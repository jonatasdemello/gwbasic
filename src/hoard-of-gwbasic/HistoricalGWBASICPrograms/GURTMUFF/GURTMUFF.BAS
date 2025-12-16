10 CLS
20 COLOR 15
30 PRINT"Gurtmuffel¯"
40 PRINT"~`S. Heblik"
50 PRINT
60 PRINT"Eingabe:"
70 INPUT"Geschwindigkeit des Fahrzeugs [km/h] :",SPD
80 IF SPD=0 THEN 240
90 MS=SPD*1000/3600
100 H=.5*MS*MS/9.810001
110 STOCK=INT(H/2.8+.5)
120 PRINT"Aufprall entspricht einem Sprung aus ";INT(H*100)/100;"m Hîhe"
130 PRINT"bzw. aus der ";STOCK;"Etage!"
140 PRINT
150 IF SPD<10 THEN 190
160 IF SPD>=10 AND SPD<20 THEN 200
170 IF SPD>=20 AND SPD<50 THEN 210
180 IF SPD>=50 THEN 220
190 PRINT"Das gibt blo· 'ne Schramme!":GOTO 270
200 PRINT"Das kînnte schon eine Beule geben!":GOTO 270
210 PRINT"Das wird einiges anrichten!":GOTO 270
220 PRINT"Das ist ja LEBENSGEFéHRLICH!!!":GOTO 270
230 GOTO 270
240 PRINT"Mensch, gib' was vernÅnftiges ein! Kein Mensch kann"
250 PRINT"mit 0 km/h gegen einen Baum fahren. Das ist praktisch unmîglich!"
260 GOTO 270
270 END
