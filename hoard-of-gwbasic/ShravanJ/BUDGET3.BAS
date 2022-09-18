10 CLS
20 D$=DATE$
30 DD = VAL(LEFT$(D$,2))
40 MM= VAL(MID$(D$, 4,2))
50 YY = VAL(RIGHT$(D$, 2))
60 RR = VAL(MID$(D$, 7, 2))
70 IF DD < 3 THEN DD = DD+12 ELSE GOTO 90
80 YY = YY -1
90 MM= FIX((MM+1)*2.61)
100 DOW = DD+MM+YY+(FIX(YY/4))+6
105 PRINT DOW
110 INPUT "What is your budget for this week? ",A
120 INPUT "How much have you spent today? ",B
130 IF B > A THEN GOTO 180
140 LET C = A - B
150 PRINT "You have spent $"B" today, so you have $"C" left to spend this week."
160 LET D = C / 6
170 PRINT "Since you have $"C" left to spend this week, you can spend $"D" everyday for the rest of this week."
180 IF B > A THEN LET F = B - A ELSE END
190 PRINT "You have gone $"F" over budget today."
200 LET G = A - F
210 LET H = G / 6
220 PRINT "Because you went $"F" over budget today, your budget for the rest of the week is $"G" so you can spend $"H" everyday for the rest of this week."
