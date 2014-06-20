

OscRecv recv1;
// use port 6449
6449 => recv1.port;
// start listening (launch thread)
recv1.listen();

// create an address in the receiver, store in new variable
recv1.event( "/r2" ) @=> OscEvent oe1;

while( true )
{
    oe1 => now;   
    // grab the next message from the queue. 
    while ( oe1.nextMsg() != 0 )
    {
        <<< "got (via OSC): oe1 !!!!!" >>>;
    }
}