5 CLS:KEY OFF:SCREEN 0,0,0:WIDTH 80:CLEAR:FOR I=1 TO 10:KEY I,"":NEXT:KEY 2,"GOTO 60"+CHR$(13):KEY 10,"RUN"+CHR$(34)+"BLUEMENU"+CHR$(34)+CHR$(13):LIST 12-57
12 '*****************   COLOR DISPLAY PROGRAM AID  ****************************
16 '浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
18 '�                  COLOR STATEMENTS FOR PROGRAMMING                       �
20 '�                                                                         �
22 '�    This program will display -- with an appropriate pause -- the full   �
24 '� array of colors for the IBM PC, along with the number used in the color �
26 '� program statement.  The program will then continue to show the color -- �
28 '� again with a display delay and number identification -- the spectrum of �
30 '� colors on a full screen, SCREEN 1, WIDTH 40.  The color/graphics board  �
32 '� and a color monitor are required to utilize this program adequately.    �
36 '�               (c) G   I   N   A   C   O  -- 1983          Ver 5.2/320   �
50 '藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
55 '        *****  < F2 > to RUN  *******  < F10 > For BLUEMENU  *****
57 ' ====== To avoid DOCUMENTATION BOX each time, REM or DELETE  line 5 ======
60 CLS:SCREEN 0,0,0:WIDTH 80:CLEAR:FOR I=1 TO 10:KEY I,"":NEXT
100 REM ===== COLOR PROGRAMMING PALLETTE =====
130 FOR I = 1 TO 31:COLOR I:PRINT"THIS IS COLOR"; I ;" DISPLAY";:NEXT
140 LOCATE 24,30:PRINT"<PRESS> ENTER TO CONTINUE";
150 GOSUB 600
160 REM ===== WIDE SCREEN DISPLAY ELSE 150 =====
200 CLS:WIDTH 40
210 FOR I=1 TO 31:COLOR I:PRINT"COLOR DISPLAY ";I;:NEXT
240 LOCATE 24,9:PRINT"<PRESS> ENTER TO TERMINATE";
250 GOSUB 600
260 COLOR 7,0:WIDTH 80:END
600 IN$=INKEY$:IF IN$="" THEN 600
610 IF IN$=CHR$(13)THEN RETURN
620 END
65000 REM ===== SAVE ROUTINE =====
65100 SAVE"B:COLORSEE.CLR"
