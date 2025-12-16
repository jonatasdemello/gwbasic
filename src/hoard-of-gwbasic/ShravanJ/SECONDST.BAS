10 INPUT "enter a string ",A$
20 LET B$ = RIGHT$(A$,2) + MID$(A$, 2, LEN(A$) -3) + LEFT$(A$,1)
40 PRINT B$
50 END
