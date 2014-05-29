/*
Connect geco (leap motion gesture detection native software) via OSC to SC.

First tests

Wed, May 28 2014, 20:38 EEST

*/

var path;

["/left", "/right"] do: { | hand |
	["/open", "/closed"] do: { | handshape |
		["/present", "/posx", "/movx", "/posy", "/movy", "/posz", "/movz",
		"/pitch", "/roll", "/yaw"] do: { | coord | 
			path = (hand +/+ handshape +/+ coord).asSymbol;
			OSCdef(path, { | ... args | args.postln; }, path);
		}
	}
}

//: Debugging ....

OSCFunc.trace(false);
OSCFunc.trace(true);

Server.killAll;
Server.default.boot;
//: Exploring gardellino with Geco

`\gardellino => \karderina;

//: Testing OSCdef as a way to change the action of a path

OSCdef('/left/open/present', { \HELLO.postln; }, '/left/open/present');

OSCdef('/left/open/present', { \OHOWORLD.postln; });

//:

