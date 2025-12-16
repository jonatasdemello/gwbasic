OPEN "B", 1, "Test.dat"
A$ = "Hello"
B$ = "This is a test of the OPEN statment to see if I can"
C$ = "do somthing I want to do."
PUT #1, 1, A$
PUT #1, 256, B$
PUT #1, 512, C$
CLOSE

