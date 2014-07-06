//:

'/brass'.cpt;

//:

Pdef('/brass3',
 Pbind(\type, \chuckInstrument, \instrument, '/brass3', 
	\dur, 0.125 , 
	'noteOn', 0.1, 
	'freq', 0.1, 
	'lip', 0.1, 
	'slide', 0.1, 
	'vibratoFreq', 0.1, 
	'vibratoGain', 0.05, 
	'volume', 0.1, 
	'clear', 0.1, 
	'startBlowing', 0.1, 
	'stopBlowing', 0.1, 
	'rate', 0.1)).play

//:
Pdef('/brass3',
 Pbind(\type, \chuckInstrument, \instrument, '/brass3', 
	\dur, 0.125 , 
	'noteOn', 0.1, 
	'freq', 100, 
	'lip', 0.1, 
	'slide', 0.1, 
	'vibratoFreq', 0.1, 
	'vibratoGain', 0.1, 
	'volume', 0.1, 
	'clear', 0.1, 
	'startBlowing', 0.1, 
	'stopBlowing', 0.1, 
	'rate', 0.1)).play
//:
Pdef('/brass3',
 Pbind(\type, \chuckInstrument, \instrument, '/brass3', 
	\dur, 0.125, 
	'noteOn', 0.1, 
	'freq', (100..1000).pseq, 
	'lip', 0.1, 
	'slide', 0.1, 
	'vibratoFreq', 0.02, 
	'vibratoGain', 0.1, 
	'volume', 0.1, 
	'clear', 0.1, 
	'startBlowing', 0.1, 
	'stopBlowing', 0.1, 
	'rate', 0.1)).play
//:
Pdef('/brass3',
 Pbind(\type, \chuckInstrument, \instrument, '/brass3', 
	\dur, 0.125, 
	'noteOn', 0.1, 
	'freq', 1000, 
	'lip', 0.1, 
	'slide', 0.1, 
	'vibratoFreq', 0.01, 
	'vibratoGain', 0.1, 
	'volume', 0.1, 
	'clear', 0.1, 
	'startBlowing', 0.1, 
	'stopBlowing', 0.1, 
	'rate', 0.1)).play;
//:
Pdef('/brass3',
 Pbind(\type, \chuckInstrument, \instrument, '/brass3', 
	\dur, 0.125 / 2, 
	'noteOn', 0.1, 
	'freq', Pbrown(100, 500, 10, inf), 
	'lip', 0.1, 
	'slide', 0.1, 
	'vibratoFreq', 0.01, 
	'vibratoGain', 0.1, 
	'volume', 0.1, 
	'clear', 0.1, 
	'startBlowing', 0.1, 
	'stopBlowing', 0.1, 
	'rate', 0.1)).play;
//:

//:
Pdef('/brass3',
 Pbind(\type, \chuckInstrument, \instrument, '/brass3', 
	\dur, Pbrown(0.02, 0.125, 0.01, inf), 
	'noteOn', 0.1, 
	'freq', 1000, 
	'lip', 0.1, 
	'slide', 0.1, 
	'vibratoFreq', 0.01, 
	'vibratoGain', 0.1, 
	'volume', 0.1, 
	'clear', 0.1, 
	'startBlowing', 0.1, 
	'stopBlowing', 0.1, 
	'rate', 0.1)).play;
//:
Pdef('/brass3',
 Pbind(\type, \chuckInstrument, \instrument, '/brass3', 
	\dur, Pbrown(0.02, 0.125, 0.01, inf), 
	'noteOn', 0.1, 
	'freq', Pbrown(100, 1000, 1, inf), 
	'lip', 0.01, 
	'slide', 0.1, 
	'vibratoFreq', 0.01, 
	'vibratoGain', 0.1, 
	'volume', 0.1, 
	'clear', 0.1, 
	'startBlowing', 0.1, 
	'stopBlowing', 0.1, 
	'rate', 0.1)).play;
