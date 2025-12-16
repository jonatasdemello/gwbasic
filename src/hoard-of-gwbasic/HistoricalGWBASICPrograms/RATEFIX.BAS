10 CLS
20 PRINT
30 PRINT"Raten Sie eine Zahl zwischen 00 und 99 !!!"
40 PRINT
50 LET S=INT(RND(1)*100)
60 PRINT"Ihr Tip :";
70 INPUT G
80 IF G=S THEN 160
90 IF G>S THEN 130
100 PRINT"Zu klein bitte gr”áere Zahlen !!! >>>"
110 PRINT
120 GOTO 60
130 PRINT"Zu gross bitte kleinere Zahlen !!! <<<"
140 PRINT
150 GOTO 60
160 PRINT"Auf den Kopf getroffen !!!"
170 PRINT"Bitte Taste drcken !!!"
180 A$=INKEY$:IF A$="" THEN 180
190 CLS
200 LOCATE 1,1:PRINT"Nochmal Raten [Y/N] ??? >>> "
210 B$=INKEY$:IF B$="y" OR B$="Y" THEN LOCATE 1,1:PRINT"Nochmal Raten [Y/N] ??? >>> Yes":GOTO 300
220 IF B$="n" OR B$="N" THEN LOCATE 1,1:PRINT"Nochmal Raten [Y/N] ??? >>> No":GOTO 400
230 GOTO 200
300 FOR Z=0 TO 10000:NEXT Z
310 GOTO 10
400 FOR Z=0 TO 10000:NEXT Z
410 CLS
420 END
