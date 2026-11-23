-- undo_0048_world_turnin_poi_felwood.sql - rolls back the rows added by 0048_world_turnin_poi_felwood.sql
-- World database. Worldserver restart required.

DELETE FROM quest_poi WHERE QuestID IN (94259,94271,94283,94295,94307,94308) AND VerifiedBuild=70124;
DELETE FROM quest_poi_points WHERE QuestID IN (94259,94271,94283,94295,94307,94308) AND VerifiedBuild=70124;
