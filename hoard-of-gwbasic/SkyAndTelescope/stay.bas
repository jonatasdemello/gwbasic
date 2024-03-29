10 REM   LENGTH OF STAY
12 REM   INSIDE 1 A.U.
14 REM
16 K=0.01720209895
18 P=3.1415926536
20 INPUT "PERIHELION DIST. ";Q
22 INPUT "ECCENTRICITY     ";E
24 PRINT
26 T=0
28 IF E>1 OR E<0 THEN 22
30 IF Q>=1 THEN 78
32 IF Q<0.0046524 THEN 82
34 IF E<1 THEN 54
36 REM
38 REM   PARABOLIC CASE
40 REM
42 T2=1/Q-1
44 T1=SQR(T2)
46 Q3=Q*Q*Q
48 T=SQR(2*Q3)*(3*T1+T1*T2)/(3*K)
50 GOTO 78
52 REM
54 REM  ELLIPTICAL CASE
56 REM
58 IF E=0 THEN 86
60 IF Q*(1+E)/(1-E)<=1 THEN 86
62 A=Q/(1-E)
64 C=(A-1)/(A*E)
66 IF C<>0 THEN 70
68 E1=P/2:  GOTO 76
70 S=SQR(1-C*C)
72 E1=ATN(S/C)
74 IF C<0 THEN E1=E1+P
76 T=A*SQR(A)*(E1-E*SIN(E1))/K
78 PRINT "DAYS: ";2*T
80 GOTO 88
82 PRINT "COLLISION WITH SUN"
84 GOTO 88
86 PRINT "ALWAYS INSIDE 1 A.U."
88 END
90 REM  ------------------------
92 REM  APPEARED IN ASTRONOMICAL
94 REM  COMPUTING, SKY & TELE-
96 REM  SCOPE, JULY, 1984
98 REM  ------------------------
