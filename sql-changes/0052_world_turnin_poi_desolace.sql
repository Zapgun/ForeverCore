-- 0052_world_turnin_poi_desolace.sql: hand-in ('?') map markers for 5 custom quests, desolace (UiMapID 1441).
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
--   94218  Craftsman's Writ: Elixir of Defense  (sort 16941, near 1)
--   94227  Craftsman's Writ: Big Bronze Knife  (sort 16941, near 25)
--   94236  Craftsman's Writ: Big Bronze Bomb  (sort 16941, sibling)
--   94245  Craftsman's Writ: Barbaric Gloves  (sort 16941, sibling)
--   94254  Craftsman's Writ: Greater Adept's Robe  (sort 16941, sibling)
--
-- Worldserver restart required (quest POI data loads at startup).

INSERT IGNORE INTO quest_poi (QuestID,BlobIndex,Idx1,ObjectiveIndex,QuestObjectiveID,QuestObjectID,MapID,UiMapID,Priority,Flags,WorldEffectID,PlayerConditionID,NavigationPlayerConditionID,SpawnTrackingID,AlwaysAllowMergingBlobs,VerifiedBuild) VALUES
(94218,0,0,-1,0,0,1,1441,0,0,0,0,0,0,0,70124),
(94227,0,0,-1,0,0,1,1441,0,0,0,0,0,0,0,70124),
(94236,0,0,-1,0,0,1,1441,0,0,0,0,0,0,0,70124),
(94245,0,0,-1,0,0,1,1441,0,0,0,0,0,0,0,70124),
(94254,0,0,-1,0,0,1,1441,0,0,0,0,0,0,0,70124);

INSERT IGNORE INTO quest_poi_points (QuestID,Idx1,Idx2,X,Y,Z,VerifiedBuild) VALUES
(94218,0,0,-6237,-3831,-58,70124),
(94227,0,0,-6185,-3936,-59,70124),
(94236,0,0,-6199,-3968,-59,70124),
(94245,0,0,-6218,-3949,-59,70124),
(94254,0,0,-6187,-3878,-59,70124);

-- Undo (also ready-to-run in undo/undo_0052_world_turnin_poi_desolace.sql):
--   DELETE FROM quest_poi WHERE QuestID IN (94218,94227,94236,94245,94254) AND VerifiedBuild=70124;
--   DELETE FROM quest_poi_points WHERE QuestID IN (94218,94227,94236,94245,94254) AND VerifiedBuild=70124;
