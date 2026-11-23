-- undo_0067_world_turnin_poi_uimap_23.sql - rolls back the rows added by 0067_world_turnin_poi_uimap_23.sql
-- World database. Worldserver restart required.

DELETE FROM quest_poi WHERE QuestID IN (94320) AND VerifiedBuild=70124;
DELETE FROM quest_poi_points WHERE QuestID IN (94320) AND VerifiedBuild=70124;
