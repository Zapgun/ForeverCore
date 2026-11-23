-- undo_0041_world_turnin_poi_ashenvale.sql - rolls back the rows added by 0041_world_turnin_poi_ashenvale.sql
-- World database. Worldserver restart required.

DELETE FROM quest_poi WHERE QuestID IN (94213,94222,94231,94240,94249,98027,98251,98417,98418) AND VerifiedBuild=70124;
DELETE FROM quest_poi_points WHERE QuestID IN (94213,94222,94231,94240,94249,98027,98251,98417,98418) AND VerifiedBuild=70124;
