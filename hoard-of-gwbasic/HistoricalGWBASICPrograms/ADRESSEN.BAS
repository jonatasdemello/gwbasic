10 'Adressendisc
20 DIM I$(50,6)
30 CLS:PRINT"1 = LADEN 2 = SUCHEN 3 = DRUCKEN 4 = EINGABE 5 = éNDERN 6 = SPEICHERN 7 = ENDE"
40 INPUT "Geben Sie die Ziffer die vor dem MenÅ steht ein --> ";S
50 IF S<1 OR S>7 THEN 40 ELSE 60
60 PRINT"Sie haben das MenÅ ";S;" gewÑhlt !!!"
70 INPUT"Stimmt das ??? (Yes/No) :";A$
80 IF A$="yes" OR A$="Yes" THEN GOTO 110
90 IF A$="no" OR A$="No" THEN RUN
100 GOTO 60
110 ON S GOSUB 840,490,600,130,300,960,830
120 GOTO 30
130 N=E+1
140 PRINT"Dateinummer: ";N
150 PRINT"---------------------------------------------------"
160 INPUT"Vorname Name          ";I$(N,1)
170 INPUT"Geburtsdatum,-ort     ";I$(N,2)
180 INPUT"Strasse               ";I$(N,3)
190 INPUT"Plz. Ort              ";I$(N,4)
200 INPUT"Telefon No.           ";I$(N,5)
210 INPUT"Besondere Kennzeichen ";I$(N,6)
220 IF S=5 THEN 400
230 E=N
240 PRINT"---------------------------------------------------"
250 PRINT"w=weiter   m=MenÅ"
260 PRINT"==================================================="
270 A$=INKEY$:IF A$="w"OR A$="W"THEN 130
280 IF A$="m"OR A$="M"THEN 30 ELSE 270
290 RETURN
300 N=N-N
310 N=N+1:IF N=0 THEN 30 ELSE 320
320 PRINT"Dateinummer: ";N
330 PRINT"---------------------------------------------------"
340 PRINT"Vorname Name         : ";I$(N,1)
350 PRINT"Geburtsdatum,-ort    : ";I$(N,2)
360 PRINT"Strasse              : ";I$(N,3)
370 PRINT"Plz. Ort             : ";I$(N,4)
380 PRINT"Telefon No.          : ";I$(N,5)
390 PRINT"Besondere Kennzeichen: ";I$(N,6)
400 PRINT"---------------------------------------------------"
410 PRINT"w=weiter   m=MenÅ   z=zurÅck   Ñ=Ñndern   d=drucken"
420 PRINT"==================================================="
430 A$=INKEY$:IF A$="w"OR A$="W"THEN 310
440 IF A$="z"OR A$="Z"THEN N=N-2:GOTO 310
450 IF A$="Ñ"OR A$="é" THEN 140
460 IF A$="d"OR A$="D"THEN GOSUB 600
470 IF A$="m"OR A$="M"THEN 30 ELSE 430
480 RETURN
490 INPUT"Wort  : ",W$
500 GOTO 840
510 PRINT"Vorname Name   : ";I$(Y,1);
520 PRINT"Stra·e    : ";I$(Y,3)
530 PRINT"Wohnort   : ";I$(Y,4)
540 PRINT"Telefon Nr: ";I$(Y,5)
550 PRINT
560 PRINT"w = weiter     m = MenÅ"
570 PRINT:N=Y
580 A$=INKEY$:IF A$="w"OR A$="W"THEN 920
590 IF A$="m"OR A$="M"THEN CLOSE 1:GOTO 30 ELSE 580
600 LPRINT CHR$(15);
610 LPRINT" Markus Birth"
620 LPRINT" Musterstrasse 1"
630 LPRINT" W-1000 Berlin 20"
640 LPRINT CHR$(18);
650 LPRINT CHR$(27);"E";
660 FOR I=1 TO 10
670 LPRINT
680 NEXT
690 PRINT"Anrede : f = Frau      h = Herrn     andere Taste = ohne Anrede"
700 A$=INKEY$:IF A$="f"OR A$="F"THEN 730
710 IF A$="h"OR A$="H"THEN 740
720 IF A$=" "THEN 760 ELSE 700
730 LPRINT TAB(35)"Frau":GOTO 750
740 LPRINT TAB(35)"Herrn"
750 LPRINT
760 LPRINT TAB(35) I$(N,2);" ";I$(N,1)
770 LPRINT
780 LPRINT TAB(35) I$(N,4)
790 LPRINT
800 LPRINT TAB(35) I$(N,5)
810 LPRINT CHR$(27);"F";
820 RETURN
830 END
840 OPEN "i",1,"adressen"
850 INPUT#1,E
860 FOR Y=1 TO E
870 FOR Z=1 TO 6
880 IF EOF(1)THEN 940
890 INPUT#1,I$(Y,Z)
900 IF S=1 THEN 920
910 IF INSTR(I$(Y,Z),W$)THEN 500 ELSE 920
920 NEXT Z,Y
930 INPUT#1,E
940 CLOSE 1
950 RETURN
960 PRINT"s=speichern    m=MenÅ"
970 A$=INKEY$:IF A$="s"OR A$="S"THEN 990
980 IF A$="m"OR A$="M"THEN 30 ELSE 970
990 OPEN"o",1,"adressen"
1000 PRINT#1,E
1010 FOR Y=1 TO E
1020 FOR Z=1 TO 6
1030 PRINT#1,I$(Y,Z)
1040 NEXT Z,Y
1050 PRINT#1,E
1060 CLOSE 1
1070 RETURN
