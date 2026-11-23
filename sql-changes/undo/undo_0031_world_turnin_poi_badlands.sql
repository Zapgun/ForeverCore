-- undo_0031_world_turnin_poi_badlands.sql - rolls back the rows added by 0031_world_turnin_poi_badlands.sql
-- World database. Worldserver restart required.

DELETE FROM quest_poi WHERE QuestID IN (94256,94268,94280,94292,94304,94745,95278,95424,95428,95431,97821) AND VerifiedBuild=70124;
DELETE FROM quest_poi_points WHERE QuestID IN (94256,94268,94280,94292,94304,94745,95278,95424,95428,95431,97821) AND VerifiedBuild=70124;
