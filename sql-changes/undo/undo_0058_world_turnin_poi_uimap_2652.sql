-- undo_0058_world_turnin_poi_uimap_2652.sql - rolls back the rows added by 0058_world_turnin_poi_uimap_2652.sql
-- World database. Worldserver restart required.

DELETE FROM quest_poi WHERE QuestID IN (93037,93128,93568) AND VerifiedBuild=70124;
DELETE FROM quest_poi_points WHERE QuestID IN (93037,93128,93568) AND VerifiedBuild=70124;
