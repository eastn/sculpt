// This chuck patch notifies SuperCollider when it starts,
// and sends to SC the format of the message that it expects to play
// its instrument.  SC then constructs a eventType on the fly for playing
// this instrument with patterns. 

// patch
BlowHole bar => dac;

////////////////// OSC receiver ////////////////
// create our OSC receiver

// This is the message+format that the osc receiver listens to
// and which triggers the instrument to play.
"/bar, f:reed, f:noiseGain, f:tonehole, f:vent, f:pressure, f:startBlowing, f:stopBlowing, f:rate" => string instrTriggerMessage;

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
recv.event( "/bar, f, f, f, f, f, f, f, f" ) @=> OscEvent oe;

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
        
  //  Math.random2f( 0, 1 ) => bar.reed;
   // Math.random2f( 0, 1 ) => bar.noiseGain;
   // Math.random2f( 0, 1 ) => bar.tonehole;
   // Math.random2f( 0, 1 ) => bar.vent;
   // Math.random2f( 0, 1 ) => bar.pressure;
 //   Math.random2f( 0, 1 ) => bar.startBlowing;
  //  Math.random2f( 0, 1 ) => bar.stopBlowing;
  //  Math.random2f( 0, 5 ) => bar.rate;

        
       oe.getFloat() => bar.reed;
       oe.getFloat() => bar.noiseGain;
       oe.getFloat() => bar.tonehole;
       oe.getFloat() => bar.vent;
       oe.getFloat() => bar.pressure;
       oe.getFloat() => bar.startBlowing;
       oe.getFloat() => bar.stopBlowing;
       oe.getFloat() => bar.rate;
                
        
        // print
        <<< "---", "" >>>;
        <<< "reed:", bar.reed() >>>;
        <<< "noiseGain:", bar.noiseGain() >>>;
        <<< "tonehole:", bar.tonehole() >>>;
        <<< "vent:", bar.vent() >>>;
        <<< "pressure:", bar.pressure() >>>;
        <<< "rate:", bar.rate() >>>;
        
        // set freq
        freq => bar.freq;
        // scale[Math.random2(0,scale.cap()-1)] => int winner;
    // 57 + Math.random2(0,2)*12 + winner => Std.mtof => bar.freq;
        // go
        .8 => bar.noteOn;
    }
    // advance time
     .1::second => now;
}
