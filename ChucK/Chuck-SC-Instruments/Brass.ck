// This chuck patch notifies SuperCollider when it starts,
// and sends to SC the format of the message that it expects to play
// its instrument.  SC then constructs a eventType on the fly for playing
// this instrument with patterns. 

// patch
Brass brass => dac;

////////////////// OSC receiver ////////////////
// create our OSC receiver

// This is the message+format that the osc receiver listens to
// and which triggers the instrument to play.
"/brass,f:noteOn,f:freq,f:lip,f:slide,f:vibratoFreq,f:vibratoGain,f:volume,f:clear,f:startBlowing,f:stopBlowing,f:rate" => string instrTriggerMessage;

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
recv.event( "/brass, f, f, f, f, f, f, f, f, f, f, f" ) @=> OscEvent oe;

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
        oe.getFloat() => float noteOn;
        oe.getFloat() => float freq;
        <<< "got (via OSC): FREQ", freq  >>>;
         <<< "got (via OSC): NoteOn", noteOn  >>>;
        // set play pointer to beginning
        // 0 => buf.pos;
        // ding!
        
        oe.getFloat() => brass.lip;
        oe.getFloat() => brass.slide;
        oe.getFloat() => brass.vibratoFreq;
        oe.getFloat() => brass.vibratoGain;
        oe.getFloat() => brass.volume;
        oe.getFloat() => brass.clear;
        oe.getFloat() => brass.startBlowing;
        oe.getFloat() => brass.stopBlowing;
        oe.getFloat() => brass.rate;
        
        // print
        <<< "---", "" >>>;
        <<< "lip:", brass.lip() >>>;
        <<< "slide:", brass.slide() >>>;
        <<< "vibratoFreq:", brass.vibratoFreq() >>>;
        <<< "vibratoGain:", brass.vibratoGain() >>>;
        <<< "volume:", brass.volume() >>>;
        //<<< "clear:", brass.clear() >>>; //Write Only!
        //<<< "startBlowing:", brass.startBlowing() >>>; //Write Only!
        //<<< "stopBlowing:", brass.stopBlowing() >>>;   //Write Only!
        <<< "rate:", brass.rate() >>>;
        
        // set freq
        freq => brass.freq;
        // go
        if ( noteOn >= 0 ) {
            .8 => brass.noteOn;
        };
    }
    // advance time
    // .5::second => now;
}
