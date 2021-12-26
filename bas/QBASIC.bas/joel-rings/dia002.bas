SCREEN 12: DEFSNG A-Z
RingMover = 0
Stepper = .022
InterMultX = 5.1
InterMultY = 4
BoxMult = .27
X = 320: Y = 6
10 RingMover = RingMover + Stepper
X = X + InterMultX * COS(RingMover)
Y = Y + InterMultY * SIN(RingMover)
Q = Y * BoxMult
X1 = X - Q: Y1 = Y - Q
X2 = X + Q: Y2 = Y + Q
FOR XV = X1 TO X2 STEP 2
LINE (X, Y1)-(XV, Y), 0
LINE (X, Y2)-(XV, Y), 0
NEXT
LINE (X, Y1)-(X2, Y), 15
LINE (X2, Y)-(X, Y2), 15
LINE (X, Y2)-(X1, Y), 15
LINE (X1, Y)-(X, Y1), 15
20 A$ = INKEY$: IF A$ = " " XOR Y < 10 THEN GOTO 20
GOTO 10






