// This chuck patch notifies SuperCollider when it starts,
// and sends to SC the format of the message that it expects to play
// its instrument.  SC then constructs a eventType on the fly for playing
// this instrument with patterns. 

// patch
Shakers shakers => dac;

////////////////// OSC receiver ////////////////
// create our OSC receiver

// This is the message+format that the osc receiver listens to
// and which triggers the instrument to play.
"/shakers,f:noteOn,f:freq,i:preset,f:energy,f:decay" => string instrTriggerMessage;

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
recv.event( "/shakers, f, f, i, f, f" ) @=> OscEvent oe;

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
        
        
        oe.getFloat() => shakers.energy;
        oe.getFloat() => shakers.decay;
       
        
        // print
        <<< "---", "" >>>;
        <<< "energy:", shakers.energy() >>>;
        <<< "decay:", shakers.decay() >>>;
       
        
        
        // set freq & preset
        freq => shakers.freq;
        preset => shakers.preset;
        // go
        if ( noteOn >= 0 ) {
            .8 => shakers.noteOn;
        };
    }
    // advance time
    // .5::second => now;
}
