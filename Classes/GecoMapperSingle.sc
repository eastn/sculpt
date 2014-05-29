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
					.action_({ this.updateOSCdef }),
					Button().states_([["test this osc message"]])
					.action_({
						this.testOscMessage(pathSelectionView.item);
					})
				),
				actionEditorView　= TextView().font_(Font.monospace))
		);
		this.makePaths;
		this.makeActions;
		actionEditorView.keyDownAction = {
			editedPath = pathSelectionView.item.asSymbol;
			editedActionString = actionEditorView.string;
			actions[editedPath] = editedActionString;
		};
		pathSelectionView.action = { | me |
			this.submitPreviousPath;
			actionEditorView.string = actions[me.item];
		};
		editedPath = pathSelectionView.item;
		editedActionString = actions[editedPath];
		actionEditorView.string = editedActionString;
		actions keysValuesDo: { | key, value |
			OSCdef(key, value, key);
		};
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
		[this, thisMethod.name, pathSelectionView.item, 
			actionEditorView.string].postln;
		actions[pathSelectionView.item] = actionEditorView.string;
	}
}