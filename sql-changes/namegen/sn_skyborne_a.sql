-- sn_skyborne_a.sql — High Order Skyborne surnames (race 95): whole + compound parts
-- Celestial/orderly theme: spires, dawn, stars, the firmament.
INSERT IGNORE INTO `playerbots_surnames` (`surname`,`race`,`gender`) VALUES
('Aetherwind',95,2),('Aurorawing',95,2),('Aurumcrest',95,2),('Brightfeather',95,2),('Brightspire',95,2),
('Celestwing',95,2),('Cloudrest',95,2),('Dawnbearer',95,2),('Dawnseeker',95,2),('Dawnspire',95,2),
('Dawnwhisper',95,2),('Empyreal',95,2),('Firmament',95,2),('Galecrest',95,2),('Heavenfield',95,2),
('Highfeather',95,2),('Highspire',95,2),('Lightspire',95,2),('Skycrown',95,2),('Skylance',95,2),
('Skysong',95,2),('Starborne',95,2),('Starspire',95,2),('Sunfeather',95,2),('Sunspire',95,2),
('Zenithwing',95,2),('Dawncrown',95,2),('Halofern',95,2),('Lumenspire',95,2),('Skywarden',95,2),
('Starscepter',95,2),('Aureliawing',95,2),('Celestborne',95,2),('Dawnlight',95,2),('Heavenspire',95,2);

INSERT IGNORE INTO `playerbots_surname_parts` (`part`,`half`,`race`) VALUES
('Aether',0,95),('Aurora',0,95),('Aurum',0,95),('Bright',0,95),('Celest',0,95),
('Cloud',0,95),('Dawn',0,95),('Empyr',0,95),('Firm',0,95),('Gale',0,95),
('Halo',0,95),('Heaven',0,95),('High',0,95),('Light',0,95),('Lumen',0,95),
('Sky',0,95),('Solar',0,95),('Star',0,95),('Sun',0,95),('Zenith',0,95),
('Zephyr',0,95),
('borne',1,95),('crest',1,95),('crown',1,95),('feather',1,95),('fern',1,95),
('field',1,95),('lance',1,95),('light',1,95),('mant',1,95),('rest',1,95),
('scepter',1,95),('seeker',1,95),('song',1,95),('spire',1,95),('warden',1,95),
('whisper',1,95),('wing',1,95);
