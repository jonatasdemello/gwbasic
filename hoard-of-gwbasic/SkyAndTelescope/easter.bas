10 REM    EASTER
12 REM
14 INPUT "YEAR ";Y
16 IF Y<1583 THEN 14
18 Y1=Y/19
20 A=INT((Y1-INT(Y1))*19+.001)
22 B1=Y/100: B=INT(B1)
24 C=INT((B1-INT(B1))*100+.001)
26 D1=B/4: D=INT(D1)
28 E=INT((D1-INT(D1))*4+.001)
30 F=INT(((B+8)/25)+.001)
32 G=INT((B-F+1)/3)
34 H1=(19*A+B-D-G+15)/30
36 H=INT((H1-INT(H1))*30+.001)
38 C1=C/4: I=INT(C1)
40 K=INT((C1-I)*4+.001)
42 L1=(32+2*E+2*I-H-K)/7
44 L=INT((L1-INT(L1))*7+.001)
46 M=INT((A+11*H+22*L)/451)
48 N1=(H+L-7*M+114)/31: N=INT(N1)
50 P=INT((N1-N)*31+.001)
52 N$="APRIL"
54 IF N=3 THEN N$="MARCH"
56 PRINT "EASTER IS ON ";N$;P+1
58 INPUT "ANOTHER (Y OR N) ";Q$
60 IF Q$="Y" THEN 14
62 END
70 REM  ------------------------
80 REM  APPEARED IN ASTRONOMICAL
90 REM  COMPUTING, SKY & TELE-
95 REM  SCOPE, MARCH, 1986
99 REM  ------------------------
