-- undo_0066_world_turnin_poi_duskwood.sql - rolls back the rows added by 0066_world_turnin_poi_duskwood.sql
-- World database. Worldserver restart required.

DELETE FROM quest_poi WHERE QuestID IN (94223) AND VerifiedBuild=70124;
DELETE FROM quest_poi_points WHERE QuestID IN (94223) AND VerifiedBuild=70124;
