10 CLS
20 PRINT"******************** Outrun-Motor-Sound ********************"
30 PRINT
40 PRINT"Bitte benutzen Sie die Tasten auf dem rechten Feld >>> 8,2,+,-,*,/,9,3,7,1,0,   [SPACE]"
50 PRINT
60 PRINT"Zum abbrechen bitte Space drcken !!!"
70 PRINT
80 PRINT"Zum Start bitte Taste drcken !!!"
90 A$=INKEY$:IF A$="" THEN 90
100 CLS
110 LOCATE 1,1:PRINT
120 PRINT"8= +1                            2= -1"
130 PRINT"+= +10                           -= -10"
140 PRINT"*= +100                          /= -100"
150 PRINT"9= +1000                         3= -1000"
160 PRINT"7= abschreckton [ca. 2.5 sec.]   1= abschreckton [dauer]"
170 IF A>0 THEN LOCATE 15,30:PRINT "      +";A;"      "
180 IF A<0 THEN LOCATE 15,30:PRINT "       ";A;"      "
190 IF A=0 THEN LOCATE 15,30:PRINT"     +/-";A;"      "
200 IF A<-3650 THEN A=-3600
210 SOUND 3700+A,1
220 B$=INKEY$:IF B$="8" THEN 360
230 IF B$="2" THEN 380
240 IF B$=" " THEN PRINT"^C":PRINT"BREAK in 170":END
250 IF B$="0" THEN A=0
260 IF B$="+" THEN A=A+10
270 IF B$="-" THEN A=A-10
280 IF B$="/" THEN A=A-100
290 IF B$="*" THEN A=A+100
300 IF B$="9" THEN A=A+1000
310 IF B$="3" THEN A=A-1000
320 IF B$="7" THEN SOUND 3077,20
330 IF B$="1" THEN A=-610
340 IF A>29050 THEN A=29000
350 GOTO 170
360 A=A+1
370 GOTO 170
380 A=A-1
390 GOTO 170
