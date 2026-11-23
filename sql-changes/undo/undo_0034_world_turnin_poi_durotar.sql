-- undo_0034_world_turnin_poi_durotar.sql - rolls back the rows added by 0034_world_turnin_poi_durotar.sql
-- World database. Worldserver restart required.

DELETE FROM quest_poi WHERE QuestID IN (96102,96604,96876,96989,97225,97279,97281,97282,98575,98576,99048,99052) AND VerifiedBuild=70124;
DELETE FROM quest_poi_points WHERE QuestID IN (96102,96604,96876,96989,97225,97279,97281,97282,98575,98576,99048,99052) AND VerifiedBuild=70124;
