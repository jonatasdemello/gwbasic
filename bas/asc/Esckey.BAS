5 CLS:SCREEN 0,0,0:WIDTH 80:CLEAR:FOR I=1 TO 10:KEY I,"":NEXT:KEY 2,"GOTO 60"+CHR$(13):KEY 10,"RUN"+CHR$(34)+"BLUEMENU"+CHR$(34)+CHR$(13):KEY OFF:LIST 10-57
13 '*****************  ESCAPE KEY RESPONSE SUBROUTINE  ************************
19 '浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
22 '� This will establish 'ESC' key as a 'CONTINUE' inkey response.  To use,  �
25 '� delete lines 05-45, renumber to fit your program, save with the 'A'     �
28 '� option and then merge in your program. Go to the subroutine with        �
31 '� a 'GOSUB' if you intend to use the procedure more than once.            �
34 '� If you do not want the F-KEY line ON, delete 'KEY-ON' from line 140.    �
37 '� If you want the prompt 'TO CONTINUE, PRESS ESC KEY' higher on screen.   �
40 '� Change the LOCATE 25 in the appropriate program lines.                  �
41 '�                 (c) G I N A C O  -1983                 Ver 5.1/160/320  �
44 '藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
55 '        *****  < F2 > to RUN  *******  < F10 > For BLUEMENU  *****
57 ' ====== To avoid DOCUMENTATION BOX each time, REM or DELETE  line 5 ======
60 CLS:SCREEN 0,0,0:WIDTH 80:CLEAR:FOR I=1 TO 10:KEY I,"":NEXT
100 '****** ESCAPE KEY RESPONSE SUBROUTINE FOLLOWS ***************************
105 KEY OFF: LOCATE 25,1:PRINT SPC(79):LOCATE 25,27:COLOR 3,0:PRINT"TO CONTINUE, PRESS ESC KEY";:COLOR 7,0
120 ESC$=INPUT$(1):IF ASC(ESC$) <> 27 THEN 125 ELSE 140
125 SOUND 500,4:GOTO 130
130 LOCATE 25,1:PRINT SPC(79):GOTO 105
140 LOCATE 25,1:PRINT SPC(79):KEY ON: REM DELETE IF YOU DO NOT WANT KEY ON
150 CLS:LOCATE 10,35:PRINT"YOU GOT IT RIGHT ":RETURN
160 END
65000 '************************** SAVE ROUITINE ******************************
65100 SAVE"B:ESCKEY.BAS"
