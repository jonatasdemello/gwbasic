10 REM * BUBBLE SORT *
100 DIM T : T=5 : DIM N(T)
110 DATA 9,7,3,5,11
120 FOR I=1 TO T
130 READ N(I)
140 NEXT I
170 LET MAX=T
175 LET X=0
180 FOR C=1 TO T-1
190 LET S1=N(C):LET S2=N(C+1)
200 IF S1<=S2 THEN GOTO 250
205 GOSUB 350
210 LET TEMP=N(C)
220 LET N(C)=N(C+1)
230 LET N(C+1)=TEMP
240 LET X=X+1
250 NEXT C
260 IF X>0 THEN LET T=T-1:GOTO 175
270 PRINT "SORTED:"
280 FOR I=1 TO MAX
290 PRINT N(I);" ";
300 NEXT I
340 END
350 FOR I=1 TO MAX
360 PRINT N(I);" ";
370 NEXT I
380 PRINT "."
390 RETURN
