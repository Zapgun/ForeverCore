-- undo_0047_world_turnin_poi_stonetalon_mountains.sql - rolls back the rows added by 0047_world_turnin_poi_stonetalon_mountains.sql
-- World database. Worldserver restart required.

DELETE FROM quest_poi WHERE QuestID IN (94216,94225,94234,94243,94252,97446) AND VerifiedBuild=70124;
DELETE FROM quest_poi_points WHERE QuestID IN (94216,94225,94234,94243,94252,97446) AND VerifiedBuild=70124;
