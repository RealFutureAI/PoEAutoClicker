#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.

; #Warn ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#SingleInstance force

; Keyboard shortcuts Matrix
; (hash)                #    Windows logo key
; (exclamation mark)    !    ALT
; (caret)               ^    CTRL
; (plus)                +    Shift

;******************************************************************************
;								PoE Beast release
; Used to Release beasts by ctrl clicking the x to release until you press escape
;******************************************************************************
; https://poe.re/#/beast <- for regexing beasts

!q::  ; Alt+Q to start
toggle := !toggle  
SetTimer, CheckEscape, 50

while toggle {
    Send, {Ctrl down}
    Click              
    Send, {Ctrl up}    

    Random, waitTime, 150, 200 ;wait randomly between 0,15 and 0,2 seconds
    Sleep, waitTime
}
return

CheckEscape:
if GetKeyState("Escape", "P") {
    toggle := false
    SetTimer, CheckEscape, Off
}
return