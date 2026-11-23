-- 0035_world_turnin_poi_azshara.sql: hand-in ('?') map markers for 11 custom quests, azshara (UiMapID 1447).
--
-- World database.
--
-- quest_poi/quest_poi_points had no ObjectiveIndex=-1 blob for
-- these quests, so the turn-in icon never showed on the world
-- map. Quests are filed by starting zone; a few enders span
-- other zone maps (noted per quest) - their markers still
-- carry the correct UiMapID for the map they land on.
--
-- confidence: 'sibling' = same ender NPC already has a marker;
-- 'near N' = closest marker data N units away; 'GUESS' = no
-- marker data nearby, UiMapID may be wrong - verify.
--
--   90789  Scalebeard  (sort -161, sibling)
--   90813  Pay Dirt!  (sort 16, near 61)
--   91607  Pay Dirt!  (sort 16, near 12)
--   92069  Claws That Rend, Tusks that Gore  (sort 16554, sibling)
--   92070  A Lost Memento  (sort 16554, near 5)
--   94316  Craftsman's Writ: Potion of Demonslaying  (sort 16941, sibling)
--   94334  Craftsman's Writ: Masterwork Target Dummy  (sort 16941, near 39)
--   94352  Craftsman's Writ: Wizardweave Turban  (sort 16941, near 39)
--   96994  Your First Riding Wolf  (sort 1637, sibling)
--   99204  Swift as the Wind  (sort 1637, sibling)
--   99215  An Epic Ride  (sort 1637, sibling)
--
-- Worldserver restart required (quest POI data loads at startup).

INSERT IGNORE INTO quest_poi (QuestID,BlobIndex,Idx1,ObjectiveIndex,QuestObjectiveID,QuestObjectID,MapID,UiMapID,Priority,Flags,WorldEffectID,PlayerConditionID,NavigationPlayerConditionID,SpawnTrackingID,AlwaysAllowMergingBlobs,VerifiedBuild) VALUES
(90789,0,0,-1,0,0,1,1447,0,0,0,0,0,0,0,70124),
(90813,0,0,-1,0,0,1,1447,0,0,0,0,0,0,0,70124),
(91607,0,0,-1,0,0,1,1447,0,0,0,0,0,0,0,70124),
(92069,0,0,-1,0,0,1,1447,0,0,0,0,0,0,0,70124),
(92070,0,0,-1,0,0,1,1447,0,0,0,0,0,0,0,70124),
(94316,0,0,-1,0,0,1,1447,0,0,0,0,0,0,0,70124),
(94334,0,0,-1,0,0,1,1447,0,0,0,0,0,0,0,70124),
(94352,0,0,-1,0,0,1,1447,0,0,0,0,0,0,0,70124),
(96994,0,0,-1,0,0,1,1447,0,0,0,0,0,0,0,70124),
(99204,0,0,-1,0,0,1,1447,0,0,0,0,0,0,0,70124),
(99215,0,0,-1,0,0,1,1447,0,0,0,0,0,0,0,70124);

INSERT IGNORE INTO quest_poi_points (QuestID,Idx1,Idx2,X,Y,Z,VerifiedBuild) VALUES
(90789,0,0,3982,-4760,305,70124),
(90813,0,0,2731,-3906,96,70124),
(91607,0,0,3590,-4413,113,70124),
(92069,0,0,3901,-5427,154,70124),
(92070,0,0,4726,-5468,109,70124),
(94316,0,0,3982,-4760,305,70124),
(94334,0,0,3983,-4799,305,70124),
(94352,0,0,3984,-4799,305,70124),
(96994,0,0,2159,-4654,50,70124),
(99204,0,0,2159,-4654,50,70124),
(99215,0,0,2159,-4654,50,70124);

-- Undo (also ready-to-run in undo/undo_0035_world_turnin_poi_azshara.sql):
--   DELETE FROM quest_poi WHERE QuestID IN (90789,90813,91607,92069,92070,94316,94334,94352,96994,99204,99215) AND VerifiedBuild=70124;
--   DELETE FROM quest_poi_points WHERE QuestID IN (90789,90813,91607,92069,92070,94316,94334,94352,96994,99204,99215) AND VerifiedBuild=70124;
