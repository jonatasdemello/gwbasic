10 CLS
20 COLOR 12:LOCATE 1,35:PRINT"Self-Check"
30 COLOR 10:PRINT:PRINT"Testing..."
40 PRINT
50 COLOR 15:PRINT"Sound-Blaster Pro card ";:A=5:GOSUB 10010
60 COLOR 15:PRINT"Motherboard ";:A=6:GOSUB 10010
10000 END:REM *** Ende wegen folgenden GOSUB...RETURN-Schleifen ***
10010 REM *** Punkt- und OK-Schleife ***
10020 GOSUB 10040:PRINT".";:GOSUB 10040:PRINT".";:GOSUB 10040:PRINT".";:GOSUB 10040:LOCATE A,70:COLOR 26:PRINT"OK"
10030 RETURN
10040 REM *** Zeitschleife ***
10050 FOR Z=0 TO 5000:NEXT Z
10060 RETURN
