10 WIDTH "LPT1:",255:DIM CHAR$(64):DIM N1(64):DIM N2(64)
20 PRINT:PRINT:PRINT "CODE 39 PRINTING PROGRAM."
30 PRINT "EPSON FX-80 OR OKIDATA MICROLINE 182?  (E or O)  ";:LINE INPUT PRN$
40 REM-----GET THE INFO FOR THIS BARCODE SYMBOL-----
50 PRINT
60 PRINT "ENTER THE NUMBERS AND/OR CHARACTERS WANTED ON THIS BARCODE SYMBOL."
70 PRINT "VALID 3 OF 9 CHARACTERS INCLUDE -   A-Z, 1-9, AND - . $ / + %"
80 PRINT "(OR HIT ESCAPE KEY TO EXIT PROGRAM)  --->  ";
90 LINE INPUT SYMBOL$
100 IF SYMBOL$=CHR$(27) THEN END
110 BAR$="*"+SYMBOL$+"*"
120 PRINT "MEDIUM OR LOW DENSITY (M or L)?  ";:LINE INPUT DENSITY$
130 INPUT "HOW MANY LABELS";NUMLAB
140 GOSUB 170
150 GOTO 60
160 REM-----FILL THE CHAR$ ARRAY-----
170 PRINT "FORMING BAR CODE SYMBOL - PLEASE WAIT..."
180 FOR LOOP=1 TO 64:CHAR$(LOOP)="":N1(LOOP)=0:N2(LOOP)=0:NEXT LOOP
190 LIN$="":FOR CHARLOOP=1 TO LEN(BAR$)
200 CHARACTER$=MID$(BAR$,CHARLOOP,1)
210 RESTORE
220 READ TABLE$:IF TABLE$="ERROR" THEN PRINT:PRINT"ERROR":END
230 IF TABLE$=CHARACTER$ THEN GOSUB 590:GOTO 250
240 FOR BITLOOP=1 TO 9:READ BIT:NEXT BITLOOP:GOTO 220
250 CHAR$(CHARLOOP)=SYM$
260 NEXT CHARLOOP
270 REM-----FILL THE N1 AND N2 ARRAYS-----
280 FOR CHARLOOP=1 TO LEN(BAR$)
290 N2(CHARLOOP)=INT(LEN(CHAR$(CHARLOOP))/256):N1(CHARLOOP)=LEN(CHAR$(CHARLOOP))
300 IF N1(CHARLOOP)>=256 THEN N1(CHARLOOP)=N1(CHARLOOP)-256:GOTO 300
310 IF N1(CHARLOOP)>127 AND N1(CHARLOOP)<256 THEN CHAR$(CHARLOOP)=CHAR$(CHARLOOP)+CHR$(0):GOTO 290
320 NEXT CHARLOOP
330 REM-----PRINT THE BARCODE IN BARS-----
340 PRINT "PRINTING LABELS ..."
350 FOR LABELLOOP=1 TO NUMLAB
360 IF DENSITY$="L" THEN WW=12 ELSE WW=8
370 FOR WID=1 TO WW
380 FOR CHARLOOP=1 TO LEN(BAR$):LPRINT CHR$(27)+"L"+CHR$(N1(CHARLOOP))+CHR$(N2(CHARLOOP))+CHAR$(CHARLOOP);:NEXT CHARLOOP
390 IF PRN$="O" THEN LPRINT CHR$(27)+"3"+CHR$(10):REM 10/216" LF & CR
400 IF PRN$="E" THEN LPRINT CHR$(27)+"J"+CHR$(10):REM 10/216" LF & CR
410 NEXT WID
420 IF PRN$="O" THEN LPRINT CHR$(20):LPRINT:LPRINT
430 REM
440 REM-----PRINT THE BARCODE IN TEXT-----
450 FOR TEXTLOOP=1 TO LEN(BAR$)
460 TEXT$=MID$(BAR$,TEXTLOOP,1)
470 IF PRN$="O" THEN LPRINT CHR$(18)+CHR$(14)+CHR$(27)+CHR$(69);:REM 10 CPI PLUS DOUBLE WIDTH PLUS EMPHASIZED
480 IF PRN$="E" THEN LPRINT CHR$(27)+"!"+CHR$(40);:REM SINGLE STRIKE EMPH. EXPAND. PICA
490 IF DENSITY$="M" THEN LPRINT TEXT$+CHR$(27)+"L"+CHR$(5)+CHR$(0)+CHR$(0)+CHR$(0)+CHR$(0)+CHR$(0)+CHR$(0);
500 IF DENSITY$="L" THEN LPRINT TEXT$+"   "+CHR$(27)+"L"+CHR$(9)+CHR$(0)+CHR$(0)+CHR$(0)+CHR$(0)+CHR$(0)+CHR$(0)+CHR$(0)+CHR$(0)+CHR$(0)+CHR$(0);
510 NEXT TEXTLOOP
520 LPRINT:LPRINT:LPRINT:LPRINT
530 IF PRN$="O" THEN LPRINT:LPRINT:LPRINT
540 NEXT LABELLOOP
550 REM
560 RETURN
570 REM -----------------------------------------------------------------------
580 REM -----FORM A CHARACTER'S SYMBOL-----
590 SYM$="":IF DENSITY$="L" THEN 620
600 GOSUB 650:GOSUB 700:GOSUB 650:GOSUB 700:GOSUB 650:GOSUB 700
610 GOSUB 650:GOSUB 700:GOSUB 650:GOSUB 750:RETURN
620 GOSUB 790:GOSUB 840:GOSUB 790:GOSUB 840:GOSUB 790:GOSUB 840
630 GOSUB 790:GOSUB 840:GOSUB 790:GOSUB 890:RETURN
640 REM ------ADD A MEDIUM DENSITY BAR BIT------
650 READ BIT
660 IF BIT=0 THEN SYM$=SYM$+CHR$(255)
670 IF BIT=1 THEN SYM$=SYM$+CHR$(255)+CHR$(255)+CHR$(255)+CHR$(255)
680 RETURN
690 REM -----ADD A MEDIUM DENSITY SPACE BIT-----
700 READ BIT
710 IF BIT=0 THEN SYM$=SYM$+CHR$(0)+CHR$(0)+CHR$(0)
720 IF BIT=1 THEN SYM$=SYM$+CHR$(0)+CHR$(0)+CHR$(0)+CHR$(0)+CHR$(0)
730 RETURN
740 REM --------ADD A MEDIUM DENSITY GAP--------
750 SYM$=SYM$+CHR$(0)+CHR$(0)+CHR$(0)+CHR$(0)
760 RETURN
770 REM -------------------------------------
780 REM ------ADD A LOW DENSITY BAR BIT------
790 READ BIT
800 IF BIT=0 THEN SYM$=SYM$+CHR$(255)+CHR$(255)+CHR$(255)+CHR$(255)+CHR$(255)
810 IF BIT=1 THEN SYM$=SYM$+CHR$(255)+CHR$(255)+CHR$(255)+CHR$(255)+CHR$(255)+CHR$(255)+CHR$(255)+CHR$(255)+CHR$(255)+CHR$(255)+CHR$(255)+CHR$(255)+CHR$(255)
820 RETURN
830 REM -----ADD A LOW DENSITY SPACE BIT-----
840 READ BIT
850 IF BIT=0 THEN SYM$=SYM$+CHR$(0)+CHR$(0)+CHR$(0)+CHR$(0)+CHR$(0)+CHR$(0)+CHR$(0)+CHR$(0)
860 IF BIT=1 THEN SYM$=SYM$+CHR$(0)+CHR$(0)+CHR$(0)+CHR$(0)+CHR$(0)+CHR$(0)+CHR$(0)+CHR$(0)+CHR$(0)+CHR$(0)+CHR$(0)+CHR$(0)+CHR$(0)+CHR$(0)+CHR$(0)
870 RETURN
880 REM --------ADD A  LOW DENSITY GAP--------
890 SYM$=SYM$+CHR$(0)+CHR$(0)+CHR$(0)+CHR$(0)+CHR$(0)+CHR$(0)+CHR$(0)+CHR$(0)+CHR$(0)+CHR$(0)+CHR$(0)+CHR$(0)+CHR$(0)+CHR$(0)+CHR$(0)+CHR$(0)
900 RETURN
910 REM ----BIT TABLE-----
920 DATA "1",1,0,0,1,0,0,0,0,1
930 DATA "2",0,0,1,1,0,0,0,0,1
940 DATA "3",1,0,1,1,0,0,0,0,0
950 DATA "4",0,0,0,1,1,0,0,0,1
960 DATA "5",1,0,0,1,1,0,0,0,0
970 DATA "6",0,0,1,1,1,0,0,0,0
980 DATA "7",0,0,0,1,0,0,1,0,1
990 DATA "8",1,0,0,1,0,0,1,0,0
1000 DATA "9",0,0,1,1,0,0,1,0,0
1010 DATA "0",0,0,0,1,1,0,1,0,0
1020 DATA "A",1,0,0,0,0,1,0,0,1
1030 DATA "B",0,0,1,0,0,1,0,0,1
1040 DATA "C",1,0,1,0,0,1,0,0,0
1050 DATA "D",0,0,0,0,1,1,0,0,1
1060 DATA "E",1,0,0,0,1,1,0,0,0
1070 DATA "F",0,0,1,0,1,1,0,0,0
1080 DATA "G",0,0,0,0,0,1,1,0,1
1090 DATA "H",1,0,0,0,0,1,1,0,0
1100 DATA "I",0,0,1,0,0,1,1,0,0
1110 DATA "J",0,0,0,0,1,1,1,0,0
1120 DATA "K",1,0,0,0,0,0,0,1,1
1130 DATA "L",0,0,1,0,0,0,0,1,1
1140 DATA "M",1,0,1,0,0,0,0,1,0
1150 DATA "N",0,0,0,0,1,0,0,1,1
1160 DATA "O",1,0,0,0,1,0,0,1,0
1170 DATA "P",0,0,1,0,1,0,0,1,0
1180 DATA "Q",0,0,0,0,0,0,1,1,1
1190 DATA "R",1,0,0,0,0,0,1,1,0
1200 DATA "S",0,0,1,0,0,0,1,1,0
1210 DATA "T",0,0,0,0,1,0,1,1,0
1220 DATA "U",1,1,0,0,0,0,0,0,1
1230 DATA "V",0,1,1,0,0,0,0,0,1
1240 DATA "W",1,1,1,0,0,0,0,0,0
1250 DATA "X",0,1,0,0,1,0,0,0,1
1260 DATA "Y",1,1,0,0,1,0,0,0,0
1270 DATA "Z",0,1,1,0,1,0,0,0,0
1280 DATA "-",0,1,0,0,0,0,1,0,1
1290 DATA ".",1,1,0,0,0,0,1,0,0
1300 DATA " ",0,1,1,0,0,0,1,0,0
1310 DATA "*",0,1,0,0,1,0,1,0,0
1320 DATA "$",0,1,0,1,0,1,0,0,0
1330 DATA "/",0,1,0,1,0,0,0,1,0
1340 DATA "+",0,1,0,0,0,1,0,1,0
1350 DATA "%",0,0,0,1,0,1,0,1,0
1360 DATA "ERROR"

