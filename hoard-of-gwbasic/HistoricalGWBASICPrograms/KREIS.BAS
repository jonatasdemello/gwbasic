10 SCREEN 1
20 WINDOW (0,0)-(31,39):CLS:PRINT TAB(10);"## Zufallskreise ##":PRINT
30 INPUT "min. : max. Radius : ",RM,RA:RA=RA-RM
40 INPUT "Anzahl             : ",N:CLS
50 FOR I=1 TO N
60 X=32*RND(1):Y=25*RND(1):R=RM+RA*RND(1)
70 CIRCLE (X,Y),R,7
80 NEXT
