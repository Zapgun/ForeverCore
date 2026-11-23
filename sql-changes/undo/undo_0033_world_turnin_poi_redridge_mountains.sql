-- undo_0033_world_turnin_poi_redridge_mountains.sql - rolls back the rows added by 0033_world_turnin_poi_redridge_mountains.sql
-- World database. Worldserver restart required.

DELETE FROM quest_poi WHERE QuestID IN (94678,94679,95148,95792,95795,95816,95934,95935,98247,98386,98407) AND VerifiedBuild=70124;
DELETE FROM quest_poi_points WHERE QuestID IN (94678,94679,95148,95792,95795,95816,95934,95935,98247,98386,98407) AND VerifiedBuild=70124;
