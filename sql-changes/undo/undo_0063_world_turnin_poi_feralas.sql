-- undo_0063_world_turnin_poi_feralas.sql - rolls back the rows added by 0063_world_turnin_poi_feralas.sql
-- World database. Worldserver restart required.

DELETE FROM quest_poi WHERE QuestID IN (97270,99233,99234) AND VerifiedBuild=70124;
DELETE FROM quest_poi_points WHERE QuestID IN (97270,99233,99234) AND VerifiedBuild=70124;
