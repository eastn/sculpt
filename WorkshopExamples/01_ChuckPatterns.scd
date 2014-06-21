// =====================================================================
// SuperCollider Workspace
// =====================================================================


/* 
Use SC patterns to control some ChucK instruments. -Run the ChucK .ck files: Flute, ModalBar, Shakers.
*/

'/flute'.cpt /* JITLib style to control a Chuck instrument, copy the Pdef created in the post window and alter its control values using patterns. */

//:

Pdef('/flute',
 Pbind(\type, \chuckInstrument, \instrument, '/flute', 
	\dur, 0.25, 
	'noteOn', Prand([-1.0, 1.0], inf), 
	'freq', Pxrand((180.0..440.0),inf), 
	'jetDelay', Pwhite(0.01, 1.0), 
	'jetReflection', Pwhite(0.01, 1.0), 
	'endReflection', Pwhite(0.01, 1.0), 
	'noiseGain', Pwhite(0.01, 1.0), 
	'vibratoFreq', Pwhite(0.01, 1.0), 
	'vibratoGain', Pwhite(0.01, 1.0), 
	'pressure', Pwhite(0.01, 1.0), 
	'clear', Pwhite(0.01, 1.0), 
	'startBlowing', Pwhite(0.01, 1.0), 
	'stopBLowing', Pwhite(0.01, 1.0), 
	'rate', Pwhite(0.01, 1.0),
	 \legato, 0.5
 )
).play

//:
'/bar'.cpt

//:
Pdef('/bar',
 Pbind(\type, \chuckInstrument, \instrument, '/bar', 
	\dur, 0.06, 
	'noteOn', Prand([-1.0, 1.0], inf), 
	'freq', Prand((120.0..880.0),inf), 
	'stickHardness', Pwhite(0.1, 1.0), 
	'strikePosition',  Pwhite(0.1, 1.0),
	'vibratoFreq', Pwhite(120.0, 1200.0),
	'vibratoGain', Pwhite(0.1, 1.0), 
	'directGain', Pwhite(0.1, 1.0), 
	'masterGain', Pwhite(0.1, 1.0), 
	'volume', Pwhite(0.3, 0.6), 
	'preset', Prand([1, 2, 3, 4], inf), 
	'strike', Pwhite(0.1, 1.0)
 )
).play;

//:

'/shakers'.cpt;

//:

Pdef('/shakers',
 Pbind(\type, \chuckInstrument, \instrument, '/shakers', 
	\dur, 0.125 , 
	'noteOn',  Prand([-1.0, 1.0], inf),
	'freq',Prand((120.0..880.0),inf),  
	'preset', Prand([1, 2, 3, 4], inf),
	 'energy', Pwhite(0.1, 1.0),
	 'decay', Pwhite(0.1, 1.0)
 )
).play