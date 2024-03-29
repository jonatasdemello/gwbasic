10 '**************************************************************
20 '*****                RHUMBLINE NAVIGATION                *****
30 '*****                  Version 06-08-82                  *****
40 '*****                    E.Weissberger                   *****
50 '**************************************************************
60 CLS:KEY OFF:LOCATE 1,20
70 PRINT "RHUMBLINE NAVIGATION PROGRAM"
80 LOCATE 2,25: PRINT "E. WEISSBERGER"
90 COLOR 0,7,0
100 PRINT " No guarantee is given for the accuracy of values returned by this "
110 PRINT "        program.  Use of this program is at the user's risk.       "
120 COLOR 7,0,0
130 PRINT
140 PRINT "THE FOLLOWING RESTRICTIONS APPLY:"
150 PRINT "    1. No course may pass through the north or south pole"
160 PRINT "    2. The course may not go due ease or due west across the"
170 PRINT "       180 degree meridian (International Date Line)
180 PRINT "    3. Distance errors occur as the course approaches 90 or 270 degrees"
190 PRINT "    4. Accuracy deteriorates for very short distances"
200 PRINT :PRINT "Coordinates will be entered as DEGREE.MIN"
210 PRINT "SECONDS should be converted to decimal MIN and concatinated with MIN"
220 PRINT: PRINT "enter WEST variation as a positive number"
230 PRINT "enter EAST variation as a negative number"
240 PRINT: PRINT "The average variation between initial and final points is used."
250 PRINT "   This is not strictly accurate for large variation changes."
260 LOCATE 22,5: COLOR 16,1,0
270 PRINT "for SOUTH longitude or EAST latitude use NEGATIVE value"
280 COLOR 7
290 LOCATE 24,50
300 PRINT "type any key to continue";
310 A$ = INKEY$: IF A$ = "" THEN 310
320 B$(1) = "LATITUDE": B$(2) = "LONGITUDE"
330 C$(1) = "INITIAL": C$(2) = "FINAL"
340 PI = 3.1415926#: CONVER = 180#/PI          '***** degrees per radian
350 CLS
360 FOR X = 1 TO 2
370 PRINT "The COORDINATES of the "C$(X)" point are "
380 FOR Y = 1 TO 2
390 PRINT B$(Y)
400 INPUT "     DEGREES.MIN ",D(X,Y)           '***** see note at beginning
410 D1(X,Y) = INT(ABS(D(X,Y)))
420 IF D(X,Y) < 0 THEN GOTO 430 ELSE GOTO 440
430 D1(X,Y) = -D1(X,Y)
440 M1(X,Y) = (D(X,Y) - D1(X,Y))*100
450 DMIN1(X,Y) = M1(X,Y)/60#                   '***** convert to decimal degrees
460 L(X,Y) = (D1(X,Y) + DMIN1(X,Y))/CONVER     '***** total decimal radians
470 NEXT Y
480 NEXT X
490 LONGDIF = L(1,2) - L(2,2)                  '***** in radians
500 FACTL2 = LOG(TAN(PI/4# + L(2,1)/2#))
510 FACTL1 = LOG(TAN(PI/4# + L(1,1)/2#))
520 ALPHA = LONGDIF/2#
530 SIALPHA = SIN(ALPHA)
540 NORMALPHA = ATN(SIALPHA/SQR(1-SIALPHA*SIALPHA))
550 Y = 2#*NORMALPHA
560 X = FACTL2 - FACTL1
570 C = ATN(Y/X)
580 IF X > 0 THEN 610 ELSE
590 IF X < 0 THEN 600 ELSE
600 C = PI - ABS(C): GOTO 620
610 C = ABS(C)
620 C1 = C*CONVER
630 NORM = SIN(LONGDIF)
640 NORMLONG = ATN(NORM/SQR(1-NORM*NORM))
650 IF NORMLONG < 0# THEN GOTO 660 ELSE GOTO 670
660 C1 = 360# - C1
670 CLS: BEEP: BEEP
680 PRINT "Determine the magnetic course based on average variation (Y/N)? ";
690 A$ = INKEY$: IF A$ = "" THEN 690
700 IF A$ = "Y" OR A$ = "y" THEN 710 ELSE 760
710 PRINT: PRINT "Use a negative value for EAST variation "
720 INPUT "What is the initial point variation? ",VI
730 INPUT "What is the final   point variation? ",VF
740 VAVER = (VI + VF)/2
750 CM = C1 + VAVER
760 CLS: PRINT: PRINT USING "The true course is ###.# degrees";C1
770 COC = COS(C)
780 IF COC = 0# THEN GOTO 790 ELSE GOTO 820
790 FACTLONG1 = 60#*LONGDIF*CONVER
800 DIST = ABS(COS(L(2,1))*FACTLONG1)
810 GOTO 850
820 DISTFACT = 60#/COC
830 LATDIF = L(2,1) - L(1,1)
840 DIST = ABS(LATDIF*DISTFACT*CONVER)
850 PRINT USING "The distance is  #####.# nautical miles";DIST
860 IF A$ = "Y" OR A$ = "y" THEN GOTO 870 ELSE GOTO 900
870 COLOR 0,7,0
880 PRINT USING " The magnetic course is ###.# degrees ";CM
890 COLOR 7,0,0
900 PRINT: PRINT "Will you run again (Y/N)? "
910 A$ = INKEY$: IF A$ = "" THEN 910 ELSE IF A$ = "Y" OR A$ = "y" THEN 350
920 KEY ON: END
