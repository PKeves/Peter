# commands missing:
# cp
# cpop
# mv
# mvop
# fd
# ff
# fs
# gp
# bp
# gz
# ct - and all mem operations

$peter_win_dir=""
$peter_lin_dir=""

Add-Type -AssemblyName System.Windows.Forms
cd $peter_lin_dir
clear
del alias:rm -Force
del alias:sc -Force
del alias:cp -Force
del alias:cd -Force
del alias:mv -Force

function ad(){
    param(
        $path="$PWD"
    )
    if(Test-Path $path){
        $path = Resolve-Path $path
        Set-Location $path
    }
}
function ada(){
    Set-Location "${peter_win_dir}\apps"
}
function adg(){
    Set-Location "${peter_win_dir}\git"
}
function adl(){
    Set-Location "${peter_win_dir}\lib"
}
function adt(){
    Set-Location "${peter_win_dir}\tmp"
}
New-Alias bd cat
function cp{
    param(
        [Parameter(
            Mandatory=$True
            Position = 0
        )]
        [string]
        $dest,

        [Parameter(
            Mandatory=$True
            ValueFromRemainingArguments=$true,
            Position = 1
        )][String[]]
        $items
    )
    foreach($item in $items){
        Copy-Item -Path $item -Destination $dest -Recurse -Force
    }
}
function df($1, $2){
    code -d $1 $2
}

New-Alias ex exit
New-Alias hd head
New-Alias hs Get-History
New-Alias me whoami
function mv{
    param(
        [Parameter(
            Mandatory=$True
            Position = 0
        )]
        [string]
        $dest,

        [Parameter(
            Mandatory=$True
            ValueFromRemainingArguments=$true,
            Position = 1
        )][String[]]
        $items
    )
    foreach($item in $items){
        Move-Item -Path $item -Destination $dest -Recurse -Force
    }
}
New-Alias nd mkdir
function nda($dir){
    mkdir $dir
    cd $dir
}
function nds($dir){
    mkdir $dir
    sd $dir
}
function nf(){
        param(
        [Parameter(
            Mandatory=$True
            ValueFromRemainingArguments=$true
            Position = 0
        )][string[]]
        $listArgs
    )
    foreach($listArg in $listArgs){
        ni $listArgs
        Invoke-Item $listArgs
    }
}
function la(){
    param(
        $path="$PWD"
    )
    if(Test-Path $path){
        $path = Resolve-Path $path
        Get-ChildItem $args -Force | Format-Wide Name -AutoSize
    }
    else{
        Get-ChildItem $args -Force | Format-Wide Name -AutoSize
    }
}
New-Alias lc ls
function ob(){
    param(
        [Parameter(
            Mandatory=$True,
            ValueFromRemainingArguments=$true,
            Position = 0
        )][string[]]
        $listArgs
    )
    foreach($listArg in $listArgs){
        Start-Process "chrome.exe" $listArg
    }
}
function oc(){
    param(
        [Parameter(
            Mandatory=$True,
            ValueFromRemainingArguments=$true,
            Position = 0
        )][string[]]
        $listArgs
    )
    foreach($listArg in $listArgs){
        code -r $listArg
    }
}
function ol{
    code -g $l\:$f
}
function op(){
    param(
        [Parameter(
            Mandatory=$True,
            ValueFromRemainingArguments=$true,
            Position = 0
        )][string[]]
        $listArgs
    )
    foreach($listArg in $listArgs){
        Invoke-Item $listArg
    }
}
function opa(){
    Invoke-Item "${peter_win_dir}\apps\autohotkey\snippets.ahk"
    Invoke-Item "${peter_win_dir}\apps\autohotkey\autohotkey.ahk"
    Start-Sleep -s 0.6
    [System.Windows.Forms.SendKeys]::SendWait("{ENTER")
    Start-Sleep -s 0.6
    [System.Windows.Forms.SendKeys]::SendWait("{ENTER")
}
function prompt {
    Write-Host "$($PWD.ProviderPath) $ " -nonewline -foregroundcolor Red
    return ' '
}
function rc($f){
    wc -l $f
}
function rm(){
    param(
        [Parameter(
            Mandatory=$True,
            ValueFromRemainingArguments=$true,
            Position = 0
        )][string[]]
        $listArgs
    )
    foreach($listArg in $listArgs){
        Remove-Item -LiteralPath "$listArg" -Force -Recurse
    }
}
New-Alias sc "${peter_lin_dir}\apps\editor\sc.ps1"
function sd(){
    param(
        $path="PWD"
    )
    if(Test-Path $path){
        $path = Resolve-Path $path
        Set-Location $path
        Get-ChildItem $args - Force | Format-Wide Name -AutoSize
    }
    else{
        Get-ChildItem $args - Force | Format-Wide Name -AutoSize
    }
}
function sda(){
    Set-Location "${peter_win_dir}\apps"
    Get-ChildItem $args - Force | Format-Wide Name -AutoSize
}
function sdg(){
    Set-Location "${peter_win_dir}\git"
    Get-ChildItem $args - Force | Format-Wide Name -AutoSize
}
function sdl(){
    Set-Location "${peter_win_dir}\lib"
    Get-ChildItem $args - Force | Format-Wide Name -AutoSize
}
function sdt(){
    Set-Location "${peter_win_dir}\tmp"
    Get-ChildItem $args - Force | Format-Wide Name -AutoSize
}
New-Alias tl tail