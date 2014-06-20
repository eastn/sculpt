// STK ModalBar
// EDITED TO TRIGGER WITH OSC
// Here adding parameters for the modal bar to the OSC message.

// patch
ModalBar bar => dac;

// scale
[0, 2, 4, 7, 8, 11] @=> int scale[];

// This is the message+format that the osc receiver listens to
// and which triggers the instrument to play.
// "/bar,i:preset,f:freq,f:stickHardness,f:strikePosition,f:vibratoFreq,f:vibratoGain,f:directGain,f:masterGain" => string instrTriggerMessage;
"/bar,i:preset,f:freq,f:stickHardness,f:strikePosition,f:vibratoFreq,f:vibratoGain,f:directGain" => string instrTriggerMessage;

////////////////// OSC sender ////////////////
// create our OSC sender

// This sender will notify Supercollider that a new instrument is listening
OscSend sender;

// Prepare to send to SuperCollider
sender.setHost("localhost", 57120);

// Preformat the message to be sent
sender.startMsg("/c_instr, s");

// Send the string declaring the format used to receive trigger messages
sender.addString(instrTriggerMessage);


////////////////// OSC receiver ////////////////
// create our OSC receiver
OscRecv recv;
// use port 6449
6449 => recv.port;
// start listening (launch thread)
recv.listen();

// create an address in the receiver, store in new variable
//recv.event( "/bar, i, f, f, f, f, f, f, f" ) @=> OscEvent oe;
recv.event( "/bar, i, f, f, f, f, f, f" ) @=> OscEvent oe;

// infinite time loop
while( true )
{
    oe => now;   
    // grab the next message from the queue. 
    while ( oe.nextMsg() != 0 )
    { 
        // getFloat fetches the expected float (as indicated by "f")
        
       // oe.getFloat() => float noteOn;
       // <<< "got (via OSC): NoteOn", noteOn  >>>;
        
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
       oe.getFloat() => bar.vibratoFreq;
       oe.getFloat() => bar.vibratoGain;
       oe.getFloat() => bar.directGain;
      // oe.getFloat() => bar.volume;
      // oe.getFloat() => bar.masterGain;
        
        // print
        <<< "---", "" >>>;
        <<< "preset:", bar.preset() >>>;
        <<< "stick hardness:", bar.stickHardness() >>>;
        <<< "strike position:", bar.strikePosition() >>>;
        <<< "vibrato freq:", bar.vibratoFreq() >>>;
        <<< "vibrato gain:", bar.vibratoGain() >>>;
        <<< "volume:", bar.volume() >>>;
        <<< "direct gain:", bar.directGain() >>>;
        <<< "master gain:", bar.masterGain() >>>;
        
        // set freq
       // freq => bar.freq;
        freq => bar.freq;
        // go
        
        .8 => bar.noteOn;
        //if ( noteOn >= 0 ) {
        //    .8 => bar.noteOn;
       // };
    }
    // advance time
    // .5::second => now;
}
