-- undo_0037_world_turnin_poi_the_barrens.sql - rolls back the rows added by 0037_world_turnin_poi_the_barrens.sql
-- World database. Worldserver restart required.

DELETE FROM quest_poi WHERE QuestID IN (95494,95495,95507,95774,95819,95820,96339,96340,96341,96342,98248) AND VerifiedBuild=70124;
DELETE FROM quest_poi_points WHERE QuestID IN (95494,95495,95507,95774,95819,95820,96339,96340,96341,96342,98248) AND VerifiedBuild=70124;
