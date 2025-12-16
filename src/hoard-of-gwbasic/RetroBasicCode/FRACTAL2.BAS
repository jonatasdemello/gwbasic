10 REM *************************************************************************
20 REM **                     FRACTALES           Compilable                  **
30 REM ** Adaptation de DARCHE Yoann sur PCompatible avrc CGA le 01/08/89     **
40 REM *************************************************************************
50     CLS
60 DEFINT A,B,C,E-Y
70 DIM H(128,128),C(320)
80 REM =========================== Menu ========================================
90 SCREEN 1:WINDOW (0,0)-(639,199)
100 PRINT "1> nouvelle surface"
110 PRINT "2> carte
120 PRINT "3> vue en strates"
130 PRINT "4> vue en ombres"
140 PRINT "5> vue en fil de fer "
150 PRINT "0> fin"
160 PRINT
170 INPUT ">",I:IF I>5 OR I<0 OR I<>INT(I) THEN 170
180 IF I=0 THEN END
190 ON I GOSUB 240,850,1080,1260,930
200 PRINT CHR$(7)
210 WHILE INKEY$="":WEND
220 GOTO 90
230 REM ========================= ParamŠtres ===================================
240 INPUT "Maille (0-3) : ",M
250 P=2^(7-M)
260 PRINT " ---->> pas =";P
270 INPUT "Hauteur de base : ",H
280 INPUT "Deviation       : ",D
290 INPUT "Graine          : ",Z
300 INPUT "Taille (128,64,32): ",L
310 IF L=128 THEN WINDOW (0,0)-(639,399)
320 REM =========================== Calcul =====================================
330 RANDOMIZE  Z
340 N=H/16:GOSUB 780
350 CLS
360 REM =========================== surface de base .
370 FOR X=0 TO L STEP P
380 FOR Y=0 TO L STEP P
390 H(X,Y)=RND*H:IF H(X,Y)<N THEN H(X,Y)=N
400 C=H(X,Y)/N:C=INT(C/6)+1:IF C>3 THEN C=3
410 PSET (X*4,Y*2),C
420 NEXT Y,X
430 REM ========================== Calcul fractal .
440 WHILE P>1
450 Q=P/2:E=D/2
460 FOR X=Q TO L-Q STEP P
470 FOR Y=Q TO L-Q STEP P
480 H=(H(X-Q,Y-Q)+H(X-Q,Y+Q)+H(X+Q,Y-Q)+H(X+Q,Y+Q))/4+D*RND-E
490 IF H<N THEN H=N
500 C=H/N:C=INT(C/6)+1:IF C>3 THEN C=3
510 H(X,Y)=H:PSET (X*4,Y*2),C
520 NEXT Y,X
530 FOR X=P TO L-P STEP P
540 FOR Y=Q TO L-Q STEP P
550 H=(H(X-Q,Y)+H(X+Q,Y)+H(X,Y-Q)+H(X,Y+Q))/4+D*RND-E
560 IF H<N THEN H=N
570 C=H/N:C=INT(C/5):IF C>3 THEN C=3
580 H(X,Y)=H:PSET(X*4,Y*2),C
590 H=(H(Y-Q,X)+H(Y+Q,X)+H(Y,X-Q)+H(Y,X+Q))/4+D*RND-E
600 IF H<N THEN H=N
610 C=H/N:C=INT(C/6)+1:IF C>3 THEN C=3
620 H(Y,X)=H:PSET (Y*4,X*2),C
630 NEXT Y,X
640 FOR I=Q TO L-Q STEP P
650 H=(H(0,I-Q)+H(0,I+Q)+H(Q,I))/3+D*RND-E:IF H<N THEN H=N
660 H(0,I)=H
670 H=(H(L,I-Q)+H(L,I+Q)+H(L-Q,I))/3+D*RND-E:IF H<N THEN H=N
680 H(L,I)=H
690 H=(H(I-Q,0)+H(I+Q,0)+H(I,Q))/3+D*RND-E:IF H<N THEN H=N
700 H(I,0)=H
710 H=(H(I-Q,L)+H(I+Q,L)+H(I,L-Q))/3+D*RND-E:IF H<N THEN H=N
720 H(I,L)=H
730 NEXT I
740 P=P/2:D=D/2
750 WEND
760 RETURN
770 RETURN
780 RETURN
790 REM
800 DRAW "NR-3":FOR C=1 TO 15
810 D$="C"+STR$(C)+";NU"+STR$(N+N):DRAW D$
820 NEXT C
830 RETURN
840 REM ============================ CARTE
850 CLS
860 FOR Y=0 TO 128
870 FOR X=0 TO 128
880 C=H(X,Y)/N:C=INT(C/6)+1:IF C>3 THEN C=3
890 PSET (X*4,Y*2),C
900 NEXT X,Y
910 RETURN
920 REM ====================== Fil de fer
930 CLS:O=160:K=0
940 IF L>=128 THEN WINDOW (0,0)-(639,399)
950 PSET (0,40):LINE -(320,0):LINE -(640,40)
960 FOR I=1 TO 320:C(I)=0:NEXT
970 FOR Y=0 TO L STEP 2:PSET (O*4-320,C(O+K))
980 K=0:O=160-Y:IF O<0 THEN K=-O
990 FOR X=K TO L STEP 2
1000 T=H(X,Y)+Y+X
1010 IF C(X+O)>T THEN H=C(X+O) ELSE H=T
1020 C(X+O)=H
1030 LINE -((O+X)*4-320,H)
1040 NEXT X:LINE -((O+X)*4-322,FH):FH=H
1050 NEXT Y
1060 RETURN
1070 REM =============== strates
1080 CLS:NM=N*4:IF L=>128 THEN WINDOW (0,0)-(639,399)
1090 PSET (0,40):LINE -(320,0):LINE -(640,40)
1100 FOR I=0 TO 80:H=H(0,I)+I:IF H<NM+I THEN H=NM+I
1110 C(80-I)=H-2
1120 H=H(I,0)+I:IF H<NM+I THEN H=NM+I
1130 C(80+I)=H-2
1140 NEXT I
1150 FOR Y=0 TO L
1160 FOR X=0 TO L-1:NMX=NM+X+Y
1170 A=80-Y+X:IF A<0 OR A>319 THEN 1230
1180 H=(H(X,Y)+X+Y)
1190 C=H(X,Y)/N:C=INT(C/6)+1:IF C>3 THEN C=3
1200 IF H<MNX THEN H=NMX
1210 IF H<=C(A) THEN PSET (A*4,C(A)),0
1220 IF H>C(A) THEN PSET (A*4,C(A)+2):LINE -(A*4,H),C:C(A)=H
1230 NEXT X,Y
1240 RETURN
1250 REM ====================================== ombres
1260 CLS:IF L=>128 THEN WINDOW (0,0)-(639,399)
1270 PSET (0,40):LINE -(320,0):LINE -(640,40)
1280 FOR I=0 TO 80:C(80-I)=H(0,I)+I-2:C(80+I)=H(I,0)+I-2:NEXT
1290 FOR Y=0 TO L:O1=0:O2=0
1300 FOR X=L TO 0 STEP -1
1310 A=80-Y+X:IF A<0 OR A>319 THEN 1390
1320 H=(H(X,Y)+X+Y)
1330 C=3
1340 IF H(X,Y)>=O1 THEN O1=H(X,Y)+1 ELSE C=2
1350 IF H(X,Y)>=O2 THEN O2=H(X,Y)+2 ELSE C=1
1360 IF H<C(A) THEN PSET (A*4,C(A)-2),C+1:GOTO 1390
1370 PSET (A*4,C(A)),C:LINE -(A*4,H)
1380 C(A)=H+2
1390 O1=O1-1:O2=O2-2
1400 NEXT X,Y
1410 RETURN
