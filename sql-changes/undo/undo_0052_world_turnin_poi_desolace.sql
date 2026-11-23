-- undo_0052_world_turnin_poi_desolace.sql - rolls back the rows added by 0052_world_turnin_poi_desolace.sql
-- World database. Worldserver restart required.

DELETE FROM quest_poi WHERE QuestID IN (94218,94227,94236,94245,94254) AND VerifiedBuild=70124;
DELETE FROM quest_poi_points WHERE QuestID IN (94218,94227,94236,94245,94254) AND VerifiedBuild=70124;
