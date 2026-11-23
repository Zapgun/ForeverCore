-- World DB. Dun Morogh, wendigo camp north of The Grizzled Den (map 42, 48).
-- The Forever quest-data restore (2026_11_05_99) added 12 Elder Wendigos (271530) on the original Wendigo (1135) camp spots
-- without removing the Wendigos, so most spots had two mobs. Removes the nearest Wendigo to each Elder (one each).
-- Also removes the Wendigo Shaman 27148600 from the same restore, which was placed on the rocks above the cave.
-- Safe to run again.
-- Spawns removed:
--   Wendigo 20003221 (2.8 yd from Elder Wendigo 27153011)
--   Wendigo 20003136 (3.9 yd from Elder Wendigo 27153000)
--   Wendigo 20003232 (4.6 yd from Elder Wendigo 27153009)
--   Wendigo 20003186 (5.2 yd from Elder Wendigo 27153006)
--   Wendigo 20003236 (6.0 yd from Elder Wendigo 27153008)
--   Wendigo 20003188 (6.1 yd from Elder Wendigo 27153001)
--   Wendigo 20003563 (6.3 yd from Elder Wendigo 27153010)
--   Wendigo 20003568 (7.6 yd from Elder Wendigo 27153002)
--   Wendigo 20003238 (8.2 yd from Elder Wendigo 27153007)
--   Wendigo 20003240 (12.5 yd from Elder Wendigo 27153003)
--   Wendigo 20003247 (14.0 yd from Elder Wendigo 27153004)
--   Wendigo 20003244 (19.6 yd from Elder Wendigo 27153005)
--   Wendigo Shaman 27148600
CREATE TABLE IF NOT EXISTS bak_0004_creature AS SELECT * FROM creature WHERE guid IN (20003221,20003136,20003232,20003186,20003236,20003188,20003563,20003568,20003238,20003240,20003247,20003244,27148600);
CREATE TABLE IF NOT EXISTS bak_0004_creature_addon AS SELECT * FROM creature_addon WHERE guid IN (20003221,20003136,20003232,20003186,20003236,20003188,20003563,20003568,20003238,20003240,20003247,20003244,27148600);
CREATE TABLE IF NOT EXISTS bak_0004_spawn_group AS SELECT * FROM spawn_group WHERE spawnType=0 AND spawnId IN (20003221,20003136,20003232,20003186,20003236,20003188,20003563,20003568,20003238,20003240,20003247,20003244,27148600);
START TRANSACTION;
DELETE FROM spawn_group WHERE spawnType=0 AND spawnId IN (20003221,20003136,20003232,20003186,20003236,20003188,20003563,20003568,20003238,20003240,20003247,20003244,27148600);
DELETE FROM creature_addon WHERE guid IN (20003221,20003136,20003232,20003186,20003236,20003188,20003563,20003568,20003238,20003240,20003247,20003244,27148600);
DELETE FROM creature WHERE guid IN (20003221,20003136,20003232,20003186,20003236,20003188,20003563,20003568,20003238,20003240,20003247,20003244,27148600);
COMMIT;
-- Undo: INSERT IGNORE INTO creature SELECT * FROM bak_0004_creature; INSERT IGNORE INTO creature_addon SELECT * FROM bak_0004_creature_addon; INSERT IGNORE INTO spawn_group SELECT * FROM bak_0004_spawn_group;
