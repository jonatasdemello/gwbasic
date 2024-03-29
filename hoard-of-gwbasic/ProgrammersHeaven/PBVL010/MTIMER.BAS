'旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
'�    FILE: MTIMER.BAS                                                     �
'� PURPOSE: PB/VISION(tm) LITE Example Program                             �
'쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
'� PURPOSE: Demonstrates the "TimerInstallCode()" routine that allows a    �
'�          single user defined function to be called up to 18 times per   �
'�          second, no matter what window is in focus.                     �
'쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
'� For instant help on any PB/VISION(tm) keyword, place the cursor on that �
'� keyword and press <CTRL-F1>.  The PB/VISION(tm) index can be accessed   �
'� by pressing <SHIFT-F1> twice.  The file "PBVLITE.PBH" _must_ be in the  �
'� same directory as the PowerBASIC IDE (PB.EXE) for this feature to work  �
'� properly.                                                               �
'읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�

'       ==================================================
'	BE SURE TO RUN "DEMO.EXE" FOR INFORMATION ON OTHER
'       PowerBASIC 3.0 TOOLS FROM DSE SOFTWARE PUBLISHING.
'       ==================================================

%ISPBU = 0

$INCLUDE ".\WINDOW.BI"
$INCLUDE ".\EVENT.BI"
$INCLUDE ".\MOUSE.BI"

	$STACK 8192

	DEFINT A-Z
	$DYNAMIC

	%timeOut = 1001

	SHARED SH%, A, B, C, D

	MTIMER.INIT	' initialize the demo interface
	MTIMER.RUN	' run the interface
	MTIMER.DONE	' terminate program
	END

SUB MTIMER.INIT

	app.attr = &H87
	app.pattern = 32
	app.GraphicsMouse = 1
	app.GraphicsMode = 1

	APPTITLE &H70, "MTIMER.BAS - DEMO PROGRAM FOR TimerInstallCode( ) ROUTINE"

	APPINIT

	GottaMouse% = MOUSEINIT(buttons%)	' initizlize mouse
	MOUSECURSORON                 		' turn it on

	A = WINPOPUP (3,  5, 10, 40, &H9F, 1, &H9F, "MTIMER.BAS - LOOK AT THE TITLE BAR", &HE0, %DRAGBAR OR %SHADOW)
	B = WINPOPUP (5, 10, 10, 40, &HA7, 1, &HA8, "MTIMER.BAS - LOOK AT THE TITLE BAR", &HCF, %DRAGBAR OR %SHADOW)
	C = WINPOPUP (7, 15, 10, 40, &HF1, 1, &HF1, "MTIMER.BAS - LOOK AT THE TITLE BAR", &H9F, %DRAGBAR OR %SHADOW)
	D = WINPOPUP (9, 20, 10, 40, &HCF, 1, &HCF, "MTIMER.BAS - LOOK AT THE TITLE BAR", &HB0, %DRAGBAR OR %SHADOW)

	TIMERINSTALLCODE CODESEG(MyTimerRoutine), CODEPTR(MyTimerRoutine)

END SUB

SUB MTIMER.RUN

	DO
		eventNo = GetEvent(0)

		SELECT CASE eventNo

			CASE 102
				EXIT SUB

			CASE %timeOut
				WINWRITE D, "%timeOut event, "

		END SELECT

	LOOP

END SUB

SUB MTIMER.DONE
	MOUSECURSOROFF
	APPCLOSE
	END
END SUB

FUNCTION MyTimerRoutine% (BYVAL UpdateOk%) PUBLIC

	' NOTE: If "UpdateOk%" = 0, it is _not_ safe to update the
	'       screen.  Only when "UpdateOk%" = 1 is it safe to
	'       use any routines that will change the display.

	STATIC char%, count%

	INCR count%

	char = char MOD 4 + 1

	COLOR 0, 7: LOCATE 1, 59: PRINT MID$("|/-\", char, 1);

	IF count% = 9 THEN
	       	count% = 0
		MyTimerRoutine% = %timeOut
	END IF

END FUNCTION
