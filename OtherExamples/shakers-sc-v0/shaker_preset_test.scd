'/shakers1'.cet;
//:
(type: \chuckInstrument, instrument: '/shakers1',
	dur: 0.125 , 
	noteOn: 0.1, 
	preset: 0, 
	objects: 0.1, 
	freq: 1000, 
	energy: 0.1, 
	decay: 0.1) => \shakers1;
//:
(freq: 100) +> \shakers1;
//:
(preset: 0) +> \shakers1;
//:
(preset: 1) +> \shakers1;
//:
(preset: 2) +> \shakers1;
// (preset: 3) +> \shakers1;
/*
(preset: 4) +> \shakers1;
//: 
(objects: 50) +> \shakers1;
//:
(energy: 10.5) +> \shakers1;
//:
(noteon: 10.5) +> \shakers1;
//:
(freq: (100, 110 .. 1000).pseq) +> \shakers1;
*/
// (preset: 5) +> \shakers1;
(preset: 7) +> \shakers1; // sleigh bells
// (preset: 8) +> \shakers1; // sticks do not use
// (preset: 9) +> \shakers1; // Crunch do not use
// (preset: 10) +> \shakers1; // Wrench do not use
(preset: 11) +> \shakers1; // sandpaper
(preset: 12) +> \shakers1; // Coke Can
(preset: 13) +> \shakers1; // Next Mug
(preset: 14) +> \shakers1; // Penny + Mug
(preset: 15) +> \shakers1; // Nickle + Mug
(preset: 16) +> \shakers1; // Dime + Mug
(preset: 17) +> \shakers1; // Quarter + Mug
(preset: 18) +> \shakers1; // Franc + Mug
(preset: 19) +> \shakers1; // Peso + Mug
(preset: 20) +> \shakers1; // Big Rocks
(preset: 21) +> \shakers1; // Little Rocks
(preset: 22) +> \shakers1; // Tuned Bamboo Chimes

// Number of objects
(objects: 10) +> \shakers1; 
(objects: 1) +> \shakers1;
(objects: 10) +> \shakers1;
(objects: 40) +> \shakers1;
(objects: (1..40).pseq) +> \shakers1;
(objects: (1..40).prand) +> \shakers1;
(objects: (1..120).pseq) +> \shakers1;
(freq: (1..40).midicps.prand) +> \shakers1;
(freq: [50, 100, 400, 800, 1600].pseq) +> \shakers1;
(dur: 0.5) +> \shakers1;


 (dur: 0.1) +> \shakers1;
