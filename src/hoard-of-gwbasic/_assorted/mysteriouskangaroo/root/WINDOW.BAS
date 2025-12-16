DECLARE SUB DWindow (X!, Y!, XX!, YY!, C!)
SCREEN 0
CLS

CALL DWindow(5, 5, 10, 10, 1)

SUB DWindow (X, Y, XX, YY, C)
COLOR C
LOCATE Y, X, 0: PRINT "Ú"
LOCATE YY, X, 0: PRINT "À"
LOCATE Y, XX, 0: PRINT "¿"
LOCATE YY, XX, 0: PRINT "Ù"

FOR Count = (Y + 1) TO (YY - 1)
LOCATE Count, X, 0: PRINT "³"
LOCATE Count, XX, 0: PRINT "³"
NEXT Count

FOR Count = (X + 1) TO (XX - 1)
LOCATE Y, Count, 0: PRINT "Ä"
LOCATE YY, Count, 0: PRINT "Ä"
NEXT Count
END SUB



