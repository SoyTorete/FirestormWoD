////////////////////////////////////////////////////////////////////////////////
//
//  MILLENIUM-STUDIO
//  Copyright 2015 Millenium-studio SARL
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

#pragma once

enum SpellLogOutputFlags
{
    SPELLLOG_OUTPUT_FLAG_PLAYER  = 1,
    SPELLLOG_OUTPUT_FLAG_CONSOLE = 2,
    SPELLLOG_OUTPUT_FLAG_FILE    = 4
};

class SpellLogMgr
{
public:
    void AddOrSetListener(Player* p_Player, uint32 p_SpellID);
    void RemoveListener(Player* p_Player);
    void RemoveSpellFromListener(Player* p_Player, uint32 p_SpellID);
    void LogSpell(Unit const* p_Caster, uint32 p_SpellID, char* p_String, ...);
    void LogSpell(Unit const* p_Caster, uint32 p_SpellID, uint32 p_SpellID2, char* p_String, ...);

private:
    std::unordered_map<Player*, std::list<uint32>> m_Listeners;
    void PrintToConsole(char* p_Str);
};

#define LOG_SPELL(c, s, fmt, ...) sSpellLogMgr->LogSpell(c, s, fmt, ##__VA_ARGS__)
#define LOG_SPELL_DOUBLE(c, s1, s2, fmt, ...) sSpellLogMgr->LogSpell(c, s1, s2, fmt, ##__VA_ARGS__)

#define sSpellLogMgr ACE_Singleton<SpellLogMgr, ACE_Null_Mutex>::instance()