// =====================================================================
// SuperCollider Workspace
// =====================================================================

/*
A code snippet to track the mic input and trig something using Coyote (onset ugen).
*/

//:
 


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
}).play

//:


s.meter

//:

Ndef(\coyoteBufTrig, {
	var input = SoundIn.ar(1);
	var detect = Decay.kr(
		Coyote.kr(input, fastMul: 0.1,	thresh: 0.001),
		0.2);
	detect
}).play
