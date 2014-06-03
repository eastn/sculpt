

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



// here is another test:

// Run this in SuperCollider (first cd to your ChucK examples folder):
// cd = change directory

"cd /Applications/ChucK/examples/; chuck --loop".unixCmd;
"cd /Applications/ChucK/examples/; chuck otf_01.ck".unixCmd;
"cd /Applications/ChucK/examples/; chuck otf_02.ck".unixCmd;
"cd /Applications/ChucK/examples/; chuck otf_03.ck; echo hey;".unixCmd;

"killall chuck".unixCmd;

