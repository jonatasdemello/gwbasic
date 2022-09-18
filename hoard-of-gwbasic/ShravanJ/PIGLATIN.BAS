10 INPUT "enter a string of text ",A$
20 IF (LEFT$(A$,1)<> "i" ) AND (LEFT$(A$, 1) <>"e") AND (LEFT$(A$, 1) <> "i") AND (LEFT$(A$, 1) <> "o") AND (LEFT$(A$, 1) <> "u") THEN GOTO 70
30 LET C$ = MID$(A$, 2, LEN(A$) -1) + LEFT$(A$, 1) +"way"
40 IF LEFT$(C$, 1) = MID$(C$, 2, 1) THEN C$= MID$(C$, 2, LEN(C$)-1)
50 PRINT C$
60 GOTO 90
70 LET C$ = MID$(A$, 2, LEN(A$) -2) + RIGHT$(A$, 1) + LEFT$(A$, 1) + "ay"
80 PRINT C$
90 END
