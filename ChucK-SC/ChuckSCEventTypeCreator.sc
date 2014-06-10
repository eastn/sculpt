/*
Create Event and add types for Pbind on the fly, 
based on specifications sent by ChucK. 

See file ChuckSCEventTypeCreator.org for instructions.

Fri, Jun  6 2014, 19:38 EEST

*/

ChuckSCEventTypeCreator {

	*initClass {
		StartUp add: {
			this.initChuckSCEventTypeCreator;
		}
	}

	*initChuckInstrRegistry {
		OSCFunc({ | msg |
			this.parseMessageAndMakeInstrument(msg);
		}, '/c_instr');
	}

	*parseMessageAndMakeInstrument { | msg |
		var formatString, params, instrName;
		formatString = msg[1].postln;
		params = formatString.asString.split($,);
		instrName = params[0];
		instrName.asCompileString.postln;
		params = params[1..];
		params = params collect: this.parseParam(_);
		params.postln;
		this.makeAndAddEventType(instrName, params);
	}

	*parseParam { | paramString |
		var parName, type;
		#type, parName = paramString split: $:;
		^[parName, if (type.first === $i) { \asInteger } { \asFloat }]
	}

	*makeAndAddEventType { | instrName, params |
		Event.addEventType(instrName.asSymbol, {
			~chuckServer.sendMsg(
				(~instrument ? '/bar'),
				*(params collect: {
					(currentEnvironment[params[0]] ? 0).value.perform(params[1])
				})
			)
		})
	}
}

/*
"a, b, c".split($,);

1.asInteger;
1.asFloat.class;

21.95.asInteger;


Server.kill
*/