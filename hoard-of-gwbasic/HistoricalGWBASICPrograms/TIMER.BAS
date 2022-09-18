10 CLS
20 PRINT"Intern-Time >>> ";TIME$
30 PRINT"Intern-Date >>> ";DATE$
40 PRINT
50 INPUT"Date [Day       ] : ",A
60 IF A=0 THEN A=1
70 INPUT"Date [Month     ] : ",B
80 IF B=0 THEN B=1
90 INPUT"Date [Year      ] : ",C
100 PRINT
110 PRINT A;".";B;".";C
120 INPUT"Time [Hour's    ] : ",D
130 INPUT"Time [Minute's  ] : ",E
140 INPUT"Time [Second's  ] : ",F
150 PRINT
160 PRINT D;":";E;":";F
170 INPUT"Timer-Date [Day     ] : ",G
180 IF G=0 THEN G=1
190 IF H=0 THEN H=1
200 INPUT"Timer-Date [Month   ] : ",H
210 INPUT"Timer-Date [Year    ] : ",I
220 PRINT
230 PRINT G;".";H;".";I
240 INPUT"Timer      [Hour's  ] : ",J
250 INPUT"Timer      [Minute's] : ",K
260 INPUT"Timer      [Second's] : ",L
270 A$=INKEY$:IF A$="" THEN 270
280 CLS
290 PRINT"Sind Sie sicher das die Eingaben stimmen [Y/N] ??? "
300 A$=INKEY$:IF A$="" THEN 300
310 IF A$="Y" OR A$="y" THEN 340
320 IF A$="N" OR A$="n" THEN 10
330 GOTO 300
340 CLS
350 F=F+1
360 LOCATE 1,1:PRINT"Intern-Time >>> ";TIME$
370 LOCATE 2,1:PRINT"Intern-Date >>> ";DATE$
380 FOR Z=0 TO 4500:NEXT Z
390 LOCATE 1,1:PRINT"Intern-Time >>> ";TIME$
400 LOCATE 2,1:PRINT"Intern-Date >>> ";DATE$
410 FOR Z=0 TO 4250:NEXT Z
420 LOCATE 1,1:PRINT"Intern-Time >>> ";TIME$
430 LOCATE 2,1:PRINT"Intern-Date >>> ";DATE$
440 FOR Z=0 TO 4000:NEXT Z
450 SOUND 2000,1:SOUND 1000,1
460 IF F=60 THEN SOUND 37,1:F=0:E=E+1
470 IF E=60 THEN SOUND 100,1:E=0:D=D+1
480 IF D=24 THEN SOUND 500,1:D=0:A=A+1
490 IF A=31 THEN SOUND 1000,1:A=1:B=B+1
500 IF B=13 THEN SOUND 1500,1:B=1:C=C+1
510 IF A=G AND B=H AND C=I AND D=J AND E=K AND F=L THEN 600
520 LOCATE 1,1:PRINT"Intern-Time >>> ";TIME$
530 LOCATE 2,1:PRINT"Intern-Date >>> ";DATE$
540 LOCATE 4,1:PRINT"Time        >>> ";D;":";E;":";F;"   "
550 LOCATE 5,1:PRINT"Date        >>> ";A;".";B;".";C;"   "
560 LOCATE 7,1:PRINT"Timer-Time  >>> ";J;":";K;":";L
570 LOCATE 8,1:PRINT"Timer-Date  >>> ";G;".";H;".";I
580 A$=INKEY$:IF A$="" THEN 350
590 END
600 CLS
610 PRINT"Es ist jetzt ";D;":";E;":";F;" Uhr !!!"
620 PRINT"Es ist der   ";A;".";B;".";C;"   !!!"
630 SOUND 37,1:SOUND 100,1:SOUND 1000,1:SOUND 2000,1:SOUND 3000,1
640 A$=INKEY$:IF A$="" THEN 630
650 CLS
660 END
