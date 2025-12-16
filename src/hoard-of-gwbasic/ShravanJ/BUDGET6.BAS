10 CLS
20 D$ = DATE$
30 month = VAL(LEFT$(D$, 2))
40 input "Enter in your yearly budget ",a
50 input "Enter in how much you have spent so far ",b
60 if b > a then goto 100
70 let c = a - b
80 let d = c / (12 - month)
90 print "You have $ "c" remaining so you can spend $ "d" every month for the rest of the year."
100 if b > a then let e = b - a else end
110 let f = a - e
120 let g = f / (12 - month)
130 print "You have gone $"e" over budget, so your new yearly budget is $"f". You can now spend $"g" every month for the rest of this year."


