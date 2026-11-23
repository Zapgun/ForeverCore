-- undo_0064_world_turnin_poi_burning_steppes.sql - rolls back the rows added by 0064_world_turnin_poi_burning_steppes.sql
-- World database. Worldserver restart required.

DELETE FROM quest_poi WHERE QuestID IN (94318,94354) AND VerifiedBuild=70124;
DELETE FROM quest_poi_points WHERE QuestID IN (94318,94354) AND VerifiedBuild=70124;
