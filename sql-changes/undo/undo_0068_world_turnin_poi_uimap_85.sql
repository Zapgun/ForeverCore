-- undo_0068_world_turnin_poi_uimap_85.sql - rolls back the rows added by 0068_world_turnin_poi_uimap_85.sql
-- World database. Worldserver restart required.

DELETE FROM quest_poi WHERE QuestID IN (96874) AND VerifiedBuild=70124;
DELETE FROM quest_poi_points WHERE QuestID IN (96874) AND VerifiedBuild=70124;
