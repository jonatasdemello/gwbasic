SCREEN 13
A = 1: D = 16
A:
LINE (0, A)-(655, A), D
A = A + 1: D = D + 1: IF D > 30 THEN GOTO Backwards
GOTO A

Backwards:
B:
LINE (0, A)-(655, A), D
A = A + 1: D = D - 1: IF D = 16 THEN GOTO A
GOTO B


