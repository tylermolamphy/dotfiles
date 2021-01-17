#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
#Include, %A_ScriptDir%\scripts\nonumlock.ahk
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, force
#Include, %A_MyDocuments%\replacements.ahk
#Include, %A_ScriptDir%\scripts\spelling.ahk
#Include, %A_ScriptDir%\scripts\hotkeys.ahk
^!#r::reload