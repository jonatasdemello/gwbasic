10  ' factor18.bas - FreeWare 2004
20 GOTO 80 ' begin
30 SAVE"factor18.bas":LIST-80
40 GOTO 630 ' get key
50 GOTO 660 ' beep and clear line
60 GOTO 670 ' clear line
70 ' begin
80 CLS:KEY OFF:DEFEXT F,N                        ' powerbasic
90 DEFSTR Q:Q=MKI$(0):L=300:DIM FA(L),EX(L)
100 PRINT "18 Digits  Double Precision Factors"
110 PRINT "      and Divisors Calculator."
120 PRINT "         by Eric F. Tchong"
130 PRINT "    for POWERBASIC systems only":PRINT
140 PRINT "Save data in ascii diskfile <y/n> ?"
150 GOSUB 40:CLS
160 IF ASC(Q)=89 OR ASC(Q)=121 THEN COPY=1:GOTO 170 ELSE COPY=0:GOTO 200
170 LINE INPUT "Enter a DOS filename ? ";Z$
180 IF LEFT$(Z$,1)=" " THEN Z$=MID$(Z$,2):GOTO 180 ' remove space(s)
190 OPEN "O",#1,Z$:CLS
200 INPUT "Enter a positive integer <=0 exit";N:IF N=0 OR N<0 THEN 690
210 TL=0:T=0
220 IF N>10^18 THEN GOSUB 50:GOTO 200 ELSE GOSUB 60
230 A$=STR$(N,18):B$="":C$=""
240 ' assemble number with spacing       123456789
250 FOR E=LEN(A$) TO 1 STEP -1
260  B$=B$+MID$(A$,E,1)                ' 987654321
270 NEXT
280 FOR E=LEN(A$) TO 1 STEP -1
290  IF E/3=INT(E/3) THEN C$=C$+" "
300  C$=C$+MID$(B$,E,1)                ' ..123 456 789
310 NEXT
320 IF LEFT$(C$,1)=" " THEN C$=MID$(C$,2):GOTO 320 ' remove space(s)
330 ' Store factors in FA(T)           ' 123 456 789
340 F=1
350 F=F+1
360 IF F>3 THEN F=F+1
370 IF F*F>N THEN F=N:GOTO 390
380 IF N/F<>INT(N/F) THEN 350
390 IF F>TL THEN TL=F:T=T+1:E=0:FA(T)=F
400 ' Store exponents in EX(T)
410 E=E+1:EX(T)=E:N=N/F:IF N=1 THEN 440
420 GOTO 340	
430 ' Send results to screen & ascii file
440 F$="":F$=C$+" ="
450 FOR K=1 TO T
460  F$=F$+STR$(FA(K)):EC=LEN(F$)
470  IF EX(K)=1 THEN 510
480  PRINT TAB(EC) EX(K);
490  IF COPY THEN PRINT #1,TAB(EC) EX(K);
500  IF K=T THEN 520 ELSE F$=F$+"  *":GOTO 520
510  IF K=T THEN 520 ELSE F$=F$+" *"
520 NEXT
530 PRINT:PRINT F$:IF COPY THEN PRINT #1,"":PRINT #1,F$
540 ' calculate divisors
550 DV=1:D$=""
560 FOR K=1 TO T
570  DV=DV*(EX(K)+1)       ' multiply exponents + 1
580 NEXT:D$=STR$(DV):D$=D$+" divisors"
590 IF LEFT$(D$,1)=" " THEN D$=MID$(D$,2):GOTO 590 ' remove space(s)
600 PRINT D$:IF COPY THEN PRINT #1,D$
610 PRINT:GOTO 200
620 ' get key
630 LSET Q=MKI$(0)
640 WHILE CVI(Q)=0:MID$(Q,1)=INKEY$:WEND:RETURN
650 ' Clear line
660 BEEP
670 PRINT CHR$(30);:PRINT STRING$(79,32):PRINT CHR$(30);:RETURN
680 ' exit program
690 IF COPY THEN CLOSE #1
700 KEY 5,"factor18.bas":KEY 6,CHR$(34)+",a":CLS:KEY ON
