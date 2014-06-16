// =====================================================================
// SuperCollider Workspace
// =====================================================================

//:

Server.default.boot

~leapPosX = 0.1;

//:

Pdef(\chuckModalBar,
	Pbind(\dur, 0.5,
		\type, \chuckInstrument, \instrument, '/bar',
        \preset, Prand((1..4), inf), 
		\freq, Pfunc{ ~leapPosX.linlin(-1.0, 1.0, 220, 1220.0) },
		\stickHardness, Pwhite(0.1, 1.0, inf),
		\strikePosition, Pwhite(0.1, 1.0, inf),
		\vibratoFreq, Pwhite(0.1, 1.0, inf),
		\vibratoGain, Pwhite(0.1, 1.0, inf),
		\directGain, Pwhite(0.1, 1.0, inf),
	).trace(\freq)
);

Pdef(\chuckModalBar).play;

//:

Pdef(\chuckModalBar).stop;

//:

NetAddr("localhost", 6449).sendMsg('/bar', rrand(0, 5));

OSCFunc.trace(true)