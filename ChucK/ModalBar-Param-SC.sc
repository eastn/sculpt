/*
Adding parameters to the ModalBar message.
*/

{
	var durations, addr;
	durations = [2 pn: 3, 1 pn: 4, 0.2 pn: 4, 0.1 pn: 16].pseq.asStream;
	addr = NetAddr("127.0.0.1", 6449);
	loop {
		addr.sendMsg('/bar', 
			90.rand, // preset
			50.0 rrand: 5000, // frequency
			1.0.rand, // stick hardnesssy
			1.0.rand, // strike position
			1.0.rand, // vibrato gain
			60.0.rand, // vibrato freq
			0.0, // Vol
			0.005 exprand: 1.0, // directGain
			0.25 exprand: 1.0 // masterGain
		);
		durations.next.wait;
	}

}.fork

//:
