5 CLS:KEY OFF:SCREEN 0,0,0:WIDTH 80:CLEAR:FOR I=1 TO 10:KEY I,"":NEXT:KEY 2,"GOTO 60"+CHR$(13):KEY 10,"RUN"+CHR$(34)+"BLUEMENU"+CHR$(34)+CHR$(13):LIST 10-57
10 '***************** HEX TO DEC/DEC TO HEX CONVERTER *************************
15 '浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
17 '�                    CONVERT HEX TO DEC & VICE VERSA                      �
19 '�                                                                         �
21 '�    This simple program can be used effectively to convert hexadecimal   �
23 '� numbers to decimal and decimal to hexadecimal. This is of value when    �
25 '� working with some poke-peek values or converting some CHR$(&Hnn) to     �
27 '� decimal values, such as when zapping disk sectors.                      �
29 '�                                                                         �
31 '�    At the prompt, enter the decimal number as "20" w/o quotes and the   �
33 '� HEX$ value will be displayed.  Enter a HEX number as "&H234" also w/o   �
35 '� quotes and both the decimal and HEX$ will be displayed.                 �
37 '�                                                                         �
39 '�    This program is based on the program in the IBM (c) BASIC MANUAL     �
41 '� under HEX$.  (c) G I N A C O   - 1983                 Ver 5.1/160/320   �
43 '藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
55 '        *****  < F2 > to RUN  *******  < F10 > For BLUEMENU  *****
57 ' ====== To avoid DOCUMENTATION BOX each time, REM or DELETE  line 5 ======
60 CLEAR:FOR I=1 TO 10:KEY I,"":NEXT
100 CLS
110 SCREEN 0,0,0
120 WIDTH 80
130 COLOR 7,0
140 KEY OFF
150 LOCATE 2,4
160 PRINT "�"
170 LOCATE 2,5
180 PRINT STRING$(71,"�")
190 LOCATE 2,76
200 PRINT "�";
210 FOR I! = 3 TO 22
220   LOCATE I!,4
230   PRINT "�"
240   LOCATE I!,76
250   PRINT "�"
260 NEXT
270 LOCATE 23,4
280 PRINT "�"
290 LOCATE 23,5
300 PRINT STRING$(71,"�")
310 LOCATE 23,76
320 PRINT "�";
330 FOR I! = 3 TO 19 STEP 2
340   LOCATE 3,8,0,0,7
350   PRINT SPC( 50)
360   LOCATE 3,25
370   INPUT "DEC # OR &HXXX #  ";X!
380   A$ = HEX$(X!)
390   LOCATE I! + 2,24
400   PRINT X!"DECIMAL IS "A$"  HEX "
410 NEXT
420 FOR I! = 3 TO 22
430   LOCATE I!,10
440   PRINT SPC( 60)
450 NEXT
460 GOTO 330
65000 REM************************** SAVE ROUTINE *****************************
65100 SAVE "B:HEXSAY.BAS"
