-- undo_0060_world_turnin_poi_eastern_plaguelands.sql - rolls back the rows added by 0060_world_turnin_poi_eastern_plaguelands.sql
-- World database. Worldserver restart required.

DELETE FROM quest_poi WHERE QuestID IN (94329,94347,97186) AND VerifiedBuild=70124;
DELETE FROM quest_poi_points WHERE QuestID IN (94329,94347,97186) AND VerifiedBuild=70124;
