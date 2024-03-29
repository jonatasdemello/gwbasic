10 CLS
20 KEY OFF
30 '*** LUNAR LANDER EXCURSION MODULE LANDING PROGRAM ***
40 PRINT TAB(25) "Houston calling *Lunar Module*:"
50 BEEP:FOR ZZ=1 TO 800:NEXT ZZ:PRINT
60 PRINT TAB(17) "Automatic landing computer has ";:COLOR 18:PRINT"malfunctioned.":COLOR 2
70 BEEP:FOR ZZ=1 TO 800:NEXT ZZ:PRINT
80 COLOR 1:LOCATE ,15:PRINT "Manual control is necessary if you wish to survive":COLOR 2
90 BEEP:FOR ZZ=1 TO 800:NEXT ZZ:PRINT
100 PRINT"You will be asked to input the fuel/consumtion rate. The more fuel you use, the"
110 PRINT"slower your desent will be.  Fuel is consumed by lbs. per second.  The rate  of"
120 PRINT "consumption you decide on must be between 8 lbs./sec and 200 lbs./sec."
130 FOR ZZ=1 TO 1500:NEXT ZZ:BEEP:PRINT
140 PRINT TAB(20)"Total fuel supply: 16,000 lbs."
150 FOR ZZ=1 TO 800:NEXT ZZ:PRINT:BEEP
160 PRINT TAB(20)"Time to impact moon: 120 sec."
170 FOR ZZ=1 TO 800:NEXT ZZ:PRINT:BEEP
180 PRINT TAB(20)"Total weight of lunar lander: 32,000 lbs."
190 FOR ZZ=1 TO 1000:NEXT ZZ:BEEP:PRINT
200 COLOR 18:PRINT:PRINT:PRINT:PRINT TAB(16)"...Stand by...First radar fix coming up...Mark..."
210 FOR ZZ=1 TO 1200:NEXT ZZ
220 CLS
230 PRINT TAB(27)"COMMENCE LANDING PROCEDURE"
240 COLOR 2:PRINT:PRINT:PRINT
250 PRINT"Input the fuel rate (lbs/sec)"
260 L=0
270 A=120
280 V=1
290 M=32500
300 N=16500
310 G=.001
320 Z=1.8
330 X1=INT(L)
340 X2=INT(A)
350 X3=INT(5280*(A-INT(A)))
360 X4=INT(3600*V)
370 X5=INT(M-N)
380 PRINT USING "     #### Sec    #### Miles   #### Ft.  #### Mph  ##### Lbs of remaining fuel";X1;X2;X3;X4;X5
390 INPUT K
400 PRINT
410 T=10
420 IF K<0 GOTO 470
430 IF K=0 GOTO 490
440 IF K<8 GOTO 470
450 IF K>200 GOTO 470
460 GOTO 490
470 PRINT TAB(16)"Pilot goofed...NASA is having fits...Try again":BEEP
480 GOTO 390
490 IF ((M-N)-.001)<0 GOTO 600
500 IF (T-.001)<0 GOTO 330
510 S=T
520 IF ((N+S*K)-M)<=0 GOTO 540
530 S=(M-N)/K
540 GOSUB 1090
550 IF I<=0 THEN 960
560 IF V<=0 THEN 580
570 IF J<0 THEN 1010
580 GOSUB 900
590 GOTO 490
600 COLOR 18:PRINT"Fuel exhasted at"L"seconds!!":COLOR 2:PRINT:BEEP
610 S=((-1*V)+SQR(V*V+2*A*G))/G
620 V=V+G*S
630 L=L+S
640 PRINT"On the Moon at"L"seconds":PRINT
650 W=3600*V
660 PRINT"Impact velocity of"W"mph":PRINT
670 PRINT"Fuel left:"M-N"lbs"
680 IF W>1 THEN 710
690 PRINT"Perfect landing. You were lucky.":PRINT
700 GOTO 840
710 IF W>10 THEN 740
720 PRINT"Good landing, but it could have been better.":PRINT
730 GOTO 840
740 IF W>25 THEN 770
750 PRINT"Congradulations on a lousy landing. You bent a strut, but that's not critical.":PRINT
760 GOTO 840
770 IF W>60 THEN 820
780 PRINT"Your Lander has been irreparably damaged. Hope you enjoy moon life since you":PRINT
790 PRINT"won't be able to leave.  You have your choice of dying from decompression,":PRINT
800 PRINT"freezing to death, or burning to death, whatever you prefer.":PRINT
810 GOTO 840
820 PRINT"You have crashed. There were no survivors. However, that new crater thats"
830 PRINT INT(.277778*W)"feet deep, will be named in your honor."
840 PRINT
850 PRINT"Do you wish to try again? (Y = yes)"
860 A$=INPUT$(1):IF A$="Y" OR A$="y" GOTO 140
870 IF A$="N" OR A$="n" GOTO 880 ELSE GOTO 860
880 CLS:KEY ON
890 END
900 L=L+S
910 T=T-S
920 M=M-S*K
930 A=I
940 V=J
950 RETURN
960 IF (S-5.000001E-03)<0 THEN 640
970 S=2*A/(V+SQR(V*V+2*A*(G-Z*K/M)))
980 GOSUB 1090
990 GOSUB 900
1000 GOTO 960
1010 W=(1-M*G/(Z*K))/2
1020 S=M*V/(Z*K*(W+SQR(W*W+V/Z)))+.05
1030 GOSUB 1090
1040 IF I<=0 THEN 960
1050 GOSUB 900
1060 IF (-1*J)<=0 THEN 490
1070 IF V<0 THEN 490
1080 GOTO 1010
1090 Q=S*K/M
1100 J=V+G*S+Z*((-1*Q)-(Q^2)/2-(Q^3)/3-(Q^4)/4-(Q^5)/5)
1110 I=A-G*S*S/2-V*S+Z*S*(Q/2+Q^2/6+Q^3/12+Q^4/20+Q^5/30)
1120 RETURN
1130 END
