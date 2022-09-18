@Echo Off
CD \Desktop
QBasic /run PreStart.Bas

:A
If Exist DeskShel.Bat goto B
CLS
Echo Goodbye!!
goto C

:B
Call DeskShel.Bat
Del DeskShel.Bat
Call Return.Bat
Goto A

:C
Echo.
