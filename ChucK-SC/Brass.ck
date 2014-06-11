// This chuck patch notifies SuperCollider when it starts,
// and sends to SC the format of the message that it expects to play
// its instrument.  SC then constructs a eventType on the fly for playing
// this instrument with patterns. 

// patch
Brass bar => dac;

////////////////// OSC receiver ////////////////
// create our OSC receiver

// This is the message+format that the osc receiver listens to
// and which triggers the instrument to play.

"/bar, f:bowPressure, f:bowPosition, f:vibratoFreq, f:vibratoGain, f:volume, f:startBowing, f:stopBowing, f:rate" => string instrTriggerMessage;

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
recv.event( "/bar, f, f, f, f, f, f, f, f, f" ) @=> OscEvent oe;

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
        
        oe.getFloat() => bar.lip;
        oe.getFloat() => bar.slide;
        oe.getFloat() => bar.vibratoFreq;
        oe.getFloat() => bar.vibratoGain;
        oe.getFloat() => bar.volume;
        oe.getFloat() => bar.clear;
        oe.getFloat() => bar.startBlowing;
        oe.getFloat() => bar.stopBlowing;
        oe.getFloat() => bar.rate;
        
        // print
        <<< "---", "" >>>;
        <<< "lip:", bar.lip() >>>;
        <<< "slide:", bar.slide() >>>;
        <<< "vibratoFreq:", bar.vibratoFreq() >>>;
        <<< "vibratoGain:", bar.vibratoGain() >>>;
        <<< "volume:", bar.volume() >>>;
        //<<< "clear:", bar.clear() >>>; //Write Only!
        //<<< "startBlowing:", bar.startBowing() >>>; //Write Only!
        //<<< "stopBlowing:", bar.stopBowing() >>>;   //Write Only!
        <<< "rate:", bar.rate() >>>;
        
        // set freq
        freq => bar.freq;
        // go
        .8 => bar.noteOn;
    }
    // advance time
    // .5::second => now;
}
