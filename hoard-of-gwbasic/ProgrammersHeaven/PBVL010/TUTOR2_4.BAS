'旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
'�    FILE: TUTOR2_4.BAS                                                   �
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
$INCLUDE ".\MOUSE.BI"                           ' mouse programs require this

	%cmQuit = 1001                          ' add a "quit" event

	APP.GRAPHICSMODE = 1                    ' adds graphical mapping
	APP.ATTR = &H9F                         ' sets desktop color
	APP.PATTERN = 250                       ' sets desktop fill pattern

' � � 2.4.1 - SELECTING THE MOUSE CURSOR STYLE 컴컴컴컴컴컴컴컴컴컴컴컴컴�

	APP.GRAPHICSMOUSE = 1

	APPTITLE &HF0, "TUTOR2_4.BAS - RODENT CONTROLLED WINDOWS"

	APPINIT

' � � 2.4.2 - MAKING PROGRAMS MOUSE AWARE 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴

	gottaRodent = MOUSEINIT(buttons)        ' initialize the critter
	MOUSECURSORON                           ' show the mouse cursor

' � � 2.4.3 - MAKING WINDOWS MOUSE AWARE 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�

	flags = %SHADOW OR %DRAGBAR OR %RESIZE

	AuntEdna = WINOPEN(10, 45, &H1B, 1, &H1F, "AUNT EDNA'S RODENT CONTROLED WINDOW", &HE0, flags)
	UncleBob = WINPOPUP(2, 4, 10, 45, &H4A, 1, &H4F, "UNCLE BOB'S RODENT CONTROLED WINDOW", &HB0, flags)
	CousinWillie = WINPOPUP(10, 30, 10, 45, &H7E, 1, &H7F, "COUSIN WILLIE'S WINDOW", &HA0, flags)

	WINSHOW AuntEdna, 0, 0, 25, 80

	HOTKEYADD &H2D00, %cmQuit               ' <ALT-X> event

	DO
		EventID = GETEVENT(0)

		SELECT CASE EventID

			CASE 17                 ' "No Event" event

			CASE 102, %cmQuit       ' <ESC> or <ALT-X>
				EXIT DO

' � � 2.4.4 - RESPONDING TO USE EVENTS 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴

			CASE 202
				WINWRITELN WINGET, "I'm on top of the world. (event #202)"

			CASE 206                ' "move" event
				WINWRITELN WINGET, "Hey, you really move me. (event #206)"

			CASE 207                ' "resize" event
				WINWRITELN WINGET, "I'm not as big as I used to be. (event #207)"

			CASE ELSE               ' Other events

		END SELECT


	LOOP

	WINCLOSE AuntEdna

	APPCLOSE

	END


