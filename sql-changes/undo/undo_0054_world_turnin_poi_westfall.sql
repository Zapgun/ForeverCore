-- undo_0054_world_turnin_poi_westfall.sql - rolls back the rows added by 0054_world_turnin_poi_westfall.sql
-- World database. Worldserver restart required.

DELETE FROM quest_poi WHERE QuestID IN (92819,92909,92910,92911) AND VerifiedBuild=70124;
DELETE FROM quest_poi_points WHERE QuestID IN (92819,92909,92910,92911) AND VerifiedBuild=70124;
