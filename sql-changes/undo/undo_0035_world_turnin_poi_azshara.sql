-- undo_0035_world_turnin_poi_azshara.sql - rolls back the rows added by 0035_world_turnin_poi_azshara.sql
-- World database. Worldserver restart required.

DELETE FROM quest_poi WHERE QuestID IN (90789,90813,91607,92069,92070,94316,94334,94352,96994,99204,99215) AND VerifiedBuild=70124;
DELETE FROM quest_poi_points WHERE QuestID IN (90789,90813,91607,92069,92070,94316,94334,94352,96994,99204,99215) AND VerifiedBuild=70124;
