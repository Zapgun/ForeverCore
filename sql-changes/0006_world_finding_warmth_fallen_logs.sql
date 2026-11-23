-- World DB. Finding Warmth (quest 99159, Dun Morogh / Misty Pine Refuge): Fallen Log (gameobject 694934).
-- 1) Each log gives 1-3 Logs (item 286339) instead of 1.
-- 2) 2026_11_02_00_world_forever_finding_warmth_fallen_logs.sql (AnoCore, map-pin grid) put 2-3 logs on many single spots,
--    and next to 3 of the 4 sniffed logs (21201590-21201593). Keep one log per spot (the sniffed one where there is one): 38 -> 24.
-- 3) All remaining logs respawn in 120 s, like the sniffed ones.
-- Safe to run again.
CREATE TABLE IF NOT EXISTS bak_0006_gameobject AS SELECT * FROM gameobject WHERE id=694934;
CREATE TABLE IF NOT EXISTS bak_0006_gameobject_addon AS SELECT * FROM gameobject_addon WHERE guid IN (9518607,9518608,9518609,9518611,9518612,9518622,9518623,9518629,9518630,9518616,9518620,9518626,9518634,9518637);
CREATE TABLE IF NOT EXISTS bak_0006_spawn_group AS SELECT * FROM spawn_group WHERE spawnType=1 AND spawnId IN (9518607,9518608,9518609,9518611,9518612,9518622,9518623,9518629,9518630,9518616,9518620,9518626,9518634,9518637);
CREATE TABLE IF NOT EXISTS bak_0006_gameobject_loot_template AS SELECT * FROM gameobject_loot_template WHERE Entry=144513;
START TRANSACTION;
DELETE FROM spawn_group WHERE spawnType=1 AND spawnId IN (9518607,9518608,9518609,9518611,9518612,9518622,9518623,9518629,9518630,9518616,9518620,9518626,9518634,9518637);
DELETE FROM gameobject_addon WHERE guid IN (9518607,9518608,9518609,9518611,9518612,9518622,9518623,9518629,9518630,9518616,9518620,9518626,9518634,9518637);
DELETE FROM gameobject WHERE id=694934 AND guid IN (9518607,9518608,9518609,9518611,9518612,9518622,9518623,9518629,9518630,9518616,9518620,9518626,9518634,9518637);
UPDATE gameobject SET spawntimesecs=120 WHERE id=694934;
UPDATE gameobject_loot_template SET MinCount=1, MaxCount=3 WHERE Entry=144513 AND Item=286339;
COMMIT;
-- Undo: DELETE FROM gameobject WHERE id=694934; INSERT IGNORE INTO gameobject SELECT * FROM bak_0006_gameobject; INSERT IGNORE INTO gameobject_addon SELECT * FROM bak_0006_gameobject_addon; INSERT IGNORE INTO spawn_group SELECT * FROM bak_0006_spawn_group; REPLACE INTO gameobject_loot_template SELECT * FROM bak_0006_gameobject_loot_template;
