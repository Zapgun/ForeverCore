-- undo_0051_world_turnin_poi_teldrassil.sql - rolls back the rows added by 0051_world_turnin_poi_teldrassil.sql
-- World database. Worldserver restart required.

DELETE FROM quest_poi WHERE QuestID IN (94775,94820,94823,97950,99205,99214) AND VerifiedBuild=70124;
DELETE FROM quest_poi_points WHERE QuestID IN (94775,94820,94823,97950,99205,99214) AND VerifiedBuild=70124;
