-- undo_0053_world_turnin_poi_searing_gorge.sql - rolls back the rows added by 0053_world_turnin_poi_searing_gorge.sql
-- World database. Worldserver restart required.

DELETE FROM quest_poi WHERE QuestID IN (94263,94275,94287,94299,94311) AND VerifiedBuild=70124;
DELETE FROM quest_poi_points WHERE QuestID IN (94263,94275,94287,94299,94311) AND VerifiedBuild=70124;
