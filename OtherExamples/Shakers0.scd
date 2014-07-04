
'/shakers'.cet;

//:

(type: \chuckInstrument, instrument: '/shakers',
	dur: 0.5 , 
	noteOn: 0.1, 
	preset: 0, 
	objects: 1.0, 
	freq: 0.1, 
	energy: 0.1, 
	decay: 0.1) => \shakers;

(preset: 2) +> \shakers;
(preset: 17) +> \shakers;
(preset: 16) +> \shakers;
(preset: 18) +> \shakers;
(energy: 0.2) +> \shakers;
(freq: [100, 200.0].pwhite) +> \shakers;
(decay: 0.905) +> \shakers;
(dur: 0.2) +> \shakers;
(objects: [1, 2.0].pwhite) +> \shakers;

//:
'/shakers'.cpt;

//:
Pdef('/shakers',
 Pbind(\type, \chuckInstrument, \instrument, '/shakers', 
	\dur, [0.25 pn: 4, 0.125 pn: 16, 1.25 pn: 2].pseq, 
	'noteOn', 0.1, 
	'preset', 20, 
	'objects', [1.0, 81.0, 120.0].prand, 
	'freq', [100, 200, 400, 800, 1000, 2000, 3000, 4000, 5000, 6000, 12000].prand, 
	'energy', 0.51, 
	'decay', 0.91)).play
