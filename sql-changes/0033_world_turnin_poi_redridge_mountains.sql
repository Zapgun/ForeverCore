-- 0033_world_turnin_poi_redridge_mountains.sql: hand-in ('?') map markers for 11 custom quests, redridge mountains (UiMapID 1433).
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
--   94678  Gnoll Infestation  (sort 16591, near 518)
--   94679  Snargl's Snout  (sort 16591, near 518)
--   95148  Southern Watch Gnoll Report  (sort 16591, near 1000)
--   95148  Southern Watch Gnoll Report  (sort 16591, near 998)
--   95792  Clear 'em Out  (sort 16591, near 388)
--   95795  Fallen in the Fen  (sort 16732, near 11)
--   95816  Sign Me Up!  (sort 44, near 5)
--   95934  Proof of Profit  (sort 16591, near 388)
--   95935  Hail the Dragonslayer  (sort 16591, near 518)
--   98247  Shipping Label  (sort 44, sibling)
--   98386  Alther's Mill  (sort 44, sibling)
--   98407  Show of Force  (sort 44, sibling)
--
-- Worldserver restart required (quest POI data loads at startup).

INSERT IGNORE INTO quest_poi (QuestID,BlobIndex,Idx1,ObjectiveIndex,QuestObjectiveID,QuestObjectID,MapID,UiMapID,Priority,Flags,WorldEffectID,PlayerConditionID,NavigationPlayerConditionID,SpawnTrackingID,AlwaysAllowMergingBlobs,VerifiedBuild) VALUES
(94678,0,0,-1,0,0,0,1433,0,0,0,0,0,0,0,70124),
(94679,0,0,-1,0,0,0,1433,0,0,0,0,0,0,0,70124),
(95148,0,0,-1,0,0,0,1435,0,0,0,0,0,0,0,70124),
(95148,1,1,-1,0,0,0,1435,0,0,0,0,0,0,0,70124),
(95792,0,0,-1,0,0,0,1433,0,0,0,0,0,0,0,70124),
(95795,0,0,-1,0,0,0,1433,0,0,0,0,0,0,0,70124),
(95816,0,0,-1,0,0,0,1433,0,0,0,0,0,0,0,70124),
(95934,0,0,-1,0,0,0,1433,0,0,0,0,0,0,0,70124),
(95935,0,0,-1,0,0,0,1433,0,0,0,0,0,0,0,70124),
(98247,0,0,-1,0,0,0,1433,0,0,0,0,0,0,0,70124),
(98386,0,0,-1,0,0,0,1433,0,0,0,0,0,0,0,70124),
(98407,0,0,-1,0,0,0,1433,0,0,0,0,0,0,0,70124);

INSERT IGNORE INTO quest_poi_points (QuestID,Idx1,Idx2,X,Y,Z,VerifiedBuild) VALUES
(94678,0,0,-8879,-3803,48,70124),
(94679,0,0,-8879,-3803,48,70124),
(95148,0,0,-9081,-5120,53,70124),
(95148,1,0,-9086,-5122,44,70124),
(95792,0,0,-8688,-3353,169,70124),
(95795,0,0,-9247,-2241,64,70124),
(95816,0,0,-9606,-1903,60,70124),
(95934,0,0,-8688,-3353,169,70124),
(95935,0,0,-8879,-3803,48,70124),
(98247,0,0,-9603,-1885,59,70124),
(98386,0,0,-9279,-2269,68,70124),
(98407,0,0,-9444,-2238,71,70124);

-- Undo (also ready-to-run in undo/undo_0033_world_turnin_poi_redridge_mountains.sql):
--   DELETE FROM quest_poi WHERE QuestID IN (94678,94679,95148,95792,95795,95816,95934,95935,98247,98386,98407) AND VerifiedBuild=70124;
--   DELETE FROM quest_poi_points WHERE QuestID IN (94678,94679,95148,95792,95795,95816,95934,95935,98247,98386,98407) AND VerifiedBuild=70124;
