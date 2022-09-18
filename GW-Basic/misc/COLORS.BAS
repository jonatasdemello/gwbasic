CLS
A = 0: B = 0: C = 30: D = 40: F = 1

A:
N$ = ""
IF A = 1 THEN N$ = N$ + "BR": A$ = "1"
IF B = 0 THEN IF A = 1 THEN B$ = "1"
IF B = 5 THEN N$ = N$ + "BL": B$ = "5"
IF C = 30 THEN N$ = N$ + "BK": C$ = "30"
IF C = 31 THEN N$ = N$ + "RE": C$ = "31"
IF C = 32 THEN N$ = N$ + "GR": C$ = "32"
IF C = 33 THEN N$ = N$ + "YE": C$ = "33"
IF C = 34 THEN N$ = N$ + "BL": C$ = "34"
IF C = 35 THEN N$ = N$ + "MA": C$ = "35"
IF C = 36 THEN N$ = N$ + "CY": C$ = "36"
IF C = 37 THEN N$ = N$ + "WH": C$ = "37"
IF D = 40 THEN N$ = N$ + "BK": D$ = "40"
IF D = 41 THEN N$ = N$ + "RE": D$ = "41"
IF D = 42 THEN N$ = N$ + "GR": D$ = "42"
IF D = 43 THEN N$ = N$ + "YE": D$ = "43"
IF D = 44 THEN N$ = N$ + "BL": D$ = "44"
IF D = 45 THEN N$ = N$ + "MA": D$ = "45"
IF D = 46 THEN N$ = N$ + "CY": D$ = "46"
IF D = 47 THEN N$ = N$ + "WH": D$ = "47"
M$ = CHR$(27) + "[" + A$ + ";" + B$ + ";" + C$ + ";" + D$ + "m"
PRINT F
OPEN "O", 1, N$
PRINT #1, M$
CLOSE
F = F + 1
IF Z > 0 THEN GOTO D
C = C + 1
IF C > 37 THEN IF A = 0 THEN A = A + 1: C = 30
IF C > 37 THEN IF A = 1 THEN D = D + 1: A = 0: : B = 0: C = 30: GOTO A
IF D > 47 THEN Z = 1: B = 5: C = 30: D = 40: A = 0: GOTO D
GOTO A

D:
C = C + 1
IF C > 37 THEN IF A = 0 THEN A = A + 1: C = 30
IF C > 37 THEN IF A = 1 THEN D = D + 1: A = 0: : B = 5: C = 30: GOTO A
IF D > 47 THEN BEEP: END
GOTO A

