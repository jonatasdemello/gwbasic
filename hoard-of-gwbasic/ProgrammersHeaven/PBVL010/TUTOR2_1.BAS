'旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
'�    FILE: TUTOR2_1.BAS                                                   �
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

' � � 2.1.1 - INCLUDING THE "EVENT DRIVER" ROUTINES 컴컴컴컴컴컴컴컴컴컴컴�

$INCLUDE "EVENT.BI"

	APP.GRAPHICSMODE = 1                    ' adds graphical mapping
	APP.ATTR = &H80                         ' sets desktop color
	APP.PATTERN = 32                        ' sets desktop fill pattern

	APPTITLE &HF0, "TUTOR2_1.BAS - AN EVENT-DRIVEN PROGRAM"

	APPINIT

	AuntEdna = WINOPEN(10, 40, &H47, 1, &H4F, "AUNT EDNA'S - PRESS <ESC> TO END", &HE0, %SHADOW)
	WINSHOW AuntEdna, 0, 0, 25, 80

	WINPRINT AuntEdna, 5, 13, &H4F, "Hello Aunt Edna"

	DO      ' entering the "event loop

' � � 2.1.2 - CALLING "GETEVENT() 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴

		EventID = GETEVENT(0)

		SELECT CASE EventID

			CASE 17                 ' "No Event" event
				WINWRITE AuntEdna, "waiting...  "

			CASE 102                ' <ESC> key event
				EXIT DO

			CASE ELSE               ' Other events

		END SELECT

	LOOP

' � � LEAVING THE "EVENT LOOP" 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴

	WINCLOSE AuntEdna

	APPCLOSE

	END

