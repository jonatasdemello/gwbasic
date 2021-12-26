SCREEN 12: DEFSNG A-Z
RingMover = 0
Stepper = .0228
InterMultX = 5.1
InterMultY = 4
BoxMult = .2
X = 320: Y = 60
Min = 4
Max = 49
10 FOR Q = Min TO Max STEP 1
GOSUB 30
NEXT Q
FOR Q = Max TO Min STEP -1
GOSUB 30
NEXT Q
20 A$ = INKEY$
IF A$ = " " THEN GOTO 10 ELSE GOTO 20
30 RingMover = RingMover + Stepper
X = X + InterMultX * COS(RingMover)
Y = Y + InterMultY * SIN(RingMover)
X1 = X - Q: Y1 = Y - Q: X2 = X + Q: Y2 = Y + Q
FOR XV = X1 TO X2 STEP 1
LINE (X, Y1)-(XV, Y), 0
LINE (X, Y2)-(XV, Y), 0
NEXT XV
LINE (X, Y1)-(X2, Y), 15
LINE (X2, Y)-(X, Y2), 15
LINE (X, Y2)-(X1, Y), 15
LINE (X1, Y)-(X, Y1), 15
RETURN

