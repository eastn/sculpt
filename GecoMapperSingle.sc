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
	var <previousPath, <previousActionString;

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
			pathSelectionView = ListView(),
			[VLayout(
				submitButton = Button().states_([["submit"]])
				.action_({ this.updateOSCdef }),
				actionEditorView　= TextView().font_(Font.monospace)), s: 2]
		);
		this.makePaths;
		this.makeActions;
		pathSelectionView.action = { | me |
			//		this.submitPreviousPath;
			previousPath = me.item;
			//			previousActionString = actionEditorView.string;
			previousActionString = actions[previousPath];
			actionEditorView.string = previousActionString;
		};
		pathSelectionView.valueAction_(0);
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

	submitPreviousPath {
		previousPath !? {
			OSCdef(previousPath, previousActionString.interpret, previousPath);
		}
	}

	updateOSCdef {
		[this, thisMethod.name, pathSelectionView.item, 
			actionEditorView.string].postln;
		actions[pathSelectionView.item] = actionEditorView.string;
	}
}