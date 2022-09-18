ON ERROR GOTO uend
OPEN "I", 1, "Test.Asc"
INPUT #1, A
INPUT #1, B
INPUT #1, C
OPEN "O", 2, "Test.~AS"
WRITE #2, A, B, C
A:
INPUT #1, A
INPUT #1, B
WRITE #2, A, B
GOTO A

uend:

