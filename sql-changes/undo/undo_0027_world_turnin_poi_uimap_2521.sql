-- undo_0027_world_turnin_poi_uimap_2521.sql - rolls back the rows added by 0027_world_turnin_poi_uimap_2521.sql
-- World database. Worldserver restart required.

DELETE FROM quest_poi WHERE QuestID IN (92466,92467,92468,92483,92484,92532,93459,94003,96996,97243,97244,97245,97257,97973,98512) AND VerifiedBuild=70124;
DELETE FROM quest_poi_points WHERE QuestID IN (92466,92467,92468,92483,92484,92532,93459,94003,96996,97243,97244,97245,97257,97973,98512) AND VerifiedBuild=70124;
