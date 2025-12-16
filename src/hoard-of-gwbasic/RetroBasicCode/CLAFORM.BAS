OPEN #10 OUTPUT "B:CLAFOR.DAT"
blanc$="      "
 LABEL essai
INPUT "Nom de la Touche";a$
50 PRINT "Taper la Touche"
IF a$="END" THEN GOTO fin
75 a=INKEY
100 IF a=-1 GOTO 75
a$=a$+RIGHT$(blanc$,6-LEN(a$))
PRINT #10,a$;STR$(a)
PRINT a$;STR$(a)
200 GOTO essai
LABEL fin
CLOSE #10
END

