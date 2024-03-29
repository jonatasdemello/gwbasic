'旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
'�    FILE: TUTOR1_1.BAS                                                   �
'� PURPOSE: PB/VISION(tm) LITE Tutorial Example Program                    �
'쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
'� For instant help on any PB/VISION(tm) keyword, place the cursor on that �
'� keyword and press <CTRL-F1>.  The PB/VISION(tm) index can be accessed   �
'� by pressing <SHIFT-F1> twice.  The file "PBVLITE.PBH" _must_ be in the  �
'� same directory as the PowerBASIC IDE (PB.EXE) for this feature to work  �
'� properly.                                                               �
'읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�

' � � 1.1.1 - TELLING POWERBASIC THAT THIS IS A PROGRAM, NOT A UNIT 컴컴컴

	%ISPBU = 0                      ' This means it is a program, not a .PBU

' � � 1.1.2 - MAKING OUR PROGRAMS WORK A WHOLE LOT FASTER 컴컴컴컴컴컴컴컴

	DEFINT A-Z                      ' Use high-speed integer variables
	$DYNAMIC                        ' Use dynamic memory allocation

' � � 1.1.3 - INCLUDING THE ROUTINE DEFINITIONS 컴컴컴컴컴컴컴컴컴컴컴컴컴

	$INCLUDE ".\WINDOW.BI"          ' Every program requires this line

' � � 1.1.4 - TURNING ON PB/VISION 컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�

	APPINIT                                 ' Initialize PB/VISION desktop

	LOCATE 12, 30:  PRINT "Hello, World!"   ' just say "hi"

	WHILE INKEY$ = "": WEND                 ' Poll the keyboard

' � � 1.1.5 - TURNING OFF PB/VISION컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�

	APPCLOSE                        ' Close PB/VISION and remove desktop

	END

