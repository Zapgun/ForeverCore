-- undo_0019_world_turnin_poi_uimap_1.sql - rolls back the rows added by 0019_world_turnin_poi_uimap_1.sql
-- World database. Worldserver restart required.

DELETE FROM quest_poi WHERE QuestID IN (96822,96873,99201) AND VerifiedBuild=70124;
DELETE FROM quest_poi_points WHERE QuestID IN (96822,96873,99201) AND VerifiedBuild=70124;
