-- undo_0038_world_turnin_poi_arathi_highlands.sql - rolls back the rows added by 0038_world_turnin_poi_arathi_highlands.sql
-- World database. Worldserver restart required.

DELETE FROM quest_poi WHERE QuestID IN (92867,94212,94221,94230,94239,94248,94314,95143,96784,97539) AND VerifiedBuild=70124;
DELETE FROM quest_poi_points WHERE QuestID IN (92867,94212,94221,94230,94239,94248,94314,95143,96784,97539) AND VerifiedBuild=70124;
