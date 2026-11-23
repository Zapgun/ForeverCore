-- undo_0050_world_turnin_poi_uimap_36.sql - rolls back the rows added by 0050_world_turnin_poi_uimap_36.sql
-- World database. Worldserver restart required.

DELETE FROM quest_poi WHERE QuestID IN (94327,94336,94889,95147,95433,96015) AND VerifiedBuild=70124;
DELETE FROM quest_poi_points WHERE QuestID IN (94327,94336,94889,95147,95433,96015) AND VerifiedBuild=70124;
