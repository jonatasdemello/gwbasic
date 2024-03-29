100 REM   COMPUTING LUNAR HEIGHTS
110 REM
120 INPUT "HALF-HEIGHT CHORD (MM) ";L1
130 INPUT "SEGMENT ";L2
140 PRINT
150 PRINT "USE VALUES IN DEGREES"
160 PRINT
170 INPUT "EARTH SEL. LONG. ";LE
180 INPUT "EARTH SEL. LAT. ";BE
190 INPUT "SUN SEL. COLONG. ";CS
200 INPUT "SUN SEL. LAT. ";BS
210 REM CONVERT DEGREES TO RADIANS
220 DR = 3.14159/180
230 LS = 90-CS
240 IF LS<O THEN LS=450-CS
250 BE = BE*DR:  LE = LE*DR
260 BS = BS*DR:  LS = LS*DR
270 CS = CS*DR
280 RM = 1080
290 EM = 23900
300 SM = 93000000
310 PRINT
320 PRINT "ENTER FEATURE DATA"
330 INPUT "  SEL. LONGITUDE ";LO
340 INPUT "  SEL. LATITUDE ";BO
350 INPUT "  SHADOW (MM) ";MQ
360 BO = BO*DR
370 I1 = SIN(BE)*SIN(BO)
380 I2 = SIN(BE)*SIN(BS)
390 I3 = SIN(BS)*SIN(BO)
400 I4 = COS(BE)*COS(BO)
410 I5 = COS(BE)*COS(BS)
420 I6 = COS(BS)*COS(BO)
430 EI = I1+I4*COS(LO-LE)
440 ER = I2+I5*COS(LE-LS)
450 SI = I3+I6*COS(LO-LS)
460 RX = L1/SIN(2*ATN(L1/L2))
470 MR = MQ/RX
480 I7 = RM*RM:  I8 = EM*EM
490 I9 = SM*SM
500 XE = SQR(I7+I8-2*RM*EM*EI)
510 ES = SQR(I8+I9-2*EM*SM*ER)
520 XS = SQR(I7+I9-2*RM*SM*SI)
530 S = (XE+ES+XS)/2
540 P = S*(S-ES)*(S-XE)*(S-XS)
550 P = (2/(XE*XS))*SQR(P)
560 SH = I3+I6*SIN(CS+LO)
570 M1 = (MR*SH/P)-1
580 M2 = (MR*SH/P)*((MR/P)-2*SH)
590 H = (M1+SQR(M1*M1-M2))*RM
600 H = H*5280:  H = INT(H)
610 PRINT "HEIGHT = ";H;" FEET"
620 PRINT:  PRINT "DO ANOTHER "
630 PRINT "FROM SAME PHOTO";
640 INPUT " (Y/N) ";YN$
650 IF YN$="Y" THEN GOTO 310
660 END
670 REM ***********************************
680 REM APPEARED IN ASTRONOMICAL COMPUTING
690 REM SKY & TELESCOPE, JANUARY 1985 ISSUE
700 REM ***********************************