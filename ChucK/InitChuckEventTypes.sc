/*

Experiment with event types for playing Patterns with ChucK. 

addEventType for some experimental types at StartUp time. 

Thu, Jun  5 2014, 13:51 EEST

*/

InitChuckEventTypes {

	*initClass {
		StartUp add: { this.addEventTypes }
	}


	*addEventTypes {
		Event.parentEvents.default[\chuckServer] = NetAddr("127.0.0.1", 6449);
		this.addTestType1;
		this.addGenericInstrument;
		// will add more types later...
	}

	*addTestType1 {
		Event.addEventType(\chuckTest, {
			~chuckServer.sendMsg("/bar",
				~preset ? 0,
				~freq.value,
				~hardness ? 0.01,
				~position ? 0.5
			);
		})
	}

	*addGenericInstrument {
		Event.addEventType(\chuckInstrument, {
			~chuckServer.sendMsg(
				(~instrument ? '/bar'),
				~preset ? 0,
				~freq.value,
				~hardness ? 0.01,
				~position ? 0.5
			);
		})
	}}