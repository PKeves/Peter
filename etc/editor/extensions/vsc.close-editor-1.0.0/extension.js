const vscode = require('vscode');

function activate(context) {
	function closeEditor(){
		if (/Untitled/.test(vscode.window.activeTextEditor.document.fileName)){
			vscode.commands.executeCommand('editor.action.selectAll')
			.then( () => {
				vscode.commands.executeCommand('deleteAllLeft')
				.then( async () => {
					vscode.commands.executeCommand('workbench.action.closeActiveEditor')
				})
			})
		}
		else{
			vscode.commands.executeCommand('workbench.action.closeActiveEditor')
		}
	}
	
	var closeEditor = vscode.commands.registerCommand(
		"extension.closeEditor",
		closeEditor
	);

	context.subscriptions.push(closeEditor);
}

exports.activate = activate;