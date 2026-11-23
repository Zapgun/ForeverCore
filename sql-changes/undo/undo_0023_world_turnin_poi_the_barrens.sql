-- undo_0023_world_turnin_poi_the_barrens.sql - rolls back the rows added by 0023_world_turnin_poi_the_barrens.sql
-- World database. Worldserver restart required.

DELETE FROM quest_poi WHERE QuestID IN (92754,92811,92812,92841,92893,93034,93066,93224,93225,93227,94257,94269,94281,94293,94305,94872,94873,96222) AND VerifiedBuild=70124;
DELETE FROM quest_poi_points WHERE QuestID IN (92754,92811,92812,92841,92893,93034,93066,93224,93225,93227,94257,94269,94281,94293,94305,94872,94873,96222) AND VerifiedBuild=70124;
