10 KEY OFF
20 CLS
25 PRINT "™ffne..."
30 OPEN "com2:9600,N,8,1,rs,cd,ds,cd" AS #1
35 PRINT "Lese..."
40 IN$ = INPUT$(34,#1)
45 PRINT "Gebe aus..."
50 FOR I=1 TO 34
60 PRINT ASC(MID$(IN$,I,1));", ";
70 NEXT
