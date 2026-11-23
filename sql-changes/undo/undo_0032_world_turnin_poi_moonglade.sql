-- undo_0032_world_turnin_poi_moonglade.sql - rolls back the rows added by 0032_world_turnin_poi_moonglade.sql
-- World database. Worldserver restart required.

DELETE FROM quest_poi WHERE QuestID IN (94261,94273,94285,94297,94309,98341,98342,98362,98404,98405,98738,98739) AND VerifiedBuild=70124;
DELETE FROM quest_poi_points WHERE QuestID IN (94261,94273,94285,94297,94309,98341,98342,98362,98404,98405,98738,98739) AND VerifiedBuild=70124;
