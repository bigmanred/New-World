#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#IfWinActive New World

global itemX := 662
global itemY := 347

global sellX := 984
global sellY := 463

global unitPriceX := 996
global unitPriceY := 384

global listDurX := 854
global listDurY := 669

global oneDayX := 867
global oneDayY := 714

global confirmX := 1120
global confirmY := 929

global delay := 300

^!1::
    sell(500)
return

^!2::
    sell(1000)
return

^!3::
    sell(2000)
return



sell(value)
{
    BlockInput, On
    ; Get the current mouse position
    MouseGetPos, OriginalMouseX, OriginalMouseY

    Click, %itemX%, %OriginalMouseY%
    sleep, delay

    Click, %sellX%, %sellY%
    sleep, delay

    Click, %unitPriceX%, %unitPriceY%
    sleep, delay
    Click
    sleep, delay
    Send, {Ctrl Down}
    sleep, delay
    Send, a
    sleep, delay
    Send, {Ctrl Up}
    sleep, delay

    Send {Raw}%value%
    sleep, delay

    MouseMove, %listDurX%, %listDurY%
    sleep, delay
    Click
    sleep, delay * 2
    MouseMove, %oneDayX%, %oneDayY%
    sleep, delay
    MouseMove, -3, 3, 25, R
    Sleep, delay/2
    MouseMove, 3, -3, 25, R
    Sleep, delay/2
    Click
    Sleep, delay * 2

    MouseMove, %confirmX%, %confirmY%
    sleep, delay
    Click

    ; Return the mouse to its original position
    MouseMove, %OriginalMouseX%, %OriginalMouseY%, 0
    BlockInput, off
}