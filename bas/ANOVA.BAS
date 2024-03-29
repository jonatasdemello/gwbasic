1 '                     ANALYSIS OF VARIANCE
2 '               Written by Tracy L. Gustafson, M.D.
3 '              Round Rock, Texas. Version 3.0, 1984
4 ON ERROR GOTO 5000:CHAIN MERGE "EPIMRG",5
15 DIM D(1,1),CS(1,1),T(1),N$(1),X(1),X2(1),MD(1),SD(1),NS(1)
22 DATA "ANALYSIS OF VARIANCE",25,22
30 PRINT:PRINT TAB(10);"1.)  1-WAY ANOVA.  For comparing the MEANS of 3 or": PRINT TAB(15);"more independent samples. (unpaired test)":PRINT
35 PRINT TAB(10);"2.)  2-WAY ANOVA.  For evaluating the combined effects":PRINT TAB(15);"of 2 variables on a third. (ROW and COLUMN effects)":PRINT
40 PRINT TAB(10);"3.)  Evaluate known F value":PRINT:PRINT
45 PRINT TAB(20);:INPUT "Enter your choice:   ",ASUB:IF ABS(ASUB-2)>1 THEN BEEP:GOTO 45 ELSE IF ASUB<3 THEN 85
50 CLS:PRINT TAB(24);"F PROBABILITY DISTRIBUTION":PRINT TAB(24);STRING$(26,205)
55 LOCATE 6,26:INPUT "Enter F value:   ",F:PRINT
60 PRINT TAB(15);:INPUT "Enter degrees of freedom in NUMERATOR:   ",V1:PRINT
65 PRINT TAB(13);:INPUT "Enter degrees of freedom in DENOMINATOR:   ",V2
70 PRINT:GOSUB 365
75 COLOR CLR1,CLR2:LOCATE 15,17:INPUT "Do you want to evaluate another F value?   ",A$
80 IF A$="y" OR A$="Y" THEN 50 ELSE 360
85 LOCATE 17,1:GOSUB 4000
90 FOR T=1 TO INT((A-1)/7):SCREEN ,,T,0:CLS:NEXT:SCREEN ,,0
95 CLS:ON ASUB GOTO 100,265
100 PRINT TAB(23);"ONE-WAY ";DTTL:PRINT TAB(23);STRING$(28,205):PRINT
105 PRINT TAB(22);FILE$;" has ";A;" samples/variables."
110 PRINT TAB(8);:INPUT "How many variables do you want to include in the ANOVA?   ",AMX
115 IF AMX<1 OR AMX>A THEN BEEP:GOTO 110
120 PRINT "Enter these";AMX;"sample numbers:":ERASE NS:DIM NS(AMX):PRINT
125 AR=CSRLIN:FOR AS=1 TO INT((AMX-1)/7):SCREEN ,,AS,0:CLS:NEXT:SCREEN ,,0
130 FOR AS=0 TO INT((AMX-1)/7):A2=AS*7+7:IF A2>AMX THEN A2=AMX
135 A1=AS*7+1:SCREEN ,,AS,AS:LOCATE AR,1:PRINT "Sample #:";
140 FOR T=A1 TO A2:AC=(T-A1+1)*10+1
145 LOCATE AR,AC:INPUT;"",NS(T):IF NS(T)<1 OR NS(T)>A THEN BEEP:LOCATE 25,25:PRINT FILE$;" has only";A;"samples.";:LOCATE AR,AC:PRINT "   ":GOTO 145
150 NEXT:NEXT AS:PRINT:AR=CSRLIN
155 FOR AS=0 TO INT((AMX-1)/7):A2=AS*7+7:IF A2>AMX THEN A2=AMX
160 A1=AS*7+1:SCREEN ,,AS,AS:LOCATE AR,1
165 PRINT "NAME:";:FOR T=A1 TO A2:PRINT TAB((T-A1+1)*10-2);N$(NS(T));:NEXT
170 PRINT:PRINT "MEAN:";:FOR T=A1 TO A2:MN=X(NS(T))/T(NS(T)):MB=ABS(MN):GOSUB 205
175 PRINT TAB((T-A1+1)*10-3);:PRINT USING P$;MN;:NEXT
180 PRINT:PRINT "VAR:";:FOR T=A1 TO A2:MB=SD(NS(T))^2:GOSUB 205
185 PRINT TAB((T-A1+1)*10-3);:PRINT USING P$;MB;:NEXT
190 LOCATE 25,17:IF A2<AMX THEN PRINT "Press P to print next page of variances."; ELSE PRINT "    Press C to continue calculations.";
195 A$=INKEY$:IF A$="" THEN 195 ELSE LOCATE 25,15:PRINT TAB(70);:IF A$="P" OR A$="p" THEN NEXT AS ELSE IF A$<>"C" AND A$<>"c" THEN BEEP:GOTO 190
200 SCREEN,,0:LOCATE AR+4,1:ON ASUB GOTO 215,270
205 IF MB>9999 THEN P$="#######.#" ELSE IF MB>99 THEN P$="#####.###" ELSE IF MB>=10 THEN P$="###.#####" ELSE P$="##.######"
210 RETURN
215 XM=0:XM2=0:NT=0:ST=0:XT2=0:M1=0:M2=0:MV=0
220 FOR T=1 TO AMX:NS=NS(T):XM=XM+X(NS):XM2=XM2+X2(NS):NT=NT+T(NS):XT2=XT2+X(NS)*X(NS)/T(NS)
225 MV=MV+SD(NS)*SD(NS):M=X(NS)/T(NS):M1=M1+M:M2=M2+M*M:NEXT
230 ST=XT2-XM*XM/NT:SS=XM2-XM*XM/NT:ES=SS-ST:MV=MV/AMX
235 V1=AMX-1:V2=NT-AMX:F=ST/V1*V2/ES:VM=(M2-M1*M1/AMX)/V1
240 PRINT TAB(8);"F";TAB(20);"df N";TAB(30);"df D";TAB(40);"TOTAL SS";TAB(53);"TRTMT SS";TAB(65);"ERROR SS"
245 PRINT TAB(5);F;TAB(20);V1;TAB(30);V2;TAB(39);SS;TAB(52);ST;TAB(64);ES
250 PRINT:PRINT TAB(10);"MEAN VARIANCE";TAB(51);"VARIANCE OF MEANS":PRINT TAB(11);MV;TAB(54);VM:GOSUB 365
255 PRINT TAB(9);"The MEANS of these samples are ";:IF P>.05 THEN PRINT "NOT ";
260 PRINT "significantly different.";TAB(75):COLOR CLR1,CLR2:GOTO 340
265 PRINT TAB(23);"TWO-WAY ";DTTL:PRINT TAB(23);STRING$(28,205):PRINT:GOTO 105
270 FOR T=2 TO AMX:IF T(NS(T))<>T(NS(1)) THEN PRINT "These samples do not all have the same number of elements---": PRINT TAB(37);"a 2-WAY ANOVA cannot be performed.":GOTO 340 ELSE NEXT
275 XR2=0:XM=0:XM2=0:XC2=0:MV=0:VM2=0:N=T(NS(1)):NT=AMX*N
280 FOR Z=1 TO N:XR=0:FOR T=1 TO AMX:XR=XR+VAL(D(NS(T),Z)):NEXT
285 XR2=XR2+XR*XR/AMX:NEXT
290 FOR T=1 TO AMX:NS=NS(T):XM=XM+X(NS):XM2=XM2+X2(NS):XC2=XC2+X(NS)*X(NS)/N:NEXT
295 SS=XM2-XM*XM/NT:SR=XR2-XM*XM/NT:SC=XC2-XM*XM/NT:RES=SS-SR-SC
300 V1=N-1:V2=(N-1)*(AMX-1):F=SR/V1*V2/RES
305 PRINT TAB(8);"F (ROW)";TAB(23);"df N";TAB(33);"df D";TAB(47);"TOTAL SS";TAB(60);"ROW SS";
310 PRINT TAB(6);F;TAB(23);V1;TAB(33);V2;TAB(46);SS;TAB(58);SR;
315 GOSUB 365:TB=12:DI="ROWS":GOSUB 465
320 V1=AMX-1:F=SC/V1*V2/RES:PRINT:PRINT
325 PRINT TAB(7);"F (COLUMN)";TAB(23);"df N";TAB(33);"df D";TAB(48);"COL SS";TAB(59);"RESIDUAL";
330 PRINT TAB(7);F;TAB(23);V1;TAB(33);V2;TAB(46);SC;TAB(58);RES;
335 GOSUB 365:TB=10:DI="COLUMNS":GOSUB 465
340 LOCATE 24,5:PRINT "Do you want to perform another ANALYSIS OF VARIANCE ";:LOCATE 25,48:INPUT;"using this datafile?   ",A$
345 IF A$="y" OR A$="Y" THEN 95 ELSE IF A$="N" OR A$="n" THEN 350 ELSE BEEP:GOTO 340
350 LOCATE 25,45:INPUT;" using a different datafile?  ",A$
355 IF A$="y" OR A$="Y" THEN 20
360 LOCATE 23,1:END
365 X=1/(V1/V2*F+1):Y=1-X:PF=1:PT=1:VA=V1:VB=V2
370 IF V1 MOD 2<>0 THEN IF V2 MOD 2=0 THEN 390 ELSE 400
375 IF V2 MOD 2=0 THEN IF V2>=V1 THEN 390
380 FOR Z=1 TO (V1/2-1):PF=PF*(.5/Z*Y*VB):PT=PT+PF:VB=VB+2:NEXT
385 P=X^(V2*.5)*PT:GOTO 450
390 FOR Z=1 TO (V2/2-1):PF=PF*(.5/Z*X*VA):PT=PT+PF:VA=VA+2:NEXT
395 P=1-Y^(V1*.5)*PT:GOTO 450
400 XT=ATN(SQR(F*V1/V2)):X=SIN(XT):Y=COS(XT):PT=Y:PF=Y
405 IF V2=1 THEN 420
410 FOR Z=2 TO (V2-3) STEP 2:PF=PF*Y*Y*Z/(Z+1):PT=PT+PF:NEXT
415 PT=PT*X:XT=XT+PT
420 PT=1:PF=1:IF V1=1 THEN 445
425 FOR Z=2 TO (V2-1) STEP 2:PF=PF*Z/(Z-1):NEXT
430 PF=PF*Y^V2*X:PZ=1:PT=1:VB=V2+1
435 FOR Z=3 TO (V1-2) STEP 2:PZ=PZ*VB*X*X/Z:PT=PT+PZ:VB=VB+2:NEXT
440 XT=XT-PT*PF
445 P=1-XT*2/3.141592653599#
450 PLAY "MB MS O2 T170 L32G L8A L32F L8G. L20 CDC L2 F"
455 PRINT TAB(25);:COLOR CLR2,CLR1:PRINT"    P = ";:IF P<.000001 THEN PRINT "< 10 (-6)"; ELSE PRINT P;
460 PRINT TAB(50):PRINT:RETURN
465 PRINT TAB(TB);"There is ";:IF P>.05 THEN PRINT "NOT ";
470 PRINT "a significant difference between ";DI;TAB(75):COLOR CLR1,CLR2:RETURN
4025 ERASE D,CS,T,N$,X,X2,MD,SD
4030 DIM D(A,C),CS(A,C),T(A),N$(A),X(A),X2(A),MD(A),SD(A)
5000 BEEP:IF ERR<>53 AND ERR<>71 THEN 5010 ELSE LOCATE 10,10:PRINT "Please place EPISTAT in drive A: (or other default).":PRINT TAB(25);"Press any key to continue:"
5005 A$=INKEY$:IF A$="" THEN 5005 ELSE RESUME
5010 ON ERROR GOTO 0:END
