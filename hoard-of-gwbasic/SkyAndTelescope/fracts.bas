10 REM  REPRESENTING A DECIMAL
12 REM  VALUE BY A CONTINUED
14 REM  FRACTION
16 REM
18 DEFDBL A-H,K-Z
20 DEFINT I,J
22 C1=1: O=99999
24 O1$="#####  ########## /"
26 O2$="= ##.#############"
28 REM
30 P=1E12
32 DIM F(100)
34 INPUT "DECIMAL VALUE";K
36 PRINT
38 I=-1
40 I=I+1
42 F(I)=INT(K): IF I>=1 THEN 46   
44 N=F(I): D=1: GOTO 48   
46 GOSUB 68   
48 R=N/D
50 IF ABS(N)>P THEN 66   
52 IF ABS(D)>P THEN 66   
54 PRINT USING O1$;F(I);N;
56 PRINT D;TAB(30);
58 PRINT USING O2$;R
60 K1=K-INT(K): IF K1=0 THEN 66
62 IF ABS(R-O)<1/P THEN 66   
64 K=C1/K1: O=R: GOTO 40   
66 END
68 D=F(I): N=1
70 FOR J=I-1 TO 0 STEP -1
72 N1=D
74 D1=F(J)*D+N
76 N=N1: D=D1
78 NEXT J 
80 N=D1: D=N1
82 RETURN
100 REM ************************
110 REM  FROM SKY & TELESCOPE'S
120 REM  ASTRONOMICAL COMPUTING
130 REM  FOR JANUARY, 1989
140 REM ************************
