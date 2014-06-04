// STK ModalBar
// EDITED TO TRIGGER WITH OSC
// Here adding parameters for the modal bar to the OSC message.

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
recv.event( "/bar, i, f, f, f, f, f, f, f, f" ) @=> OscEvent oe;

// infinite time loop
while( true )
{
    oe => now;   
    // grab the next message from the queue. 
    while ( oe.nextMsg() != 0 )
    { 
        // getFloat fetches the expected float (as indicated by "f")
        oe.getInt() => int presetNum;
        // print
        <<< "got (via OSC): presetNum", presetNum  >>>;
        oe.getFloat() => float freq;
        <<< "got (via OSC): FREQ", freq  >>>;
        // set play pointer to beginning
        // 0 => buf.pos;
        // ding!
        presetNum => bar.preset;
  
       oe.getFloat() => bar.stickHardness;
       oe.getFloat() => bar.strikePosition;
       oe.getFloat() => bar.vibratoGain;
       
       oe.getFloat() => bar.vibratoFreq;
       oe.getFloat() => bar.volume;
       oe.getFloat() => bar.directGain;
       oe.getFloat() => bar.masterGain;
        
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
        
        // set freq
        freq => bar.freq;
        // go
        .8 => bar.noteOn;
    }
    // advance time
    // .5::second => now;
}
