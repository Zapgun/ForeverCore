-- sn_skyborne_h.sql — Windshaper Skyborne surnames (race 96): whole + compound parts
-- Wind/storm theme: gales, tempests, sky and weather.
INSERT IGNORE INTO `playerbots_surnames` (`surname`,`race`,`gender`) VALUES
('Aetherborn',96,2),('Breezeborn',96,2),('Cloudweaver',96,2),('Cyclonewind',96,2),('Galehart',96,2),
('Galewing',96,2),('Hurricrest',96,2),('Mistralwind',96,2),('Skybreaker',96,2),('Skyreaver',96,2),
('Squallrunner',96,2),('Stormbinder',96,2),('Stormfeather',96,2),('Stormwing',96,2),('Tempestborn',96,2),
('Thundercrest',96,2),('Twisterwind',96,2),('Windcaller',96,2),('Windrider',96,2),('Windshard',96,2),
('Zephyrhart',96,2),('Zephyrlight',96,2),('Aetherstorm',96,2),('Galesinger',96,2),('Nimbuswing',96,2),
('Skyseeker',96,2),('Stormrider',96,2),('Tempestwing',96,2),('Vortexwind',96,2),('Windweaver',96,2),
('Zephyrborn',96,2),('Breezewing',96,2),('Cyclonecrest',96,2),('Galeshard',96,2),('Stormsinger',96,2);

INSERT IGNORE INTO `playerbots_surname_parts` (`part`,`half`,`race`) VALUES
('Aether',0,96),('Breeze',0,96),('Cloud',0,96),('Cyclone',0,96),('Gale',0,96),
('Gust',0,96),('Hurri',0,96),('Mistral',0,96),('Nimbus',0,96),('Sky',0,96),
('Squall',0,96),('Storm',0,96),('Tempest',0,96),('Thunder',0,96),('Twister',0,96),
('Vortex',0,96),('Wind',0,96),('Zephyr',0,96),
('binder',1,96),('born',1,96),('breaker',1,96),('breeze',1,96),('caller',1,96),
('crest',1,96),('feather',1,96),('hart',1,96),('light',1,96),('reaver',1,96),
('rider',1,96),('runner',1,96),('seeker',1,96),('shard',1,96),('shaper',1,96),
('singer',1,96),('storm',1,96),('weaver',1,96),('wind',1,96),('wing',1,96);
