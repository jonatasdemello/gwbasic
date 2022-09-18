10 KEY 1,"RUN"+CHR$(13)
20 KEY 2,"LOAD"+CHR$(34)
30 KEY 3,"LIST"+CHR$(13)
40 KEY 4,""
50 KEY 5,"LIST -"
60 KEY 6,"COLOR 15,0"+CHR$(13)
70 KEY 7,"SYSTEM"+CHR$(13)
80 KEY 8,"KEY LIST"+CHR$(13)
90 KEY 9,"CLS"+CHR$(13)
100 KEY 10,"SAVE"+CHR$(34)+"KARTENTR"+CHR$(34)+CHR$(13)
110 KEY OFF
120 COLOR ,7
130 CLS
140 COLOR 0:PRINT"     |============| |============| |============| |============|"
150 COLOR 0:PRINT"     |      4     | | 14     2   | |       14   | |    3   9   |"
160 COLOR 0:PRINT"     |   6     5  | | 3    11  6 | |   11   15  | |  13        |"
170 COLOR 0:PRINT"     |   13   14  | |   10   15  | |  13  9  10 | |  7   5  1  |"
180 COLOR 0:PRINT"     | 7  12   15 | |       7    | |    8   12  | |  15    11  |"
190 COLOR 0:PRINT"     |============| |============| |============| |============|"
200 PRINT
210 COLOR 12:PRINT"        Karte   1      Karte  2       Karte  3       Karte  4"
220 COLOR 0:PRINT
230 COLOR 10:PRINT"Denken Sie sich eine Zahl von 0-15 aus !!!"
240 PRINT"Schauen Sie nach auf welcher Karte Ihre Zahl ist."
250 PRINT"Tippen Sie jetzt [j]a oder [n]ein ein. z.B.->Karte 2 :j"
260 PRINT"                                             Karte 3 :n"
270 PRINT
280 PRINT"Karte 1 :"
290 A$=INKEY$:IF A$="" THEN 290
300 PRINT"Karte 2 :"
310 B$=INKEY$:IF B$="" THEN 310
320 PRINT"Karte 3 :"
330 C$=INKEY$:IF C$="" THEN 330
340 PRINT"Karte 4 :"
350 D$=INKEY$:IF D$="" THEN 350
360 PRINT
370 A=0
380 IF A$="j" OR A$="J" THEN A=A+4
390 IF B$="j" OR B$="J" THEN A=A+2
400 IF C$="j" OR C$="J" THEN A=A+8
410 IF D$="j" OR D$="J" THEN A=A+1
420 COLOR 12:PRINT"Die gesuchte Zahl lautet ---> ---> ---> : ";A
430 COLOR 10:PRINT
440 PRINT"Wollen Sie noch einmal spielen [j]a/[n]ein ???"
450 Z$=INKEY$:IF Z$="j" OR Z$="J" THEN RUN
460 IF Z$="n" OR Z$="N" THEN COLOR 7,0:CLS:KEY ON:END
470 GOTO 450