//:
Pdef('/brass3',
 Pbind(\type, \chuckInstrument, \instrument, '/brass3', 
	\dur, 0.125 / 2, 
	'noteOn', 0.1, 
	'freq', 1000, 
	'lip', 0.1, 
	'slide', 0.1, 
	'vibratoFreq', 0.01, 
	'vibratoGain', 0.1, 
	'volume', 0.1, 
	'clear', 0.1, 
	'startBlowing', 0.1, 
	'stopBlowing', 0.1, 
	'rate', 0.1)).play;
//:
Pdef('/brass3',
 Pbind(\type, \chuckInstrument, \instrument, '/brass3', 
	\dur, 0.125 / 2, 
	'noteOn', 0.1, 
	'freq', 1000, 
	'lip', 0.1, 
	'slide', 0.1, 
	'vibratoFreq', 0.05, 
	'vibratoGain', 0.05, 
	'volume', 0.1, 
	'clear', 0.1, 
	'startBlowing', 0.1, 
	'stopBlowing', 0.1, 
	'rate', 0.1)).play;
//:
Pdef('/brass3',
 Pbind(\type, \chuckInstrument, \instrument, '/brass3', 
	\dur, 0.125 / 2, 
	'noteOn', 0.1, 
	'freq', 1000, 
	'lip', 0.1, 
	'slide', 0.1, 
	'vibratoFreq', 0.1, 
	'vibratoGain', 0.4, 
	'volume', 0.1, 
	'clear', 0.1, 
	'startBlowing', 0.1, 
	'stopBlowing', 0.1, 
	'rate', 0.1)).play;
//:
Pdef('/brass3',
 Pbind(\type, \chuckInstrument, \instrument, '/brass3', 
	\dur, 0.125 / 2, 
	'noteOn', 0.1, 
	'freq', Pbrown(400, 4000, 1, inf), 
	'lip', 0.1, 
	'slide', 0.1, 
	'vibratoFreq', 0.01, 
	'vibratoGain', 0.4, 
	'volume', 0.1, 
	'clear', 0.1, 
	'startBlowing', 0.1, 
	'stopBlowing', 0.1, 
	'rate', 0.1)).play;
//:
Pdef('/brass3',
 Pbind(\type, \chuckInstrument, \instrument, '/brass3', 
	\dur, 0.125 / 2, 
	'noteOn', 0.1, 
	'freq', Pbrown(100, 4000, 1, inf), 
	'lip', 0.1, 
	'slide', 0.1, 
	'vibratoFreq', 0.05, 
	'vibratoGain', 0.4, 
	'volume', 0.1, 
	'clear', 0.1, 
	'startBlowing', 0.1, 
	'stopBlowing', 0.1, 
	'rate', 0.1)).play;
//:
Pdef('/brass3',
 Pbind(\type, \chuckInstrument, \instrument, '/brass3', 
	\dur, 0.125 / 2, 
	'noteOn', 0.1, 
	'freq', Pbrown(200, 4000, 1, inf), 
	'lip', 0.3,
	'slide', 0.1, 
	'vibratoFreq', 0.05, 
	'vibratoGain', 0.4, 
	'volume', 0.1, 
	'clear', 0.1, 
	'startBlowing', 0.1, 
	'stopBlowing', 0.1, 
	'rate', 0.1)).play;
//:
Pdef('/brass3', /// !!!!!!!!!
 Pbind(\type, \chuckInstrument, \instrument, '/brass3', 
	\dur, 0.125 / 2, 
	'noteOn', 0.1, 
	'freq', Pbrown(200, 400, 1, inf), 
	'lip', 0.13,
	'slide', 0.1, 
	'vibratoFreq', 0.05, 
	'vibratoGain', 0.4, 
	'volume', 0.1, 
	'clear', 0.1, 
	'startBlowing', 0.1, 
	'stopBlowing', 0.1, 
	'rate', 0.1)).play;
