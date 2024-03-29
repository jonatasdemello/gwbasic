10 REM APERTURE ANTENNA CHARACTERISTICS
20 REM "ANTENNA DESIGN USING PERSONAL COMPUTERS"
30 PI=3.14159
40 DEF FNLOG10(X)=.4343*LOG(X)
50 KEY OFF
60 CLS
70 COLOR 1,0
80 PRINT "THIS PROGRAM CALCULATES APERTURE ANTENNA CHARACTERISTICS"
90 PRINT
100 COLOR 4,0
110 PRINT
120 PRINT "APERTURE TYPES AVAILABLE:"
130 PRINT "          1-LINE SOURCE"
140 PRINT "          2-RECTANGULAR APERTURE"
150 PRINT "          3-CIRCULAR APERTURE"
160 PRINT "          4-EXIT PROGRAM"
170 PRINT
180 INPUT "WHICH APERTURE TYPE DO YOU WANT(1,2,3,4)";AP
190 IF AP=1 THEN GOTO 240
200 IF AP=2 THEN GOTO 610
210 IF AP=3 THEN GOTO 960
220 IF AP=4 THEN GOTO 1490
230 GOTO 180
240 REM LINE SOURCE CASE
250 PRINT "LINE SOURCE DISTRIBUTIONS AVAILABLE:"
260 PRINT "          1-UNIFORM"
270 PRINT "          2-TRIANGULAR"
280 PRINT "          3-COSINE"
290 PRINT "          4-COSINE SQUARED"
300 PRINT
310 INPUT "WHICH DISTRIBUTION DO YOU WANT(1,2,3,4)";LS
320 IF LS=1 THEN GOTO 370
330 IF LS=2 THEN GOTO 430
340 IF LS=3 THEN GOTO 490
350 IF LS=4 THEN GOTO 550
360 GOTO 310
370 GOSUB 1210
380 GOSUB 1240
390 HPBW=50.7*XLAM/L
400 SLL=-13.3
410 D=2*L/XLAM
420 GOTO 1310
430 GOSUB 1210
440 GOSUB 1240
450 HPBW=73.30001*XLAM/L
460 SLL=-26.6
470 D=1.5*L/XLAM
480 GOTO 1310
490 GOSUB 1210
500 GOSUB 1240
510  HPBW=68.2*XLAM/L
520 SLL=-23!
530 D=1.62*L/XLAM
540 GOTO 1310
550 GOSUB 1210
560 GOSUB 1240
570 HPBW=82.5*XLAM/L
580 SLL=-31.7
590 D=1.33*L/XLAM
600 GOTO 1310
610 REM RECTANGULAR APERTURE CASE
620 PRINT "RECTANGULAR APERTURE DISTRIBUTIONS AVAILABLE:"
630 PRINT "          1-UNIFORM IN E AND H-PLANES"
640 PRINT "          2-UNIFORM IN E-PLANE, COSINE IN H-PLANE(TE 10 MODE)"
650 PRINT "          3-COSINE IN E AND H-PLANES"
660 PRINT
670 INPUT "WHICH DISTRIBUTION DO YOU WANT(1,2,3)";RD
680 IF RD=1 THEN GOTO 720
690 IF RD=2 THEN GOTO 800
700 IF RD=3 THEN GOTO 880
710 GOTO 670
720 GOSUB 1210
730 GOSUB 1260
740 HPBWE=50.6*XLAM/B
750 HPBWH=50.6*XLAM/A
760 SLLE=-13.3
770 SLLH=-13.3
780 D=4*PI*A*B/(XLAM*XLAM)
790 GOTO 1390
800 GOSUB 1210
810 GOSUB 1260
820 HPBWE=50.6*XLAM/B
830 HPBWH=68.80001*XLAM/A
840 SLLE=-13.3
850 SLLH=-23!
860 D=.81*4*PI*A*B/(XLAM*XLAM)
870 GOTO 1390
880 GOSUB 1210
890 GOSUB 1260
900 HPBWE=68.80001*XLAM/B
910 HPBWH=68.80001*XLAM/A
920 SLLE=-23
930 SLLH=-23
940 D=.656*4*PI*A*B/(XLAM*XLAM)
950 GOTO 1390
960 REM CIRCULAR APERTURE CASE
970 PRINT "CIRCULAR APERTURE DISTRIBUTIONS AVAILABLE:"
980 PRINT "          1-UNIFORM"
990 PRINT "          2-TE 11 WAVEGUIDE MODE"
1000 PRINT
1010 INPUT "WHICH DISTRIBUTION DO YOU WANT(1,2)";CD
1020 IF CD=1 THEN GOTO 1050
1030 IF CD=2 THEN GOTO 1130
1040 GOTO 1010
1050 GOSUB 1210
1060 GOSUB 1290
1070 HPBWE=29.2*XLAM/A
1080 HPBWH=HPBWE
1090 SLLE=-17.6
1100 SLLH=-17.6
1110 D=(2*PI*A/XLAM)^2
1120 GOTO 1390
1130 GOSUB 1210
1140 GOSUB 1290
1150 HPBWE=29.2*XLAM/A
1160 HPBWH=37*XLAM/A
1170 SLLE=-17.6
1180 SLLH=-26.2
1190 D=10.5*PI*(A/XLAM)^2
1200 GOTO 1390
1210 INPUT "WHAT IS THE FREQUENCY(MHz)";FMC
1220 XLAM=300/FMC
1230 RETURN
1240 INPUT "WHAT IS THE LINE SOURCE LENGTH(meters)";L
1250 RETURN
1260 INPUT "WHAT IS THE APERTURE SIZE IN THE E-PLANE(meters)";B
1270 INPUT "WHAT IS THE APERTURE SIZE IN THE H-PLANE(meters)";A
1280 RETURN
1290 INPUT "WHAT IS THE CIRCULAR APERTURE RADIUS(meters)";A
1300 RETURN
1310 REM PRINT OUT LINE SOURCE DATA
1320 DDB=10*FNLOG10(D)
1330 PRINT
1340 COLOR 14,0
1350 PRINT USING "HALF-POWER BEAMWIDTH(degrees)=###.##";HPBW
1360 PRINT USING "SIDELOBE LEVEL(dB)=###.#";SLL
1370 PRINT USING "DIRECTIVITY=###.#, =##.# dB";D,DDB
1380 GOTO 90
1390 REM PRINT OUT APERTURE DATA
1400 DDB=10*FNLOG10(D)
1410 PRINT
1420 COLOR 14,0
1430 PRINT USING "E-PLANE HP BEAMWIDTH(degrees)=###.##";HPBWE
1440 PRINT USING "H-PLANE HP BEAMWIDTH(degrees)=###.##";HPBWH
1450 PRINT USING "E-PLANE SIDELOBE LEVEL(dB)=###.#";SLLE
1460 PRINT USING "H-PLANE SIDELOBE LEVEL(dB)=###.#";SLLH
1470 PRINT USING "DIRECTIVITY=###.#, =##.# dB";D,DDB
1480 GOTO 90
1490 COLOR 7,0
1500 KEY ON
1510 END
