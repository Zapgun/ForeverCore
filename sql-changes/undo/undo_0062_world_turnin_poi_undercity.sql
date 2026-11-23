-- undo_0062_world_turnin_poi_undercity.sql - rolls back the rows added by 0062_world_turnin_poi_undercity.sql
-- World database. Worldserver restart required.

DELETE FROM quest_poi WHERE QuestID IN (96988,97000,97985) AND VerifiedBuild=70124;
DELETE FROM quest_poi_points WHERE QuestID IN (96988,97000,97985) AND VerifiedBuild=70124;
