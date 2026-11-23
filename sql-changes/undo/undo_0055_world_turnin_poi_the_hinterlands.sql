-- undo_0055_world_turnin_poi_the_hinterlands.sql - rolls back the rows added by 0055_world_turnin_poi_the_hinterlands.sql
-- World database. Worldserver restart required.

DELETE FROM quest_poi WHERE QuestID IN (94266,94278,94290,94302) AND VerifiedBuild=70124;
DELETE FROM quest_poi_points WHERE QuestID IN (94266,94278,94290,94302) AND VerifiedBuild=70124;
