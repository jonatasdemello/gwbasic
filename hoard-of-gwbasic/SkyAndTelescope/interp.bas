10 REM  LAGRANGE INTERPOLATION
12 REM
14 INPUT "HOW MANY POINTS";N
16 PRINT 
18 DIM X(N),F(N),L(N)
20 FOR I=1 TO N
22 INPUT "X,F";X(I),F(I)
24 NEXT I
26 FOR I=1 TO N: L(I)=1
28 FOR J=1 TO N
30 IF J=I THEN 34
32 L(I)=L(I)*(X(I)-X(J))
34 NEXT J
36 L(I)=F(I)/L(I)
38 NEXT I
40 PRINT 
42 INPUT "DESIRED X";X$
44 IF X$="X" THEN 78
48 X=VAL(X$): F1=0
50 FOR I=1 TO N
52 IF X<>X(I) THEN 56
54 F=F(I): F1=1
56 NEXT I
58 IF F1=1 THEN 74
60 T=1: F=0
62 FOR I=1 TO N
64 T=T*(X-X(I))
66 NEXT I
68 FOR I=1 TO N
70 F=F+L(I)*T/(X-X(I))
72 NEXT I
74 PRINT "F: ";F
76 PRINT: GOTO 42
78 END
80 REM  ------------------------
85 REM  APPEARED IN ASTRONOMICAL
90 REM  COMPUTING, SKY & TELE-
95 REM  SCOPE, APRIL, 1984
99 REM  ------------------------

