5 CLS
10 PRINT " Digite a mensagem: "
15 INPUT M$
20 LET L = LEN(M$)
30 FOR N = 1 TO L
40 LET A = ASC(MID$(M$, N, 1)) - 1
50 PRINT CHR$(A);
60 NEXT N
70 PRINT
80 PRINT " Mais alguma mensagem? (S/N) "
90 INPUT R$
100 IF R$ = "S" THEN GOTO 10
110 END

