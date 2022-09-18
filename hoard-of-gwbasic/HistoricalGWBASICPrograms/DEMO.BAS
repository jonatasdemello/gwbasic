1 CLS : REM Maus Basic Beispiel
2 PRINT"Dies ist ein Beispiel in Basic geschrieben, das den Mouse Driver Aufruf zeigt."
3 PRINT"        Details entnehmen sie bitte dem Help File [Help.com]."
4 PRINT
5 PRINT"                        Funktion:"
6 PRINT"   Linker Knopf = Ausdruck von Knopfstatus und Cursorposition (x,y)"
7 PRINT"   Rechter Knopf = Ende."
11 PRINT
15 DEFINT A-Z
18 DEF SEG=0
20 MSEG=256*PEEK(51*4+3)+PEEK(51*4+2)
30 MOUSE=256*PEEK(51*4+1)+PEEK(51*4)+2
40 IF MSEG OR  (MOUSE-2) THEN 60
50 PRINT "                   Mouse Driver not found":END
60 DEF SEG=MSEG
70 IF PEEK(MOUSE-2)=207 THEN 50
80 PRINT "                   Mouse Driver is installed"
100 M1%=0
110 CALL MOUSE(M1%, M2%, M3%, M4%)
120 S$ = "Fehler" : IF M1=-1 THEN S$ = "O.K."
140 PRINT "Status = ";S$
150 M1=10:M2=1:M3=2:M4=5
160 CALL MOUSE(M1%, M2%, M3%, M4%)
170 M1=1
180 CALL MOUSE(M1%, M2%, M3%, M4%)
190 M1 = 3
200 CALL MOUSE(M1%, M2%, M3%, M4%)
210 IF M2% = 0 THEN 190
220 PRINT"Button Status = ";M2,"Cursor Position: x = ";M3," y = ";M4
230 M1=2
240 CALL MOUSE(M1%, M2%, M3%, M4%)
250 IF M2 = 1 THEN 170
260 END
