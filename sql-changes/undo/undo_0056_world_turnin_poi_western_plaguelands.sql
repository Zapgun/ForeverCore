-- undo_0056_world_turnin_poi_western_plaguelands.sql - rolls back the rows added by 0056_world_turnin_poi_western_plaguelands.sql
-- World database. Worldserver restart required.

DELETE FROM quest_poi WHERE QuestID IN (94323,94341,94350,94356) AND VerifiedBuild=70124;
DELETE FROM quest_poi_points WHERE QuestID IN (94323,94341,94350,94356) AND VerifiedBuild=70124;
