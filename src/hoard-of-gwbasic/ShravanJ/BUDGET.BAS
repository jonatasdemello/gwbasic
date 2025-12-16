5 CLS
10 INPUT "What is your budget for today? ",A
20 INPUT "How much have you spent so far? ",B
30 IF B > A THEN GOTO 60
40 LET C = A - B
50 PRINT "Your budget for today was $"A" and so far you have spent $"B" so you have $"C" left for today.
60 LET D = B - A
65 IF A > B THEN END
70 PRINT "Looks like you are $"D" over budget for today!"
80 INPUT "Since you have gone over budget for today, I can calculate how much you can set as your budget for tomorrow. What is your budget for tomorrow? ",E
90 LET F = E - D
100 PRINT "Because you went over budget today, your budget for tomorrow is $"F" "
