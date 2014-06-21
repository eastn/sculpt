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

	*initChuckSCEventTypeCreator {
		OSCFunc({ | msg |
			this.parseMessageAndMakeInstrument(msg);
		}, '/c_instr');
		this.makeChuckInstrumentEventType;
	}

	*makeChuckInstrumentEventType {
		Event.addEventType(\chuckInstrument, {
			// currentEnvironment.postln;
			var instrument, params, message;
			instrument = ~instrument ? '/bar';
			//	[this, thisMethod.name, instrument].postln;
			//	Library.at('ChuckInstruments').postln;
			params = Library.at('ChuckInstruments', instrument);
			params = params collect: { | param |
				///					[param[0], param[0].class].postln;
				//		currentEnvironment[param[0]].postln;
					(currentEnvironment[param[0]] ? 0).value.perform(param[1])
			};
			//	params.postln;
			message = [instrument] ++ params;
			//message.postln;
			~chuckServer.sendMsg(*message);
		});

		//	[this, thisMethod.name].postln;

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
		this.makePdefTemplate(instrName, params);
		this.makeEdefTemplate(instrName, params);
	}

	*parseParam { | paramString |
		var parName, type;
		#type, parName = paramString split: $:;
		//		[this, thisMethod, "TYPE first char:", type.first, "type is integer: type.first === $i" ].postln;
		^[parName.asSymbol, if (type.first === $i) { \asInteger } { \asFloat }]
	}

	*makeAndAddEventType { | instrName, params |
		var message, instrParams;
		Library.put(\ChuckInstruments, instrName.asSymbol, params);
		// [this, thisMethod.name, Library.at(\ChuckInstruments)].postln
	}

	*makePdefTemplate { | instrName, params |
		var template;
		/* final form of template (string):
			Pdef(\defname, Pbind(
			    \type, \chuckInstrument,
			    \instrument, \<instrName>,
			    .. param pairs with default values 
			))
		*/
		template = 
		("Pdef(" ++ instrName.asSymbol.asCompileString
			++ ",\n Pbind(\\type, \\chuckInstrument, \\instrument, "
			++ instrName.asSymbol.asCompileString
			++ ", \n\t\\dur, 0.125 "
		).ccatList(
			params.collect({ | p | 
				format("\n\t%, %", p[0].asCompileString,
					if (p[1] === \asInteger) { 0 } { 0.1 }
				)
			});
		) ++ ")).play";
		Library.put(\PdefTemplates, instrName.asSymbol, template);
	}

	*makeEdefTemplate { | instrName, params |
		var template;
		/* final form of template (string):
			Pdef(\defname, Pbind(
			    \type, \chuckInstrument,
			    \instrument, \<instrName>,
			    .. param pairs with default values 
			))
		*/
		template = 
		(
			"Edef(\\defname,\n (type: \\chuckInstrument, instrument: %"
			++ 	instrName.asSymbol.asCompileString ++
			"\n\tdur: 0.125 "
		).ccatList(
			params.collect({ | p | 
				format("\n\t%:, %", p[0],
					if (p[1] === \asInteger) { 0 } { 0.1 }
				)
			});
		) ++ "))";
		Library.put(\EdefTemplates, instrName.asSymbol, template);
	}
}

+ Symbol {
	cpt {
		// get Chuck Pdef Template
		^Library.at(\PdefTemplates, this);
	}

	cet {
		^Library.at(\EdefTemplates, this);
	}
}


/*
"a, b, c".split($,);

1.asInteger;
1.asFloat.class;

21.95.asInteger;


Server.kill
*/