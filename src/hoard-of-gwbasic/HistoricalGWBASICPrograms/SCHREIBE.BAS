10 CLS
20 COLOR 15
30 B$=INKEY$:IF B$="" THEN 30
40 IF B$="/" THEN 80
50 IF B$="*" THEN CLS
60 PRINT B$;
70 GOTO 30
80 CLS
90 COLOR 4
100 READ A$
110 FOR Z=0 TO 1000:NEXT
120 IF A$="en" THEN GOTO 170
130 PRINT A$
140 GOTO 90
160 DATA "**************"," ************","  **********","   ********","    ******","     ****","      **","     ****","    ******","   ********","  **********"," ************","**************","en"
170 RESTORE
180 Z$=INKEY$:IF Z$=" " THEN 10
190 GOTO 180
