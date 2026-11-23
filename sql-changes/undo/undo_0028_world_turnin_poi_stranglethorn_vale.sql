-- undo_0028_world_turnin_poi_stranglethorn_vale.sql - rolls back the rows added by 0028_world_turnin_poi_stranglethorn_vale.sql
-- World database. Worldserver restart required.

DELETE FROM quest_poi WHERE QuestID IN (94217,94226,94235,94244,94253,95141,95325,95385,95773,95776,95789,95791,97331,97386,97420) AND VerifiedBuild=70124;
DELETE FROM quest_poi_points WHERE QuestID IN (94217,94226,94235,94244,94253,95141,95325,95385,95773,95776,95789,95791,97331,97386,97420) AND VerifiedBuild=70124;
