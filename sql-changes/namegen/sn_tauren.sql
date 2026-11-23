-- sn_tauren.sql — tauren surnames (race 6): whole surnames + compound parts
INSERT IGNORE INTO `playerbots_surnames` (`surname`,`race`,`gender`) VALUES
('Amberhide',6,2),('Bisonmane',6,2),('Bloodtusk',6,2),('Cloudmane',6,2),('Darkhorn',6,2),
('Dawnhorn',6,2),('Dustmane',6,2),('Eaglefeather',6,2),('Earthbinder',6,2),('Farstalker',6,2),
('Flintmane',6,2),('Goldenmane',6,2),('Greathoof',6,2),('Greyhoof',6,2),('Hawksight',6,2),
('Ironhide',6,2),('Kindspirit',6,2),('Longhorn',6,2),('Misthoof',6,2),('Mountainfoot',6,2),
('Plainstrider',6,2),('Proudhorn',6,2),('Redmane',6,2),('Riverstone',6,2),('Rockhorn',6,2),
('Runningwater',6,2),('Skychaser',6,2),('Stonehoof',6,2),('Stormhide',6,2),('Strongtotem',6,2),
('Sundancer',6,2),('Swiftmane',6,2),('Swiftstride',6,2),('Tallhorn',6,2),('Thunderhorn',6,2),
('Truenorth',6,2),('Whitetail',6,2),('Winterhoof',6,2),('Crestmane',6,2),('Hornrider',6,2),
('Palehide',6,2),('Spiritwalker',6,2),('Windsinger',6,2),('Youngbull',6,2),('Meadowrun',6,2);

INSERT IGNORE INTO `playerbots_surname_parts` (`part`,`half`,`race`) VALUES
('Amber',0,6),('Bison',0,6),('Blood',0,6),('Cloud',0,6),('Dark',0,6),
('Dawn',0,6),('Dust',0,6),('Eagle',0,6),('Earth',0,6),('Flint',0,6),
('Golden',0,6),('Grass',0,6),('Great',0,6),('Grey',0,6),('Hawk',0,6),
('Hill',0,6),('Iron',0,6),('Kind',0,6),('Long',0,6),('Meadow',0,6),
('Mist',0,6),('Mountain',0,6),('Pale',0,6),('Plain',0,6),('Proud',0,6),
('Rain',0,6),('Red',0,6),('River',0,6),('Rock',0,6),('Running',0,6),
('Sky',0,6),('Spirit',0,6),('Stone',0,6),('Storm',0,6),('Strong',0,6),
('Sun',0,6),('Swift',0,6),('Tall',0,6),('Thunder',0,6),('True',0,6),
('White',0,6),('Wild',0,6),('Wind',0,6),('Winter',0,6),('Young',0,6),
('binder',1,6),('bull',1,6),('chaser',1,6),('crest',1,6),('dancer',1,6),
('feather',1,6),('foot',1,6),('hide',1,6),('hoof',1,6),('horn',1,6),
('mane',1,6),('north',1,6),('rider',1,6),('runner',1,6),('sight',1,6),
('singer',1,6),('spirit',1,6),('stalker',1,6),('stone',1,6),('stride',1,6),
('strider',1,6),('tail',1,6),('totem',1,6),('tusk',1,6),('walker',1,6),
('water',1,6),('winds',1,6);
