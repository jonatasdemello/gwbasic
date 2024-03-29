10 '***************************************************************************
20 '*                                                                         *
30 '*                            DRAW-IT.BAS                                  *
40 '*                                                                         *
50 '*                     BY ROBERT RELF (70176,403)                          *
60 '*                                                                         *
70 '*                             (C) 1983                                    *
80 '*                                                                         *
90 '***************************************************************************
100 '
110 'THIS IS A PROGRAM FOR DRAWING SCREEN GRAPHICS WITH SIMPLE KEYSTROKES.
120 'REQUIRES BASICA 2.00, COLOR GRAPHICS ADAPTER, ONE DISK DRIVE, COLOR OR
130 'NON-IBM MONOCHROME MONITOR, AND NEC OR PROWRITER DOT MATRIX PRINTER TO
140 'USE BUILT-IN GRAPHICS HARDCOPY SUBROUTINE. (DOS "GRAPHICS" COMMAND MAY
150 'BE USABLE FOR IBM OR EQUIVALENT PRINTER.)
160 '
170 '*************** IMPORTANT! ******************
180 'REMOVE THE APOSTROPHE FROM LINE 210 FOR COLOR MONITOR OR FROM LINE
190 '220 FOR NON-IBM MONOCHROME MONITOR.
200 '
210 COL1=1:COL2=1:COL3=2:COL7=7:COL10=10:COL14=14:COL15=15:P=0
220 'COL1=0:COL2=3:COL3=3:COL7=7:COL10=15:COL14=15:COL15=15:P=1
230 '
235 GOSUB 50000  'SWITCH TO COLOR MONITOR  ** ADDED BY TOM D. HALL **
240 GOSUB 1160      'CAPS LOCK / NUM LOCK ON
250 X%=160:Y%=90:Z%=3:C%=160:D%=90:C=0:DIM K%(14600):L%=1:M%=1:N%=318:P%=180
260 ON ERROR GOTO 2750
270 KEY 15,CHR$(&H40)+CHR$(71)   'DEFINE KEY TRAPS      HOME
280 KEY 16,CHR$(&H40)+CHR$(73)   'PgUp
290 KEY 17,CHR$(&H40)+CHR$(79)   'END
300 KEY 18,CHR$(&H40)+CHR$(81)   'PgDn
310 KEY 19,CHR$(&H40)+CHR$(58)   'CAPS LOCK
320 KEY 20,CHR$(&H40)+CHR$(69)   'NUM LOCK
340 KEY OFF:SCREEN 0,1:COLOR 15,0,0:WIDTH 40:CLS:LOCATE 5,19:PRINT "IBM"
350 LOCATE 7,12,0:PRINT "Personal Computer"
360 COLOR COL10,0:LOCATE 10,5,0:PRINT CHR$(213)+STRING$(31,205)+CHR$(184)
370 LOCATE 11,5,0:PRINT CHR$(179)+"            DRAW-IT            "+CHR$(179)
380 LOCATE 12,5,0:PRINT CHR$(179)+"                               "+CHR$(179)
390 LOCATE 13,5,0:PRINT CHR$(179)+STRING$(31,32)+CHR$(179)
400 LOCATE 14,5,0:PRINT CHR$(179)+"         Version 2.40          "+CHR$(179)
410 LOCATE 15,5,0:PRINT CHR$(212)+STRING$(31,205)+CHR$(190)
420 COLOR 15,0:LOCATE 17,6,0:PRINT "(C) Copyright  Rob Relf  1983"
430 COLOR COL14,0:LOCATE 23,7,0:PRINT "Press space bar to continue"
440 DEF SEG=0: POKE 1050,PEEK(1052):DEF SEG   'CLEAR KEYBOARD BUFFER
450 IF INKEY$=" " THEN ELSE 450
460 SCREEN 0:WIDTH 80:COLOR COL7,COL1,COL1:CLS      'SET SCREEN ATTRIBUTES
470 LOCATE 2,30:PRINT "WELCOME TO DRAW-IT
480 PRINT
490 GOSUB 2240         'PRINT HELP SCREEN
500 PRINT "WHICH DRIVE CONTAINS THIS PROGRAM ? (A,B,C,D,E,F or G)";
510 G$=INKEY$
520 IF G$="A"THEN F$="A:":GOTO 560
530 IF G$="B"THEN F$="B:":GOTO 560
540 IF G$="C"THEN F$="C:":GOTO 560
541 IF G$="D"THEN F$="D:":GOTO 560     ' ** ADDED BY TOM D. HALL **
542 IF G$="E"THEN F$="E:":GOTO 560     '
543 IF G$="F"THEN F$="F:":GOTO 560     '
544 IF G$="G"THEN F$="G:":GOTO 560     '
550 GOTO 510
560 SCREEN 1:COLOR 0,P:CLS:VIEW SCREEN (1,1)-(318,180),,3     'GRAPHICS SCREEN
570 LOCATE 24,1:PRINT "TO SET BACKGROUND COLOR PUSH SPACEBAR";
580 LOCATE 25,1:PRINT "THEN PUSH <ENTER> TO CONTINUE";
590 Q$=INKEY$
600 IF Q$=" "THEN READ Q:IF Q>15 THEN Q=0:RESTORE
610 COLOR Q
620 IF Q$=CHR$(13)THEN 650
630 GOTO 590
640 DATA 1,3,7,8,9,11,13,15,16
650 GOSUB 1100:GOSUB 1090:GOSUB 1190:GOSUB 2920:GOSUB 1790  'PRINT STATUS LINES
655 GOSUB 1520                   'ENABLE KEY TRAPS
660 C$=INKEY$                                      'LOOP AND WAIT FOR KEYSTROKE
670 PSET(X%,Y%),Z%
680 IF C$="L"THEN GOSUB 1180    'LINE
690 IF C$="S"THEN GOSUB 1250    'SAVE SCREEN
700 IF C$="R"THEN GOSUB 1350    'RETRIEVE FILE
710 IF C$="*"THEN GOSUB 1410    'PRINT SCREEN
720 IF C$="X"THEN GOSUB 1510    'ACTIVATE KEYS
730 IF C$="p"THEN GOSUB 1740    'PALETTE
740 IF C$="D"THEN GOSUB 1780    'DRAW
750 IF C$="0"THEN Z%=0:GOSUB 1830       'SET COLOR 0
760 IF C$="1"THEN Z%=1:GOSUB 1830       'SET COLOR 1
770 IF C$="2"THEN Z%=2:GOSUB 1830       'SET COLOR 2
780 IF C$="3"THEN Z%=3:GOSUB 1830       'SET COLOR 3
790 IF C$="P"THEN GOSUB 1920    'PAINT
800 IF C$="A"THEN GOSUB 1960    'ARC
810 IF C$="C"THEN GOSUB 2000    'CIRCLE
820 IF C$="W"THEN GOSUB 2210    'WIPE SCREEN CLEAN
830 IF C$="H"THEN GOSUB 2630    'HELP
840 IF C$="F"THEN GOSUB 2900    'FAST
850 IF C$="I"THEN GOSUB 2970    'INSERT TEXT
860 IF C$="Q"THEN SCREEN 0:WIDTH 80:COLOR COL7,COL0,COL0:CLS:END
870 GOTO 660
880 '** TEST FOR DOT POSITION WITHIN SCREEN **
890 IF Y%>M% THEN Y%=Y%-L%:GOSUB 1050
900 RETURN 660
910 IF X%>M% THEN X%=X%-L%:GOSUB 1050
920 RETURN 660
930 IF X%<N% THEN X%=X%+L%:GOSUB 1050
940 RETURN 660
950 IF Y%<P% THEN Y%=Y%+L%:GOSUB 1050
960 RETURN 660
970 IF X%>M% AND Y%>M% THEN X%=X%-L%:Y%=Y%-L%:GOSUB 1050
980 RETURN 660
990 IF X%<N% AND Y%>M% THEN X%=X%+L%:Y%=Y%-L%:GOSUB 1050
1000 RETURN 660
1010 IF X%>M% AND Y%<P% THEN X%=X%-L%:Y%=Y%+L%:GOSUB 1050
1020 RETURN 660
1030 IF X%<N% AND Y%<P% THEN X%=X%+L%:Y%=Y%+L%:GOSUB 1050
1040 RETURN 660
1050 IF B=1 THEN 1060 ELSE 1070
1060 PSET(C%,D%),Z%:LINE-(X%,Y%),Z%:GOTO 1080
1070 PSET(C%,D%),C:B=0
1080 C=POINT(X%,Y%):C%=X%:D%=Y%
1090 LOCATE 25,3:PRINT X%;:LOCATE 25,10:PRINT Y%;:RETURN
1100 POKE &H4E,COL2     'PRINT GREEN TEXT IN COLOR MODE
1110 LOCATE 24,1:PRINT "           <L>INE  <A>RC  <C>IR  <H>ELP";
1120 GOSUB 1830
1130 LOCATE 25,1:PRINT "X=     Y=      <D>RAW  <F>AST  <P>AINT ";
1140 RETURN
1150 '** CAPS LOCK / NUM LOCK ON **
1160 DEF SEG=0:POKE &H417,192:DEF SEG:RETURN
1170 '** TOGGLE "LINE" FUNCTION **
1180 A=A+1
1190 IF A=1 THEN A%=X%:B%=Y%:LOCATE 24,12:POKE &H4E,2:PRINT "<L>INE  ";
1200 IF A=1 THEN POKE &H4E,COL2:RETURN
1210 IF A=2 THEN LINE(A%,B%)-(X%,Y%),Z%:A=0:LOCATE 24,12:PRINT "<L>INE  ";
1220 RETURN
1230 LOCATE 24,12:PRINT "<L>INE  ";:RETURN
1240 '** SAVE SCREEN TO DISK **
1250 GET(1,1)-(318,180),K%:CLS
1260 LOCATE 5,2:PRINT "  WHAT WILL YOU NAME YOUR DRAWING? ";
1270 LOCATE 6,2:PRINT "TYPE IN A NAME UP TO 8 LETTERS LONG"
1280 LOCATE 7,2:INPUT "AND PRESS <ENTER>",A$
1290 IF A$=""OR  LEN(A$)>8 THEN LOCATE 7,2:PRINT STRING$(38," ");:BEEP:GOTO 1280
1300 GOSUB 2700
1310 B$=F$+A$+".PIC"
1320 DEF SEG=&HB800:BSAVE B$,0,&H4000:DEF SEG
1330 RETURN
1340 '** RETRIEVE SCREEN FROM DISK **
1350 LOCATE 24,1:PRINT STRING$(39," ");:POKE &H4E,COL3
1360 CLS:LOCATE 5,1:FILES F$+"*.PIC"
1370 LOCATE 24,1:INPUT;"ENTER FILENAME TO RECALL";D$:E$=F$+D$+".PIC"
1380 DEF SEG=&HB800:BLOAD E$,0 :DEF SEG
1390 POKE &H4E,COL2:RETURN 650
1400 '** DUMP SCREEN TO NEC OR C.ITOH DOT MATRIX PRINTER **
1410 OPEN "lpt1:" AS #1:WIDTH #1,255:DEF SEG=&HB800
1420 LPRINT CHR$(29)CHR$(30)CHR$(27)"A"STRING$(4,10)CHR$(15)CHR$(27)"E"CHR$(27)"T16"CHR$(27)">";
1430 FOR Y%=79 TO 0 STEP -1
1440 LPRINT CHR$(27);"S";"0552";
1450 FOR X%=Y% TO 7280+Y% STEP 80:PRINT#1,STRING$(3,PEEK(X%))STRING$(3,PEEK(X%+&H2000));:NEXT
1470 LPRINT :NEXT :CLOSE #1 :LPRINT
1480 LPRINT CHR$(27)"A" STRING$(8,10)CHR$(29)CHR$(30)CHR$(27)"<";
1490 DEF SEG:RETURN
1500 '** ENABLE KEY TRAPPING **
1510 DEF SEG=0:POKE 1050,PEEK(1052):DEF SEG    'CLEAR BUFFERS
1520 ON KEY(11)GOSUB 890
1530 KEY(11)ON
1540 ON KEY(12)GOSUB 910
1550 KEY(12)ON
1560 ON KEY(13)GOSUB 930
1570 KEY(13)ON
1580 ON KEY(14)GOSUB 950
1590 KEY(14)ON
1600 ON KEY(15)GOSUB 970
1610 KEY(15)ON
1620 ON KEY(16)GOSUB 990
1630 KEY(16)ON
1640 ON KEY(17)GOSUB 1010
1650 KEY(17)ON
1660 ON KEY(18)GOSUB 1030
1670 KEY(18)ON
1680 ON KEY(19)GOSUB 1160
1690 KEY(19)ON
1700 ON KEY(20)GOSUB 1160
1710 KEY(20)ON
1720 RETURN
1730 '** TOGGLE COLOR PALETTE **
1740 IF P=0 THEN P=1 ELSE P=0
1750 COLOR ,P
1760 RETURN
1770 '** TOGGLE "DRAW" FUNCTION **
1780 IF B=0 THEN B=1 ELSE B=0
1790 IF B=1 THEN LOCATE 25,16:POKE &H4E,2:PRINT "<D>RAW";:POKE &H4E,COL2
1800 IF B<>1 THEN LOCATE 25,16:PRINT "<D>RAW";
1810 RETURN
1820 '** PRINT COLOR ON STATUS LINE **
1830 Z$=STR$(Z%):LOCATE 24,1:PRINT "COLOR 0123";
1840 POKE &H4E,2
1850 IF Z%=0 THEN LOCATE 24,7:PRINT RIGHT$(Z$,1);
1860 IF Z%=1 THEN LOCATE 24,8:PRINT RIGHT$(Z$,1);
1870 IF Z%=2 THEN LOCATE 24,9:PRINT RIGHT$(Z$,1);
1880 IF Z%=3 THEN LOCATE 24,10:PRINT RIGHT$(Z$,1);
1890 POKE &H4E,COL2
1900 RETURN
1910 '** FILL IN SHAPE WITH CURRENT COLOR **
1920 IF Z%=0 THEN W%=1 ELSE W%=0
1930 PSET(X%,Y%),W%:PAINT(X%,Y%),Z%,Z%:C=Z%
1940 RETURN
1950 '** DRAW SPECIFIED ARC OR CIRCLE **
1960 POKE &H4E,COL3:LOCATE 24,1:PRINT STRING$(39," ");
1970 LOCATE 24,1:INPUT;"ENTER STARTING POINT DEGREES    ",S$:I$=S$:GOSUB 2820
1980 LOCATE 24,1:PRINT STRING$(39," ");
1990 LOCATE 24,1:INPUT;"ENTER ENDING POINT DEGREES      ",T$:I$=T$:GOSUB 2820
2000 LOCATE 24,1:PRINT STRING$(39," ");
2010 POKE &H4E,COL3:LOCATE 24,1
2020 INPUT;"ENTER THE DESIRED RADIUS     ",R$:I$=R$:GOSUB 2820
2030 S=VAL(S$):T=VAL(T$):R=VAL(R$)
2040 IF S=0 AND T=0 THEN 2160
2050 B#=2*3.141593
2060 A#=B#/360
2070 S#=(S+90)*A#:T#=(T+90)*A#
2080 IF S#>B# THEN S#=S#-B#
2090 IF T#>B# THEN T#=T#-B#
2100 LOCATE 24,1:PRINT STRING$(39," ");
2110 LOCATE 24,1:PRINT "CONNECT ENDS OF ARC TO CENTER? (Y or N)";:POKE &H4E,COL2
2120 I$=INKEY$
2130 IF I$="Y"THEN S#=-S#:T#=-T#:GOTO 2170
2140 IF I$="N"THEN 2170
2150 GOTO 2120
2160 CIRCLE(X%,Y%),R,Z%:GOTO 2180
2170 CIRCLE(X%,Y%),R,Z%,S#,T#:S$="":T$=""
2180 GOSUB 1100:GOSUB 1090:GOSUB 1190:GOSUB 2920:GOSUB 1790  'RESET STATUS LINE
2190 RETURN
2200 '** CLEAR SCREEN **
2210 SCREEN 0,0,0:CLS:X%=160:Y%=90:Z%=3:C%=160:D%=90:C=0:RETURN 560
2220 '** "HELP" SCREEN **
2230 SCREEN 0:WIDTH 80:COLOR COL7,COL1,COL1:CLS
2240 PRINT "  THIS IS A PROGRAM FOR DRAWING GRAPHICS ON THE SCREEN. ";
2250 PRINT "SELECT THE COLOR THAT
2260 PRINT "YOU WILL DRAW IN BY TYPING 0,1,2 OR 3. ";
2270 PRINT "YOU MAY ALTERNATE BETWEEN ONE OF TWO
2280 PRINT "COLOR PALETTES BY PRESSING SHIFT / P. ";
2290 PRINT "YOU CAN MOVE FREELY ABOUT THE SCREEN BY
2300 PRINT "PRESSING ANY OF THE KEYS ON THE NUMERIC KEYPAD EXCEPT 0 OR 5. ";
2310 PRINT "(IF ANY OF THE
2320 PRINT "KEYS CEASE TO FUNCTION, PRESS X TO RESET THE KEYS). ";
2330 PRINT "TO DRAW A LINE AS YOU MOVE,
2340 PRINT "TYPE D. TO STOP DRAWING, TYPE D AGAIN. ";
2350 PRINT "TO DRAW A LINE THAT CANNOT BE DRAWN WITH
2360 PRINT "THE NUMERIC KEYS, ";
2370 PRINT "MOVE TO YOUR STARTING POINT AND TYPE L, THEN MOVE TO YOUR
2380 PRINT "ENDING POINT AND TYPE L ONCE AGAIN. ";
2390 PRINT "TYPE F FOR THE FAST MODE TO MOVE OR DRAW
2400 PRINT "IN UNITS OF TEN INSTEAD OF ONE. ";
2410 PRINT "( NOTE THAT YOU MUST BE IN THE NORMAL SPEED MODE";
2420 PRINT "TO MOVE OR DRAW TO THE BORDER LINE ). ";
2430 PRINT "TO DRAW A CIRCLE OR AN ARC, MOVE TO THE
2440 PRINT "DESIRED CENTER POINT,";
2450 PRINT "TYPE C OR A, AND ANSWER THE PROMPTS WHICH APPEAR.PARAMETERS";
2460 PRINT "FOR AN ARC ARE 0 TO 360 ";
2470 PRINT "DEGREES WITH 0 AT THE TOP AND GOING COUNTER-CLOCKWISE
2480 PRINT "ON THE SCREEN. ";
2490 PRINT "RESPOND TO PROMPTS WHICH APPEAR ON THE STATUS LINE AND PRESS
2500 PRINT "<ENTER>.YOU MAY PAINT ANY ";
2510 PRINT "AREA WITH COLOR BY TYPING P, PROVIDED THAT THE ENTIRE";
2520 PRINT "AREA IS BORDERED BY THAT ";
2530 PRINT "SAME COLOR. YOU MAY RECALL ANY PREVIOUSLY DRAWN SCREEN";
2540 PRINT "BY TYPING R AND ANSWERING ";
2550 PRINT "THE PROMPT. TYPE Q TO QUIT. TYPE PrtSc TO PRINT A COPY";
2560 PRINT "OF YOUR DRAWING ON THE PRINTER. ";
2570 PRINT "TYPE S TO SAVE YOUR DRAWING TO A DISK FILE.
2580 PRINT "TYPE I TO INSERT TEXT ";
2590 PRINT "INTO THE GRAPHICS SCREEN AT THE CURRENT X/Y COORDINATE.";
2600 PRINT "TYPE W TO WIPE THE SCREEN ";
2610 PRINT "IMAGE AND BEGIN AGAIN. TYPE H FOR HELP (THIS SCREEN).
2620 RETURN
2630 '** SAVE SCREEN IN ARRAY **
2640 GET(1,1)-(318,180),K%
2650 GOSUB 2230
2660 PRINT
2670 PRINT "                PRESS ANY KEY TO RETURN TO DRAWING
2680 N$=INKEY$
2690 IF N$=""THEN 2680
2700 '** REPLACE SCREEN AS BEFORE **
2710 SCREEN 1:COLOR Q,P:CLS:VIEW SCREEN (1,1)-(318,180),,3
2720 PUT(1,1),K%
2730 GOSUB 1100:GOSUB 1090:GOSUB 1190:GOSUB 2920:GOSUB 1790 'PRINT STATUS LINES
2740 RETURN
2750 '** ERROR HANDLING **
2760 BEEP :DEF SEG
2770 LOCATE 24,1:PRINT STRING$(39," ");
2780 POKE &H4E,COL3:LOCATE 24,1:PRINT"ERROR HAS OCCURRED - TRY AGAIN  ";
2790 POKE &H4E,COL2
2800 FOR X=1 TO 2000:NEXT
2810 RESUME 650
2820 '** TEST FOR PROPER INPUT **
2830 IF I$=""THEN ERROR 200
2840 FOR X=1 TO LEN(I$)
2850 X$=MID$(I$,X)
2860 IF ASC(X$)>44 AND ASC(X$)<58 THEN 2870 ELSE K=1
2870 NEXT
2880 IF K=1 THEN K=0:ERROR 200
2890 RETURN
2900 '** TOGGLE "FAST" FUNCTION **
2910 F=F+1
2920 IF F=1 THEN L%=10:M%=11:N%=308:P%=170:LOCATE 25,24
2930 IF F=1 THEN POKE &H4E,2:PRINT "<F>AST  ";:POKE &H4E,COL2:RETURN
2940 IF F=2 THEN L%=1:M%=1:N%=318:P%=180:F=0
2950 LOCATE 25,24:PRINT "<F>AST  ";:RETURN
2960 '**** INSERT TEXT INTO GRAPHICS SCREEN ****
2970 POKE &H4E,Z%
2980 ROW=Y%/8
2990 COL=X%/8+1
3000 LOCATE ROW,COL
3010 INPUT;"",I$
3020 POKE &H4E,COL2
3030 RETURN
49990 REM ---- Switch to Color Monitor   ** ADDED BY TOM D. HALL **
50000 KEY OFF   'turn off 25th line
50010 CLS       'clear screen
50020 LOCATE ,,0 'turn off cursor
50030 DEF SEG =0 'address bios
50040 POKE &H410,(PEEK(&H410) AND &HCF) OR &H10 'change equipment parameter
50050 DEF SEG   'address default memory
50060 SCREEN 1  'set medium resolution graphics
50070 SCREEN 0  'set text mode
50080 WIDTH 80  'set width to 80 characters
50090 WIDTH 40  'set width to 40 characters
50100 LOCATE ,,1,6,7    'turn on cursor
50110 SCREEN 1,0 'set medium resolution graphics and enable color
50120 COLOR 0,0  'set background to black and select palette 0
50130 RETURN
