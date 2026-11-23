-- undo_0040_world_turnin_poi_uimap_69.sql - rolls back the rows added by 0040_world_turnin_poi_uimap_69.sql
-- World database. Worldserver restart required.

DELETE FROM quest_poi WHERE QuestID IN (92858,93125,93362,93594,94260,94272,94284,94296,99258) AND VerifiedBuild=70124;
DELETE FROM quest_poi_points WHERE QuestID IN (92858,93125,93362,93594,94260,94272,94284,94296,99258) AND VerifiedBuild=70124;
