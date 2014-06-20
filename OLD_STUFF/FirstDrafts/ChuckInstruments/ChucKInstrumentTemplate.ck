// STK ModalBar
// EDITED TO TRIGGER WITH OSC
// Here adding parameters for the modal bar to the OSC message.

// ================ INSTRUMENT!!! ================
ModalBar bar => dac;
// ================================================================

////////////////// OSC receiver ////////////////

OscRecv recv;
6449 => recv.port;
recv.listen();

recv.event( "/bar, i, f, f, f, f, f, f, f, f" ) @=> OscEvent oe;

// infinite time loop
while( true )
{
    oe => now;
    while ( oe.nextMsg() != 0 )
    { 
       oe.getInt() => bar.preset;
       oe.getFloat() => bar.freq;
       oe.getFloat() => bar.stickHardness;
       oe.getFloat() => bar.strikePosition;
       oe.getFloat() => bar.vibratoGain;
       oe.getFloat() => bar.vibratoFreq;
       oe.getFloat() => bar.volume;
       oe.getFloat() => bar.directGain;
       oe.getFloat() => bar.masterGain;
        
        // print
        <<< "Modal Bar", "" >>>;
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
}
