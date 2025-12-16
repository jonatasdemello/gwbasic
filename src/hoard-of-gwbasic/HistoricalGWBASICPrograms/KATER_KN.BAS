10 CLS
20 INPUT"Zahl [1.....9] : ",A
30 IF A<1 OR A>9 THEN CLS:GOTO 20
40 INPUT"Zahl [1.....9] : ",B
50 IF B<1 OR B>9 THEN CLS:GOTO 40
60 INPUT"Zahl [1.....9] : ",C
70 IF C<1 OR C>9 THEN CLS:GOTO 80
80 CLS
90 ON A GOTO 130,140,150,160,170,180,190,200,210
100 ON B GOTO 220,230,240,250,260,270,280,290,300
110 ON C GOTO 310,330,350,370,390,410,430,450,470
120 RUN
130 PRINT"Mein Tîchterchen hat einen Spatz, das ist ihr allergrî·ter Schatz.":GOTO 100
140 PRINT"Es wohnt im Zoo ein Elefant, der ist den Kindern wohlbekannt.":GOTO 100
150 PRINT"Bestimmt kennt ihr den Kater Kno, der liegt den ganzen Tag im Stroh.":GOTO 100
160 PRINT"Der Taxifahrer Hermann Bont fÑhrt nie zu schnell, doch sehr gekonnt.":GOTO 100
170 PRINT"Vor unsrer HaustÅr sitzt ein Hund, der wiegt schon fÅnfunddrei·ig Pfund.":GOTO 100
180 PRINT"Wir haben einen bunten Hahn, der fÑhrt gern mit der Eisenbahn.":GOTO 100
190 PRINT"Ein Turner turn am Reck mit Schwung und mit sehr viel Begeisterung.":GOTO 100
200 PRINT"Mein Bruder Hans hat einen Zahn mit einem Loch wie ein Vulkan.":GOTO 100
210 PRINT"Ein kleiner Kaktus steht am Fenster und sieht angeblich nachts Gespenster.":GOTO 100
220 PRINT"Er zwietscht und zwatscht von frÅh bis spÑt, obwohl ihm nie ein Lied gerÑt.":GOTO 110
230 PRINT"Fri·t hundert Kilo Heu am Tag, viel Brot und was er sonst noch mag.":GOTO 110
240 PRINT"FÑngt er sich eine kleine Maus, schimpft er sie sieben Stunden aus.":GOTO 110
250 PRINT"FÑhrt fÅnfzehn Jahre unfallfrei, und das freut auch die Polizei.":GOTO 110
260 PRINT"Er spitzt die Ohren, lauscht und blefft und blifft und blafft und blîfft und    klÑfft.":GOTO 110
270 PRINT"An jedem Tag legt er ein Ei und sonntags sogar zwei bis drei.":GOTO 110
280 PRINT"Und manchmal turnt er mit Luise auf unserer HimmelsschlÅsselwiese.":GOTO 110
290 PRINT"Ach wÅrde er zum Zahnarzt gehn, dann kînnte jeder das verstehn.":GOTO 110
300 PRINT"Er bildet sich das zwar nur ein, denn er ist wirklich noch sehr klein.":GOTO 110
310 PRINT"Und badet im Aqarium vor dem vergnÅgten Publikum."
320 A$=INKEY$:IF A$="" THEN 320 ELSE RUN
330 PRINT"Und abends kettet man ihn an, damit ihn keiner stehlen kann."
340 A$=INKEY$:IF A$="" THEN 340 ELSE RUN
350 PRINT"Dann wischt er sich den Bart und stîhnt:Ach, wie ist man doch schon verwîhnt."
360 A$=INKEY$:IF A$="" THEN 360 ELSE RUN
370 PRINT"Doch jede dritte Nacht im Traum fÑhrt er an einen dicken Baum."
380 A$=INKEY$:IF A$="" THEN 380 ELSE RUN
390 PRINT"Kommt ein Gewitter, rei·t er aus und kricht vor Angst ins HÅhnerhaus."
400 A$=INKEY$:IF A$="" THEN 400 ELSE RUN
410 PRINT"Vieleicht war euch das nicht bekannt? Ich finde, es ist allerhand."
420 A$=INKEY$:IF A$="" THEN 420 ELSE RUN
430 PRINT"Bestimmt fÑhrt er zur Olympiade, wenn nicht, dann wÑre das sehr schade."
440 A$=INKEY$:IF A$="" THEN 440 ELSE RUN
450 PRINT"Ist auch geschwollen sein Gesicht, bedauern sollte man ihn nicht."
460 A$=INKEY$:IF A$="" THEN 460 ELSE RUN
470 PRINT"Ich gie· ihn jetzt mit Hustentee, da wÑchst er schnell wie Kuckucksklee."
480 A$=INKEY$:IF A$="" THEN 480 ELSE RUN
