const vscode = require('vscode');

function activate(context) {

	function switchEditorGroup(){
		let activeGroup = vscode.window.activeTextEditor.viewColumn
		
		if (activeGroup == 1){
			vscode.commands.executeCommand('workbench.action.moveEditorToNextGroup')
		}
		else{
			vscode.commands.executeCommand('workbench.action.moveEditorToPreviousGroup')
		}
	}
	
	var switchEditorGroup = vscode.commands.registerCommand(
		"extension.switchEditorGroup",
		switchEditorGroup
	);

	context.subscriptions.push(switchEditorGroup);
}

exports.activate = activate;