-- sn_gnome.sql — gnome surnames (race 7): whole surnames + compound parts
INSERT IGNORE INTO `playerbots_surnames` (`surname`,`race`,`gender`) VALUES
('Brassbolt',7,2),('Clockspring',7,2),('Cogspinner',7,2),('Dizzlespark',7,2),('Fanglebolt',7,2),
('Fizzlebang',7,2),('Gearspring',7,2),('Gearwhistle',7,2),('Hotsprocket',7,2),('Hotwrench',7,2),
('Jiggsworth',7,2),('Klackspring',7,2),('Klickclack',7,2),('Looscrew',7,2),('Mechabolt',7,2),
('Megafuse',7,2),('Nimblebolt',7,2),('Nutwrench',7,2),('Oilspark',7,2),('Overlock',7,2),
('Pistonfist',7,2),('Pistonrod',7,2),('Quickcoil',7,2),('Quickspring',7,2),('Razzlebang',7,2),
('Rustbolt',7,2),('Sparkwhistle',7,2),('Sprocketslip',7,2),('Tinkerton',7,2),('Togglebolt',7,2),
('Underbolt',7,2),('Voltspring',7,2),('Voltwrench',7,2),('Widgetwhirl',7,2),('Wobblegear',7,2),
('Zippyfuse',7,2),('Bumblegear',7,2),('Crankshaft',7,2),('Fidgitspark',7,2),('Wrenchbolt',7,2),
('Zappanoodle',7,2),('Steamwhistle',7,2),('Nutmegger',7,2),('Kerfuffle',7,2),('Whirligig',7,2);

INSERT IGNORE INTO `playerbots_surname_parts` (`part`,`half`,`race`) VALUES
('Brass',0,7),('Bumble',0,7),('Clock',0,7),('Cog',0,7),('Crank',0,7),
('Dabble',0,7),('Dizzle',0,7),('Fangle',0,7),('Fiddle',0,7),('Fizz',0,7),
('Gear',0,7),('Gizmo',0,7),('Hot',0,7),('Jig',0,7),('Klack',0,7),
('Klick',0,7),('Mega',0,7),('Nimble',0,7),('Nut',0,7),('Oil',0,7),
('Over',0,7),('Piston',0,7),('Quick',0,7),('Razzle',0,7),('Rust',0,7),
('Spark',0,7),('Sprocket',0,7),('Spring',0,7),('Steam',0,7),('Tinker',0,7),
('Toggle',0,7),('Volt',0,7),('Whiz',0,7),('Widget',0,7),('Wobble',0,7),
('Zippy',0,7),
('bang',1,7),('bolt',1,7),('bung',1,7),('clack',1,7),('coil',1,7),
('crank',1,7),('doo',1,7),('fist',1,7),('fuse',1,7),('gear',1,7),
('gleam',1,7),('hopper',1,7),('klack',1,7),('knob',1,7),('lock',1,7),
('noodle',1,7),('rod',1,7),('screw',1,7),('shaft',1,7),('spark',1,7),
('spin',1,7),('spring',1,7),('spurt',1,7),('ton',1,7),('trill',1,7),
('whistle',1,7),('whirl',1,7),('wrench',1,7),('zap',1,7),('zip',1,7);
