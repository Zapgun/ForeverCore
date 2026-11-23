-- undo_0049_world_turnin_poi_ungoro_crater.sql - rolls back the rows added by 0049_world_turnin_poi_ungoro_crater.sql
-- World database. Worldserver restart required.

DELETE FROM quest_poi WHERE QuestID IN (94267,94279,94291,94303,94315,94322) AND VerifiedBuild=70124;
DELETE FROM quest_poi_points WHERE QuestID IN (94267,94279,94291,94303,94315,94322) AND VerifiedBuild=70124;
