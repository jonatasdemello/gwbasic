SCREEN 11: DEFSNG A-Z
RingMover = 0 'Circles around ring
Stepper = .0131
InterMultX = 3
InterMultY = 3
BoxMultX1 = .3
BoxMultY1 = .02
BoxMultX2 = .3
BoxMultY2 = .02
X = 320: Y = 6
10 RingMover = RingMover + Stepper
X = X + InterMultX * COS(RingMover)
Y = Y + InterMultY * SIN(RingMover)
StartX = X - Y * BoxMultX1: StartY = Y - Y * BoxMultY1
EndX = X + Y * BoxMultX2: EndY = Y + Y * BoxMultY2
LINE (StartX, StartY)-(EndX, EndY), 0, BF
LINE (StartX, StartY)-(EndX, EndY), 1, B
GOTO 10






