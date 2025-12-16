10 REM Anzeige der Farben
15 SHELL "MODE CO80"
20 CLS
30 COLOR 15:PRINT"Normale Farben:"
40 COLOR 15:PRINT"00 - Schwarz       ";:COLOR 1:PRINT"01 - Dunkelblau    ";:COLOR 2:PRINT"02 - DunkelgrÅn    ";:COLOR 3:PRINT"03 - Dunkelcyan"
50 COLOR 4:PRINT"04 - Dunkelrot     ";:COLOR 5:PRINT"05 - Dunkelviolett ";:COLOR 6:PRINT"06 - Braun         ";:COLOR 7:PRINT"07 - Hellgrau"
60 COLOR 8:PRINT"08 - Grau          ";:COLOR 9:PRINT"09 - Blau          ";:COLOR 10:PRINT"10 - HellgrÅn      ";:COLOR 11:PRINT"11 - Hellblau"
70 COLOR 12:PRINT"12 - Hellrot       ";:COLOR 13:PRINT"13 - Hellviolett   ";:COLOR 14:PRINT"14 - Gelb          ";:COLOR 15:PRINT"15 - Wei·"
80 PRINT
90 PRINT"Blinkende Farben:"
100 COLOR 31:PRINT"16 - Schwarz       ";:COLOR 17:PRINT"17 - Dunkelblau    ";:COLOR 18:PRINT"18 - DunkelgrÅn    ";:COLOR 19:PRINT"19 - Dunkelcyan"
110 COLOR 20:PRINT"20 - Dunkelrot     ";:COLOR 21:PRINT"21 - Dunkelviolett ";:COLOR 22:PRINT"22 - Braun         ";:COLOR 23:PRINT"23 - Hellgrau"
120 COLOR 24:PRINT"24 - Grau          ";:COLOR 25:PRINT"25 - Blau          ";:COLOR 26:PRINT"26 - HellgrÅn      ";:COLOR 27:PRINT"27 - Hellblau"
130 COLOR 28:PRINT"28 - Hellrot       ";:COLOR 29:PRINT"29 - Hellviolett   ";:COLOR 30:PRINT"30 - Gelb          ";:COLOR 31:PRINT"31 - Wei·"
140 COLOR 15
150 A$=INKEY$:IF A$="" THEN 150
for x=0 to 15
  color ,,x
next x
