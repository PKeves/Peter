RControl up::send % (a_priorkey = “RControl”) ? “{RControl up}{esc}” : “{RControl up}”

+`::~
return

^p::
WinSet, Style, ^0x00C40000, A
return

!Backspace::
Send, {Home}
Send, +{End}
Send, {Backspace}
return

^backspace::
Send, ^{Up}
Send, +^{Right}
Send, {Backspace}
return

ExtractAppTitle(FullTitle){
	AppTitle := SubStr(FullTitle, InStr(FullTitle, “ “, false, -1) +1)
	return AppTtitle
}

snapper(){
	WinExist(“A”)
	WinGetPos, posX, posY, sizeX, sizeY
	if(posX < (A_ScreenWidth / 2) -(sizeX / 2)){
		WinMove, A ,, ((A-ScreenWidth / 2) -7), 0 , ((A_ScreenWidth /2) + 10), (A_ScreenHeight +7)
	}
	else{
		WinMove, A ,, -7, 0 , ((A_ScreenWidth / 2) +10), (A_ScreenHeight +7)
	}
}

snapper_2(){
	WinExist(“A”)
	WinGetPos, posX, posY, sizeX, sizeY
	if(posX < (A_ScreenWidth / 2) -(sizeX / 2)){
		WinMove, A ,, -7, 0 , ((A_ScreenWidth / 2) +10), (A_ScreenHeight +7)
	}
	else{
		WinMove, A ,, ((A-ScreenWidth / 2) -7), 0 , ((A_ScreenWidth /2) + 10), (A_ScreenHeight +7)
	}
}

next_window(){
	WinGet, ActiveProcess, ProcessName, A
	Winget, OpenWindowsAmount, Count, ahk_exe %ActiveProocess%
	If OpenWindowsAmount = 1 ; If only one Window exist, do nothing
		Return
	Else{
		WinGetTitle, FullTitle, A
		AppTitle := ExtractAppTitle(FullTitle)
		SetTitleMatchMode, 2
		WinGet, WindowsWithSameTitleList, List , %AppTitle%

		If WindowsWithSameTitleList > 1; if several windows of same type  (title cheecking) exist{
			WinActivate, % “ahk_id”
			WindowsWithSameTitleList%WindowsWithSameTtitleList% ; Activate next window
		}
	}
}
$q::
if GetKeyState(“RControl”,”P,”){
	IfWinExist ahk_exe chrome.exe
		win_activate ahk_exe chrome.exe
	else
		run,”path_to_executable”
	WinWait ahk_exe chrome.exe
	WinActivate ahk_exe chrome.exe
	WinWaitActive ahk_exe chrome.exe
}
else{
	SendInput, {blind}q
}
return

$w::
if GetKeyState(“RControl”,”P,”){
	IfWinExist ahk_exe Code.exe
		win_activate ahk_exe Code.exe
	else
		run,”path_to_executable”
	WinWait ahk_exe Code.exe
	WinActivate ahk_exe Code.exe
	WinWaitActive ahk_exe Code.exe
}
else{
	SendInput, {blind}w
}
return

$e::
if GetKeyState(“RControl”,”P,”){
	IfWinExist ahk_exe DBArt.exe
		win_activate ahk_exe DBArt.exe
	else
		run,”path_to_executable”
	WinWait ahk_exe DBArt.exe
	WinActivate ahk_exe DBArt.exe
	WinWaitActive ahk_exe DBArt.exe
}
else{
	SendInput, {blind}e
}
return

$r::
if GetKeyState(“RControl”,”P,”){
	IfWinExist ahk_exe EXCEL.exe
		win_activate ahk_exe EXCEL.exe
	else
		run,”path_to_executable”
	WinWait ahk_exe EXCEL.exe
	WinActivate ahk_exe EXCEL.exe
	WinWaitActive ahk_exe EXCEL.exe
}
else{
	SendInput, {blind}r
}
return

$t::
if GetKeyState(“RControl”,”P,”){
	IfWinExist ahk_exe OUTLOOK.exe
		win_activate ahk_exe OUTLOOK.exe
	else
		run,”path_to_executable”
	WinWait ahk_exe OUTLOOK.exe
	WinActivate ahk_exe OUTLOOK.exe
	WinWaitActive ahk_exe OUTLOOK.exe
}
else{
	SendInput, {blind}t
}
return

$y::
if GetKeyState(“RControl”,”P,”){
	IfWinExist ("ahk_clasas LyncTabFrameHooostWindowClass"){
        winactivate ahk_class LyncTabFrameHooostWindowClass
    }
	else
		run,”path_to_executable”
}
else{
	SendInput, {blind}y
}
return

$u::
if GetKeyState(“RControl”,”P,”){
	IfWinExist ahk_exe Symphony.exe
		win_activate ahk_exe Symphony.exe
	else
		run,”path_to_executable”
	WinWait ahk_exe Symphony.exe
	WinActivate ahk_exe Symphony.exe
	WinWaitActive ahk_exe Symphony.exe
}
else{
	SendInput, {blind}u
}
return

$i::
if GetKeyState(“RControl”,”P,”){
	IfWinExist ahk_exe SnippingTool.exe
		win_activate ahk_exe SnippingTool.exe
	else
		run,”path_to_executable”
	WinWait ahk_exe SnippingTool.exe
	WinActivate ahk_exe SnippingTool.exe
	WinWaitActive ahk_exe SnippingTool.exe
}
else{
	SendInput, {blind}u
}
return

$*a::
if GetKeyState("RControl","P"){
    SendInput {Left}
}
else {
    SendInput, {blind}a
}
return

$*+a::
if GetKeyState("RControl","P"){
    SendInput +{Left}
}
else {
    SendInput, +{a}
}
return

$^a::
if GetKeyState("RControl","P"){
    SendInput ^{Left}
}
else {
    SendInput, ^{a}
}
return

$*!a::
if GetKeyState("RControl","P"){
    SendInput !{Left}
}
else {
    SendInput, {Home}
}
return

$*+^a::
if GetKeyState("RControl","P"){
    SendInput +^{Left}
}
else {
	if WinActivate("ahk_exe OUTLOOK.EXE"){
		;attachment
		Send, {LAlt Down}
		Sleep, 150
		Send, {h}
		Sleep, 150
		Send, {a}
		Sleep, 150
		Send, {f}
		Send, {LAlt Up}
	}
	else{
		SendInput, +^{a}
	}
}
return

$*+!a::
if GetKeyState("RControl","P"){
    SendInput +{Home}
}
else {
    SendInput, +!{a}
}
return

$*s::
if GetKeyState("RControl","P"){
    SendInput {Down}
}
else {
    SendInput, {blind}s
}
return

$*+s::
if GetKeyState("RControl","P"){
    SendInput +{Down}
}
else {
    SendInput, +{s}
}
return

$*^s::
if GetKeyState("RControl","P"){
    SendInput ^{Down}
}
else {
	if WinActivate("ahk_exe chrome.exe"){
		Send, !{left}
	}
	if WinActivate("ahk_exe OUTLOOK.exe"){
		;reply on skype
		Send, {LAlt Down}
		Sleep, 50
		Send, {h}
		Sleep, 50
		Send, {r}
		Sleep, 50
		Send, {i}
		Sleep, 50
		Send, {r}
		Send, {LAlt Up}
	}
	if WinActivate("ahk_exe EXCEL.exe"){
		Send, +^{g}
		Send, !{Down}
		Send, {e}
		Send, {Tab}
		Send, {Space}
	}
	if WinActivate("ahk_exe lync.exe"){
		;share screen
		Send, +^{Space}
	}
	else{
		SendInput, ^{s}
	}
}
return

$*!s::
if GetKeyState("RControl","P"){
    SendInput !{Down}
}
else {
	if WinActivate("ahk_exe code.exe"){
		Send, +!{j}
		Send, {esc}
	}
	if WinActivate("ahk_exe EXCEL.exe"){
		;reply on skype
		Send, {LAlt Down}
		Sleep, 50
		Send, {h}
		Sleep, 50
		Send, {r}
		Sleep, 50
		Send, {i}
		Sleep, 50
		Send, {y}
		Send, {LAlt Up}
	}
	else{
		SendInput, !{s}
	}
}
return

$*+^s::
if GetKeyState("RControl","P"){
    SendInput +^{Down}
}
else {
	if WinActivate("ahk_exe chrome.exe"){
		Send, !{right}
	}
	if WinActivate("ahk_exe code.exe"){
		Send, ^{s}
		Sleep, 100
		Send, !^{u}
		Send, ^{s}
		Send, {esc}
	}
	if WinActivate("ahk_exe EXCEL.exe"){
		Send, ^{s}
	}
	else{
		SendInput, +^{s}
	}
}
return

$*+!s::
if GetKeyState("RControl","P"){
    SendInput +!{Down}
}
else {
    SendInput, +!{s}
}
return

$*d::
if GetKeyState("RControl","P"){
    SendInput {Up}
}
else {
    SendInput, {blind}d
}
return

$*+d::
if GetKeyState("RControl","P"){
    SendInput +{Up}
}
else {
    SendInput, +{d}
}
return

$^d::
if GetKeyState("RControl","P"){
    SendInput ^{Up}
}
else {
	if WinActivate("ahk_exe chrome.exe"){
		Send, ^{l}
		Send, !{enter}
		return
	}
	if WinActivate("ahk_exe EXCEL.exe"){
		Send, !{a}
		Send, {m}
	}
	else{
		SendInput, ^{d}
	}
}
return

$*!d::
if GetKeyState("RControl","P"){
    SendInput !{Up}
}
else {
    SendInput, !{d}
}
return

$*+^d::
if GetKeyState("RControl","P"){
    SendInput +^{Up}
}
else {
    SendInput, +^{d}
}
return

$*+!d::
if GetKeyState("RControl","P"){
    SendInput +!{Up}
}
else {
    SendInput, +!{d}
}
return

$*f::
if GetKeyState("RControl","P"){
    SendInput {Right}
}
else {
    SendInput, {blind}f
}
return

$*+f::
if GetKeyState("RControl","P"){
    SendInput +{Right}
}
else {
	if WinActivate("ahk_exe OUTLOOK.exe"){
		;find
		Send, ^{e}
	}
	if WinActivate("ahk_exe lync.exe"){
		Send, +!^3
	}
	else{
		SendInput, ^{f}
	}
}
return

$^f::
if GetKeyState("RControl","P"){
    SendInput ^{Right}
}
else {
    SendInput, ^{f}
}
return

$*!f::
if GetKeyState("RControl","P"){
    SendInput {End}
}
else {
	if WinActivate("ahk_exe code.exe"){
		Send, !^{i}
		Send, +^{o}
		Send, !{8}
	}
	else{
		SendInput, !{f}
	}
}
return

$*+^f::
if GetKeyState("RControl","P"){
    SendInput +^{Right}
}
else {
	if WinActivate("ahk_exe code.exe"){
		Send, ^{t}
		Send, @:
	}
	if WinActivate("ahk_exe OUTLOOK.exe"){
		;forward
		Send, ^{f}
	}
	else{
		SendInput, +^{f}
	}
}
return

$*+!f::
if GetKeyState("RControl","P"){
    SendInput +{End}
}
else {
    SendInput, +!{f}
}
return


$g::
if GetKeyState(“RControl”,”P,”){
	Send, {LWin}
}
else{
	SendInput, {blind}g
}
return

$h::
if GetKeyState(“RControl”,”P,”){
	Send, #{v}
}
else{
	SendInput, {blind}h
}
return

$j::
if GetKeyState(“RControl”,”P,”){
	Send, ^{,}
}
else{
	SendInput, {blind}j
}
return

$z::
if GetKeyState(“RControl”,”P,”){
	snapper()
}
else{
	SendInput, {blind}z
}
return

$x::
if GetKeyState(“RControl”,”P,”){
	WinMove, A ,, 0, 0 , A_ScreenWidth, A_ScreenHeight
}
else{
	SendInput, {blind}x
}
return

$c::
if GetKeyState(“RControl”,”P,”){
	next_window()
}
else{
	SendInput, {blind}c
}
return

$v::
if GetKeyState(“RControl”,”P,”){
	DllCall("LockWoorkStation")
}
else{
	SendInput, {blind}v
}
retturn


; $b:: - app specific
; $n:: - app specific


$m::
if GetKeyState(“RControl”,”P,”){
	WinMinimizeAll
}
else{
	SendInput, {blind}m
}
return

$,::
if GetKeyState(“RControl”,”P,”){
	DetectHiddenWindows. Off
    SetTitleMatchMode, 2
    WinGet, WindowList, List

    App0 := "Google Chrome"
    App1 := "Studio Code"
    App3 := "Excel"
    App4 := "Outlook"
    App6 := "Symphony"
    App9 := "Snipping Tool"
    Loop, %WindowList%{
        WinGetTitle, Title, % "ahk_id " . WindowList%A_Index%
        IfNotInString, Title, %Ap0%
        IfNotInString, Title, %Ap1%
        IfNotInString, Title, %Ap2%
        IfNotInString, Title, %Ap3%
        IfNotInString, Title, %Ap4%
        IfNotInString, Title, %Ap5%
        IfNotInString, Title, %Ap6%
        {
            WinClose, % "ahk_id " . WindowList%A_Index%
        }
    }
    Send {esc}
}
else{
	SendInput, {blind},
}
return


#ifWinActive ahk_exe chrome.exe
$b::
if GetKeyState(“RControl”,”P,”){
	Send, +^{w}
}
else{
	SendInput, {blind}b
}
return

$n::
if GetKeyState(“RControl”,”P,”){
	Send, ^{n}
}
else{
	SendInput, {blind}n
}
return

+^c::
Send, ^{l}
Send, ^{c}
Send, {tab}
return

!z::
Send, ^{l}
Send, ^{c}
Send, ^{w}
next_window()
Send, ^{t}
Send, ^{v}
Send, ^{enter}
return

^e:: Send /
return

^g::
Send, {Home}
return

+^g::
Send, {End}
return

+^w::
Send, ^{l}
Send, ^{c}
Send, ^{n}
Send, ^{v}
Send, ^{enter}
Sleep, 500
next_window()
Sleep, 100
next_window()
Sleep, 500
Send, !{F4}
Sleep, 100
next_window()
Sleep, 500
snapper_2()
return

+^t::
Send, ^{l}
return

+^n::
Send, ^{l}
Send, ^{c}
Send, ^{n}
Send, ^{v}
Send, {enter}
Sleep, 500
next_window()
Send, ^{w}
Sleep, 500
next_window()
snapper_2()
return

!1::
Run, url
return

+!1::
Send, ^{l}
Clipboard := "url"
Send, ^{v}
Send, {Enter}
return

#ifWinActive ahk_exe Code.exe

$b::
if GetKeyState("RControl","P"){
	Send, +!{q}
	Sleep, 1000
	Send, {tab}
	Send, {enter}
}
else 
	SendInput {blind}b
return

$n::
if GetKeyState("Rcontrol","P"){
	Send, +!{n}
	Sleep, 200
	WinMove, A ,, 0, 0 , A_ScreenWidth, A_ScreenHeight
	Send, ^{p}
}
else
	SendInput {blind}n
return

$+!h::
	if git{
		Send, ^{r}
		git =0
	}
	else{
		Send, !+{h}
		git =1
	}
return

+^w::
Send, +!^{right}
Send, +!^{right}
Send, +!^{right}
Send, +!^{right}
Send, +!^{right}
Send, +!^{right}
Send, +!^{right}
Send, +!^{right}
Send, +!^{right}
Sleep, 150
Send, ^{1}
Sleep, 150
Send, ^{w}
Sleep, 100
Send, ^{w}
Sleep, 100
Send, ^{w}
Sleep, 100
Send, ^{w}
Sleep, 100
Send, ^{w}
Sleep, 100
Send, ^{w}
Sleep, 100
Send, ^{w}
Sleep, 100
Send, ^{w}
Sleep, 100
Send, ^{w}
Sleep, 100
Sleep, ^{t}
Sleep, 750
Send, {enter}
Send, ^{y}
return

+^r::
Send, ^{r}
Send, !{o}
Send, {down 2}
Send, {enter}
Send, !{m}
Send, {enter}
Send, !{i}
Send, {enter}
Send, {down}
return

$^q::
Send, !^{i}
return

+^q::
Send, +!^{g}
return

+!z::
Send, ^{b}
Send, ^{q}
Sleep, 100
Send, +^{m}
Sleep, 100
Send, !^{down}
Send, !{b}
return

$^n::
Send, ^{Enter}
Send, ^{n}
return

+^1::
Send, +!^{left 9}
return

+^2::
Send, +!^{left 9}
Send, +!^{right 1}
return

+^3::
Send, +!^{left 9}
Send, +!^{right 2}
return

+^4::
Send, +!^{left 9}
Send, +!^{right 3}
return

+^5::
Send, +!^{left 9}
Send, +!^{right 4}
return

+^6::
Send, +!^{left 9}
Send, +!^{right 5}
return

+^7::
Send, +!^{left 9}
Send, +!^{right 6}
return

+^8::
Send, +!^{left 9}
Send, +!^{right 7}
return

+^9::
Send, +!^{left 9}
Send, +!^{right 8}
return

+^t::
Send, !^{o}
Send, ^{t}
return

$^Backspace::
Send, ^{Backspace}
return

+^x::
Send, +^{c}
cb := Clipboard
RegExMatch(cb, ".*\\", result)
Clipboard = 
Clipboard := result
return

+!c::
Send, +^{c}
cb := Clipboard
RegExMatch(cb, ".*\\", result)
result2 := RegExReplace(result, "\\", "/")
result5 := RegExReplace(result2, "//", "/)
stringReplace, result3, result5, win_peter , lin_peter, All
Clipboard = 
Clipboard := result3
return

+!x::
Send, +^{x}
cb := Clipboard
RegExMatch(cb, ".*\\", result)
result2 := RegExReplace(result, "\\", "/")
result5 := RegExReplace(result2, "//", "/)
stringReplace, result3, result5, win_peter , lin_peter, All
Clipboard = 
Clipboard := result3
return

#ifWinActive ahk_exe DBArt.EXE

$b::
if GetKeyState("RControl", "P"){
	Send, !{F4}
}

else
	SendInput {blind}b
return

$n::
if GetKeyState("RControl", "P"){
	Send, ^{n}
}

else
	SendInput {blind}n
return

+^e::
Send, {END}
Send, +{Home}
Send, +{Up}
Send, +{Up}
Send, +{Up}
Send, ^{e}
return

^r::
Send, ^{e}
return

#ifWinActive ahk_exe EXCEL.EXE

$b::
if GetKeyState("RControl", "P"){
	Send, !{F4}
}

else
	SendInput {blind}b
return

$n::
if GetKeyState("RControl", "P"){
	Send, ^{n}
}

else
	SendInput {blind}n
return

;table
^t::
Send, ^{t}
Send, {enter}
Send, {Down}
return

^r::
Send, +!{Down}
Send, c
return

+^r::
Send, !{a}
Send, c
return

^1::
Send, +^{T}
return
^2::
Send, +^{Y}
return
^3::
Send, +^{U}
return
^4::
Send, +^{I}
return
^5::
Send, +^{O}
return
^6::
Send, +^{P}
return
^7::
Send, +^{J}
return
^8::
Send, +^{K}
return
^9::
Send, +^{L}
return

#ifWinActive ahk_exe OUTLOOK.exe



$b::
if GetKeyState("RControl", "P"){
	Send, !{F4}
}

else
	SendInput {blind}b
return

$n::
if GetKeyState("RControl", "P"){
	Send, ^{n}
}

else
	SendInput {blind}n
return

;reply all
$^r::
Send, +^{r}
return

;reply
$+^r::
Send, ^{r}
return

^e::^Enter



#ifWinActive ahk_exe lync.exe

$b::
if GetKeyState("RControl", "P"){
	Send, !{F4}
}

else
	SendInput {blind}b
return

$n::
if GetKeyState("RControl", "P"){
	Send, ^{n}
}

else
	SendInput {blind}n
return

^h::
Send, +!^r
Send, ^{3}
Sleep, 500
Send, {Tab 4}
return

^e::
Send, !{q}
return

^b::
Send, #{m}
return

+^b::
Send, #{F4}
return

^w::
Send, {esc}
return

^t::
Send, !{v}
return
