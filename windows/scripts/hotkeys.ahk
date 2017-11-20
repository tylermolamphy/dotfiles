^PgUp::
Send {Media_Play_Pause}
sleep 500
Run, C:\tools\nircmd.exe cmdwait 1000 monitor off
return

^#!Backspace::
run, cmd /c shutdown /s /t 2
return

^CtrlBreak::
sleep, 3000
Run C:\Windows\System32\Ribbons.scr /s
return

^+q::
MsgBox, got your back!
Return
