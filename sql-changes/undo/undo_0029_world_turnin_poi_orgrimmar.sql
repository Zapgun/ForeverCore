-- undo_0029_world_turnin_poi_orgrimmar.sql - rolls back the rows added by 0029_world_turnin_poi_orgrimmar.sql
-- World database. Worldserver restart required.

DELETE FROM quest_poi WHERE QuestID IN (95483,97411,97412,98891,98893) AND VerifiedBuild=70124;
DELETE FROM quest_poi_points WHERE QuestID IN (95483,97411,97412,98891,98893) AND VerifiedBuild=70124;
