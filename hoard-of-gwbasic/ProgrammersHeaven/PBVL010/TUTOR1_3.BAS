'旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
'�    FILE: TUTOR1_3.BAS                                                   �
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

' � � 1.3.1 - DO YOU WANT TEXT OR GRAPHICS? 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�

	APP.GRAPHICSMODE = 1                    ' adds graphical mapping

' � � 1.3.2 - CHANGING DESKTOP COLORS 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�

	APP.ATTR = &H9F                         ' sets desktop color
	APP.PATTERN = 32                        ' sets desktop fill pattern

' � � 1.3.3 - ADDING A "TITLE BAR" TO THE DESKTOP 컴컴컴컴컴컴컴컴컴컴컴컴�

	APPTITLE &HF0, "TUTOR1_3.BAS - ANOTHER FUN-FILLED PB/VISION TUTORIAL"

	APPINIT

	Edna = WINOPEN(10, 40, &H10, 1, &H1F, "AUNT EDNA'S HOUSE", &HE0, %SHADOW)

	WINSHOW Edna, 0, 0, 25, 80

	UncleBob = WINPOPUP(15, 40, 5, 30, &H47, 1, &H4F, "UNCLE BOB'S HOUSE", &HF0, %SHADOW)

	WINPRINT Edna, 5, 0, &H1E, "Hello Aunt Edna"
	WINPRINT UncleBob, 2, 0, -1, "Yo! Uncle Bob"

	WHILE INKEY$ = "": WEND

	WINCLOSE Edna
	WINCLOSE UncleBob

	APPCLOSE

	END

