0'Prog = -------SCMDUMP-------
1 'no nonsense Graphics Sideways memory DUMP for C.ITOH 8510 PROWRITER
2 'Author: Herb Shear;
11 'NEC 8023 may require `[' (incremental) rather than `>" (unidirectional).
20 KEY OFF:DEFINT A-Z:DEF SEG=&HB800:WIDTH"LPT1:",255:E$=CHR$(27)
30 LPRINT CHR$(29)" "E$"A"STRING$(4,10)E$"T16"E$"N"E$"L010"E$">"CHR$(15)E$"P";
40 FOR Y=1 TO 80:LPRINT E$"S1000";:FOR X=80 TO 8000 STEP 80:K=X-Y:LPRINT STRING$(5,PEEK(K))STRING$(5,PEEK(K+8192));:NEXT:LPRINT:NEXT:LPRINT CHR$(10)E$"A"STRING$(8,10)CHR$(29)" "E$"<"CHR$(15)E$"N"E$"L000";:WIDTH"LPT1:",80:END
