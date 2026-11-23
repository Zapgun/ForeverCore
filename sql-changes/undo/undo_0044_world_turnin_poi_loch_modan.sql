-- undo_0044_world_turnin_poi_loch_modan.sql - rolls back the rows added by 0044_world_turnin_poi_loch_modan.sql
-- World database. Worldserver restart required.

DELETE FROM quest_poi WHERE QuestID IN (94466,94467,94468,94495,94502,94505) AND VerifiedBuild=70124;
DELETE FROM quest_poi_points WHERE QuestID IN (94466,94467,94468,94495,94502,94505) AND VerifiedBuild=70124;
