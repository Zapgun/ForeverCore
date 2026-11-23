-- undo_0046_world_turnin_poi_silverpine_forest.sql - rolls back the rows added by 0046_world_turnin_poi_silverpine_forest.sql
-- World database. Worldserver restart required.

DELETE FROM quest_poi WHERE QuestID IN (91920,91921,94220,94229,94247,95981) AND VerifiedBuild=70124;
DELETE FROM quest_poi_points WHERE QuestID IN (91920,91921,94220,94229,94247,95981) AND VerifiedBuild=70124;