//:
Pdef('/brass3', /// !!!!!!!!!
 Pbind(\type, \chuckInstrument, \instrument, '/brass3', 
	\dur, 0.125 / 2, 
	'noteOn', 0.1, 
	'freq', Pbrown(200, 400, 1, inf), 
	'lip', 0.13,
	'slide', 0.1, 
	'vibratoFreq', 0.1, 
	'vibratoGain', 0.4, 
	'volume', 0.1, 
	'clear', 0.1, 
	'startBlowing', 0.1, 
	'stopBlowing', 0.1, 
	'rate', 0.1)).play;
//:
Pdef('/brass3',
 Pbind(\type, \chuckInstrument, \instrument, '/brass3', 
	\dur, 0.125 / 2, 
	'noteOn', 0.1, 
	'freq', [500, 1000].pseq, 
	'lip', 0.1, 
	'slide', 0.1, 
	'vibratoFreq', 0.1, 
	'vibratoGain', 0.4, 
	'volume', 0.1, 
	'clear', 0.1, 
	'startBlowing', 0.1, 
	'stopBlowing', 0.1, 
	'rate', 0.1)).play;
//:
Pdef('/brass3',
 Pbind(\type, \chuckInstrument, \instrument, '/brass3', 
	\dur, 0.125 / 2, 
	'noteOn', 0.1, 
	'freq', [500, 1000].pseq, 
	'lip', 0.1, 
	'slide', 0.1, 
	'vibratoFreq', 0.1, 
	'vibratoGain', 0.04, 
	'volume', 0.1, 
	'clear', 0.1, 
	'startBlowing', 0.1, 
	'stopBlowing', 0.1, 
	'rate', 0.1)).play;
//:
Pdef('/brass3',
 Pbind(\type, \chuckInstrument, \instrument, '/brass3', 
	\dur, 0.125, 
	'noteOn', 0.1, 
	'freq', [500, 1000].pseq, 
	'lip', 0.1, 
	'slide', 0.1, 
	'vibratoFreq', 0.1, 
	'vibratoGain', 0.04, 
	'volume', 0.1, 
	'clear', 0.1, 
	'startBlowing', 0.1, 
	'stopBlowing', 0.1, 
	'rate', 0.1)).play;
//:
Pdef('/brass3',
 Pbind(\type, \chuckInstrument, \instrument, '/brass3', 
	\dur, 0.125, 
	'noteOn', 0.1, 
	'freq', [500, 600, 1000].pseq, 
	'lip', 0.1, 
	'slide', 0.1, 
	'vibratoFreq', 0.1, 
	'vibratoGain', 0.04, 
	'volume', 0.1, 
	'clear', 0.1, 
	'startBlowing', 0.1, 
	'stopBlowing', 0.1, 
	'rate', 0.1)).play;
//:
Pdef('/brass3',
 Pbind(\type, \chuckInstrument, \instrument, '/brass3', 
	\dur, 0.125, 
	'noteOn', 0.1, 
	'freq', [500, 600, 1000].prand, 
	'lip', 0.1, 
	'slide', 0.1, 
	'vibratoFreq', 0.1, 
	'vibratoGain', 0.04, 
	'volume', 0.1, 
	'clear', 0.1, 
	'startBlowing', 0.1, 
	'stopBlowing', 0.1, 
	'rate', 0.1)).play;
//:
Pdef('/brass3',
 Pbind(\type, \chuckInstrument, \instrument, '/brass3', 
	\dur, [0.125 pn: 2, 0.5].prand, 
	'noteOn', 0.1, 
	'freq', [500, 600, 1000].prand, 
	'lip', 0.1, 
	'slide', 0.1, 
	'vibratoFreq', 0.1, 
	'vibratoGain', 0.04, 
	'volume', 0.1, 
	'clear', 0.1, 
	'startBlowing', 0.1, 
	'stopBlowing', 0.1, 
	'rate', 0.1)).play;
//:
Pdef('/brass3',
 Pbind(\type, \chuckInstrument, \instrument, '/brass3', 
	\dur, [0.125 pn: 2, 0.5, 1].prand, 
	'noteOn', 0.1, 
	'freq', [500, 600, 1000].prand, 
	'lip', 0.1, 
	'slide', 0.1, 
	'vibratoFreq', 0.1, 
	'vibratoGain', 0.04, 
	'volume', 0.1, 
	'clear', 0.1, 
	'startBlowing', 0.1, 
	'stopBlowing', 0.1, 
	'rate', 0.1)).play;
//:
Pdef('/brass3',
 Pbind(\type, \chuckInstrument, \instrument, '/brass3', 
	\dur, [0.125 pn: 2, 0.5, 1].prand, 
	'noteOn', 0.1, 
	'freq', [500, 600, 1000].prand, 
	'lip', [0.1, 0.2].pseq, 
	'slide', [0.1, 0.5].pseq, 
	'vibratoFreq', 0.1, 
	'vibratoGain', 0.4, 
	'volume', 0.1, 
	'clear', 0.1, 
	'startBlowing', 0.1, 
	'stopBlowing', 0.1, 
	'rate', 0.1)).play;
///: 3d part: solos ----------------------------------------------------------------
//:
Pdef('/brass3',
 Pbind(\type, \chuckInstrument, \instrument, '/brass3', 
	\dur, [0.125 pn: 2, 0.5, 1].prand, 
	'noteOn', 0.1, 
	'freq', (20..70).midicps.prand, 
	'lip', [0.1, 0.2].pseq, 
	'slide', [0.1, 0.5].pseq, 
	'vibratoFreq', 0.1, 
	'vibratoGain', 0.4, 
	'volume', 0.1, 
	'clear', 0.1, 
	'startBlowing', 0.1, 
	'stopBlowing', 0.1, 
	'rate', 0.1)).play;
//:
Pdef('/brass3',
 Pbind(\type, \chuckInstrument, \instrument, '/brass3', 
	\dur, [0.125 pn: 2, 0.5, 1, 0.125 / 2 pn: 16].prand, 
	'noteOn', 0.1, 
	'freq', (50..70).midicps.prand, 
	'lip', [0.1, 0.2].pseq, 
	'slide', [0.1, 0.5].pseq, 
	'vibratoFreq', 0.1, 
	'vibratoGain', 0.4, 
	'volume', 0.1, 
	'clear', 0.1, 
	'startBlowing', 0.1, 
	'stopBlowing', 0.1, 
	'rate', 0.1)).play;
//:
Pdef('/brass3',
 Pbind(\type, \chuckInstrument, \instrument, '/brass3', 
	\dur, [0.125 pn: 2, 0.5, 1, 0.125 / 2 pn: 16].prand, 
	'noteOn', 0.1, 
	'freq', (50..70).midicps.prand, 
	'lip', [0.1, 0.2, 0.4].prand, 
	'slide', [0.1, 0.5, 0.01].prand, 
	'vibratoFreq', 0.1, 
	'vibratoGain', 0.4, 
	'volume', 0.1, 
	'clear', 0.1, 
	'startBlowing', 0.1, 
	'stopBlowing', 0.1, 
	'rate', 0.1)).play;
//:
Pdef('/brass3',
 Pbind(\type, \chuckInstrument, \instrument, '/brass3', 
	\dur, [0.5, 1].prand, 
	'noteOn', 0.1, 
	'freq', (50..70).midicps.prand, 
	'lip', [0.1, 0.2, 0.4].prand, 
	'slide', [0.1, 0.5, 0.01].prand, 
	'vibratoFreq', 0.1, 
	'vibratoGain', 0.4, 
	'volume', 0.1, 
	'clear', 0.1, 
	'startBlowing', 0.1, 
	'stopBlowing', 0.1, 
	'rate', 0.1)).play;
//:
Pdef('/brass3',
 Pbind(\type, \chuckInstrument, \instrument, '/brass3', 
	\dur, [0.5, 1].prand, 
	'noteOn', 0.1, 
	'freq', (60..70).midicps.prand, 
	'lip', 3, 
	'slide', 2, 
	'vibratoFreq', 0.0, 
	'vibratoGain', 0.0, 
	'volume', 0.6, 
	'clear', 0.9, 
	'startBlowing', 0.1, 
	'stopBlowing', 0.1, 
	'rate', 0.1)).play;
