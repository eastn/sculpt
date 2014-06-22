// This chuck patch notifies SuperCollider when it starts,
// and sends to SC the format of the message that it expects to play
// its instrument.  SC then constructs a eventType on the fly for playing
// this instrument with patterns. 

// patch
VoicForm vox => dac;

////////////////// OSC receiver ////////////////
// create our OSC receiver

// This is the message+format that the osc receiver listens to
// and which triggers the instrument to play.
"/vox,f:freq,f:noteOn,i:phonemeNum,f:speak" => string instrTriggerMessage;


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
recv.event( "/vox, f, f, i, f" ) @=> OscEvent oe;

// infinite time loop
while( true )
{
    oe => now;   
    // grab the next message from the queue. 
    while ( oe.nextMsg() != 0 )
    { 
        // getFloat fetches the expected float (as indicated by "f")
        //oe.getInt() => int presetNum;
        // print
        //<<< "got (via OSC): presetNum", presetNum  >>>;
        oe.getFloat() => float freq;
        oe.getFloat() => float noteOn;
        <<< "got (via OSC): FREQ", freq  >>>;
        <<< "got (via OSC): NoteON", noteOn  >>>;
        // set play pointer to beginning
        // 0 => buf.pos;
        // ding!
        
        oe.getInt() => vox.phonemeNum;
        oe.getFloat() => vox.speak;
        
        
        // print
        <<< "---", "" >>>;
        <<< "phonemeNum:", vox.phonemeNum() >>>; //does not printing
        //<<< ":", clar.noiseGain() >>>;
        
        // set freq
        freq => vox.freq;
        // go
        if ( noteOn >= 0 ) {
           .8 => vox.noteOn;
        };
        
    }
    // advance time
    // .5::second => now;
}
