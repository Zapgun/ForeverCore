-- World DB. Dun Morogh wendigos: the AnoCore spawn restore (2026_11_02_29_world_forever_spawns_restore_anocore.sql)
-- added a second, offset copy of the Grizzled Den / Shimmer Ridge camps on top of the original spawns.
-- Removes the 15 restored copies that are within 20 yards of an original spawn of the same creature
-- (Grizzled Den 30 -> 18). Copies 20-40 yards out (3240, 3572, 1007166) are left in place.
-- Safe to run again.
-- Spawns removed:
--      3239 Wendigo (Dun Morogh, 9.3 yd from original 20003186)
--      3567 Wendigo (Dun Morogh, 8.2 yd from original 20003568)
--      3246 Wendigo (Shimmer Ridge, 18.1 yd from original 20003188)
--      3257 Wendigo (The Grizzled Den, 5.5 yd from original 20003576)
--      3258 Wendigo (The Grizzled Den, 5.9 yd from original 20003577)
--      3562 Wendigo (The Grizzled Den, 5.5 yd from original 20003562)
--      3566 Wendigo (The Grizzled Den, 18.3 yd from original 20003572)
--      3255 Young Wendigo (The Grizzled Den, 9.0 yd from original 20003553)
--      3261 Young Wendigo (The Grizzled Den, 15.7 yd from original 20003553)
--      3262 Young Wendigo (The Grizzled Den, 14.0 yd from original 20003553)
--      3548 Young Wendigo (The Grizzled Den, 19.3 yd from original 20003555)
--      3551 Young Wendigo (The Grizzled Den, 19.0 yd from original 20003556)
--      3554 Young Wendigo (The Grizzled Den, 15.7 yd from original 20003555)
--      3558 Young Wendigo (The Grizzled Den, 13.4 yd from original 20003556)
--      3583 Young Wendigo (The Grizzled Den, 16.9 yd from original 20003556)
CREATE TABLE IF NOT EXISTS bak_0003_creature AS SELECT * FROM creature WHERE guid IN (3239,3567,3246,3257,3258,3562,3566,3255,3261,3262,3548,3551,3554,3558,3583);
CREATE TABLE IF NOT EXISTS bak_0003_creature_addon AS SELECT * FROM creature_addon WHERE guid IN (3239,3567,3246,3257,3258,3562,3566,3255,3261,3262,3548,3551,3554,3558,3583);
CREATE TABLE IF NOT EXISTS bak_0003_spawn_group AS SELECT * FROM spawn_group WHERE spawnType=0 AND spawnId IN (3239,3567,3246,3257,3258,3562,3566,3255,3261,3262,3548,3551,3554,3558,3583);
START TRANSACTION;
DELETE FROM spawn_group WHERE spawnType=0 AND spawnId IN (3239,3567,3246,3257,3258,3562,3566,3255,3261,3262,3548,3551,3554,3558,3583);
DELETE FROM creature_addon WHERE guid IN (3239,3567,3246,3257,3258,3562,3566,3255,3261,3262,3548,3551,3554,3558,3583);
DELETE FROM creature WHERE guid IN (3239,3567,3246,3257,3258,3562,3566,3255,3261,3262,3548,3551,3554,3558,3583);
COMMIT;
-- Undo: INSERT IGNORE INTO creature SELECT * FROM bak_0003_creature; INSERT IGNORE INTO creature_addon SELECT * FROM bak_0003_creature_addon; INSERT IGNORE INTO spawn_group SELECT * FROM bak_0003_spawn_group;
