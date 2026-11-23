-- undo_0024_world_turnin_poi_uimap_198.sql - rolls back the rows added by 0024_world_turnin_poi_uimap_198.sql
-- World database. Worldserver restart required.

DELETE FROM quest_poi WHERE QuestID IN (90702,91564,91696,92100,93127,93444,93521,93547,93615,94348,94360,94479,95379,96296,96959,96983,96998,97001) AND VerifiedBuild=70124;
DELETE FROM quest_poi_points WHERE QuestID IN (90702,91564,91696,92100,93127,93444,93521,93547,93615,94348,94360,94479,95379,96296,96959,96983,96998,97001) AND VerifiedBuild=70124;
