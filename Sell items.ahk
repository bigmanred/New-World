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

^1::
    sell(500)
return

^2::
    sell(1000)
return

^3::
    sell(2000)
return

*^q::ExitApp


sell(value)
{
    BlockInput, On
    ; Get the current mouse position
    MouseGetPos, OriginalMouseX, OriginalMouseY

    clickM(itemX, OriginalMouseY, delay)

    clickM(sellX, sellY, delay)

    clickM(unitPriceX, unitPriceY, delay)

    Send, {Ctrl Down}
    sleep, delay/2
    Send, a
    sleep, delay/2
    Send, {Ctrl Up}

    Send {Raw}%value%
    sleep, delay

    clickM(listDurX, listDurY, delay)

    MouseMove, %oneDayX%, %oneDayY%
    sleep, delay
    wiggle(3, delay/3)
    Click
    Sleep, delay

    clickM(confirmX, confirmY, 0)

    ; Return the mouse to its original position
    MouseMove, %OriginalMouseX%, %OriginalMouseY%, 0
    sleep, delay
    wiggle(20, delay/3)

    BlockInput, off
}


clickM(x, y, delay)
{
    MouseMove %x%, %y%
    sleep, 100
    Click
    sleep, %delay%
}


wiggle(amount, delay)
{
    MouseMove, -%amount%, %amount%, 10, R
    Sleep, delay
    MouseMove, %amount%, -%amount%, 10, R
    Sleep, delay
}