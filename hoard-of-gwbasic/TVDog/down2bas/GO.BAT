echo off
echo Loading BASIC ... One Moment Please
if exist basica.com goto one
if exist basic.exe goto two
if exist gwbasic.exe goto three
echo 浜様様様様様様様様様様様様様様様様様様様様融
echo �    Unable to Locate BASIC -- Transfer    �
echo �   Copy of BASICA, BASIC, or GWBASIC to   �
echo � This Disk or Sub-Directory and Try Again �
echo 藩様様様様様様様様様様様様様様様様様様様様夕
goto quit 
:one
basica welcome
goto quit
:two
basic welcome
goto quit
:three
gwbasic welcome
:quit
cls
