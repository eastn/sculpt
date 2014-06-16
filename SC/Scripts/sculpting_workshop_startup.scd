/*
To be used as startup script (in place of startup.scd ...)
for the sound sculpt workshop. [2014-06-22 Sun]
*/

SoundSculpt {
	*initClass {
		StartUp add: {
			BufferList.loadFolder;
		}
	}

}