10 REM * SHELL SORT *
100 DIM T : T=5 : DIM N(T)
110 DATA 9,7,3,5,11
120 FOR I=1 TO T
130 READ N(I)
140 NEXT I
170 LET C=T
180 LET C=INT(C/2)
190 IF C=0 THEN GOTO 330
200 LET D=T-C
210 LET E=1
220 LET F=E
230 LET G=F+C
240 IF N(F)<=N(G) THEN GOTO 300
245 GOSUB 550
250 LET TEMP=N(F)
260 LET N(F)=N(G)
270 LET N(G)=TEMP
280 LET F=F-C
290 IF F>0 THEN GOTO 230
300 LET E=E+1
310 IF E>D THEN GOTO 180
320 GOTO 220
330 PRINT "SORTED "
340 FOR I=1 TO T
350 PRINT N(I);" ";
360 NEXT I
380 PRINT "."
390 END
549 REM DEBUG
550 FOR I=1 TO T
560 PRINT N(I);" ";
570 NEXT I
580 PRINT ".";" C:";C;" D:";D;" E:";E;" F:";F;" G:";G
590 RETURN
