SCREEN 12: DEFSNG A-Z
RingMover1 = .09
RingMover2 = .081
Stepper1 = .0191
Stepper2 = .0181
InterMultX1 = 4
InterMultY1 = 3.1
InterMultX2 = 4
InterMultY2 = 2.9
X1 = 311: Y1 = 29
X2 = 341: Y2 = 32
Min = 3
Max = 50
Twist1 = 2
Twist2 = 1
10 FOR Corner = Min TO Max
GOSUB 30
NEXT
FOR Corner = Max TO Min STEP -1
GOSUB 30
NEXT
20 A$ = INKEY$:
IF A$ = "1" THEN GOTO 10 ELSE GOTO 20
30 RingMover1 = RingMover1 + Stepper1
X1 = X1 + InterMultX1 * COS(Twist1 * RingMover1)
Y1 = Y1 + InterMultY1 * SIN(RingMover1)
EndX1 = X1 + Corner: EndY1 = Y1 + Corner
LINE (X1, Y1)-(EndX1, EndY1), 0, BF
LINE (X1, Y1)-(EndX1, EndY1), 15, B
RingMover2 = RingMover2 + Stepper2
X2 = X2 + InterMultX2 * COS(Twist2 * RingMover2)
Y2 = Y2 + InterMultY2 * SIN(RingMover2)
EndX2 = X2 + Corner: EndY2 = Y2 + Corner
LINE (X2, Y2)-(EndX2, EndY2), 0, BF
LINE (X2, Y2)-(EndX2, EndY2), 15, B
RETURN



