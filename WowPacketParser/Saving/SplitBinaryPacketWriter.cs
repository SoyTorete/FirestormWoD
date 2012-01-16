﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Threading;
using WowPacketParser.Enums;
using WowPacketParser.Enums.Version;
using WowPacketParser.Misc;

namespace WowPacketParser.Loading
{
    public class FileLock<T>
    {
        private const int _timeout = 3000;
        private static readonly Dictionary<T, References> _locks = new Dictionary<T, References>();

        public IDisposable Lock(T fileName)
        {
            Monitor.Enter(_locks);
            References obj;
            if (_locks.TryGetValue(fileName, out obj))
            {
                obj.Addquire();
                Monitor.Exit(_locks);
                if (!Monitor.TryEnter(obj, _timeout))
                    throw new TimeoutException(String.Format("{0}", fileName));
            }
            else
            {
                obj = new References();
                Monitor.Enter(obj);
                _locks.Add(fileName, obj);
                Monitor.Exit(_locks);
            }

            return new Locker<T>(fileName);
        }

        private static void Unlock(T fileName)
        {
            lock (_locks)
            {
                References obj;
                if (_locks.TryGetValue(fileName, out obj))
                {
                    Monitor.Exit(obj);
                    if (0 == obj.Release())
                        _locks.Remove(fileName);
                }
            }
        }

        private class References
        {
            private int _count = 1;
            public void Addquire()
            {
                Interlocked.Increment(ref _count);
            }

            public int Release()
            {
                return Interlocked.Decrement(ref _count);
            }
        }

        class Locker<T2> : IDisposable
        {
            private readonly T2 _fileName;

            public Locker(T2 fileName)
            {
                _fileName = fileName;
            }

            public void Dispose()
            {
                FileLock<T2>.Unlock(_fileName);
            }
        }
    }

    public static class SplitBinaryPacketWriter
    {
        private static readonly FileLock<string> locks = new FileLock<string>();

        public static void Write(IEnumerable<Packet> packets, Encoding encoding)
        {
            foreach (var packet in packets)
            {
                var fileName = Opcodes.GetOpcodeName(packet.Opcode) + "." + Settings.DumpFormat.ToString().ToLower();
                try
                {
                    using (locks.Lock(fileName))
                    {
                        using (var writer = new BinaryWriter(new FileStream(fileName, FileMode.Append, FileAccess.Write, FileShare.None), encoding))
                        {
                            if (Settings.DumpFormat == DumpFormatType.Pkt)
                            {
                                writer.Write((ushort)packet.Opcode);
                                writer.Write((int)packet.GetLength());
                                writer.Write((byte)packet.Direction);
                                writer.Write((ulong)Utilities.GetUnixTimeFromDateTime(packet.Time));
                                writer.Write(packet.GetStream(0));
                            }
                            else
                            {
                                writer.Write(packet.Opcode);
                                writer.Write((int)packet.GetLength());
                                writer.Write((int)Utilities.GetUnixTimeFromDateTime(packet.Time));
                                writer.Write((byte)packet.Direction);
                                writer.Write(packet.GetStream(0));
                            }
                            writer.Close();
                        }
                    }
                }
                catch(TimeoutException)
                {
                    Console.WriteLine("Timeout trying to write Opcode to {0} ignoring opcode", fileName);
                }
            }
        }
    }
}
