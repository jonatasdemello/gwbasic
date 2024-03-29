10 '              AGE OF THE UNIVERSE
20 '
30 DEFDBL A-H,J-Z: DEFINT I: SCREEN 9: KEY OFF
40 LOCATE 15,1: PRINT "Hubble constant [ 25 to 150 (km/s)/Mpc ] ";
50 INPUT H0: IF H0<25# OR H0>150# THEN CLS: GOTO 40
60 HT=(3.085678D+19)/(H0*31557600#)
70 LOCATE 17,1: PRINT "Omega zero [ 0 to 5 ]";
80 PRINT SPC(40);: LOCATE 17,23
90 INPUT OZ: PRINT: IF OZ<0# OR OZ>5# THEN GOTO 70
100 IF OZ=0# THEN OS=1#: GOTO 180
110 IF OZ=1# THEN OS=1.5#*SQR(3#): GOTO 180
120 IF OZ<=.5# THEN GM=(1#-OZ+SQR(1#-2#*OZ))/OZ
130 IF OZ<=.5# THEN X=.5#*(GM^(1#/3#)+GM^(-1#/3#))
140 IF OZ>.5# THEN AL=ATN(SQR(2#*OZ-1#)/(1#-OZ))
150 IF AL<0# THEN AL=AL+4#*ATN(1#)
160 IF OZ>.5# THEN X=COS(AL/3#)
170 OS=4#*OZ*X*X*X
180 PRINT USING "Omega lambda < #.########## gives Big Bang"; OS
190 PRINT USING "Omega lambda > #.########## gives no Big Bang"; OS
200 LOCATE 22,1: PRINT "Omega lambda [ -10 to 10 ]";
210 PRINT SPC(40);: LOCATE 22,28: INPUT OL
220 IF OL<-10# OR OL>10# THEN GOTO 200
230 CLS: LOCATE 22,17
240 PRINT " Hubble constant    Omega zero    Omega lambda"
250 LOCATE 23,17: PRINT USING " ### (km/s)/Mpc     ";H0;
260 PRINT USING " ##.####    ###.##########";OZ;OL;
270 LINE (0,5)-(639,260),7,B: TL=-5#: TR=5#
280 LOCATE 1,29: COLOR 15: PRINT " Scale Factor vs. Time "
290 FOR I=1 TO 4: TN=0#: RN=1#: DN=1#
300 COLOR 12: IF I=4 THEN COLOR 9
310 HN=.0025#: IF I=1 OR I=3 THEN HN=-HN
320 T=TN: R=RN: D=DN: DP=DN: TP=TN
330 F=OL*R-OZ/(2#*R*R): K1=HN*F: L1=HN*D
340 T=TN+HN/2#: R=RN+L1/2#: D=DN+K1/2#
350 F=OL*R-OZ/(2#*R*R): K2=HN*F: L2=HN*D
360 T=TN+HN/2#: R=RN+L2/2#: D=DN+K2/2#
370 F=OL*R-OZ/(2#*R*R): K3=HN*F: L3=HN*D
380 T=TN+HN: R=RN+L3: D=DN+K3
390 F=OL*R-OZ/(2#*R*R): K4=HN*F: L4=HN*D
400 TN=TN+HN: RP=RN: DP=DN
410 RN=RN+(L1+2#*L2+2#*L3+L4)/6#
420 DN=DN+(K1+2#*K2+2#*K3+K4)/6#
430 IF RN<0# OR RN>3# OR TN<TL OR TN>TR THEN GOTO 460
440 IF I>2 THEN PSET (640*(TN-TL)/(TR-TL),260-RN*85)
450 GOTO 320
460 IF I=1 THEN TL=TN
470 IF I=2 THEN TR=TN*1.1#
480 IF I=2 THEN XP=640/(1-TR/TL): CIRCLE (XP,175),3,14
490 IF I=2 THEN LINE (XP,260)-(XP,250),15
500 IF I=3 THEN LOCATE 19,XP/16: COLOR 12: PRINT "PAST";
510 IF I=3 AND RN<0# THEN LOCATE 20,1: COLOR 7: PRINT "0";
520 A=XP/8-2: IF ABS(A-32)>30 THEN A=32+30*SGN(A-32)
530 T=TN-HN-RP/DP: IF OZ>0# THEN T=T+RP/(3#*DP)
540 LOCATE 20,A: COLOR 14: AG=ABS(T*HT/10 ^ 9)
550 IF I=3 AND RN<0# THEN PRINT USING "###.# billion years"; AG;
560 IF I=4 THEN LOCATE 19,37+XP/16: COLOR 9: PRINT "FUTURE";
570 NEXT I
580 LOCATE 22,1: END
900 REM  *********************************************
910 REM  THIS PROGRAM COMPUTES THE AGE OF THE UNIVERSE
920 REM  FOR DIFFERENT VALUES OF THE HUBBLE PARAMETER,
930 REM  DENSITY PARAMETER, AND COSMOLOGICAL CONSTANT.
940 REM  FROM SKY & TELESCOPE, JANUARY 1996, PAGE 92.
950 REM  *********************************************
