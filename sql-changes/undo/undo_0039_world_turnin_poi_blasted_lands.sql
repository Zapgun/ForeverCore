-- undo_0039_world_turnin_poi_blasted_lands.sql - rolls back the rows added by 0039_world_turnin_poi_blasted_lands.sql
-- World database. Worldserver restart required.

DELETE FROM quest_poi WHERE QuestID IN (94317,94319,94326,94328,94335,94346,94353,94355,96799,96812) AND VerifiedBuild=70124;
DELETE FROM quest_poi_points WHERE QuestID IN (94317,94319,94326,94328,94335,94346,94353,94355,96799,96812) AND VerifiedBuild=70124;
