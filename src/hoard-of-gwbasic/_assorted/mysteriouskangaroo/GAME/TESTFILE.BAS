DECLARE SUB Dialog (X!, Y!, CC!, C!, M$)
SCREEN 12
Dialog 0, 0, 1, 15, "This is a test of a Dialog box"
Dialog 0, 80, 5, 14, "Why am I testing this! It's a waste of time!"
Dialog 80, 160, 4, 11, "I'm testing it to see if it works right!"
Dialog 80, 225, 2, 9, "It works just fine!"
LOCATE 13: INPUT enter

SUB Dialog (X, Y, CC, C, M$)
A = LEN(M$)

LINE (X, Y)-(X + A * 8 + 16, Y + 45), CC, B
LINE (X + 1, Y + 1)-(X + A * 8 + 16 - 1, Y + 44), CC, B
LINE (X + 3, Y + 3)-(X + A * 8 + 16 - 3, Y + 42), CC, B

Y = Y + 32
B = Y / 16
X = X + 16
BB = X / 8
LOCATE B, BB, 0: COLOR C: PRINT M$
END SUB

