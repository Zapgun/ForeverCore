-- undo_0059_world_turnin_poi_winterspring.sql - rolls back the rows added by 0059_world_turnin_poi_winterspring.sql
-- World database. Worldserver restart required.

DELETE FROM quest_poi WHERE QuestID IN (94324,94333,98462) AND VerifiedBuild=70124;
DELETE FROM quest_poi_points WHERE QuestID IN (94324,94333,98462) AND VerifiedBuild=70124;
