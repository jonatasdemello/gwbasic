'旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
'�    FILE: TUTOR3_1.BAS                                                   �
'� PURPOSE: PB/VISION(tm) LITE Tutorial Example Program                    �
'쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
'� For instant help on any PB/VISION(tm) keyword, place the cursor on that �
'� keyword and press <CTRL-F1>.  The PB/VISION(tm) index can be accessed   �
'� by pressing <SHIFT-F1> twice.  The file "PBVLITE.PBH" _must_ be in the  �
'� same directory as the PowerBASIC IDE (PB.EXE) for this feature to work  �
'� properly.                                                               �
'읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�

%ISPBU = 0

DEFINT A-Z
$DYNAMIC

$INCLUDE ".\WINDOW.BI"
$INCLUDE ".\EVENT.BI"
$INCLUDE ".\MOUSE.BI"

	APP.GRAPHICSMODE = 1
	APP.GRAPHICSMOUSE = 1

	APPTITLE &HB0, "AN INTRODUCTION TO MULTI-THREADING"

	APPINIT

	GottaMouse% = MOUSEINIT(buttons%)
	MOUSECURSORON

	winflags = %SHADOW OR %DRAGBAR OR %CONTROL OR %RESIZE OR %MINMAX

	win1% = WINPOPUP(0, 0, 10, 50, &H9F, 1, &H9F, "YourRoutine() Window", &HCF, winflags)


' � � 6.1.1 - ASSIGNING CODE TO A WINDOW 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�

	WININSTALLCODE win1%, CODESEG(YourRoutine), CODEPTR(YourRoutine)

	DO

		eventNo = GETEVENT(0)

		SELECT CASE eventNo

			CASE 102
				EXIT DO

			CASE ELSE

		END SELECT

	LOOP

	MOUSECURSOROFF
	APPCLOSE

	END


' � � 6.1.2 - SYNTAX OF A WINDOW ROUTINE 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴

FUNCTION YourRoutine% (BYVAL handle%, BYVAL eventNo%, BYVAL parm1%, BYVAL parm2%)

' � � 6.1.3 - PROCESSING EVENTS IN A WINDOW ROUTINE 컴컴컴컴컴컴컴컴컴컴�

	SELECT CASE eventNo

		CASE 203                ' control box clicked
			eventNo% = 102

		CASE 217                ' window clicked while minimized
			WINNORMALIZE handle

		CASE ELSE

	END SELECT

	WINWRITELN handle%, "Event" + STR$(eventNo%) + " in YourRoutine()"

' � � 6.1.4 - RETURNING THE EVENT CODE BACK TO GETEVENT() 컴컴컴컴컴컴컴컴

	YourRoutine% = eventNo%         ' return this event code

END FUNCTION

