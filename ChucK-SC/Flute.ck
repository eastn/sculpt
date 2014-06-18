// This chuck patch notifies SuperCollider when it starts,
// and sends to SC the format of the message that it expects to play
// its instrument.  SC then constructs a eventType on the fly for playing
// this instrument with patterns. 

// patch
Flute flute => dac;

////////////////// OSC receiver ////////////////
// create our OSC receiver

// This is the message+format that the osc receiver listens to
// and which triggers the instrument to play.
"/flute,f:jetDelay,f:jetReflection,f:endReflection,f:noiseGain,f:vibratoFreq,f:vibratoGain,f:pressure" => string instrTriggerMessage;

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
recv.event( "/flute, f, f, f, f, f, f, f" ) @=> OscEvent oe;

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
        <<< "got (via OSC): FREQ", freq  >>>;
        // set play pointer to beginning
        // 0 => buf.pos;
        // ding!
        
        oe.getFloat() => flute.jetDelay;
        oe.getFloat() => flute.jetReflection;
        oe.getFloat() => flute.noiseGain;
        oe.getFloat() => flute.vibratoFreq;
        oe.getFloat() => flute.vibratoGain;
        oe.getFloat() => flute.pressure;
               
        // print
        <<< "---", "" >>>;
        <<< "jetDelay:", flute.jetDelay() >>>;
        <<< "jetReflection:", flute.jetReflection() >>>;
        <<< "noiseGain:", flute.noiseGain() >>>;
        <<< "vibratoFreq:", flute.vibratoFreq() >>>;
        <<< "vibratoGain:", flute.vibratoGain() >>>;
        <<< "pressure:", flute.pressure() >>>;
        
        // set freq
        freq => flute.freq;
        // go
        .8 => flute.noteOn;
    }
    // advance time
    // .5::second => now;
}