//:
Pdef('/brass3',
 Pbind(\type, \chuckInstrument, \instrument, '/brass3', 
	\dur, [1].prand , 
	'noteOn', 0.1, 
	'freq', 1200, 
	'lip', 0.195, 
	'slide', 0.091, 
	'vibratoFreq', 0.6, 
	'vibratoGain', 0.15, 
	'volume', 0.1, 
	'clear', 0.1, 
	'startBlowing', 0.41, 
	'stopBlowing', 0.1, 
	'rate', 0.1)).play
//:
Pdef('/brass3',
 Pbind(\type, \chuckInstrument, \instrument, '/brass3', 
	\dur, [0.5, 1, 0.25 pn: 4, 0.125 pn: 16, 4].prand, 
	'noteOn', 0.1, 
	'freq', (80..90).midicps.prand, 
	'lip', 0.03, 
	'slide', 0.02, 
	'vibratoFreq', 0.1, 
	'vibratoGain', 0.1, 
	'volume', 0.06, 
	'clear', 0.9, 
	'startBlowing', 0.1, 
	'stopBlowing', 0.1, 
	'rate', 0.1)).play;
//:
Pdef('/brass3').stop;
//:
Pdef('/brass3',
 Pbind(\type, \chuckInstrument, \instrument, '/brass3', 
	\dur, [0.25, 0.5, 1].prand, 
	'noteOn', 0.1, 
	'freq', [5000, 2000, 1000].prand, 
	'lip', 0.195, 
	'slide', 0.091, 
	'vibratoFreq', 0.6, 
	'vibratoGain', 0.15, 
	'volume', 0.1, 
	'clear', 0.1, 
	'startBlowing', 0.41, 
	'stopBlowing', 0.1, 
	'rate', 0.1)).play

///: ================================================================
///: ================================================================
///: ================================================================
//:
Pdef('/brass3',
 Pbind(\type, \chuckInstrument, \instrument, '/brass3', 
	\dur, [1].prand , 
	'noteOn', 0.1, 
	'freq', [1200, 1000, 800].prand, 
	'lip', 0.195, 
	'slide', 0.091, 
	'vibratoFreq', 0.6, 
	'vibratoGain', 0.15, 
	'volume', 0.1, 
	'clear', 0.1, 
	'startBlowing', 0.41, 
	'stopBlowing', 0.1, 
	'rate', 0.1)).play
//:
Pdef('/brass3',
 Pbind(\type, \chuckInstrument, \instrument, '/brass3', 
	\dur, [0.25].prand , 
	'noteOn', 0.1, 
	'freq', 900, 
	'lip', 0.195, 
	'slide', 0.091, 
	'vibratoFreq', 0.6, 
	'vibratoGain', 0.15, 
	'volume', 0.1, 
	'clear', 0.1, 
	'startBlowing', 0.41, 
	'stopBlowing', 0.1, 
	'rate', 0.1)).play
//:
Pdef('/brass3',
 Pbind(\type, \chuckInstrument, \instrument, '/brass3', 
	\dur, 0.125  / 2, 
	'noteOn', 0.1, 
	'freq', [1200, 1000, 800, 900].prand, 
	'lip', 0.195, 
	'slide', 0.091, 
	'vibratoFreq', 0.6, 
	'vibratoGain', 0.15, 
	'volume', 0.1, 
	'clear', 0.1, 
	'startBlowing', 0.41, 
	'stopBlowing', 0.1, 
	'rate', 0.1)).play;

//:
Pdef('/brass3',
 Pbind(\type, \chuckInstrument, \instrument, '/brass3', 
	\dur, [20].prand , 
	'noteOn', 0.1, 
	'freq', 1200, 
	'lip', 0.195, 
	'slide', 0.091, 
	'vibratoFreq', 0.6, 
	'vibratoGain', 0.15, 
	'volume', 0.1, 
	'clear', 0.1, 
	'startBlowing', 0.41, 
	'stopBlowing', 0.1, 
	'rate', 0.1)).play