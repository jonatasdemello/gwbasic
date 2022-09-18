10 INPUT "enter a string ",A$
20 LET B$= MID$(A$, 2, LEN(A$) -1) + LEFT$(A$,1)
40 PRINT B$
50 END
