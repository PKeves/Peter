const crypto = require('crypto');
const fs = require('fs');
const path = require('path');
const vscode = require('vscode');

function activate(context) {
	const checksum = computeChecksum('/Applications/Visual Studio Code.app/Contents/Resources/app/out/vs/code/electron-browser/workbench/workbench.html')
	vscode.window.showInformationMessage(checksum);
}

function computeChecksum(file) {
	var contents = fs.readFileSync(file)
	return crypto
	  .createHash('md5')
	  .update(contents)
	  .digest('base64')
	  .replace(/=+$/, '')
  }
exports.activate = activate;