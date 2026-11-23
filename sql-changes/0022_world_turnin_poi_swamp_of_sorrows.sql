-- 0022_world_turnin_poi_swamp_of_sorrows.sql: hand-in ('?') map markers for 26 custom quests, swamp of sorrows (UiMapID 1435).
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
--   93464  The Visiting Mage  (sort 8, sibling)
--   93663  Lost in Transit  (sort 8, sibling)
--   94264  Craftsman's Writ: Shadow Oil  (sort 16941, near 50)
--   94276  Craftsman's Writ: Wicked Mithril Blade  (sort 16941, near 50)
--   94288  Craftsman's Writ: Mithril Frag Bomb  (sort 16941, near 43)
--   94300  Craftsman's Writ: Big Voodoo Mask  (sort 16941, near 50)
--   94312  Craftsman's Writ: Orange Martial Shirt  (sort 16941, near 43)
--   94613  My Kingdom for a Horse  (sort 16591, near 668)
--   94877  Saving Sunnyglade  (sort 16591, near 1000)
--   94879  Scraps of Knowledge  (sort 16591, near 1000)
--   94879  Scraps of Knowledge  (sort 16591, near 998)
--   94881  Curious Trinkets  (sort 16591, near 998)
--   94886  The Western Front  (sort 16591, near 352)
--   94887  Saving Marshal Ryan  (sort 16591, near 167)
--   94923  Hats Off  (sort 16591, near 512)
--   94999  Eyes for the Watchman  (sort 16591, near 370)
--   95329  Out in the Field  (sort 16591, near 403)
--   95561  Apple of My Eye  (sort 16591, near 876)
--   95603  Bats in the Belfry  (sort 16591, near 786)
--   95615  In Memoriam  (sort 16591, near 786)
--   95912  WANTED: Blademaster Kaijo  (sort 16591, near 1002)
--   95913  Fit for a Princess  (sort 16591, near 876)
--   95943  Foreman's Plight  (sort 16591, near 906)
--   95961  Stepped Out  (sort 16591, near 1093)
--   95991  WANTED: Ghostmaw  (sort 16591, near 804)
--   96009  High Stakes  (sort 16591, near 906)
--   96085  Upstream Contamination  (sort 16591, near 786)
--
-- Worldserver restart required (quest POI data loads at startup).

INSERT IGNORE INTO quest_poi (QuestID,BlobIndex,Idx1,ObjectiveIndex,QuestObjectiveID,QuestObjectID,MapID,UiMapID,Priority,Flags,WorldEffectID,PlayerConditionID,NavigationPlayerConditionID,SpawnTrackingID,AlwaysAllowMergingBlobs,VerifiedBuild) VALUES
(93464,0,0,-1,0,0,1,1443,0,0,0,0,0,0,0,70124),
(93663,0,0,-1,0,0,0,1435,0,0,0,0,0,0,0,70124),
(94264,0,0,-1,0,0,0,1435,0,0,0,0,0,0,0,70124),
(94276,0,0,-1,0,0,0,1435,0,0,0,0,0,0,0,70124),
(94288,0,0,-1,0,0,0,1435,0,0,0,0,0,0,0,70124),
(94300,0,0,-1,0,0,0,1435,0,0,0,0,0,0,0,70124),
(94312,0,0,-1,0,0,0,1435,0,0,0,0,0,0,0,70124),
(94613,0,0,-1,0,0,0,84,0,0,0,0,0,0,0,70124),
(94877,0,0,-1,0,0,0,1435,0,0,0,0,0,0,0,70124),
(94879,0,0,-1,0,0,0,1435,0,0,0,0,0,0,0,70124),
(94879,1,1,-1,0,0,0,1435,0,0,0,0,0,0,0,70124),
(94881,0,0,-1,0,0,0,1435,0,0,0,0,0,0,0,70124),
(94886,0,0,-1,0,0,0,36,0,0,0,0,0,0,0,70124),
(94887,0,0,-1,0,0,0,36,0,0,0,0,0,0,0,70124),
(94923,0,0,-1,0,0,0,1435,0,0,0,0,0,0,0,70124),
(94999,0,0,-1,0,0,0,1433,0,0,0,0,0,0,0,70124),
(95329,0,0,-1,0,0,0,84,0,0,0,0,0,0,0,70124),
(95561,0,0,-1,0,0,0,1435,0,0,0,0,0,0,0,70124),
(95603,0,0,-1,0,0,0,1435,0,0,0,0,0,0,0,70124),
(95615,0,0,-1,0,0,0,1435,0,0,0,0,0,0,0,70124),
(95912,0,0,-1,0,0,0,84,0,0,0,0,0,0,0,70124),
(95913,0,0,-1,0,0,0,1435,0,0,0,0,0,0,0,70124),
(95943,0,0,-1,0,0,0,1435,0,0,0,0,0,0,0,70124),
(95961,0,0,-1,0,0,0,84,0,0,0,0,0,0,0,70124),
(95991,0,0,-1,0,0,0,1435,0,0,0,0,0,0,0,70124),
(96009,0,0,-1,0,0,0,1435,0,0,0,0,0,0,0,70124),
(96085,0,0,-1,0,0,0,1435,0,0,0,0,0,0,0,70124);

INSERT IGNORE INTO quest_poi_points (QuestID,Idx1,Idx2,X,Y,Z,VerifiedBuild) VALUES
(93464,0,0,-362,2485,75,70124),
(93663,0,0,-10101,-2819,22,70124),
(94264,0,0,-10425,-3645,23,70124),
(94276,0,0,-10425,-3645,23,70124),
(94288,0,0,-10257,-3824,18,70124),
(94300,0,0,-10425,-3645,23,70124),
(94312,0,0,-10257,-3824,18,70124),
(94613,0,0,-8821,-4559,29,70124),
(94877,0,0,-9081,-5120,53,70124),
(94879,0,0,-9081,-5120,53,70124),
(94879,1,0,-9086,-5122,44,70124),
(94881,0,0,-9086,-5122,44,70124),
(94886,0,0,-8051,-3366,167,70124),
(94887,0,0,-7786,-3160,184,70124),
(94923,0,0,-9137,-3997,37,70124),
(94999,0,0,-8916,-3656,73,70124),
(95329,0,0,-8530,-4773,32,70124),
(95561,0,0,-9124,-4986,38,70124),
(95603,0,0,-9157,-4889,56,70124),
(95615,0,0,-9157,-4889,56,70124),
(95912,0,0,-9040,-5093,39,70124),
(95913,0,0,-9124,-4986,38,70124),
(95943,0,0,-9066,-4967,41,70124),
(95961,0,0,-8215,-5715,6,70124),
(95991,0,0,-9215,-4976,37,70124),
(96009,0,0,-9066,-4967,41,70124),
(96085,0,0,-9157,-4889,56,70124);

-- Undo (also ready-to-run in undo/undo_0022_world_turnin_poi_swamp_of_sorrows.sql):
--   DELETE FROM quest_poi WHERE QuestID IN (93464,93663,94264,94276,94288,94300,94312,94613,94877,94879,94881,94886,94887,94923,94999,95329,95561,95603,95615,95912,95913,95943,95961,95991,96009,96085) AND VerifiedBuild=70124;
--   DELETE FROM quest_poi_points WHERE QuestID IN (93464,93663,94264,94276,94288,94300,94312,94613,94877,94879,94881,94886,94887,94923,94999,95329,95561,95603,95615,95912,95913,95943,95961,95991,96009,96085) AND VerifiedBuild=70124;
