/*
Introductory tutorial to tiny-sc
*/

/* 
1. The "chuck operator" => sets the source of a named sound and plays it. 
The source can be: 
*/

//: 1.1. A function: 
{ WhiteNoise.ar(0.1) } => \sound1;
//: 1.2. A reference to the name of a template holding a SynthDef
`\boombah => \sound1;
//: 1.3. An event plays like a pattern:
(degree: Pseq([0, 2, 4, 7], inf), dur: 0.1) => \sound1;

//: 2. To stop a named sound (SynthTree), send it the message fadeOut.
\sound1.fadeOut(0.05);

//: 3. To restart a sound, send it the message start
\sound1.start;

//: 4. To change a parameter of the sound, use the 'set' message
// New sound to test: 
{ Formant.ar(\fundfreq.kr(440), \formfreq.kr(1760), 880) * 0.1 } => \sound1;

//: Changing the formant frequency
200 =>.formfreq \sound1;
//: Again
1600 =>.formfreq \sound1;
//: Change the fundamental frequeny
200 =>.fundfreq \sound1;

/* 
5. If the playing sound is a pattern, you can add or ovewrite exisitng 
key-pattern pairs on the fly with the operator 
*/

//: 5.1 Chuck a new key-pattern array to the sound
//  The patterns included in the array replace the ones with the
//  same name in the SynthTree, or are added to it.
(dur: Prand([0.01, 0.2], inf), amp: Pseq([0.01, 0.1], inf)) => \sound1;

//: Modify the pattern
(degree: (0..8).prand, dur: 0.1, amp: [0.05, 0.1].pseq) +> \sound1;

//: different instruments
(instrument: \bassfoundation) +> \sound1;

//: Make a filter
{ Pan2.ar(RLPF.ar(Inp.ar, \freq.kr(800), \rq.kr(1)), \pos.kr(0)) } => \rlpf;

//: Send sound1 to the filter
\sound1 =<> \rlpf;

//: Modify a parameter through control synth
{ LFDNoise3.kr(\rate.kr(2)).range(\lo.kr(200), \hi.kr(2000)) } =>.freq \rlpf;

//: A different control synth to same parameter
{ SinOsc.kr(\rate.kr(0.3)).range(\lo.kr(200), \hi.kr(5000)) } =>.freq \rlpf;

// Replace the source at \sound1 with another one
{ WhiteNoise.ar(0.1) } => \sound1;

// Set the fade-in fade-out time to 0.5 seconds
\sound1.fadeTime = 5;

// Replace again, fading-out the previous sound in 0.5 seconds
{ PinkNoise.ar(0.1) } => \sound1;

// Change the fade-time of the SynthTree in the same line:
{ LPF.ar(GrayNoise.ar(0.1*Decay.kr(Dust.kr(10))), \freq.kr(5000)) } => \sound1.fadeTime_(0.5);

// Fadeout with custom duration
\sound.fadeOut(12);

