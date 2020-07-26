^PrintScreen:: ; pause spotify and lock workstation
Send {Media_Play_Pause}
return
^Home:: ; pause spotify and lock workstation
Send {Media_Prev}
return
^End:: ; pause spotify and lock workstation
Send {Media_Next}
return

^#!Backspace:: ; shut down at the end of the day
run, cmd /c shutdown /s /t 2
return

^CtrlBreak:: ; just start screensaver
sleep, 3000
Run C:\Windows\System32\Ribbons.scr /s
return

^+q:: ; don't quit chrome or firefox on Control Shift Q
MsgBox, got your back!
Return

^d:: ; remote desktop from clipboard contents
clipboard := clipboard
Run, C:\Windows\System32\mstsc.exe /v %clipboard%
Return

^+d::
Send, {LCtrl down}d{LCtrl Up}
return

::tstamp:: ; insert timestamp
FormatTime, CurrentDateTime,, yyyy-MM-dd@HH:mm:ss
SendInput %CurrentDateTime%
return

::dstamp:: ; insert timestamp
FormatTime, CurrentDateTime,, yyyy-MM-dd
SendInput %CurrentDateTime%
return