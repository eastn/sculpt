

{
	var durations;
	durations = [1, 0.2 pn: 4, 0.1 pn: 16].pseq.asStream;
	loop {
		
		NetAddr("127.0.0.1", 6449).sendMsg('/bar', 1.0);
		durations.next.wait;
	}

}.fork

//:
