// This chuck patch notifies SuperCollider when it starts,
// and sends to SC the format of the message that it expects to play
// its instrument.  SC then constructs a eventType on the fly for playing
// this instrument with patterns. 

// patch
ModalBar bar => dac;

////////////////// OSC receiver ////////////////
// create our OSC receiver

// This is the message+format that the osc receiver listens to
// and which triggers the instrument to play.
"/bar,f:noteOn,f:freq,i:preset,f:stickHardness,f:strikePosition,f:vibratoFreq,f:vibratoGain,f:directGain,f:masterGain,f:volume,f:strike" => string instrTriggerMessage;

// This sender will notify Supercollider that a new instrument is listening
OscSend sender;

// Prepare to send to SuperCollider
sender.setHost("localhost", 57120);

// Preformat the message to be sent
sender.startMsg("/c_instr, s");

// Send the string declaring the format used to receive trigger messages
sender.addString(instrTriggerMessage);

OscRecv recv;
// use port 6449
6449 => recv.port;
// start listening (launch thread)
recv.listen();

// create an address in the receiver, store in new variable
recv.event( "/bar, f, f, i, f, f, f, f, f, f, f, f" ) @=> OscEvent oe;

// infinite time loop
while( true )
{
    oe => now;   
    // grab the next message from the queue. 
    while ( oe.nextMsg() != 0 )
    { 
        
        
        oe.getFloat() => float noteOn;
        oe.getFloat() => float freq;
        oe.getInt() => int preset;
        <<< "got (via OSC): NoteON", noteOn  >>>;
        <<< "got (via OSC): FREQ", freq  >>>;
        <<< "got (via OSC): preset", preset  >>>;
        // set play pointer to beginning
        // 0 => buf.pos;
        // ding!
       
         
       oe.getFloat() => bar.stickHardness;
       oe.getFloat() => bar.strikePosition;
       oe.getFloat() => bar.vibratoFreq;
       oe.getFloat() => bar.vibratoGain;
       oe.getFloat() => bar.directGain;
       oe.getFloat() => bar.masterGain;
       oe.getFloat() => bar.volume;
        
        // print
        <<< "---", "" >>>;
        <<< "stick hardness:", bar.stickHardness() >>>;
        <<< "strike position:", bar.strikePosition() >>>;
        <<< "vibrato gain:", bar.vibratoGain() >>>;
        <<< "vibrato freq:", bar.vibratoFreq() >>>;
        <<< "volume:", bar.volume() >>>;
        <<< "direct gain:", bar.directGain() >>>;
        <<< "master gain:", bar.masterGain() >>>;
        

        // set freq & preset
        freq => bar.freq;
        preset => bar.preset;
        // go
        if ( noteOn >= 0 ) {
            .8 => bar.noteOn;
        };
    }
    // advance time
    // .5::second => now;
}
