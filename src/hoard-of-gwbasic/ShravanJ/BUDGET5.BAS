1 CLS
2 D$ = DATE$
3 MM = VAL(LEFT$(D$, 2))
4 MM=MM+1
5 MM = FIX(MM*2.61)
6 DD = VAL(MID$(D$, 4,2))
7 YY = VAL(RIGHT$(D$, 2))
8 DOW = DD + MM + YY + FIX(YY/4) + 6
9 LET DOW2 = DOW MOD 7
10 CLS
20 INPUT "What is your budget for this week? ",A
30 INPUT "How much have you spent today? ",B
40 IF B > A THEN GOTO 90
50 LET C = A - B
60 PRINT "You have spent $"B" today, so you have $"C" left to spend this week."
70 LET D = C / (7 - dow2)
80 PRINT "Since you have $"C" left to spend this week, you can spend $"D" everyday for the rest of this week."
90 IF B > A THEN LET F = B - A ELSE END
100 PRINT "You have gone $"F" over budget today."
110 LET G = A - F
120 LET H = G / (7 - dow2)
130 PRINT "Because you went $"F" over budget today, your budget for the rest of the week is $"G" so you can spend $"H" everyday for the rest of this week."

