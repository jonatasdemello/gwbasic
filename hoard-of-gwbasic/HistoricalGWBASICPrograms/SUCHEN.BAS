10 REM
20 INPUT"Wort : ",W$
30 INPUT"File : ",F$
40 LET N=0
50 PRINT
60 OPEN "i",#1,F$
70 IF EOF(1) THEN GOTO 140
80 LINE INPUT #1,Z$
90 IF INSTR(Z$,W$) THEN GOTO 110
100 GOTO 70
110 PRINT Z$
120 LET N=N+1
130 GOTO 70
140 CLOSE #1
150 PRINT
160 PRINT W$;"steht in ",N;" Zeilen von ";F$
