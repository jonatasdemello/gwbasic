10 CLS
20 LOCATE 12,1:PRINT "        Allumez votre imprimante et appuyer sur une touche"
30 A$=INPUT$(1)
40 LPRINT CHR$(27);"!"
50 LPRINT CHR$(18)
60 PRINT "Votre imprimante est configur‚e en mode Graphique !!! "
70 LOCATE 22,70:PRINT "Darche Yoann"
80 END
