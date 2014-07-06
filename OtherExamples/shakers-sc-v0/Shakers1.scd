
NetAddr.localAddr;

'/shakers2'.cpt;
//:
2 * 2 * 0.125

//:
Pdef('/shakers1',
 Pbind(\type, \chuckInstrument, \instrument, '/shakers1', 
	\dur, [0.125 pn: 16, 0.25, 0.5, 1.0, 2.0].pseq, 
	'noteOn', 0.01, 
	'preset', [3, 4, 5, 6, 7, 8, 9, 10, 20, 22].pseq, 
	'objects', [1, 50, 100].prand, 
	'freq', (100, 200 .. 12000).prand, 
	'energy', 0.09, 
	'decay', 0.05)).play

//:
Pdef('/shakers2',
 Pbind(\type, \chuckInstrument, \instrument, '/shakers2', 
	\dur, 0.1 , 
	'noteOn', 0.1, 
	'preset', 1, 
	'objects', 0.1, 
	'freq', 1000, 
	'energy', 0.91, 
	'decay', 0.1)).play

//:

Pdef('/shakers3',
 Pbind(\type, \chuckInstrument, \instrument, '/shakers3', 
	\dur, 20, 
	'noteOn', 0.9, 
	'preset', 1, 
	'objects', 4.1, 
	'freq', 500, 
	'energy', 0.91, 
	'decay', 0.1)).play

//:

Pdef('/shakers3').stop;