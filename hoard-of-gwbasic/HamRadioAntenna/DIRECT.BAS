10 REM DIRECTIVITY CALCULATION
20 REM "ANTENNA DESIGN USING PERSONAL COMPUTERS"
30 KEY OFF
40 CLS
50 PI=3.141593
60 DEF FNLOG10(X)=.4343*LOG(X)
70 COLOR 1,0
80 PRINT "DIRECTIVITY CALCULATION FOR AN ARBITRARY ANTENNA PATTERN"
90 COLOR 4,0
100 PRINT
110 PRINT "SPECIFY ANTENNA FIELD PATTERN AS A PRODUCT OF AN ARRAY"
120 PRINT "FACTOR AND AN ELEMENT FACTOR."
130 PRINT
140 PRINT "ARRAY FACTOR:"
150 INPUT "ENTER NUMBER OF ELEMENTS, SPACING(WVL), AND PHASING(deg)";N,D,AD
160 PRINT "ELEMENT FACTOR:"
170 PRINT "                  0-ISOTROPIC ELEMENT"
180 PRINT "                  1-SHORT DIPOLE (COLLINEAR)"
190 PRINT "                  2-SHORT DIPOLE (PARALLEL)"
200 PRINT "                  3-HALF-WAVE DIPOLE (COLLINEAR)"
210 PRINT "                  4-HALF-WAVE DIPOLE (PARALLEL)"
220 PRINT "                  5-OTHER"
230 INPUT "SELECT OPTION(0 TO 5)";EOP
240 IF EOP<0 OR EOP>5 THEN GOTO 230
250 INPUT "HOW MANY INTEGRATION POINTS"; M
260 M=2*INT(M/2)
270 F0=0
280 REM DO INTEGRATIONS
290 S=0
300 DTH=PI/M
310 DPH=PI/M
320 FOR I=1 TO M+1
330 TH=DTH*(I-1)
340 W=3+(-1)^I
350 IF I=1 OR I=M+1 THEN W=1
360 FOR J=1 TO 2*M+1
370 PH=DPH*(J-1)
380 V=3+(-1)^J
390 IF J=1 OR J=2*M+1 THEN V=1
400 GOSUB 570
410 FS=F*F
420 IF FS>F0 THEN F0=FS
430 S=S+FS*W*V*SIN(TH)
440 NEXT J
450 NEXT I
460 S=S*DPH*DTH/9
470 DR=4*PI*F0/S
480 DRDB=10*FNLOG10(DR)
490 PRINT
500 COLOR 14,0
510 PRINT USING "THE DIRECTIVITY IS ###.## OR ##.## dB";DR,DRDB
520 PRINT
530 COLOR 4,0
540 INPUT "CONTINUE(Y,N)";IS$
550 IF IS$="N" THEN GOTO 710
560 GOTO 40
570 REM COMPUTE FIELD PATTERN
580 STH=SIN(TH)
590 CTH=COS(TH)
600 EF=STH
610 IF EOP=0 THEN EF=1
620 IF (EOP=3 OR EOP=4) AND STH>.001 THEN EF=COS(.5*PI*CTH)/STH
630 REM NEXT STATEMENT IS FOR USER-DEFINED ELEMENT PATTERN
640 IF EOP=5 THEN EF=1
650 IF EOP=0 OR EOP=2 OR EOP>=4 THEN PSI=2*PI*D*STH*COS(PH)+AD*PI/180
660 IF EOP=1 OR EOP=3 THEN PSI=2*PI*D*CTH+AD*PI/180
670 AF=1
680 IF ABS(PSI)>.001 THEN AF=SIN(N*PSI/2)/(N*SIN(PSI/2))
690 F=AF*EF
700 RETURN
710 COLOR 7,0
720 KEY ON
730 END
