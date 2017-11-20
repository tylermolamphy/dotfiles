^PgUp:: ; pause spotify and lock workstation
Send {Media_Play_Pause}
sleep 500
Run, C:\tools\nircmd.exe cmdwait 1000 monitor off
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

::tstamp:: ; insert timestamp
FormatTime, CurrentDateTime,, yyMMdd-hhmmss
SendInput %CurrentDateTime%
return

::dstamp:: ; insert timestamp
FormatTime, CurrentDateTime,, yyMMdd
SendInput %CurrentDateTime%
return