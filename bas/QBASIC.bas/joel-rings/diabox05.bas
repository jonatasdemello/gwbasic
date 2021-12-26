SCREEN 12: DEFSNG A-Z
RingMover = 0
Stepper = .026
InterMultX = 6
InterMultY = 4.5
BoxMult = .25
X = 300: Y = 7
SquAddX = 0
SquAddY = -20
SquDiv = 1.4
10 RingMover = RingMover + Stepper
X = X + InterMultX * COS(RingMover)
Y = Y + InterMultY * SIN(RingMover)
Q = Y * BoxMult
X1 = X - Q: Y1 = Y - Q: X2 = X + Q: Y2 = Y + Q
LINE (X2 / SquDiv + SquAddX, 479 - Y / SquDiv + SquAddY)-(X / SquDiv + SquAddX, 479 - Y2 / SquDiv + SquAddY), 0, BF
LINE (X2 / SquDiv + SquAddX, 479 - Y / SquDiv + SquAddY)-(X / SquDiv + SquAddX, 479 - Y2 / SquDiv + SquAddY), 15, B
FOR XV = X1 TO X2 STEP 1
LINE (X, Y1)-(XV, Y), 0
LINE (X, Y2)-(XV, Y), 0
NEXT
LINE (X, Y1)-(X2, Y), 15
LINE (X2, Y)-(X, Y2), 15
LINE (X, Y2)-(X1, Y), 15
LINE (X1, Y)-(X, Y1), 15
20 A$ = INKEY$: IF A$ = " " XOR Y < 10 THEN GOTO 20
GOTO 10

