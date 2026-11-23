-- undo_0025_world_turnin_poi_stormwind_city.sql - rolls back the rows added by 0025_world_turnin_poi_stormwind_city.sql
-- World database. Worldserver restart required.

DELETE FROM quest_poi WHERE QuestID IN (98896,98899,98901) AND VerifiedBuild=70124;
DELETE FROM quest_poi_points WHERE QuestID IN (98896,98899,98901) AND VerifiedBuild=70124;
