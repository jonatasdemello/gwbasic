7 REM ððð L ð A ð U ð F ð S ð C ð H ð R ð I ð F ð T ððð
8 REM                                  von Markus Birth
9 REM
10 SAVE"LAUF2.BAK"
20 SCREEN 0,0,0
30 WIDTH 80
40 KEY OFF
50 CLS
60 COLOR 14:PRINT"ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»"
70 COLOR 14:PRINT"º ððððððððððððððððððððð L A U F S C H R I F T ððððððððððððððððð ³ von RoboCop º"
80 COLOR 14:PRINT"ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¼"
90 PRINT
100 COLOR 15
110 PRINT"Als Zeile k”nnen Sie bis zu 2 Zeilen Text eingeben!"
120 PRINT"Nach jeder Anzeige einer Zeile wird eine leere Zeile ausgegeben."
130 PRINT"Sie k”nnen alle Zeichen auáer: ";CHR$(44);CHR$(59);" und ";CHR$(34);" eingeben."
140 PRINT"Wenn Sie ein nichtprintbares Zeichen eingeben, erscheint :"
150 PRINT CHR$(34);"Neue Eingabe?";CHR$(34);" und Sie drfen den Text nochmal eingeben."
160 LOCATE 23,1
170 PRINT"                                 *** Taste ***"
180 A$=INKEY$:IF A$="" THEN GOTO 180
190 CLS
200 COLOR 15
210 INPUT"Zeilen : ",A
220 DIM Z$(A),C(A)
230 PRINT
240 B=1
250 PRINT"Zeile (" B ") :";:INPUT "",Z$(B)
260 IF Z$(B)="" THEN A=B-1:GOTO 320
270 PRINT"Farbe (" B ") :";:INPUT "",C(B)
280 PRINT
290 B=B+1
300 IF B>A THEN GOTO 320
310 GOTO 250
320 INPUT"Pause         :",P
330 PRINT
340 PRINT"[1-80]"
350 INPUT"Zeilenl„nge   :",ZL
360 PRINT
370 PRINT"[J/N]"
380 INPUT"Wiederholen   :",W$
390 PRINT
400 PRINT"[J/N]"
410 INPUT"Gr”áenautom.  :",GA$
420 IF GA$="j" OR GA$="J" AND ZL<41 THEN WIDTH 40
430 CLS
440 B=1
450 ZC$(B)=SPACE$(ZL-1) + Z$(B) + " "
460 B=B+1
470 IF B>A THEN GOTO 490
480 GOTO 450
490 REM Hauptroutine
500 X=1
510 B=1
520 CLS
530 IF B>A THEN 630
540 COLOR C(B)
550 TX$=ZC$(B)
560 T$=MID$(TX$,X,ZL)
570 LOCATE 1,1
580 PRINT T$;
590 X=X+1
600 IF X>LEN(TX$) THEN B=B+1:X=1:GOTO 530
610 FOR M=0 TO P:NEXT M
620 GOTO 550
630 IF W$="j" OR W$="J" THEN X=1:B=1:GOTO 530
640 COLOR 15
650 END
