// This chuck patch notifies SuperCollider when it starts,
// and sends to SC the format of the message that it expects to play
// its instrument.  SC then constructs a eventType on the fly for playing
// this instrument with patterns. 

// patch
Clarinet clar => dac;

////////////////// OSC receiver ////////////////
// create our OSC receiver

// This is the message+format that the osc receiver listens to
// and which triggers the instrument to play.
"/clar,f:freq,f:noteOn,f:reed,f:noiseGain,f:clear,f:vibratoFreq,f:vibratoGain,f:pressure,f:startBlowing,f:stopBlowing,f:rate" => string instrTriggerMessage;

//clear instrument control, doesn't give any explanation if it is floar or integer, I guess this must be an integer 0 - 1.

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
recv.event( "/clar, f, f, f, f, f, f, f, f, f, f, f" ) @=> OscEvent oe;

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
        
        oe.getFloat() => clar.reed;
        oe.getFloat() => clar.noiseGain;
        oe.getInt() => clar.clear;
        oe.getFloat() => clar.vibratoFreq;
        oe.getFloat() => clar.vibratoGain;
        oe.getFloat() => clar.pressure;
        oe.getFloat() => clar.startBlowing;
        oe.getFloat() => clar.stopBlowing;
        oe.getFloat() => clar.rate;
        
        // print
        <<< "---", "" >>>;
        <<< "reed:", clar.reed() >>>;
        <<< "noiseGain:", clar.noiseGain() >>>;
        //<<< "clear:", clar.clear() >>>; //Write Only ?? (lacks of documentation).
        <<< "vibratoFreq:", clar.vibratoFreq() >>>;
        <<< "vibratoGain:", clar.vibratoGain() >>>;
        <<< "pressure:", clar.pressure() >>>;
        //<<< "startBlowing:", clar.startBlowing() >>>; //Write Only!
        //<<< "stopBlowing:", clar.stopBlowing() >>>;   //Write Only!
        <<< "rate:", clar.rate() >>>;
        
        // set freq
        freq => clar.freq;
        // go
        if ( noteOn >= 0 ) {
            .8 => clar.noteOn;
        };

    }
    // advance time
    // .5::second => now;
}
