UPDATE `creature` SET `npcflag`=128 WHERE id IN (88779, 88607, 88599, 88483, 88228, 88223, 88045, 87871, 87868, 87775, 87550, 87549, 87543, 87302, 87204, 87203, 87202, 87201, 87200, 87052, 86998, 86779, 86778, 86045, 86317, 85821, 85754, 85716, 85547, 85545, 85427, 85344, 85210, 85106, 85067, 84907, 84902, 84889, 84830, 84825, 84728, 84492, 70436, 70499, 70719, 70723, 70752, 71618, 71619, 71620, 71622, 71641, 72130, 72157, 72158, 72159, 72173, 72405, 72428, 72429, 72430, 72488, 72489, 73114, 73141, 73142, 73143, 73144, 73145, 73146, 73147, 73148, 73190, 73293, 73327, 73585, 73614, 73714, 73715, 73913, 73914, 74471, 75036, 75136, 75432, 75688, 75689, 75690, 75691, 75692, 75693, 75694, 75695, 76110, 76111, 76117, 76198, 76520, 76521, 76522, 76746, 77354, 77356, 77359, 77363, 77365, 77368, 77372, 77381, 77383, 78456, 78461, 78564, 78568, 78672, 78770, 78939, 78940, 78959, 78989, 79448, 79539, 79748, 79774, 79813, 79821, 79826, 79828, 79832, 79834, 79858, 79864, 79867, 80006, 80285, 80521, 80765, 80777, 80827, 80930, 80931, 80998, 81004, 81092, 81093, 81095, 81096, 81100, 81105, 81160, 81180, 81253, 81314, 81317, 81321, 81322, 81324, 81325, 81326, 81327, 81359, 81588, 81614, 81742, 81840, 81886, 81951, 81981, 82156, 82182, 82183, 82227, 82343, 82344, 82386, 82432, 82442, 82508, 82516, 82568, 82613, 82622, 82635, 82636, 82731, 82732, 82795, 83825, 84132, 84234, 64028, 68198, 68363, 69059, 69060, 85033, 86698, 86776, 86683, 88493, 88482, 87062, 87057);

INSERT INTO npc_vendor(entry, item, TYPE) VALUES (87542, 109558, 1) ON DUPLICATE KEY UPDATE `entry` = VALUES(`entry`), `item` = VALUES(`item`), `type` = VALUES(`type`);
INSERT INTO npc_vendor(entry, item, TYPE) VALUES (87048, 109558, 1) ON DUPLICATE KEY UPDATE `entry` = VALUES(`entry`), `item` = VALUES(`item`), `type` = VALUES(`type`);

INSERT INTO npc_vendor(entry, item, TYPE) VALUES (87022, 111922, 1) ON DUPLICATE KEY UPDATE `entry` = VALUES(`entry`), `item` = VALUES(`item`), `type` = VALUES(`type`);

INSERT INTO npc_vendor(entry, item, TYPE) VALUES (87552, 111921, 1) ON DUPLICATE KEY UPDATE `entry` = VALUES(`entry`), `item` = VALUES(`item`), `type` = VALUES(`type`);
INSERT INTO npc_vendor(entry, item, TYPE) VALUES (87065, 111921, 1) ON DUPLICATE KEY UPDATE `entry` = VALUES(`entry`), `item` = VALUES(`item`), `type` = VALUES(`type`);

INSERT INTO npc_vendor(entry, item, TYPE) VALUES (87063, 111923, 1) ON DUPLICATE KEY UPDATE `entry` = VALUES(`entry`), `item` = VALUES(`item`), `type` = VALUES(`type`);
INSERT INTO npc_vendor(entry, item, TYPE) VALUES (87551, 111923, 1) ON DUPLICATE KEY UPDATE `entry` = VALUES(`entry`), `item` = VALUES(`item`), `type` = VALUES(`type`);
INSERT INTO npc_vendor(entry, item, TYPE) VALUES (79829, 111923, 1) ON DUPLICATE KEY UPDATE `entry` = VALUES(`entry`), `item` = VALUES(`item`), `type` = VALUES(`type`);

INSERT INTO npc_vendor(entry, item, TYPE) VALUES (87052, 115359, 1) ON DUPLICATE KEY UPDATE `entry` = VALUES(`entry`), `item` = VALUES(`item`), `type` = VALUES(`type`);
INSERT INTO npc_vendor(entry, item, TYPE) VALUES (77356, 115359, 1) ON DUPLICATE KEY UPDATE `entry` = VALUES(`entry`), `item` = VALUES(`item`), `type` = VALUES(`type`);
INSERT INTO npc_vendor(entry, item, TYPE) VALUES (79832, 115359, 1) ON DUPLICATE KEY UPDATE `entry` = VALUES(`entry`), `item` = VALUES(`item`), `type` = VALUES(`type`);
INSERT INTO npc_vendor(entry, item, TYPE) VALUES (87548, 115359, 1) ON DUPLICATE KEY UPDATE `entry` = VALUES(`entry`), `item` = VALUES(`item`), `type` = VALUES(`type`);