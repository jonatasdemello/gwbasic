10 KEY OFF
30 WIDTH 80:SCREEN 0:COLOR 7,0:CLS
40 DIM F(53)
49 COLOR 0,7:PRINT SPC(79):LOCATE 1,1
50 PRINT TAB(5);"Growth Rate        and       Projections  via  Exponential Regression":COLOR 7,0
60 PRINT
70 PRINT
81 PRINT "    This program analyzes the trend (of some value) for past periods,"
82 PRINT "    computes an average growth rate, and projects future figures."
83 PRINT :PRINT "    If entering new data ---":PRINT "    You will be asked to specify the number of past periods, and then the number    of future periods to project.  ";
84 PRINT "For each of the past periods, you must then":PRINT "    enter the number of items. (the number must be non-zero)"
85 PRINT :PRINT "    The total number of periods (past + future) cannot exceed 52."
90 PRINT
100 PRINT
150 LINE INPUT;"Do you want to enter new <new> or review old <old> data ? ";TODO$:TODO$=LEFT$(TODO$,1)
160 IF TODO$="n" OR TODO$="N" THEN PRINT :GOTO 200
165 IF TODO$<>"o" AND TODO$<>"O" THEN PRINT:GOTO 150
170 PRINT :LINE INPUT"What is the file name of the old data you want to review ?";OLD$:OLD$=LEFT$(OLD$,12):LOCATE 25,10:PRINT "Please stand by while the file is read in";:IF OLD$="" THEN RUN
175 OPEN OLD$ FOR INPUT AS #1 : J=0
176 INPUT#1, TITLE$:INPUT #1, M,P
177 WHILE NOT EOF(1) : J=J+1:IF J>52 THEN 188 ELSE INPUT#1,F(J):WEND
188 GOTO 300
199 REM .. data entry
200 PRINT :LINE INPUT "How many past periods: ? ";M$:M=VAL(M$)
210 LINE INPUT "How many periods to project (future): ? ";P$:P=VAL(P$):IF P<0 THEN P=0
220 IF M+P>52 THEN PRINT :PRINT "ONLY 52 PERIODS PLEASE  !":GOTO 100
225 IF M=<0 THEN PRINT :PRINT "Number of past periods can't = ";M;"!":GOTO 100
230 PRINT
240 PRINT "Now enter amounts for past periods :"
250 PRINT
260 FOR J=1 TO M
270 PRINT "Period ";J;": ? ";
280 LINE INPUT;F$:F(J)=VAL(F$):IF F(J) > 0!  THEN 290
282 Y=CSRLIN:SOUND 40,20:LOCATE 25,1:PRINT "Sorry, you must enter a numeric value > 0";:LOCATE Y,1:PRINT SPC(30);:LOCATE Y,1:GOTO 270
290 PRINT :NEXT J
299 REM .. perform exponential regression
300 T=LOG(F(1)):TOTAL=0
310 V=0
320 FOR J=2 TO M
325 IF J>52 THEN J=52 GOTO 360
330 L=LOG(F(J))
340 T=T+L
350 V=V+(J-1)*L
360 NEXT J
370 A=6*(2*V/(M-1)-T)/M/(M+1)
380 A=EXP(A)-1
390 AGF=EXP(T/M-A*(M-1)/2)
399 REM .. project values for future periods
400 FOR J=M+1 TO M+P
410 F(J)=INT(AGF*(1+A)^(J-1)+.5)
420 NEXT J
430 MIN=F(1)
440 MAX=F(1)
450 FOR J=1 TO M+P
455 IF J<=M THEN TOTAL=TOTAL+F(J)
460 IF F(J)>MAX THEN MAX=F(J)
470 IF F(J)<MIN THEN MIN=F(J)
480 NEXT J
490 S=168/(MAX+MIN) : AVG=TOTAL/M  'find graph scale factor (s), 168 is number                                      of vertical dots space left
999 REM .. results in tabular form
1000 CLS:Y=1:X=1:ROW14=0:Y1=1
1010 FOR J=1 TO M
1030 LOCATE Y,X
1040 PRINT "Period #";J;F(J);
1042 Y=Y+1
1043 IF Y=14 THEN Y=1:X=X+20:ROW14=-1
1050 NEXT J
1051 IF ROW14 THEN Y=14:X=1 ELSE X=1
1052 LOCATE Y,X:FOR J1=1 TO 79 : PRINT CHR$(240);:NEXT:LOCATE Y,33:PRINT " PROJECTED ":Y=Y+1:Y1=Y
1053 FOR J=M+1 TO M+P : IF X>79 THEN X=1
1054 LOCATE Y,X
1055 PRINT "Period #";J;" ";F(J);:Y=Y+1
1056 IF Y=23 THEN Y=Y1:X=X+20
1058 NEXT J
1060 LOCATE 23,1:PRINT "** (Growth Rate =";INT(A*10000+.5)/100;"%";
1065 PRINT "   Average value for the past ";M;" periods = ";AVG;")";
1066 LOCATE 24,5:PRINT TITLE$;
1070 LOCATE 25,1:LINE INPUT;"Press  Return  to continue ... ";GOON$
1099 REM .. plot individual data points < scatter graph >
1100 GOSUB 2010
1110 FOR J=1 TO M+P
1120 IF J>M THEN C=1
1130 PSET (J*11+45,200-INT(S*F(J))),C
1140 NEXT J
1199 REM .. plot line graph
1200 GOSUB 2000
1202 FLAG!=0  'false
1205 IF ASC(A$)=27 THEN SCREEN 0 : GOTO 1000
1207 IF FLAG! THEN GOSUB 2010
1210 PSET (56,200-INT(S*F(1))),C
1220 FOR J=2 TO M+P
1230 IF J>M THEN C=1
1240 LINE -(J*11+45,200-INT(S*F(J))),C
1250 NEXT J
1260 REM .. plot individual data points, connect them with a line <line graph>
1262 GOSUB 2000
1264 FLAG!=0  'false
1266 IF ASC(A$)=27 THEN 1100
1268 IF FLAG! THEN GOSUB 2010
1269 IF M+P<24 THEN R1=2 ELSE R1=3   'used to set radius of circle on linegraph
1270 PSET (56,200-INT(S*F(1))),C  : CIRCLE (56,200-INT(S*F(1))),R1,1,,6.2831
1272 FOR J=2 TO M+P
1274 IF J>M THEN C=1
1276 P1=J*11+45 : P2=200-INT(S*F(J))
1278 LINE -(P1,P2),C : CIRCLE (P1,P2),R1,1,,6.2831  : PAINT (P1,P2),2,1
1280 NEXT J
1299 REM .. plot a bar graph
1300 GOSUB 2000
1303 IF ASC(A$)=27 THEN FLAG!=-1 : GOTO 1207
1310 FOR J=1 TO M+P
1320 IF J>M THEN C=1
1330 LINE (J*11+45,200)-(J*11+54,200-INT(S*F(J))),C,BF
1340 NEXT J
1399 REM .. store this data if requested
1400 A$=INPUT$(1) : IF ASC(A$)=27 THEN FLAG!=-1 : GOTO 1268
1402 SCREEN 0:WIDTH 80:CLS:LOCATE 3,1
1404 LINE INPUT;"Do you wish to review this data again ? ";YORN$:YORN1$=LEFT$(YORN$,1):IF YORN1$="y" OR YORN1$="Y" THEN 1000
1408 LOCATE 6,1:LINE INPUT;"Do you want to save this data  ? ";YORN$:YORN1$=LEFT$(YORN$,1):IF YORN1$<>"y" AND YORN1$<>"Y" AND YORN1$<>"n" AND YORN1$<>"N" THEN 1402
1409 IF YORN1$="n" OR YORN1$="N" THEN 1510
1410 LOCATE 8,1:LINE INPUT;"Please enter the file name (8 characters max) : ? ";FILENAME$:FILENAME$=LEFT$(FILENAME$,8):FILENAME$=FILENAME$+".gro"
1412 LOCATE 10,1:LINE INPUT;"Please specify a title for this data ? ";TITLE$
1420 OPEN FILENAME$ FOR OUTPUT AS #1:PRINT #1,LEFT$(TITLE$,70):PRINT #1, M;P
1430 FOR J=1 TO M+P : PRINT#1, F(J) : NEXT
1440 CLOSE#1
1510 SCREEN 0,0,0
1520 RUN
1999 REM .. select graphic screen resolution, choose colors (c), display titles             & scaled values.  Then return to perform the graph
2000 A$=INPUT$(1) : IF A$="" THEN A$="."  'dummy
2002 IF ASC(A$)=27 THEN RETURN
2010 CLS
2020 SCREEN 2,0 : IF M+P < 24 THEN SCREEN 1,0
2030 IF M+P < 24 THEN COLOR 0,7
2040 IF M+P < 24 THEN C=2 ELSE C=1
2050 PRINT "Average Growth Rate = ";INT(A*10000+.5)/100;"%";
2070 IF M+P<24 THEN PRINT :PRINT "Amount";:PRINT " ||    <----------- Periods ---------->": PRINT " \/    1  3   6   9   12  15  18  21  24";:GOTO 2088
2080 PRINT "   Average value for past";M;"periods =";AVG:PRINT "Amount  ";TITLE$:PRINT " ||    <------------------------------- Periods ------------------------------>"
2085 PRINT " \/    1  3   6   9   12  15  18  21 23  26  29  32 34 36 38  41  44  47  50  53";
2088 IF M+P<24 THEN 2200
2100 FOR J=5 TO 25 STEP 2:LOCATE J,1:PRINT INT((168-(J/5-1)*40)/S+.5);:NEXT:RETURN
2200 FOR J=5 TO 25 STEP 3:LOCATE J,1:PRINT INT((168-(J/5-1)*40)/S+.5);:NEXT:RETURN
