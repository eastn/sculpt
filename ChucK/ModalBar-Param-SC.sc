/*
Adding parameters to the ModalBar message.
*/

{
	var durations, addr;
	durations = [0.25 pn: 6, 1 pn: 4, 0.2 pn: 4, 0.1 pn: 16].prand.asStream;
	addr = NetAddr("127.0.0.1", 6449);
	loop {
		addr.sendMsg('/bar', 
			1, // preset
			(20 .. 80).choose.midicps, // frequency
			0.00000005 rrand: 0.4, // stick hardness 0 = more pitch 1 = less pitch
			0.5, // strike position
			1.0.rand, // vibrato gain
			6.0.rand, // vibrato freq
			0.0, // Vol : NO EFFECT
			0.03 exprand: 0.8, // directGain 0 = more pitch 1 = more stick transient
			0.1 exprand: 0.9, // masterGain (overall loudness)
		);
		durations.next.wait;
	}

}.fork

//:
