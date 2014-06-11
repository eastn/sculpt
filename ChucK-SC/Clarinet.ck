// This chuck patch notifies SuperCollider when it starts,
// and sends to SC the format of the message that it expects to play
// its instrument.  SC then constructs a eventType on the fly for playing
// this instrument with patterns. 

// patch
Clarinet bar => dac;

////////////////// OSC receiver ////////////////
// create our OSC receiver

// This is the message+format that the osc receiver listens to
// and which triggers the instrument to play.
"/bar, f:reed, f:noiseGain, i:clear, f:vibratoFreq, f:vibratoGain, f:pressure, f:startBlowing, f:stopBlowing, f:rate" => string instrTriggerMessage;

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
recv.event( "/bar, f, f, i, f, f, f, f, f, f" ) @=> OscEvent oe;

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
        
        oe.getFloat() => bar.reed;
        oe.getFloat() => bar.noiseGain;
        oe.getInt() => bar.clear;
        oe.getFloat() => bar.vibratoFreq;
        oe.getFloat() => bar.vibratoGain;
        oe.getFloat() => bar.pressure;
        oe.getFloat() => bar.startBlowing;
        oe.getFloat() => bar.stopBlowing;
        oe.getFloat() => bar.rate;
        
        // print
        <<< "---", "" >>>;
        <<< "reed:", bar.reed() >>>;
        <<< "noiseGain:", bar.noiseGain() >>>;
        //<<< "clear:", bar.clear() >>>; //Write Only ?? (lacks of documentation).
        <<< "vibratoFreq:", bar.vibratoFreq() >>>;
        <<< "vibratoGain:", bar.vibratoGain() >>>;
        <<< "pressure:", bar.pressure() >>>;
        //<<< "startBlowing:", bar.startBlowing() >>>; //Write Only!
        //<<< "stopBlowing:", bar.stopBlowing() >>>;   //Write Only!
        <<< "rate:", bar.rate() >>>;
        
        // set freq
        freq => bar.freq;
        // go
        .8 => bar.noteOn;
    }
    // advance time
    // .5::second => now;
}
