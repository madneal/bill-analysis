
#c::
IfWinNotExist ahk_class Chrome_WidgetWin_1
{
    Run Chrome
    Run www.google.com
    WinActivate
}
Else IfWinNotActive ahk_class Chrome_WidgetWin_1
{
    Run www.google.com
    WinActivate
}
Else
{
    WinMinimize
}
Return
