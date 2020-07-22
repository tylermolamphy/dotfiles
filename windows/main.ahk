#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, force
#Include, %A_ScriptDir%\scripts\spelling.ahk
;#Include, %A_ScriptDir%\scripts\altdrag.ahk
#Include, %A_ScriptDir%\scripts\hotkeys.ahk
#Include, %A_ScriptDir%\scripts\sublimetext.ahk
^!#r::reload