SCREEN 12: DEFSNG A-Z
RingMover = 0
Stepper = .018
InterMultXL = 4.3
InterMultYL = 3
InterMultXS = 2
InterMultYS = 1.1
XL1 = 270: YL1 = 12
XS1 = -9: YS1 = -3
10 RingMover = RingMover + Stepper
XL1 = XL1 + InterMultXL * COS(RingMover)
YL1 = YL1 + InterMultYL * SIN(RingMover)
XS1 = XS1 + InterMultXS * COS(RingMover)
YS1 = YS1 + InterMultYS * SIN(RingMover)
XL2 = XL1 + ABS(XS1) + 9: YL2 = YL1 + ABS(YS1) + 3
LINE (XL1, YL1)-(XL2, YL2), 0, BF
LINE (XL1, YL1)-(XL2, YL2), 15, B
IF YL1 > 20 THEN GOTO 10
20 A$ = INKEY$
IF A$ = " " THEN GOTO 10 ELSE GOTO 20

