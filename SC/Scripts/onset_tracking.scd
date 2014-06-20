
/*
A code snippet to track the mic input and trig something using Coyote (onset ugen).
*/

//: Open meter to see input singal levels

s.meter

//: JITlib style (Ndef) 

Ndef(\coyote, {
	var input = SoundIn.ar(1);
	var detect =
	PinkNoise.ar(
		Decay.kr(
			Coyote.kr(input, 
				fastMul: 0.1, //increase to adapt sensitivity
				thresh: 0.001),
			0.2));
	//[detect, input] //uncomment this line to hear the mic signal too.
	detect
}).play;

//: tiny-sc style
{
	var input = SoundIn.ar(1);
	var detect = WhiteNoise.ar(
		Decay.kr(
			Coyote.kr(
				input, 
				// Tweak the following controls to calibrate tracking sensitivity
				fastMul: \fastMul.kr(0.1),	
				thresh: \thresh.kr(0.001)
			),
			0.2
		)
	);
	detect
} => \onsets;

//: Broadcast the onset tigger message to anyone who listens, via OSC

~detector = {
	var input = SoundIn.ar(1);
	var detect = Coyote.kr(
		input,
		// Tweak the following controls to calibrate tracking sensitivity
		fastMul: \fastMul.kr(0.1),	
		thresh: \thresh.kr(0.001)
	);
	// Send trigger via OSC message whenever an onset is detected: 
	SendReply.kr(detect, '/onset');
	PinkNoise.ar(Decay.kr(detect)); // use this as audible feedback for control purposes
	// turn SynthTree amp down when not needed. 
} => \onsets;

OSCFunc({ 
	"onset message received".postln;
	~detector.changed(\onset);
}, '/onset');

//:

\anyone.addNotifier(~detector, \onset, { (degree: 10.rand).play });

\anyone.addNotifier(~detector, \onset, { (degree: 10.rand -5).play });

\anotherone.addNotifier(~detector, \onset, { (degree: 10.rand +20).play });


//: Uncouple the above. This frees all notifications in both directions for both objects

\anyone.objectClosed;
\anotherone.objectClosed;

//: ================ Testing buffer playing ================
//: First load all buffers from userAppSupporDir +/+ sounds/*.wav/aiff

BufferList.loadFolder;

/*
To play with the buffers below, download the samples from: 
https://github.com/iani/sounds
And place the sounds folder inside the user support directory 
(see also: README.org, 
https://github.com/iani/SC/blob/snippets/README.org)
*/

//: Now try playing some of the loaded buffers: 

`\clap +> \test;  // once

`\clap ++> \test; // looping 

`\tom +> \test; // another one, once

`\tom ++> \test; // again, looping

`\tamb +> \test; // last one, once

//: Now connect a simple sample player to the tracker above:

\samplePlayer1.st.addNotifier(~detector, \onset, {
	`\conga +> \samplePlayer1;
});

//: Variation: Play a different sample each time, 
// selected from the list of all loaded buffers (in series): 

~samples = Library.at(Server.default).keys.asArray
.select({ | b | b !== '*null-buffer*' })
.pseq.asStream;

\samplePlayer1.st.addNotifier(~detector, \onset, {
	`(~samples.next) +> \samplePlayer1;
})
