-- sn_nightelf.sql — night elf surnames (race 4): whole surnames + compound parts
INSERT IGNORE INTO `playerbots_surnames` (`surname`,`race`,`gender`) VALUES
('Duskbloom',4,2),('Duskrunner',4,2),('Feathersong',4,2),('Leafshade',4,2),('Lightweave',4,2),
('Mistwalker',4,2),('Moonshadow',4,2),('Nightbreeze',4,2),('Nightwind',4,2),('Pinebough',4,2),
('Quillfeather',4,2),('Raincaller',4,2),('Ravenwood',4,2),('Shadowglade',4,2),('Shadowleaf',4,2),
('Silvershade',4,2),('Skywhisper',4,2),('Spiritwind',4,2),('Starfall',4,2),('Stargazer',4,2),
('Starsong',4,2),('Swiftarrow',4,2),('Thornbrush',4,2),('Treeshade',4,2),('Umbersong',4,2),
('Wildgrove',4,2),('Willowshade',4,2),('Dewdancer',4,2),('Emberfall',4,2),('Fernwalker',4,2),
('Leafwhisper',4,2),('Moonweave',4,2),('Oakshade',4,2),('Rosethorn',4,2),('Silverleaf',4,2),
('Starwhisper',4,2),('Thistledown',4,2),('Willowmere',4,2),('Wispglade',4,2),('Zephyrshade',4,2);

INSERT IGNORE INTO `playerbots_surname_parts` (`part`,`half`,`race`) VALUES
('Dew',0,4),('Dusk',0,4),('Ember',0,4),('Feather',0,4),('Fern',0,4),
('Leaf',0,4),('Light',0,4),('Mist',0,4),('Moon',0,4),('Night',0,4),
('Pine',0,4),('Quill',0,4),('Rain',0,4),('Raven',0,4),('Rose',0,4),
('Shadow',0,4),('Silver',0,4),('Sky',0,4),('Spirit',0,4),('Star',0,4),
('Thistle',0,4),('Thorn',0,4),('Tree',0,4),('Umber',0,4),('Wild',0,4),
('Willow',0,4),('Wisp',0,4),('Zephyr',0,4),
('bloom',1,4),('bough',1,4),('breeze',1,4),('brush',1,4),('caller',1,4),
('dancer',1,4),('fall',1,4),('feather',1,4),('flower',1,4),('gazer',1,4),
('glade',1,4),('grove',1,4),('leaf',1,4),('mere',1,4),('moon',1,4),
('runner',1,4),('shade',1,4),('shadow',1,4),('song',1,4),('spirit',1,4),
('star',1,4),('stride',1,4),('walker',1,4),('weave',1,4),('whisper',1,4),
('wind',1,4),('wing',1,4),('wood',1,4);
