

MappingFunction {
	/* 
		A function that also has a spec 
	*/
	var spec, function;

	*new { | spec, function |

		^this.newCopyArgs(spec, function);
	}

	value { | ... args |
		function.(spec, args);
	}
}

/*

example usage inside leap interface


instead of 
{ ..... function }

write: 

MappingFunction(
	\freq.asSpec,   // the spec
	{ | spec, args |
	spec.map(args[0][1] + 1 / 2);
	}
);

*/


