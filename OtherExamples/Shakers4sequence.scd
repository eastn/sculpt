
Pdef('/shakers4',
 Pbind(\type, \chuckInstrument, \instrument, '/shakers4', 
	\dur, 0.125, 
	'noteOn', 0.1, 
	'preset', 0, 
	'objects', 1, 
	'freq', 600, 
	'energy',0.5, 
	'decay', 0.5)).play;

//:
Pdef('/shakers4',
 Pbind(\type, \chuckInstrument, \instrument, '/shakers4', 
	\dur, 0.125, 
	'noteOn', 0.1, 
	'preset', [0, 1].pseq, 
	'objects', 1, 
	'freq', 600, 
	'energy',0.5, 
	'decay', 0.5)).play

//:
Pdef('/shakers4',
 Pbind(\type, \chuckInstrument, \instrument, '/shakers4', 
	\dur, 0.125, 
	'noteOn', 0.1, 
	'preset', [0, 1].prand, 
	'objects', 1, 
	'freq', 600, 
	'energy',0.5, 
	'decay', 0.5)).play

//:
Pdef('/shakers4',
 Pbind(\type, \chuckInstrument, \instrument, '/shakers4', 
	\dur, 0.125, 
	'noteOn', 0.1, 
	'preset', [0, 1, 2].prand, 
	'objects', 1, 
	'freq', [600, 1200].pseq, 
	'energy', 0.5, 
	'decay', 0.5)).play


//:
Pdef('/shakers4',
 Pbind(\type, \chuckInstrument, \instrument, '/shakers4', 
	\dur, 0.125, 
	'noteOn', 0.1, 
	'preset', [0, 1, 2].prand, 
	'objects', 1, 
	'freq', [600, 1200, 2400].pseq, 
	'energy', 0.5, 
	'decay', 0.5)).play

//:
Pdef('/shakers4',
 Pbind(\type, \chuckInstrument, \instrument, '/shakers4', 
	\dur, 0.125, 
	'noteOn', 0.1, 
	'preset', [0, 1, 2, 3].prand, 
	'objects', 1, 
	'freq', [600, 1200, 2400].pseq, 
	'energy', 0.5, 
	'decay', 0.5)).play

//:
Pdef('/shakers4',
 Pbind(\type, \chuckInstrument, \instrument, '/shakers4', 
	\dur, 0.125, 
	'noteOn', 0.1, 
	'preset', [0, 1, 2, 3, 4].prand, 
	'objects', 1, 
	'freq', [600, 1200, 2400].pseq, 
	'energy', 0.5, 
	'decay', 0.5)).play
//:
Pdef('/shakers4',
 Pbind(\type, \chuckInstrument, \instrument, '/shakers4', 
	\dur, [0.125 pn: 8, (0.125/2) pn: 16, 0.5, 1.0].pseq, 
	'noteOn', 0.1, 
	'preset', [0, 1, 2, 3, 4].prand, 
	'objects', 1, 
	'freq', [600, 1200, 2400].pseq, 
	'energy', 0.5, 
	'decay', 0.5)).play
//:
//:
Pdef('/shakers4',
 Pbind(\type, \chuckInstrument, \instrument, '/shakers4', 
	\dur, [0.125 pn: 8, (0.125/2) pn: 16, 0.5, 1.0].pseq, 
	'noteOn', 0.1, 
	'preset', [0, 1, 2, 3, 4].prand, 
	'objects', 1, 
	'freq', [600, 1200, 2400, 100].pseq, 
	'energy', [0.01 pn: 16, 0.5].pseq, 
	'decay', 0.5)).play
//:
Pdef('/shakers4',
 Pbind(\type, \chuckInstrument, \instrument, '/shakers4', 
	\dur, [0.125 pn: 8, (0.125/2) pn: 16, 0.5, 1.0].prand, 
	'noteOn', 0.1, 
	'preset', [0, 1, 2, 3, 4].prand, 
	'objects', 1, 
	'freq', [600, 1200, 2400, 100].pseq, 
	'energy', [0.01 pn: 16, 0.5].pseq, 
	'decay', 0.5)).play
//:
Pdef('/shakers4',
 Pbind(\type, \chuckInstrument, \instrument, '/shakers4', 
	\dur, [0.125 pn: 8, (0.125/2) pn: 16, 0.5, 2.0].prand, 
	'noteOn', 0.1, 
	'preset', (0..21).prand, 
	'objects', 1, 
	'freq', [600, 1200, 2400, 100].pseq, 
	'energy', [0.01 pn: 16, 0.5].pseq, 
	'decay', 0.5)).play
//:
Pdef('/shakers4',
 Pbind(\type, \chuckInstrument, \instrument, '/shakers4', 
	\dur, [0.125 pn: 16, 0.25, 0.5, 1.0, 2.0].pseq, 
	'noteOn', [2.91 pn: 16].prand, 
	'preset', [3, 4, 5, 6, 7, 8, 9, 10, 20, 22].pseq, 
	'objects', [1, 50, 100].prand, 
	'freq', (100, 200 .. 12000).prand, 
	'energy', 0.09, 
	'decay', 0.05)).play;
//:
Pdef('/shakers4',
 Pbind(\type, \chuckInstrument, \instrument, '/shakers4', 
	\dur, [0.125 pn: 16, 0.25, 0.5, 1.0, 2.0].pseq, 
	'noteOn', [2.91 pn: 16].prand, 
	'preset', 1, 
	'objects', [1, 50, 100].prand, 
	'freq', (100, 200 .. 12000).prand, 
	'energy', 0.09, 
	'decay', 0.05)).play;
//:
//:
Pdef('/shakers4',
 Pbind(\type, \chuckInstrument, \instrument, '/shakers4', 
	\dur, 0.1, 
	'noteOn', [2.91 pn: 16].prand, 
	'preset', 14, 
	'objects', 1, 
	'freq', 10, 
	'energy', 100.49, 
	'decay', 0.05)).play;
//:
Pdef('/shakers4',
 Pbind(\type, \chuckInstrument, \instrument, '/shakers4', 
	\dur, 0.01, 
	'noteOn', 0.5, 
	'preset', 14, 
	'objects', 1, 
	'freq', (1..1000).pseq, 
	'energy', 0.49, 
	'decay', 0.05)).play;
//:
//:
Pdef('/shakers4',
 Pbind(\type, \chuckInstrument, \instrument, '/shakers4', 
	\dur, Pbrown(0.01, 0.2, 0.01, inf), 
	'noteOn', 0.5, 
	'preset', 14, 
	'objects', 1, 
	'freq', (1..1000).pseq, 
	'energy', 0.49, 
	'decay', 0.05)).play;
//:
Pdef('/shakers4',
 Pbind(\type, \chuckInstrument, \instrument, '/shakers4', 
	\dur, Pbrown(0.01, 0.2, 0.01, inf), 
	'noteOn', 0.5, 
	'preset', 14, 
	'objects', 1, 
	'freq', Pbrown(1, 1000, 1, inf), 
	'energy', 0.49, 
	'decay', 0.05)).play;
//:
Pdef('/shakers4',
 Pbind(\type, \chuckInstrument, \instrument, '/shakers4', 
	\dur, Pbrown(0.01, 0.2, 0.01, inf), 
	'noteOn', 0.5, 
	'preset', [14].prand, 
	'objects', 1, 
	'freq', Pbrown(1, 10, 2, inf), 
	'energy', 0.49, 
	'decay', 0.05)).play;


