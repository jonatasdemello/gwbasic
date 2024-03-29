'旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
'�    FILE: TUTOR1_2.BAS                                                   �
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

	APPINIT

' � � 1.2.1 to 1.2.6 - OPENING A NEW WINDOW 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�

	AuntEdna = WINOPEN(10, 40, &H10, 1, &H1F, "AUNT EDNA'S HOUSE", &HE0, %SHADOW)

' � � 1.2.7 - DISPLAYING AN OPEN WINDOW 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�

	WINSHOW AuntEdna, 0, 0, 25, 80

' � � 1.2.8 - ANOTHER WAY OF OPENING AND DISPLAYING A WINDOW 컴컴컴컴컴컴컴

	UncleBob = WINPOPUP(15, 40, 5, 30, &H47, 1, &H4F, "UNCLE BOB'S HOUSE", &HF0, %SHADOW)

' � � 1.2.9 - PRINTING TEXT IN A WINDOW 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�

	WINPRINT AuntEdna, 5, 10, &H1E, "Hello Aunt Edna"
	WINPRINT UncleBob, 2, 2, -1, "Yo! Uncle Bob"

	WHILE INKEY$ = "": WEND

' � � 1.2.10 - CLOSING A WINDOW 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�

	WINCLOSE AuntEdna
	WINCLOSE UncleBob

	APPCLOSE

	END

