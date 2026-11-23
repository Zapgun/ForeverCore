-- undo_0043_world_turnin_poi_tanaris.sql - rolls back the rows added by 0043_world_turnin_poi_tanaris.sql
-- World database. Worldserver restart required.

DELETE FROM quest_poi WHERE QuestID IN (94265,94277,94289,94301,94313,96912,96913,97530) AND VerifiedBuild=70124;
DELETE FROM quest_poi_points WHERE QuestID IN (94265,94277,94289,94301,94313,96912,96913,97530) AND VerifiedBuild=70124;
