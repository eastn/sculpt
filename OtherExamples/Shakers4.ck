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
"/shakers4,f:noteOn,i:preset,f:objects,f:freq,f:energy,f:decay" => string instrTriggerMessage;

// This sender will notify Supercollider that a new instrument is listening
OscSend sender;

// Prepare to send to SuperCollider
sender.setHost("localhost", 57121);

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
recv.event( "/shakers4, f, i, f, f, f, f" ) @=> OscEvent oe;

// infinite time loop
while( true )
{
    oe => now;   
    // grab the next message from the queue. 
    while ( oe.nextMsg() != 0 )
    { 
        oe.getFloat() => float noteOn;
        oe.getInt() => int preset;
        oe.getFloat() => float objects;
        oe.getFloat() => float freq;

        preset => shakers.preset;
        objects => shakers.objects;
        freq => shakers.freq;
        oe.getFloat() => shakers.energy;
        oe.getFloat() => shakers.decay;

        if ( noteOn >= 0 ) {
            noteOn => shakers.noteOn;
        };
    }
    // advance time
    // .5::second => now;
}
