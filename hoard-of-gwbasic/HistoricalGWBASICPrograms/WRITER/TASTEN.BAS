10 DAT$="OUTPUT.TTN"
20 OPEN "O",1,DAT$
30 PRINT#1,"Ausgabe-Datei von TASTEN.BAS"
40 PRINT#1,""
50 KEY OFF
60 B=1:C=0:D=1:E=1
70 CLS
80 GOTO 210
90 ON ERROR GOTO 310
100 A$=INKEY$:IF A$="" THEN 100
110 A=ASC(A$)
120 IF A=8 THEN C=C-2:E=E-2:GOSUB 320:GOTO 190
130 IF A=13 THEN GOSUB 270:GOTO 190
140 IF A=27 THEN GOSUB 290:GOTO 310
150 LOCATE B,C
160 COLOR 15,0,0
170 PRINT CHR$(A)
180 OUTP$=OUTP$+CHR$(A)
190 COLOR 14:LOCATE 24,1:PRINT USING"CHR$(###)                                                        \            \";A;DAT$;
200 LOCATE 25,1:PRINT OUTP$;SPACE$(80-LEN(OUTP$));
210 LOCATE D,E
220 COLOR 31,0,0
230 PRINT CHR$(95);" "
240 C=C+1:IF C>80 THEN C=1:B=B+1:PRINT#1,OUTP$:OUTP$=""
250 E=E+1:IF E>80 THEN E=1:D=D+1
260 GOTO 100
270 LOCATE D,E-1:PRINT " "
280 B=B+1:C=0:D=D+1:E=1
290 PRINT#1,OUTP$:OUTP$=""
300 RETURN
310 COLOR 15:CLS:END
320 OUTP$=LEFT$(OUTP$,(LEN(OUTP$)-1))
330 RETURN
