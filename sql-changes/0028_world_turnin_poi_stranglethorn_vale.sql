-- 0028_world_turnin_poi_stranglethorn_vale.sql: hand-in ('?') map markers for 15 custom quests, stranglethorn vale (UiMapID 1434).
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
--   94217  Craftsman's Writ: Lesser Troll's Blood Elixir  (sort 16941, sibling)
--   94226  Craftsman's Writ: Green Iron Gauntlets  (sort 16941, sibling)
--   94235  Craftsman's Writ: Gnomish Universal Remote  (sort 16941, sibling)
--   94244  Craftsman's Writ: Dark Leather Shoulders  (sort 16941, near 50)
--   94253  Craftsman's Writ: Colorful Kilt  (sort 16941, near 56)
--   95141  Report to Rog'mar  (sort 33, near 233)
--   95325  We've Been Robbed!  (sort 16591, near 20)
--   95385  Torn Mystical Scroll  (sort 33, near 6)
--   95773  Enemies in the Water  (sort 33, sibling)
--   95776  The Only Good Brinescale...  (sort 16550, sibling)
--   95789  Shady Saltseers  (sort 16550, sibling)
--   95791  The Saltseer Captain  (sort 16550, sibling)
--   97331  Zimmix's Great Escape  (sort 33, sibling)
--   97386  The Offense of Grom'gol  (sort 33, sibling)
--   97420  Reduce, Reuse, Reconcile  (sort 33, near 115)
--
-- Worldserver restart required (quest POI data loads at startup).

INSERT IGNORE INTO quest_poi (QuestID,BlobIndex,Idx1,ObjectiveIndex,QuestObjectiveID,QuestObjectID,MapID,UiMapID,Priority,Flags,WorldEffectID,PlayerConditionID,NavigationPlayerConditionID,SpawnTrackingID,AlwaysAllowMergingBlobs,VerifiedBuild) VALUES
(94217,0,0,-1,0,0,0,1434,0,0,0,0,0,0,0,70124),
(94226,0,0,-1,0,0,0,1434,0,0,0,0,0,0,0,70124),
(94235,0,0,-1,0,0,0,1434,0,0,0,0,0,0,0,70124),
(94244,0,0,-1,0,0,0,1434,0,0,0,0,0,0,0,70124),
(94253,0,0,-1,0,0,0,1434,0,0,0,0,0,0,0,70124),
(95141,0,0,-1,0,0,0,84,0,0,0,0,0,0,0,70124),
(95325,0,0,-1,0,0,0,1434,0,0,0,0,0,0,0,70124),
(95385,0,0,-1,0,0,0,1434,0,0,0,0,0,0,0,70124),
(95773,0,0,-1,0,0,0,1434,0,0,0,0,0,0,0,70124),
(95776,0,0,-1,0,0,0,1434,0,0,0,0,0,0,0,70124),
(95789,0,0,-1,0,0,0,1434,0,0,0,0,0,0,0,70124),
(95791,0,0,-1,0,0,0,1434,0,0,0,0,0,0,0,70124),
(97331,0,0,-1,0,0,0,1434,0,0,0,0,0,0,0,70124),
(97386,0,0,-1,0,0,0,1434,0,0,0,0,0,0,0,70124),
(97420,0,0,-1,0,0,0,1434,0,0,0,0,0,0,0,70124);

INSERT IGNORE INTO quest_poi_points (QuestID,Idx1,Idx2,X,Y,Z,VerifiedBuild) VALUES
(94217,0,0,-13184,333,40,70124),
(94226,0,0,-14447,448,16,70124),
(94235,0,0,-14465,460,15,70124),
(94244,0,0,-14335,426,7,70124),
(94253,0,0,-11986,-995,77,70124),
(95141,0,0,-7941,-4773,22,70124),
(95325,0,0,-11952,-504,48,70124),
(95385,0,0,-14410,421,-2,70124),
(95773,0,0,-12398,168,3,70124),
(95776,0,0,-12398,168,3,70124),
(95789,0,0,-14453,501,26,70124),
(95791,0,0,-14453,501,26,70124),
(97331,0,0,-14298,540,9,70124),
(97386,0,0,-12398,168,3,70124),
(97420,0,0,-12667,-1032,98,70124);

-- Undo (also ready-to-run in undo/undo_0028_world_turnin_poi_stranglethorn_vale.sql):
--   DELETE FROM quest_poi WHERE QuestID IN (94217,94226,94235,94244,94253,95141,95325,95385,95773,95776,95789,95791,97331,97386,97420) AND VerifiedBuild=70124;
--   DELETE FROM quest_poi_points WHERE QuestID IN (94217,94226,94235,94244,94253,95141,95325,95385,95773,95776,95789,95791,97331,97386,97420) AND VerifiedBuild=70124;
