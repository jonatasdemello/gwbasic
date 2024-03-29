10  ' frmigamr.bas - FreeWare 2005 from Aruba
20 GOTO 170 ' begin
30 SAVE"frmigamr",A:LIST-170      
40 GOTO 1090 ' locate converter
50 GOTO 1110 ' blank from print to 
60 GOTO 1130 ' blank O
70 GOTO 1170 ' print O
80 GOTO 1220 ' get key
90 GOTO 1260 ' get from & to
100 GOTO 1360 ' illegal move
110 GOTO 1440 ' computer wins
120 GOTO 1520 ' human wins
130 GOTO 1600 ' delay
140 GOTO 1640 ' convert 47 - 57 --> 0 - 10
150 GOTO 1760 ' check for legal human move HM=1
160 ' begin
170 CLS:SCREEN 0:KEY OFF:COLOR 15,0:RANDOMIZE TIMER
180 PRINT "   T H E   F R E N C H   M I L I T A R Y   G A M E"
190 PRINT "     GWBASIC by Eric F. Tchong - February 5, 2005 ":PRINT
200 PRINT "   The game is played against the computer with the"
210 PRINT "   two players alternating turns. You control the 3"
220 PRINT "   red pieces while the computer controls the green"
230 PRINT "            piece. You always go first.":PRINT
240 PRINT " Move along a line to an adjacent cell. Computer's"
250 PRINT "green piece can move in any direction, while your red"
260 PRINT "pieces cannot go in a backward (downward) direction."
270 PRINT "          To move, press keys 0 to 9 or /":PRINT
280 PRINT "  You win the game by trapping the computer where it"
290 PRINT "   cannot move. The computer wins by reaching the"
300 PRINT "       very bottom, where it cannot be caught.":PRINT
310 PRINT "          <Esc> exits the game immediately.":PRINT
320 PRINT "         Press any key to start the game..."
330 DIM P(10),T(10):DEFSTR M,Q:Q=MKI$(0):DIM M(24) ' locals
340 M(1) ="             �         �":M(2)=M(1)
350 M(3) ="     �������Ĵ         �������Ŀ"
360 M(4) ="     �       �    /    �       �"
370 M(5) ="     �       �����������       �"
380 M(6)= "���������Ŀ  ���������Ŀ  ���������Ŀ"
390 M(7)= "�         �  �         �  �         �"
400 M(8)= "�         ��Ĵ         ��Ĵ         �":M(13)=M(8)
410 M(9)= "�    7    �Ŀ�    8    ��Ĵ    9    �":M(18)=M(8)
420 M(10)="����������� �����������ٳ �����������"
430 M(11)="���������Ŀ ����������Ŀ� ���������Ŀ"
440 M(12)="�         � ��         �� �         �"
450 M(14)="�    4    � ڴ    5    ÿ �    6    �":M(15)=M(10)
460 M(16)="���������Ŀ ����������Ŀ� ���������Ŀ"
470 M(17)="�         ��ٳ         ��Ĵ         �"
480 M(19)="�    1    �  �    2    �  �    3    �"
490 M(20)="�����������  �����������  �����������"
500 M(21)="     �       ���������Ŀ       �"
510 M(22)="     �       �         �       �"
520 M(23)="     �������Ĵ         ���������"
530 M(24)="             �    0    �"    
540 C$=CHR$(219):B1$=C$+C$+C$+C$+C$+C$+C$:A$="       ":Y=14
550 DATA 1372,1039,1052,1065,719,732,745,399,412,425,92
560 ' Initialize 11 screen positions
570 FOR A=0 TO 10:READ T(A):NEXT:RESTORE:GOSUB 80 ' get key
580 ' draw board
590 CLS:FOR A=0 TO 10:P(A)=0:NEXT
600 FOR X=1 TO 24:LOCATE X,Y:PRINT M(X);:NEXT
610 LOCATE 1,1:PRINT "    T H E"
620 LOCATE 2,1:PRINT "  F R E N C H"
630 LOCATE 3,1:PRINT "M I L I T A R Y"
640 LOCATE 4,1:PRINT "    G A M E"
650 Z=T(5):PL=0:GOSUB 70:Z=T(1):GOSUB 70 ' print pieces
660 Z=T(3):GOSUB 70:Z=T(0):GOSUB 70:SW=1
670 P(0)=1:P(1)=1:P(3)=1:P(5)=2
680 ' human first move --> 1-4  1-2  0-2  3-2  3-6
690 GOSUB 90  ' get from & to
700 GOSUB 150 ' test for valid human move
710 IF HM=0 THEN GOSUB 100:GOTO 690
720 P(F)=0:P(T)=1:GOSUB 50 ' blank from print to
730 ' test if human has won
740 IF P(1)+P(4)+P(5)+P(7)=5  THEN GOSUB 120:GOTO 590
750 IF P(7)+P(8)+P(9)+P(10)=5 THEN GOSUB 120:GOTO 590
760 IF P(3)+P(5)+P(6)+P(9)=5  THEN GOSUB 120:GOTO 590
770 ' scan computer spot
780 FOR S=0 TO 10
790  IF P(S)=2 THEN SP=S
800 NEXT:K=SP+1
810 ON K GOTO 820,830,850,870,890,910,930,950,970,990,1010
820 R=INT(RND*3)+1:IF P(R)=0 THEN 1020 ELSE 820         ' 0
830 R=INT(RND*6):IF R=1 OR R=3 THEN 830                 ' 1
840 IF P(R)=0 THEN 1020 ELSE 830              
850 R=INT(RND*6):IF R=2 OR R=4 THEN 850                 ' 2
860 IF P(R)=0 THEN 1020 ELSE 850
870 R=INT(RND*7):IF R=1 OR R=3 OR R=4 THEN 870          ' 3
880 IF P(R)=0 THEN 1020 ELSE 870
890 R=INT(RND*7)+1:IF R=2 OR R=3 OR R=4 OR R=6 THEN 890 ' 4
900 IF P(R)=0 THEN 1020 ELSE 890
910 R=INT(RND*9)+1:IF R=5 THEN 910                      ' 5
920 IF P(R)=0 THEN 1020 ELSE 910
930 R=INT(RND*7)+3:IF R=4 OR R=6 OR R=7 OR R=8 THEN 930 ' 6
940 IF P(R)=0 THEN 1020 ELSE 930
950 R=INT(RND*7)+4:IF R=6 OR R=7 OR R=9 THEN 950        ' 7
960 IF P(R)=0 THEN 1020 ELSE 950
970 R=INT(RND*6)+5:IF R=6 OR R=8 THEN 970               ' 8
980 IF P(R)=0 THEN 1020 ELSE 970
990 R=INT(RND*6)+5:IF R=7 OR R=9 THEN 990               ' 9
1000 IF P(R)=0 THEN 1020 ELSE 990
1010 R=INT(RND*3)+7:IF P(R)=0 THEN 1020 ELSE 1010        ' 10
1020 F=SP:T=R
1030 LOCATE 7,54:PRINT "COMPUTER moves"
1040 LOCATE 8,53:PRINT F:LOCATE 8,56:PRINT T
1050 PL=0:GOSUB 50:P(SP)=0:P(R)=2
1060 IF P(0)=2 THEN GOSUB 110:GOTO 590
1070 GOTO 690
1080 ' locate converter
1090 V=INT(Z/64)+1:F=(V-1)*64:F=(Z-F)+1:LOCATE V,F:RETURN
1100 ' blank from print to
1110 Z=T(F):GOSUB 60:Z=T(T):GOSUB 70:RETURN
1120 ' blank O
1130 GOSUB 40:GOSUB 130
1140 FOR EQ=0 TO 1:LOCATE V+EQ,F:PRINT A$:NEXT:GOSUB 130
1150 RETURN
1160 ' paint O
1170 GOSUB 40:GOSUB 130
1180 IF PL=0 THEN COLOR 10,0 ELSE COLOR 12,0
1190 FOR EQ=0 TO 1:LOCATE V+EQ,F:PRINT B1$:NEXT:GOSUB 130
1200 PL=1:COLOR 15,0:RETURN
1210 ' get key
1220 LSET Q=MKI$(0)
1230 WHILE CVI(Q)=0:MID$(Q,1)=INKEY$:WEND
1240 IF ASC(Q)=27 THEN 1340 ELSE RETURN
1250 ' player move from and move to values
1260 LOCATE 4,54:PRINT "HUMAN moves"
1270 GOSUB 80:F=ASC(Q):LOCATE 5,54:PRINT Q
1280 IF F<47 OR F>57 THEN GOSUB 100:GOTO 1270
1290 GOSUB 140:K=F
1300 GOSUB 80:T=ASC(Q):LOCATE 5,57:PRINT Q
1310 IF T<47 OR T>57 THEN GOSUB 100:GOTO 1300
1320 F=T:GOSUB 140:U=F:F=K:T=U:RETURN
1330 ' exit
1340 COLOR 7,0:CLS:END
1350 ' illegal move
1360 BEEP
1370 FOR D=1 TO 12
1380  LOCATE 6,54:PRINT "Illegal move":SOUND .49, .2
1390  LOCATE 6,54:PRINT "            ":SOUND .49, .2
1400 NEXT
1410 LOCATE 5,54:PRINT "    "
1420 RETURN
1430 ' computer wins
1440 BEEP
1450 FOR D=1 TO 12
1460  LOCATE 8,54:PRINT "COMPUTER WINS!":SOUND .49, .2
1470  LOCATE 8,54:PRINT "              ":SOUND .49, .2
1480 NEXT
1490 LOCATE 8,54:PRINT "Press to restart.."
1500 GOSUB 80:SW=0:RETURN
1510 ' human wins
1520 BEEP
1530 FOR D=1 TO 12
1540  LOCATE 8,54:PRINT "YOU WIN! Congrats":SOUND .49, .2
1550  LOCATE 8,54:PRINT "                 ":SOUND .49, .2
1560 NEXT
1570 LOCATE 8,54:PRINT "Press to restart.."
1580 GOSUB 80:SW=0:RETURN
1590 ' delay
1600 IF SW=0 THEN 1620
1610 FOR D=1 TO 3:SOUND .49, .2:NEXT
1620 RETURN
1630 ' convert 47 - 57 --> 0 - 10
1640 IF F=47 THEN F=10:RETURN
1650 IF F=48 THEN F=0:RETURN
1660 IF F=49 THEN F=1:RETURN
1670 IF F=50 THEN F=2:RETURN
1680 IF F=51 THEN F=3:RETURN
1690 IF F=52 THEN F=4:RETURN
1700 IF F=53 THEN F=5:RETURN
1710 IF F=54 THEN F=6:RETURN
1720 IF F=55 THEN F=7:RETURN
1730 IF F=56 THEN F=8:RETURN
1740 IF F=57 THEN F=9:RETURN
1750 ' test human legal move
1760 IF F=T THEN 2050
1770 IF F=0 AND T=1 THEN 2060 '  1
1780 IF F=0 AND T=2 THEN 2060 '  2
1790 IF F=0 AND T=3 THEN 2060 '  3
1800 IF F=1 AND T=2 THEN 2060 '  4
1810 IF F=1 AND T=4 THEN 2060 '  5
1820 IF F=1 AND T=5 THEN 2060 '  6
1830 IF F=2 AND T=1 THEN 2060 '  7
1840 IF F=2 AND T=3 THEN 2060 '  8
1850 IF F=2 AND T=5 THEN 2060 '  9
1860 IF F=3 AND T=2 THEN 2060 ' 10
1870 IF F=3 AND T=5 THEN 2060 ' 11
1880 IF F=3 AND T=6 THEN 2060 ' 12
1890 IF F=4 AND T=5 THEN 2060 ' 13
1900 IF F=4 AND T=7 THEN 2060 ' 14
1910 IF F=5 AND T=4 THEN 2060 ' 15
1920 IF F=5 AND T=6 THEN 2060 ' 16
1930 IF F=5 AND T=7 THEN 2060 ' 17
1940 IF F=5 AND T=8 THEN 2060 ' 18
1950 IF F=5 AND T=9 THEN 2060 ' 19
1960 IF F=6 AND T=5 THEN 2060 ' 20
1970 IF F=6 AND T=9 THEN 2060 ' 21
1980 IF F=7 AND T=8 THEN 2060 ' 22
1990 IF F=7 AND T=10 THEN 2060 ' 23
2000 IF F=8 AND T=7  THEN 2060 ' 24
2010 IF F=8 AND T=9  THEN 2060 ' 25
2020 IF F=8 AND T=10 THEN 2060 ' 26
2030 IF F=9 AND T=8  THEN 2060 ' 27
2040 IF F=9 AND T=10 THEN 2060 ' 28
2050 HM=0:RETURN
2060 IF P(F)=2 THEN 2050
2070 IF P(F)=1 AND P(T)=0 THEN HM=1:RETURN
2080 GOTO 2050
