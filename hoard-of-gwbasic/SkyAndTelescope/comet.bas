5 GOSUB 69: GOTO 200
10 REM   KEPLER'S EQUATION
11 REM
12 P1=3.14159265: R1=180/P1
13 K=0.01720209895
18 IF E0>=0.95 THEN GOTO 40
19 IF E0>=1 THEN 85
20 A1=Q/(1-E0): M=K*T*A1^(-1.5)
21 REM
22 REM   BINARY SEARCH
23 REM
24 F=SGN(M): M=ABS(M)/(2*P1)
25 M=(M-INT(M))*2*P1*F
26 IF M<0 THEN M=M+2*P1
27 F=1: IF M>P1 THEN F=-1
28 IF M>P1 THEN M=2*P1-M
29 E=P1/2: D=P1/4
30 FOR I1=1 TO 23
31 M1=E-E0*SIN(E)
32 E=E+SGN(M-M1)*D: D=D/2
33 NEXT I1
34 V=SQR((1+E0)/(1-E0)): E=E*F
35 V=2*ATN(V*SIN(E/2)/COS(E/2))
36 R=A1*(1-E0*COS(E))
38 GOTO 81
39 REM
40 REM    GAUSS METHOD
41 REM
43 A=SQR((1+9*E0)/10)
44 B=5*(1-E0)/(1+9*E0)
45 C=SQR(5*(1+E0)/(1+9*E0))
46 B1=3*A*K*T/SQR(2*Q*Q*Q)
47 B2=1: REM  INITIAL VALUE
48 W1=B2*B1: B3=ATN(2/W1)
49 T1=SIN(B3/2)/COS(B3/2)
50 S1=SGN(T1): T1=ABS(T1)
51 T2=T1^(1/3)*S1: G=ATN(T2)
52 S=2*COS(2*G)/SIN(2*G)
53 A2=B*S*S: B0=B2: B2=0
54 IF ABS(A2)>0.3 THEN 19
55 FOR J=0 TO 7
56 B2=B2+B(J)*A2^J
57 NEXT J
58 IF ABS(B2-B0)>1E-8 THEN 48
59 C1=0
60 FOR J=0 TO 7
61 C1=C1+S(J)*A2^J
62 NEXT J
63 C1=SQR(1/C1)
64 V1=C*C1*S: D1=1/(1+A2*C1*C1)
65 V=2*ATN(V1): R=Q*D1*(1+V1*V1)
67 GOTO 81
68 REM
69 REM   COEFFICIENTS
70 FOR J=0 TO 7: READ B(J): NEXT
71 FOR J=0 TO 7: READ S(J): NEXT
72 RETURN
73 DATA 1,0,-0.017142857
74 DATA -0.003809524, -0.001104267
75 DATA -0.000367358,-0.000131675
76 DATA -0.000049577,1,-0.8
77 DATA 0.04571429,0.01523810
78 DATA 0.00562820, 0.00218783
79 DATA 0.00087905,0.00036155
80 RETURN
81 IF V<0 THEN V=V+2*P1
84 GOTO 86
85 PRINT "OUT OF RANGE"
86 RETURN
200 REM   COMET POSITION IN SKY
203 REM
206 PRINT "PERI DATE  ";
207 GOSUB 800: J9=J: F9=F
208 INPUT "PERI DIST Q  ";Q
209 INPUT "ECCENTRICITY ";E0
212 INPUT "ARG OF PERIHELION ";W
215 INPUT "LONG OF ASC NODE  ";N
218 INPUT "INCLINATION       ";I
233 P1=3.14159265: R1=P1/180
236 E=23.4457889*R1: REM OBLIQUITY
239 W=W*R1: N=N*R1: I=I*R1
242 GOSUB 338  
245 PRINT
246 PRINT "DATE  ";
247 GOSUB 800: J1=J: F1=F
248 GOSUB 500: T=(J1-J9)+(F1-F9)
249 GOSUB 10
251 REM   POSITION IN ORBIT PLANE
254 X1=R*COS(V): Y1=R*SIN(V)
257 REM
260 REM   HELIOCENTRIC EQUATORIAL
261 REM   COORDINATES
263 X2=P7*X1+Q7*Y1
266 Y2=P8*X1+Q8*Y1
269 Z2=P9*X1+Q9*Y1
272 REM
275 REM   GEOCENTRIC EQUATORIAL
276 REM   COORDINATES
278 X3=X+X2: Y3=Y+Y2: Z3=Z+Z2
281 GOSUB 392: REM  FOR 2000.0!
284 D3=SQR(X3*X3+Y3*Y3+Z3*Z3)
287 R1=P1/180
290 A=ATN(Y3/X3)/(15*R1)
293 IF X3<0 THEN A=A+12
296 IF A<0 THEN A=A+24
299 D=ATN(Z3/SQR(X3*X3+Y3*Y3))/R1
301 REM   NOW ROUND OFF
302 A=A+0.05/60
305 H=INT(A): M=60*(A-H)
308 M=INT(10*M)/10
311 S=SGN(D): D=ABS(D)+0.5/60
314 D1=INT(D): M1=INT(60*(D-D1))
317 S$="+": IF S=-1 THEN S$="-"
320 PRINT "R.A.  ";H;"H ";M;"M"
323 PRINT "DEC. ";S$;D1;"D ";M1;"M"
326 PRINT "COMET-EARTH DIST:";D3
329 PRINT "COMET-SUN DIST: ";R
330 INPUT "ANOTHER (Y OR N) ";Q$
331 IF Q$="Y" THEN 245
332 END
335 REM
338 REM   P'S AND Q'S
344 W1=SIN(W): W2=COS(W)
347 N1=SIN(N): N2=COS(N)
350 I1=SIN(I): I2=COS(I)
353 E1=SIN(E): E2=COS(E)
356 P7=W2*N2-W1*N1*I2
359 P8=(W2*N1+W1*N2*I2)*E2
362 P8=P8-W1*I1*E1
365 P9=(W2*N1+W1*N2*I2)*E1
368 P9=P9+W1*I1*E2
371 Q7=-W1*N2-W2*N1*I2
374 Q8=(-W1*N1+W2*N2*I2)*E2
377 Q8=Q8-W2*I1*E1
380 Q9=(-W1*N1+W2*N2*I2)*E1
383 Q9=Q9+W2*I1*E2
386 RETURN
389 REM
392 REM   1950.0 --> 2000.0
395 A7=+0.9999257: A8=-0.0111789
398 A9=-0.0048590: B7=+0.0111789
401 B8=+0.9999375: B9=-0.0000272
404 C7=+0.0048590: C8=-0.0000272
407 C9=+0.9999882
410 X4=A7*X3+A8*Y3+A9*Z3
413 Y4=B7*X3+B8*Y3+B9*Z3
416 Z4=C7*X3+C8*Y3+C9*Z3
419 X3=X4: Y3=Y4: Z3=Z4
422 RETURN
500 REM    X,Y,Z OF THE SUN
501 REM    (EQUINOX 1950.0)
502 REM
504 J8=J-2415020: R1=3.14159265/180
505 T=(J8+F)/36525
506 P0=1.396041+0.000308*(T+0.5)
507 P0=P0*(T-0.499998)
508 A=100:GOSUB 529:G0=A+358.475833
509 L0=A+279.696678-P0
510 A=1336: GOSUB 529  
511 C0=A+270.434164-P0
512 A=162: GOSUB 529  
513 V0=A+212.603219
514 A=53:GOSUB 529: M0=A+319.529425
515 A=8: GOSUB 529: J0=A+225.444651
516 G=G0+T*(-0.950250-0.000150*T)
517 C=C0+T*(307.883142-0.001133*T)
518 L=L0+T*(0.768920+0.000303*T)
519 V=V0+T*(197.803875+0.001286*T)
520 M=M0+T*(59.8585+0.000181*T)
521 J=J0+T*154.906654
522 G=G*R1: C=C*R1: L=L*R1
523 V=V*R1: M=M*R1: J=J*R1
524 GOSUB 532  
528 RETURN
529 REM   NORMALIZATION
530 A=360*(A*T-INT(A*T)): RETURN
531 REM
532 X=0.000011*COS(2*G-L-2*J)
533 X=X+0.000011*COS(2*G+L-2*V)
534 X=X-0.000012*COS(G+L-V)
535 X=X-0.000012*COS(4*G-L-8*M+3*J)
536 X=X+0.000012*COS(4*G+L-8*M+3*J)
537 X=X-0.000014*COS(C-2*L)
538 X=X+0.000017*COS(C)
539 X=X+0.000018*SIN(2*G+L-2*V)
540 X=X-0.000021*T*COS(G+L)
541 X=X-0.000026*SIN(G-L-J)
542 X=X+0.000035*COS(2*G-L)
543 X=X+0.000063*T*COS(G-L)
544 X=X+0.000105*COS(2*G+L)
545 X=X+0.008374*COS(G+L)
546 X=X-0.025127*COS(G-L)
547 X=X+0.999860*COS(L)
548 REM
549 Y=0.000010*SIN(2*G+L-2*V)
550 Y=Y-0.000010*SIN(2*G-L-2*J)
551 Y=Y-0.000011*SIN(G+L-V)
552 Y=Y+0.000011*SIN(4*G-L-8*M+3*J)
553 Y=Y+0.000011*SIN(4*G+L-8*M+3*J)
554 Y=Y+0.000013*SIN(C-2*L)
555 Y=Y+0.000016*SIN(C)
556 Y=Y-0.000017*COS(2*G+L-2*V)
557 Y=Y-0.000019*T*SIN(G+L)
558 Y=Y-0.000024*COS(G-L-J)
559 Y=Y-0.000032*SIN(2*G-L)
560 Y=Y-0.000057*T*SIN(G-L)
561 Y=Y+0.000097*SIN(2*G+L)
562 Y=Y+0.007683*SIN(G+L)
563 Y=Y+0.023053*SIN(G-L)
564 Y=Y+0.917308*SIN(L)
565 REM
566 Z=-0.000010*COS(G-L-J)
567 Z=Z-0.000014*SIN(2*G-L)
568 Z=Z-0.000025*T*SIN(G-L)
569 Z=Z+0.000042*SIN(2*G+L)
570 Z=Z+0.003332*SIN(G+L)
571 Z=Z+0.009998*SIN(G-L)
572 Z=Z+0.397825*SIN(L)
573 RETURN
800 REM   CALENDAR --> JD
805 REM
810 INPUT "Y,M,D ";Y,M,D
815 G=1
820 D1=INT(D): F=D-D1-0.5
825 J=-INT(7*(INT((M+9)/12)+Y)/4)
830 IF G=0 THEN 850  
835 S=SGN(M-9): A=ABS(M-9)
840 J3=INT(Y+S*INT(A/7))
845 J3=-INT((INT(J3/100)+1)*3/4)
850 J=J+INT(275*M/9)+D1+G*J3
855 J=J+1721027+2*G+367*Y
860 IF F>=0 THEN 870  
865 F=F+1: J=J-1
870 RETURN
875 END
880 REM  ------------------------
890 REM  APPEARED IN ASTRONOMICAL
900 REM  COMPUTING, SKY & TELE-
910 REM  SCOPE, DECEMBER, 1985
920 REM  ------------------------
