10 INPUT "enter a sentence: "; S$
15 WHILE S$ <> ""
20 S = INSTR(S$, " ")
21 IF S > 0 THEN GOTO 27
22 IF S = 0 THEN A$= S$
25 S$=""
26 GOTO 38
27 IF S > 0 THEN A$ = LEFT$(S$, S-1)
28 S$ = MID$(S$, S+1, LEN(S$)-S)
30 FOR I = 1 TO LEN(S$)
32 IF LEFT$(S$, 1) = " " THEN S$ =  RIGHT$(S$, LEN(S$)-1) ELSE GOTO 38
33 REM IF LEFT$(S$, 1) <> " " THEN GOTO 38 ELSE S$= RIGHT$(S$, LEN(S$-1))
34 NEXT I
38 GOSUB 1010
40 WEND
50 END
1010 IF (LEFT$(A$, 1) <> "a") AND (LEFT$(A$,1)<> "i" ) AND (LEFT$(A$, 1) <>"e") AND (LEFT$(A$, 1) <> "i") AND (LEFT$(A$, 1) <> "o") AND (LEFT$(A$, 1) <> "u") THEN GOTO 1060
1020 C$= A$ + "way"
1040 PRINT C$ ; " ";
1050 GOTO 2000
1060 FOR V = 1 TO LEN(A$)
1070 L$ = MID$(A$, V, 1)
1080 IF L$ = "a" OR L$ = "e" OR L$ = "i" OR L$ = "o" OR L$ = "u" THEN GOTO 1110
1090 NEXT V
1110 C$= RIGHT$(A$, LEN(A$)-V+1) + LEFT$(A$, V-1) + "ay"
1120 PRINT C$; " " ;
2000 RETURN
