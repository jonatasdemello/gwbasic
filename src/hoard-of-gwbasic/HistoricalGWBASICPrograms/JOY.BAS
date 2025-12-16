10 CLS
20 PRINT"Dies ist ein Joystick-Test fÅr den HCV 386-DX."
30 PRINT"DrÅcken Sie eine Taste zum Start !!!"
40 B$=INKEY$:IF B$="" THEN 40
50 CLS
60 PRINT"Left = 4-6     Right = 181-185     Up = 5-7     Down = 127-133"
70 PRINT"Fire Button 1 = -1                 Fire Button 2 = -1"
80 LOCATE 15,30
90 A=STICK(0):B=STICK(1)
100 C=STRIG(1):D=STRIG(4)
110 LOCATE 15,1
120 PRINT "                         Left/Right : ";A;"Up/Down : ";B;"                "
130 LOCATE 16,1
140 PRINT"                     Fire Button 1 : ";C;"Fire Button 2 : ";D;"                "
150 IF A=5 OR A=6 OR A=7 THEN LOCATE 15,1:PRINT"ÆÆÆ Left"
160 IF A=152 OR A=153 OR A=154 OR A=155 THEN LOCATE 15,60:PRINT"Right ØØØ"
170 IF B=5 OR B=6 OR B=7 THEN LOCATE 15,1:PRINT"7 Up"
180 IF B=151 OR B=152 OR B=153 OR B=154 OR B=155 THEN LOCATE 15,60:PRINT"8 Down"
190 IF C=-1 THEN LOCATE 16,1:PRINT"6 Fire Button 1"
200 IF D=-1 THEN LOCATE 16,61:PRINT"6 Fire Button 2"
210 B$=INKEY$:IF B$=" " THEN 230
220 GOTO 90
230 PRINT"^C"
240 PRINT"BREAK in 240"
250 A$="Quick"
260 LOAD"WINDOWS.BAS"
