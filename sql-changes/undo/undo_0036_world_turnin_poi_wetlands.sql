-- undo_0036_world_turnin_poi_wetlands.sql - rolls back the rows added by 0036_world_turnin_poi_wetlands.sql
-- World database. Worldserver restart required.

DELETE FROM quest_poi WHERE QuestID IN (94219,94228,94237,94246,94255,97171,98208,98209,98223,98240,98313) AND VerifiedBuild=70124;
DELETE FROM quest_poi_points WHERE QuestID IN (94219,94228,94237,94246,94255,97171,98208,98209,98223,98240,98313) AND VerifiedBuild=70124;
