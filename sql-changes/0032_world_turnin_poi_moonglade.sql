-- 0032_world_turnin_poi_moonglade.sql: hand-in ('?') map markers for 12 custom quests, moonglade (UiMapID 1450).
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
--   94261  Craftsman's Writ: Great Rage Potion  (sort 16941, sibling)
--   94273  Craftsman's Writ: Moonsteel Broadsword  (sort 16941, near 44)
--   94285  Craftsman's Writ: Unstable Trigger  (sort 16941, near 53)
--   94297  Craftsman's Writ: Quickdraw Quiver  (sort 16941, near 53)
--   94309  Craftsman's Writ: Star Belt  (sort 16941, near 59)
--   98341  The Great Windborne Cat Spirit  (sort -263, near 332)
--   98342  The Great Cat Spirit  (sort -263, sibling)
--   98362  To Thunder Bluff  (sort -263, sibling)
--   98404  The Great Windborne Cat Spirit  (sort -263, near 332)
--   98405  The Great Cat Spirit  (sort -263, sibling)
--   98738  Blessings of the Great Windborne Cat Spirit  (sort -263, sibling)
--   98739  Blessings of the Great Cat Spirit  (sort -263, sibling)
--
-- Worldserver restart required (quest POI data loads at startup).

INSERT IGNORE INTO quest_poi (QuestID,BlobIndex,Idx1,ObjectiveIndex,QuestObjectiveID,QuestObjectID,MapID,UiMapID,Priority,Flags,WorldEffectID,PlayerConditionID,NavigationPlayerConditionID,SpawnTrackingID,AlwaysAllowMergingBlobs,VerifiedBuild) VALUES
(94261,0,0,-1,0,0,1,1450,0,0,0,0,0,0,0,70124),
(94273,0,0,-1,0,0,1,1450,0,0,0,0,0,0,0,70124),
(94285,0,0,-1,0,0,1,1450,0,0,0,0,0,0,0,70124),
(94297,0,0,-1,0,0,1,1450,0,0,0,0,0,0,0,70124),
(94309,0,0,-1,0,0,1,1450,0,0,0,0,0,0,0,70124),
(98341,0,0,-1,0,0,1,1450,0,0,0,0,0,0,0,70124),
(98342,0,0,-1,0,0,1,1450,0,0,0,0,0,0,0,70124),
(98362,0,0,-1,0,0,1,1412,0,0,0,0,0,0,0,70124),
(98404,0,0,-1,0,0,1,1450,0,0,0,0,0,0,0,70124),
(98405,0,0,-1,0,0,1,1450,0,0,0,0,0,0,0,70124),
(98738,0,0,-1,0,0,1,1450,0,0,0,0,0,0,0,70124),
(98739,0,0,-1,0,0,1,1450,0,0,0,0,0,0,0,70124);

INSERT IGNORE INTO quest_poi_points (QuestID,Idx1,Idx2,X,Y,Z,VerifiedBuild) VALUES
(94261,0,0,8020,-2679,525,70124),
(94273,0,0,7840,-2563,489,70124),
(94285,0,0,7834,-2613,489,70124),
(94297,0,0,7834,-2613,489,70124),
(94309,0,0,7990,-2576,503,70124),
(98341,0,0,7359,-2397,488,70124),
(98342,0,0,7355,-2729,463,70124),
(98362,0,0,-1039,-282,159,70124),
(98404,0,0,7359,-2397,488,70124),
(98405,0,0,7355,-2729,463,70124),
(98738,0,0,8020,-2679,525,70124),
(98739,0,0,8020,-2679,525,70124);

-- Undo (also ready-to-run in undo/undo_0032_world_turnin_poi_moonglade.sql):
--   DELETE FROM quest_poi WHERE QuestID IN (94261,94273,94285,94297,94309,98341,98342,98362,98404,98405,98738,98739) AND VerifiedBuild=70124;
--   DELETE FROM quest_poi_points WHERE QuestID IN (94261,94273,94285,94297,94309,98341,98342,98362,98404,98405,98738,98739) AND VerifiedBuild=70124;
