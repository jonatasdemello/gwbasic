OPEN #10 APPEND "B:CLAVIER.DAT"
 LABEL essai
INPUT "Nom de la Touche";a$
50 PRINT "Taper la Touche"
IF a$="END" THEN GOTO fin
75 a=INKEY
100 IF a=-1 GOTO 75
PRINT #10,a$;STR$(a)
PRINT a$;STR$(a)
200 GOTO essai
LABEL fin
CLOSE #1
END

