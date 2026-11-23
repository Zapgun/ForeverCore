-- undo_0061_world_turnin_poi_ironforge.sql - rolls back the rows added by 0061_world_turnin_poi_ironforge.sql
-- World database. Worldserver restart required.

DELETE FROM quest_poi WHERE QuestID IN (95924,96059,96394) AND VerifiedBuild=70124;
DELETE FROM quest_poi_points WHERE QuestID IN (95924,96059,96394) AND VerifiedBuild=70124;
