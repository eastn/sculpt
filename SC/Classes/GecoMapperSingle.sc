/*
One of two first designs for trying out different actions for the n paths of OSC
messages received by geco.

This one has a list panel for selecting the path, and a text field for editing 
the action (function) of the selected path. 

Wed, May 28 2014, 21:59 EEST
*/

GecoMapperSingle : UniqueWindow {

	var pathSelectionView, actionEditorView;
	var <paths, <actions, submitButton;
	var <editedPath, <editedActionString;

	*initClass {
		StartUp add: { this.default };
	}

	*default {
		^this.for(this, \default, { | me |
			me.initGecoMapperSingle;
		})
	}

	initGecoMapperSingle {
		this.right(900).height_(300);
		this.window.view.layout = HLayout(
			pathSelectionView = ListView().fixedWidth_(160),
			VLayout(
				HLayout(
					submitButton = Button().states_([["submit"]])
					.maxHeight_(23).action_({ this.updateOSCdef }),
					Button().states_([["test this osc message"]])
					.maxHeight_(23).action_({
						this.testOscMessage(pathSelectionView.item);
					}),
					Button().states_([["all"], ["solo"], ["mute"]])
					.maxHeight_(23).action_({ | me |
						this.perform([\playAll, \playSolo, \muteThis][me.value]);
					}),
					Button().states_([["open"]]).maxHeight_(23).action_({ this.open }),
					Button().states_([["save"]]).maxHeight_(23).action_({ this.save })
				),
				actionEditorView　= TextView().font_(Font.monospace))
		);
		this.makePaths;
		this.makeActions;
		actionEditorView.keyDownAction = {
			{editedPath = pathSelectionView.item.asSymbol;
			editedActionString = actionEditorView.string;
			actions[editedPath] = editedActionString}.defer(0.001);
		};
		pathSelectionView.action = { | me |
			this.submitPreviousPath;
			actionEditorView.string = actions[me.item];
		};
		editedPath = pathSelectionView.item;
		editedActionString = actions[editedPath];
		actionEditorView.string = editedActionString;
		actions keysValuesDo: { | key, value |
			OSCdef(key, value.interpret, key);
		};
	}

	playAll {
		
	}

	playSolo {
		thisMethod.name.postln;
	}
	muteThis {
		thisMethod.name.postln;
	}
	testOscMessage { | message |
		this.submitPreviousPath;
		NetAddr.localAddr.sendMsg(message, 10.rand);
	}

	submitPreviousPath {
		editedPath !? {
			OSCdef(editedPath, editedActionString.interpret, editedPath);
		}
	}

	updateCurrentPath { | path |
		actions[path] = editedActionString;
	}

	makePaths {
		paths = (["/left", "/right"].collect{ | hand |
			["/open", "/closed"].collect{ | handshape |
				["/present", "/posx", "/movx", "/posy", "/movy", "/posz", "/movz",
					"/pitch", "/roll", "/yaw"] collect: { | coord | 
						 (hand +/+ handshape +/+ coord).asSymbol;
					}
			}
		}).flat;
		pathSelectionView.items = paths;
	}

	makeActions {
		actions = IdentityDictionary();
		paths do: { | p | actions[p] = "{ | ... args | args.postln; }" }
	}

	updateOSCdef {
		actions[pathSelectionView.item] = actionEditorView.string;
		this.submitPreviousPath;
	}

	save {
		paths.collect({ | p | [p, actions[p]]})
		.writeArchive(this.defaultSetupFilePath);
		"GECO OSC SETUP SAVED IN USER APP SUPPORT DIRECTORY".postln;
	}

	open {
		//		Document.open(this.defaultSetupFilePath);
		var data;
		data = this.defaultSetupFilePath.load;
		//		data.postln;
		paths = data collect: _[0];
		actions = IdentityDictionary();
		data do: { | pathAction |
			actions[pathAction[0]] = pathAction[1];
		};
		this.changed(\everything);
		"LOADED CONFIG".postln;
		data.asCompileString.postln;
		paths.asCompileString.postln;
		actions.asCompileString.postln;
		actions do: _.postln;
	}

	defaultSetupFilePath {
		^Platform.userAppSupportDir +/+ "GECO_OSC_SETUP.sctxar";
	}
}
