'旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
'�    FILE: TUTOR3_2.BAS                                                   �
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

	DIM thisWin AS SHARED INTEGER

	APP.GRAPHICSMODE = 1
	APP.GRAPHICSMOUSE = 1

	APPTITLE &HB0, "THE NEXT STEP IN MULTI-THREADING"

	APPINIT

	GottaMouse% = MOUSEINIT(buttons%)
	MOUSECURSORON

	winflags = %SHADOW OR %DRAGBAR OR %CONTROL OR %RESIZE OR %MINMAX

	thisWin% = WINPOPUP(1, 1, 10, 50, &H9F, 1, &H9F, "ThisRoutine() Window", &HCF, winflags)
	thatWin% = WINPOPUP(13, 29, 10, 50, &HF0, 1, &HF1, "ThatRoutine() Window", &HB0, winflags)

	WININSTALLCODE thisWin%, CODESEG(ThisRoutine), CODEPTR(ThisRoutine)
	WININSTALLCODE thatWin%, CODESEG(ThatRoutine), CODEPTR(ThatRoutine)

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

FUNCTION ThatRoutine% (BYVAL handle%, BYVAL eventNo%, BYVAL parm1%, BYVAL parm2%)

	SELECT CASE eventNo

		CASE 200                ' got focus event
			WINWRITE handle, "GOT FOCUS - "

		CASE 201                ' lost focus event
			WINWRITE handle, "LOST FOCUS - "

		CASE 202                ' click event
			WINWRITE handle, "CLICK - "

		CASE 203                ' control box clicked
			eventNo% = 102

		CASE 217                ' window clicked while minimized
			WINNORMALIZE handle

		CASE ELSE

	END SELECT

	WINWRITELN handle%, "Event" + STR$(eventNo%) + " in ThatRoutine()"

	ThatRoutine% = eventNo%         ' return the event code

END FUNCTION

FUNCTION ThisRoutine% (BYVAL handle%, BYVAL eventNo%, BYVAL parm1%, BYVAL parm2%)

' � � 6.2.1 - SOME NEW EVENT CODES 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�

	SELECT CASE eventNo

		CASE 200                ' got focus event
			WINWRITE handle, "GOT FOCUS - "

		CASE 201                ' lost focus event
			WINWRITE handle, "LOST FOCUS - "

		CASE 202                ' click event
			WINWRITE handle, "CLICK - "

		CASE 203                ' control box clicked
			eventNo% = 102

		CASE 217                ' window clicked while minimized
			WINNORMALIZE handle

		CASE ELSE

	END SELECT

	WINWRITELN handle%, "Event" + STR$(eventNo%) + " in ThisRoutine()"

	ThisRoutine% = eventNo%         ' return this event code

END FUNCTION

