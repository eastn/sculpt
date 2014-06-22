/*
Playing ChucK instruments with patterns.
Tiny-sc style.
*/

'/blow'.cet;
//:
(type: \chuckInstrument, instrument: '/blow',
	dur: [0.1, 0.3].prand, 
	noteOn: [0.8, -1, 0.0].prand, 
	freq: [40, 42, 44, 45, 47, 49].prand.midicps * 4, 
	reed: 0.04, 
	noiseGain: 0.99, 
	tonehole: 0.00002, 
	vent: 0.0001, 
	pressure: 0.1, 
	startBowing: 0.1, 
	stopBowing: 0.1, 
	rate: 0.1) => \pattern1;

//: 
(dur: 1, freq: 400, vent: 0.5, tonehole: 0.5, pressure: 0.5) +> \pattern1;

(vent: 0.05) +> \pattern1;

//:
(noteOn: -1) +> \pattern1;

//:
['/bowed', '/blow', '/brass', '/clar', '/flute', '/sax', '/sitar', ].sort 
do: { | i | i.cet.postln;  };

//:
//: ================ blow ================
(type: \chuckInstrument, instrument: '/blow',
	dur: 0.125 , 
	noteOn: 0.1, 
	freq: 0.1, 
	reed: 0.1, 
	noiseGain: 0.1, 
	tonehole: 0.1, 
	vent: 0.1, 
	pressure: 0.1, 
	startBowing: 0.1, 
	stopBowing: 0.1, 
	rate: 0.1) => \blow;


//: ================ bowed ================
(type: \chuckInstrument, instrument: '/bowed',
	dur: 0.125 , 
	noteOn: 0.1, 
	freq: 0.1, 
	bowPressure: 0.1, 
	bowPosition: 0.1, 
	vibratoFreq: 0.1, 
	vibratoGain: 0.1, 
	volume: 0.1, 
	startBowing: 0.1, 
	stopBowing: 0.1) => \bowed;


//: ================ brass ================
(type: \chuckInstrument, instrument: '/brass',
	dur: 0.125 , 
	noteOn: 0.1, 
	freq: 0.1, 
	lip: 0.1, 
	slide: 0.1, 
	vibratoFreq: 0.1, 
	vibratoGain: 0.1, 
	volume: 0.1, 
	clear: 0.1, 
	startBlowing: 0.1, 
	stopBlowing: 0.1, 
	rate: 0.1) => \brass;


//: ================ clar ================
(type: \chuckInstrument, instrument: '/clar',
	dur: 0.125 , 
	freq: 0.1, 
	noteOn: 0.1, 
	reed: 0.1, 
	noiseGain: 0.1, 
	clear: 0.1, 
	vibratoFreq: 0.1, 
	vibratoGain: 0.1, 
	pressure: 0.1, 
	startBlowing: 0.1, 
	stopBlowing: 0.1, 
	rate: 0.1) => \clar;


//: ================ flute ================
(type: \chuckInstrument, instrument: '/flute',
	dur: 0.125 , 
	noteOn: 0.1, 
	freq: 0.1, 
	jetDelay: 0.1, 
	jetReflection: 0.1, 
	endReflection: 0.1, 
	noiseGain: 0.1, 
	vibratoFreq: 0.1, 
	vibratoGain: 0.1, 
	pressure: 0.1, 
	clear: 0.1, 
	startBlowing: 0.1, 
	stopBLowing: 0.1, 
	rate: 0.1) => \flute;


//: ================ sax ================
(type: \chuckInstrument, instrument: '/sax',
	dur: 0.125 , 
	noteOn: 0.1, 
	freq: 0.1, 
	stiffness: 0.1, 
	aperture: 0.1) => \sax;


//: ================ sitar ================
(type: \chuckInstrument, instrument: '/sitar',
	dur: 0.125 , 
	freq: 0.1, 
	noteOn: 0.1, 
	pluck: 0.1, 
	clear: 0.1) => \sitar;
