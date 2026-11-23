-- 0072: Westfall Longshore — adds one murloc spawn point in the water around
-- the sunken ship offshore of the Slark beach (map ~50.2, 7.8 -> world
-- -9597, 1325). Classic has murlocs swimming near the wreck; this data had
-- none below the waterline in the whole strip.
--
-- World database.
--
-- Same structure as the neighboring beach points: one pool with max_limit 1
-- and two candidate creatures (Murloc Coastrunner 126 / Murloc Raider 515),
-- 300 s respawn, 10 yd wander so it swims around the wreck.
--
-- New rows only (guids 91005001-2, pool 9200150 — verified free). No backup
-- table needed; undo deletes by guid.

INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnDifficulties`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `currentwaypoint`, `curHealthPct`, `MovementType`, `npcflag`, `unit_flags`, `unit_flags2`, `unit_flags3`, `ScriptName`, `StringId`, `VerifiedBuild`) VALUES
(91005001, 126, 0, 0, 0, '0', 0, 0, 0, -1, 0, 1, -9598.5, 1327.0, -3.0, 1.9, 300, 10, 0, 100, 1, NULL, NULL, NULL, NULL, '', NULL, 0),
(91005002, 515, 0, 0, 0, '0', 0, 0, 0, -1, 0, 1, -9598.5, 1327.0, -3.0, 1.9, 300, 10, 0, 100, 1, NULL, NULL, NULL, NULL, '', NULL, 0);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES
(9200150, 1, 'Westfall sunken-ship murloc (0072)');

INSERT INTO `pool_members` (`type`, `spawnId`, `poolSpawnId`, `chance`, `description`) VALUES
(0, 91005001, 9200150, 0, 'Westfall sunken-ship murloc (0072)'),
(0, 91005002, 9200150, 0, 'Westfall sunken-ship murloc (0072)');

-- Undo:
--   DELETE FROM pool_members WHERE poolSpawnId = 9200150;
--   DELETE FROM pool_template WHERE entry = 9200150;
--   DELETE FROM creature WHERE guid IN (91005001, 91005002);
