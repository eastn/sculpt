// This chuck patch notifies SuperCollider when it starts,
// and sends to SC the format of the message that it expects to play
// its instrument.  SC then constructs a eventType on the fly for playing
// this instrument with patterns. 

// patch
Bowed bowed => dac;


// This is the message+format that the osc receiver listens to
// and which triggers the instrument to play.
"/bowed, f:freq, f:bowPressure, f:bowPosition, f:vibratoFreq, f:vibratoGain, f:volume, f:startBowing, f:stopBowing, f:rate" => string instrTriggerMessage;

////////////////// OSC sender ////////////////
// create our OSC sender

// This sender will notify Supercollider that a new instrument is listening
OscSend sender;

// Prepare to send to SuperCollider
sender.setHost("localhost", 57120);

// Preformat the message to be sent
sender.startMsg("/c_instr, s");

// Send the string declaring the format used to receive trigger messages
sender.addString(instrTriggerMessage);

////////////////// OSC receiver ////////////////
// create our OSC receiver

OscRecv recv;
// use port 6449
6449 => recv.port;
// start listening (launch thread)
recv.listen();

// create an address in the receiver, store in new variable
recv.event( "/bowed, f, f, f, f, f, f, f, f, f" ) @=> OscEvent oe;

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
        
        oe.getFloat() => bowed.bowPressure;
        oe.getFloat() => bowed.bowPosition;
        oe.getFloat() => bowed.vibratoFreq;
        oe.getFloat() => bowed.vibratoGain;
        oe.getFloat() => bowed.volume;
        oe.getFloat() => bowed.startBowing;
        oe.getFloat() => bowed.stopBowing;
        //oe.getFloat() => bowed.rate;
        
        // print
        <<< "---", "" >>>;
        <<< "bowPressure:", bowed.bowPressure() >>>;
        <<< "bowPosition:", bowed.bowPosition() >>>;
        <<< "vibratoFreq:", bowed.vibratoFreq() >>>;
        <<< "vibratoGain:", bowed.vibratoGain() >>>;
        <<< "volume:", bowed.volume() >>>;
      //<<< "startBlowing:", bowed.startBowing() >>>; //Write Only!
      //<<< "stopBlowing:", bowed.stopBowing() >>>;   //Write Only!
        //<<< "rate:", bowed.rate() >>>;
        
        // set freq
        // freq => bowed.freq;
        // go
        .8 => bowed.noteOn;
    }
    // advance time
    // .5::second => now;
}
