

//:
//:
Edef(\chuckTest,
	(type: \chuckTest,  degree: (0..25).pseq, dur: 0.1, 
		hardness: [0.1, 0.91].pseq,
		preset: 1
)).play;

//:

\chuckTest =< (type: \chuckTest,  degree: (-10..2).prand, dur: 0.25, 
	hardness: [0.001, 0.002].pseq,
	preset: 1
)

//:
\chuckTest =< (
	degree: ((1..12) - 10).pseq + [0, 5].pseq,
	hardness: ((1..12) / 100).pseq,
	position: ((1..12) / 100).pseq,
	preset: 4,
	dur: [0.05 pn: 8, 0.5 pn: 4].prand
);

//: Restart after Command-period:
Edef(\chuckTest).play;

//:
\chuckTest =< (
	degree: ((1..12) - 10).prand + [0, 5].pseq,
	hardness: ((1..12) / 100).pseq,
	position: ((1..12) / 100).pseq,
	preset: 4,
	dur: [0.125 pn: 4, 0.25 pn: 8, 0.5 pn: 4].prand
);

//: ================================================================
// Testing \chuckInstrument
Edef(\chuckTest, (
	type: \chuckInstrument,  
	degree: (-10..2).prand, dur: 0.25, 
	hardness: [0.001, 0.002].pseq,
	instrument: ['/bar', '/silence'].prand,
	preset: 1
)).play;

