-- World DB. Dun Morogh camp at 42, 48: Elder Wendigo 27153003 (from the 2026_11_05_99 quest-data restore) stands on a roof piece. Remove it.
-- Safe to run again.
CREATE TABLE IF NOT EXISTS bak_0005_creature AS SELECT * FROM creature WHERE guid IN (27153003);
CREATE TABLE IF NOT EXISTS bak_0005_creature_addon AS SELECT * FROM creature_addon WHERE guid IN (27153003);
CREATE TABLE IF NOT EXISTS bak_0005_spawn_group AS SELECT * FROM spawn_group WHERE spawnType=0 AND spawnId IN (27153003);
START TRANSACTION;
DELETE FROM spawn_group WHERE spawnType=0 AND spawnId IN (27153003);
DELETE FROM creature_addon WHERE guid IN (27153003);
DELETE FROM creature WHERE guid IN (27153003);
COMMIT;
-- Undo: INSERT IGNORE INTO creature SELECT * FROM bak_0005_creature; INSERT IGNORE INTO creature_addon SELECT * FROM bak_0005_creature_addon; INSERT IGNORE INTO spawn_group SELECT * FROM bak_0005_spawn_group;
