
NetAddr.localAddr;
//:
'/brass1'.cet;
//:
//: ================ brass1 ================
(type: \chuckInstrument, instrument: '/brass1',
	dur: 0.125 , 
	noteOn: 0.1, 
	freq: 0.1, 
	lip: 0.1, 
	slide: 0.1, 
	vibratoFreq: 0.1, 
	vibratoGain: 0.05, 
	volume: 0.01, 
	clear: 0.1, 
	startBlowing: 0.1, 
	stopBlowing: 0.1, 
	rate: 0.1) => \brass1;

//:
(freq: 100) +> \brass1;
(freq: (1..1000).pseq) +> \brass1;
(vibratoGain: 0.1) +> \brass1;
(vibratoGain: 0.05) +> \brass1;
(freq: 10) +> \brass1;
(noteOn: 0.1) +> \brass1;
(volume: 0.01) +> \brass1;

(freq: 1000) +> \brass1;
(vibratoFreq: 0.05) +> \brass1;
(vibratoGain: 0.1) +> \brass1;
(lip: 1) +> \brass1;
(lip: 0.01) +> \brass1;
(freq: 100) +> \brass1;

(freq: 800) +> \brass1;

(dur: [0.125, 0.25, 0.5, 1].prand) +> \brass1;

(lip: 0.1) +> \brass1;
(vibratoFreq: 10) +> \brass1;

//:
(type: \chuckInstrument, instrument: '/brass1',
	dur: 0.125 , 
	noteOn: 0.1, 
	freq: 0.1, 
	lip: 0.1, 
	slide: 0.1, 
	vibratoFreq: 0.1, 
	vibratoGain: 0.05, 
	volume: 0.01, 
	clear: 0.1, 
	startBlowing: 0.1, 
	stopBlowing: 0.1, 
	rate: 0.1) => \brass1;
//:
(dur: 0.3) +> \brass1;
//:
(freq: [ 61, 63, 65, 66, 68 ].midicps.pseq) +> \brass1;
//:
()



