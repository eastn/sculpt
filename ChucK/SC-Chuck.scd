

// A SC patch that sends OSC messages to ChucK:

n = NetAddr("127.0.0.1", 6449);

(
t = Task({
	   	16.do({
			n.sendMsg("/sndbuf/buf/rate", rrand(0.8, 2.2));
			0.05.wait;
		});
	});
		
t.start;
)

t.stop