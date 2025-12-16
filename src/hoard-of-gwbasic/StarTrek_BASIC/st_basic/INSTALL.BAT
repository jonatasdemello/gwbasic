ECHO OFF
CLS
ECHO STAR TREK GAME INSTALLATION PROGRAM. LAST MODIFIED:10/95
ECHO WORKING...WAIT!!!
IF "%1"=="/I" GOTO :CHECK_FOR_OPTION
IF "%1"=="/i" GOTO :CHECK_FOR_OPTION
CLS
TYPE INSTALL.TXT
GOTO :END

:CONFIRM

IF NOT EXIST 007.COM GOTO :ERROR
IF NOT EXIST 001.BAS GOTO :ERROR
CLS
ECHO.
ECHO This program will now create & copy STARTREK game
IF NOT "%X%"=="" ECHO files to %X% 
ECHO Is this correct?
ECHO.
ECHO         [1]  --  This is INCORRECT. Do not copy files at this time!
ECHO         [2]  --  That is correct. Please PROCEED with the installation.
ECHO.

:KEYCHECK
007.COM
IF ERRORLEVEL 3 GOTO :KEYCHECK
IF ERRORLEVEL 2 GOTO :INSTALL
IF ERRORLEVEL 1 GOTO :ABORT
GOTO :KEYCHECK

:INSTALL
CLS
ECHO STAR TREK INSTALLATION PROGRAM
ECHO.
ECHO WARNING: If an error should occur during installation,
ECHO             use the CTRL C key sequence or BREAK to end program.
ECHO             INSTALL.BAT will not know IF any error has occurred.
ECHO.
IF NOT EXIST 001.BAS GOTO :ERROR
GOTO :CONT_INSTALL

:ERROR
ECHO.
ECHO INSTALL could not locate proper files. Please be sure
ECHO that disks are in the right drives when using INSTALL.BAT
GOTO :ABORT

:CURRENT_DRIVE
ECHO.
ECHO INSTALL has been aborted. Did not specify TARGET drive and/or directory.
GOTO :end

:CHECK_FOR_OPTION
IF "%2"=="/X" GOTO :NO_ST_DIR
IF "%2"=="/x" GOTO :NO_ST_DIR

set x=%2\STARTREK
GOTO :CONFIRM

:NO_ST_DIR

IF "%3"=="" GOTO :CURRENT_DRIVE
set x=%3
GOTO :CONFIRM

:CONT_INSTALL
 

ECHO Making directory (if any) entitled %x%
md %x%
ECHO Making subdirectory (if any) as %x%
md %x%
ECHO Copying files from disk to %x%
GOTO :COPY_PROCESS

:COPY_PROCESS
echo on
copy startrek.* %x%
copy basic.* %x%
copy 0??.* %x%
copy install.* %x%
copy record.* %x%
copy gwbasic.exe %x%
echo off
cls

ECHO Installation complete. To play game, goto %x% 
ECHO and type STARTREK at DOS prompt to begin game.
ECHO.
GOTO :END

:ABORT
CLS
ECHO Installation program has been ABORTED!
goto :END

:END
