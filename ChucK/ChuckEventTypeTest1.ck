
// STK ModalBar
// EDITED TO TRIGGER WITH OSC

// patch
ModalBar bar => dac;

// scale
[0, 2, 4, 7, 8, 11] @=> int scale[];

////////////////// OSC receiver ////////////////
// create our OSC receiver
OscRecv recv;
// use port 6449
6449 => recv.port;
// start listening (launch thread)
recv.listen();

// create an address in the receiver, store in new variable
recv.event( "/bar, i, f, f, f" ) @=> OscEvent oe;

// infinite time loop
while( true )
{
    
    oe => now;
    
    // grab the next message from the queue. 
    while ( oe.nextMsg() != 0 )
    { 
        // getFloat fetches the expected float (as indicated by "f")
        // oe.getFloat(); // => buf.play;
        // print
        <<< "got (via OSC):", "something eheh heh"  >>>;
        // set play pointer to beginning
        // 0 => buf.pos;
        // ding!
        oe.getInt() => bar.preset;
        // set freq
        oe.getFloat() => bar.freq;
        oe.getFloat() => bar.stickHardness;
        oe.getFloat() => bar.strikePosition;
        Math.random2f( 0, 1 ) => bar.vibratoGain;
        Math.random2f( 0, 60 ) => bar.vibratoFreq;
        Math.random2f( 0, 1 ) => bar.volume;
        Math.random2f( .5, 1 ) => bar.directGain;
        Math.random2f( .5, 1 ) => bar.masterGain;
        
        // print
        <<< "---", "" >>>;
        <<< "preset:", bar.preset() >>>;
        <<< "stick hardness:", bar.stickHardness() >>>;
        <<< "strike position:", bar.strikePosition() >>>;
        <<< "vibrato gain:", bar.vibratoGain() >>>;
        <<< "vibrato freq:", bar.vibratoFreq() >>>;
        <<< "volume:", bar.volume() >>>;
        <<< "direct gain:", bar.directGain() >>>;
        <<< "master gain:", bar.masterGain() >>>;
        
        // go
        .8 => bar.noteOn;
    }
    // advance time
    // .5::second => now;
}
