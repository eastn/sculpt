// This chuck patch notifies SuperCollider when it starts,
// and sends to SC the format of the message that it expects to play
// its instrument.  SC then constructs a eventType on the fly for playing
// this instrument with patterns. 

// patch
BlowHole blow => dac;

////////////////// OSC receiver ////////////////
// create our OSC receiver

// This is the message+format that the osc receiver listens to
// and which triggers the instrument to play.
// f:reed, f:noiseGain, f:tonehole, f:vent, f:pressure, f:startBlowing, f:stopBlowing, f:rate
"/blow,f:noteOn,f:freq,f:reed,f:noiseGain,f:tonehole,f:vent,f:pressure,f:startBowing,f:stopBowing,f:rate" => string instrTriggerMessage;

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
recv.event( "/blow, f, f, f, f, f, f, f, f, f, f" ) @=> OscEvent oe;

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
       <<< "got (via OSC): NoteON", noteOn  >>>;
        // set play pointer to beginning
        // 0 => buf.pos;
        // ding!
                
       oe.getFloat() => blow.reed;
       oe.getFloat() => blow.noiseGain;
       oe.getFloat() => blow.tonehole;
       oe.getFloat() => blow.vent;
       oe.getFloat() => blow.pressure;
       oe.getFloat() => blow.startBlowing;
       oe.getFloat() => blow.stopBlowing;
       oe.getFloat() => blow.rate;
                
        
        // print
        <<< "---", "" >>>;
        <<< "reed:", blow.reed() >>>;
        <<< "noiseGain:", blow.noiseGain() >>>;
        <<< "tonehole:", blow.tonehole() >>>;
        <<< "vent:", blow.vent() >>>;
        <<< "pressure:", blow.pressure() >>>;
        <<< "rate:", blow.rate() >>>;
        
        // set freq
        freq => blow.freq;
        // go
        if ( noteOn >= 0 ) {
            .8 => blow.noteOn;
        };
    }
    // advance time
    // .1::second => now;
}
