10 CLS
20 PRINT"           ******************** German-Horoscope ********************"
30 PRINT:PRINT:PRINT
40 PRINT"Date of Birth please"
50 PRINT"?? . ?? . ????"
60 INPUT"Date DAY   : ",A
70 PRINT A;" . ?? . ????"
80 IF A<0 OR A>31 THEN 150
90 INPUT"Date MONTH : ",B
100 PRINT A;" . ";B;" . ????"
110 INPUT"Date YEAR  : ",C
120 PRINT A;" . ";B;" . ";C
130 IF C<0 OR C>9999 THEN 210
140 GOTO 240
150 PRINT"?Neue Eingabe"
160 PRINT
170 GOTO 60
180 PRINT"?Neue Eingabe"
190 PRINT
200 GOTO 90
210 PRINT"?Neue Eingabe"
220 PRINT
230 GOTO 110
240 IF A>20 AND A<32 AND B=3 THEN 490
250 IF A>0 AND A<21 AND B=4 THEN 490
260 IF A>23 AND A<31 AND B=9 THEN 670
270 IF A>0 AND A<24 AND B=10 THEN 670
280 IF A>20 AND A<31 AND B=4 THEN 860
290 IF A>0 AND A<21 AND B=5 THEN 860
300 IF A>23 AND A<32 AND B=10 THEN 1050
310 IF A>0 AND A<23 AND B=11 THEN GOTO 1050
320 IF A>20 AND A<32 AND B=5 THEN 1240
330 IF A>0 AND A<22 AND B=6 THEN 1240
340 IF A>22 AND A<31 AND B=11 THEN 1430
350 IF A>0 AND A<22 AND B=12 THEN 1430
360 IF A>21 AND A<31 AND B=6 THEN GOTO 1600
370 IF A>0 AND A<23 AND B=7 THEN 1600
380 IF A>21 AND A<32 AND B=12 THEN 1770
390 IF A>0 AND A<21 AND B=1 THEN 1770
400 IF A>22 AND A<32 AND B=7 THEN 1930
410 IF A>0 AND A<24 AND B=8 THEN 1930
420 IF A>20 AND A<32 AND B=1 THEN GOTO 2090
430 IF A>0 AND A<20 AND B=2 THEN 2090
440 IF A>23 AND A<32 AND B=8 THEN 2250
450 IF A>0 AND A<24 AND B=9 THEN 2250
460 IF A>19 AND A<30 AND B=2 THEN 2420
470 IF A>0 AND A<21 AND B=3 THEN 2420
480 GOTO 10
490 CLS
500 PRINT"                         ********** Sternbild : WIDDER **********"
510 PRINT:PRINT
520 PRINT"Datum : ";A;" . ";B;" . ";C
530 PRINT
540 PRINT:PRINT"vom : 21.03.";C;" bis : 20.04.";C
550 PRINT
560 PRINT"Mit Gewalt l„át sich in diesem Jahr gar nichts erreichen, und es ist daher "
570 PRINT"auch ratsam, nicht gleich mit der Tr ins Haus zu fallen. Mit Zurckhaltung "
580 PRINT"und Diplomatie - nicht gleich alles sagen, was ihnen auf der Zunge liegt - "
590 PRINT"kommen Sie wesentlich besser weiter. In einer pers”nlichen Sache ist eine"
600 PRINT"Entscheidung f„llig. Drcken Sie sich nicht davor"
610 PRINT:PRINT:PRINT
620 PRINT"                       ********** Bitte [Space Bar] drcken **********"
630 D$=INKEY$:IF D$=" " THEN GOTO 650
640 GOTO 630
650 BEEP:BEEP:BEEP
660 GOTO 10
670 CLS
680 PRINT"                              ********** Sternbild : WAAGE **********"
690 PRINT
700 PRINT:PRINT
710 PRINT"Datum : ";A;" . ";B;" . ";C
720 PRINT
730 PRINT"vom : 24.09.";C;"   bis : 23.10";C
740 PRINT
750 PRINT"Behauptungen aufzustellen, ohne auch nur die Spur eines Beweises zu haben, ist"
760 PRINT"eine gef„hrliche Sache. Bevor Sie also mit anderen ber ihren Verdacht reden,"
770 PRINT"sollten Sie erst einmal handfeste Indizien sammeln. Andernfalls k”nnte Ihr Ruf"
780 PRINT"einen b”sen Knacks bekommen, der Ihnen noch viel Žrger bereiten kann."
790 PRINT"In der Liebe ist mehr Objektivit„t notwendig."
800 PRINT:PRINT:PRINT
810 PRINT"                       ********** Bitte [Space Bar] drcken **********"
820 D$=INKEY$:IF D$=" " THEN GOTO 840
830 GOTO 820
840 BEEP:BEEP:BEEP
850 GOTO 10
860 CLS
870 PRINT"                             ********** Sternbild : STIER **********"
880 PRINT
890 PRINT:PRINT
900 PRINT"Datum : ";A;" . ";B;" . ";C
910 PRINT
920 PRINT"vom : 21.04.";C;"    bis : 20.05.";C
930 PRINT
940 PRINT"Eine sehr sch”ne Zeit mit rundum guten Aussichten liegt vor Ihnen. Sie finden"
950 PRINT"zudem an einem Dienstag jemanden, mit dem Sie offen ber Ihre geheimen Žngste"
960 PRINT"reden k”nnen und bei dem Sie sich total verstanden fhlen. Doch so hilfreich"
970 PRINT"dieser Kontakt auch ist, sollten Sie sich rechtzeitig darauf einstellen, daá er"
980 PRINT"nicht von nachhaltiger Dauer sein wird."
990 PRINT:PRINT:PRINT
1000 PRINT"                     ********** Bitte [Space Bar] drcken **********"
1010 D$=INKEY$:IF D$=" " THEN GOTO 1030
1020 GOTO 1010
1030 BEEP:BEEP:BEEP
1040 GOTO 10
1050 CLS
1060 PRINT"                   ********** Sternbild : SKORPION (Skorpius) **********"
1070 PRINT
1080 PRINT:PRINT
1090 PRINT"Datum : ";A;" . ";B;" . ";C
1100 PRINT
1110 PRINT"vom : 24.10.";C;"    bis : 22.11.";C
1120 PRINT
1130 PRINT"Es kommen Ihnen in einer bestimmten Sache pl”tzlich Zweifel. H”ren Sie lieber"
1140 PRINT"auf die Stimme des Herzens als auf Ihren Verstand. Ein Angebot, das man Ihnen"
1150 PRINT"an einem Donnerstag macht, hat allerhand Haken. Lassen Sie sich nicht darauf"
1160 PRINT"ein, ehe man Ihnen schriftlich alle Zusicherungen gibt, die Sie brauchen. Er-"
1170 PRINT"fllen Sie dem Partner einen Herzenswunsch."
1180 PRINT:PRINT:PRINT
1190 PRINT"                  ********** Bitte [Space Bar] drcken **********"
1200 D$=INKEY$:IF D$=" " THEN GOTO 1220
1210 GOTO 1200
1220 BEEP:BEEP:BEEP
1230 GOTO 10
1240 CLS
1250 PRINT"                    *********** Sternbild : Zwillinge **********"
1260 PRINT
1270 PRINT:PRINT
1280 PRINT"Datum : ";A;" . ";B;" . ";C
1290 PRINT
1300 PRINT "vom : 21.05.";C;"    bis : 21.06:";C
1310 PRINT
1320 PRINT "Auch wenn Sie meinen es sei unter Ihrer Wrde, so sollten Sie doch ein Ohr da-"
1330 PRINT"rauf halten, was zur Zeit hinter Ihrem Rcken getuschelt wird. Jemand m”chte "
1340 PRINT"Ihnen das Leben schwer machen und rechnet fest mit Ihrer vornehmen Zurckhal-"
1350 PRINT"tung. Zeigen Sie ihm sofort die Z„hne und lassen Sie sich nichts gefallen. "
1360 PRINT "Ihre Haltung erntet ungeteilten Beifall."
1370 PRINT:PRINT:PRINT
1380 PRINT"                      ********** Bitte [Space Bar] drcken **********"
1390 D$=INKEY$:IF D$=" " THEN 1410
1400 GOTO 1390
1410 BEEP:BEEP:BEEP
1420 GOTO 10
1430 CLS
1440 PRINT"                          ********** Sternbild : SCHšTZE **********"
1450 PRINT:PRINT:PRINT
1460 PRINT "Datum : ";A;" . ";B;" . ";C
1470 PRINT
1480 PRINT "vom : 23.11.";C;"    BIS : 21.12";C
1490 PRINT
1500 PRINT "Beruflich er”ffnen sich Ihnen ab einem Dienstag M”glichkeiten, von denen Sie"
1510 PRINT "vor kurzem gar nicht zu tr„umen gewagt h„tten. Greifen Sie zu und handeln Sie,"
1520 PRINT "auch wenn Sie anfangs glauben, sich zu bernehmen. Sie schaffen's bestimmt."
1530 PRINT "Privat sollten Sie jetzt fr klare Verh„ltnisse sorgen und reinen Wein ein-"
1540 PRINT "schenken, wo immer noch Unklarheiten bestehen."
1550 PRINT :PRINT :PRINT "              ********** Bitte [Space Bar] drcken **********"
1560 D$=INKEY$:IF D$=" " THEN GOTO 1580
1570 GOTO 1560
1580 BEEP:BEEP:BEEP
1590 GOTO 10
1600 CLS
1610 PRINT"                ********** Sternbild : KREBS **********"
1620 PRINT
1630 PRINT:PRINT"Datum : ";A;" . ";B;" . ";C
1640 PRINT
1650 PRINT"vom : 22.06.";C;"    bis : 22.07.";C
1660 PRINT
1670 PRINT "Es k”nnte sein, daá zu einem Wochenbeginn beh”rdliche Foderungen auf Sie zukom-"
1680 PRINT "men, die Ihnen unverst„ndlich erscheinen. Schieben Sie aber nichts auf die "
1690 PRINT "lange Bank, sondern setzten Sie sich in Ruhe mit der Angelegenheit auseinander."
1700 PRINT "Gegebenfalls rechtzeitig Expertenrat einholen. An einem privaten Miáverst„nd-"
1710 PRINT "nis sind Sie ganz schuldlos."
1720 PRINT:PRINT:PRINT"              ********** Bitte [Space Bar] drcken **********"
1730 D$=INKEY$:IF D$=" " THEN 1750
1740 GOTO 1730
1750 BEEP:BEEP:BEEP
1760 GOTO 10
1770 CLS
1780 PRINT"                  ********** Sternbild : STEINBOCK **********"
1790 PRINT:PRINT"Datum : ";A;" . ";B;" . ";C
1800 PRINT
1810 PRINT"vom : 22.12.";C;"    bis : 20.01.";C
1820 PRINT
1830 PRINT "Sie haben sich leider all zu sehr in eine Sache festgebissen, und manch einer"
1840 PRINT "hat den Eindruck, daá es Ihnen inzwischen gar nicht mehr um die Sache geht,"
1850 PRINT "sondern daá Sie nur um des Konfliktes willen streiten. Wenn dies zutrifft, dann"
1860 PRINT "mssen Sie dem Ganzen sofort ein kompromiáloses Ende bereiten, ehe Sie sich"
1870 PRINT "wichtige Symphatiien verscherzen."
1880 PRINT:PRINT:PRINT"              ********** Bitte [Space Bar] drcken **********"
1890 D$=INKEY$:IF D$=" " THEN GOTO 1910
1900 GOTO 1890
1910 BEEP:BEEP:BEEP
1920 GOTO 10
1930 CLS
1940 PRINT"                      ********** Sternbild : L™WE **********"
1950 PRINT:PRINT"Datum : ";A;" . ";B;" . ";C
1960 PRINT
1970 PRINT"vom : 23.07.";C;"    bis : 23.08";C
1980 PRINT
1990 PRINT "Es geht Ihnen gewaltig gegen den Strich, daá Sie in einer zwischenmenschlichen"
2000 PRINT "Angelegenheit scheinbar noch keinen Schritt voran gekommen sind. Es besteht "
2010 PRINT "wirklich kein Grund zur Panik: Denn an einem Donnerstag erhalten Sie ein deut-"
2020 PRINT "liches Zeichen, daá Ihre Zuneigung erwidert wird und daá man bereit ist, Ihret-"
2030 PRINT "wegen Kompromisse in Kauf zu nehmen."
2040 PRINT:PRINT:PRINT"          ********** Bitte [Space Bar] drcken ***********"
2050 D$=INKEY$:IF D$=" " THEN GOTO 2070
2060 GOTO 2050
2070 BEEP:BEEP:BEEP
2080 GOTO 10
2090 CLS
2100 PRINT"                 ********** Sternbild : WASSERMANN **********"
2110 PRINT:PRINT"Datum : ";A;" . ";B;" . ";C
2120 PRINT
2130 PRINT"vom : 21.01.";C;"    bis : 19.02.";C
2140 PRINT
2150 PRINT"Nehmen Sie jetzt dankbar und freudig alles an, was Ihnen an Sch”nem und Guten"
2160 PRINT "angeboten wird. Die vergangenen Wochen haben hohe Anforderungen an Sie gestellt,"
2170 PRINT "so daá ein paar Streicheleinheiten Ihrer Seele jetzt besonders wohl tun. An "
2180 PRINT "einem Donnerstag meldet sich jemand bei Ihnen, dem Sie mit gemischten Gefhlen"
2190 PRINT "gegenberstehen. Folgen Sie Ihrem Instinkt."
2200 PRINT:PRINT:PRINT"            ********** Bitte [Space Bar] drcken **********"
2210 D$=INKEY$:IF D$=" " THEN 2230
2220 GOTO 2210
2230 BEEP:BEEP:BEEP
2240 GOTO 10
2250 CLS
2260 PRINT"                      ********** Sternbild : JUNGFRAU **********"
2270 PRINT
2280 PRINT "Datum : ";A;" . ";B;" . ";C
2290 PRINT
2300 PRINT"vom : 24.08.";C;"    bis : 23.09.";C
2310 PRINT
2320 PRINT "Žrgern Sie sich doch nicht l„nger ber die Unzul„nglichkeiten Ihrer Mit-"
2330 PRINT "menschen. Kmmern Sie sich lieber um die eigenen Angelegenheiten und treiben "
2340 PRINT "Sie eine Sache voran, mit der Sie sich reichlich Lorbeeren verdienen k”nnen."
2350 PRINT "Die Mhe lohnt bestimmt, auch wenn Sie alles diesmal im Alleingang machen ms-"
2360 PRINT "sen. Geben Sie Ihr Geld nicht zu sorglos aus!"
2370 PRINT:PRINT:PRINT"            ********** Bitte [Space Bar] drcken ***********"
2380 D$=INKEY$:IF D$=" " THEN 2400
2390 GOTO 2380
2400 BEEP:BEEP:BEEP
2410 GOTO 10
2420 CLS
2430 PRINT"                   ********** Sternbild : FISCHE **********"
2440 PRINT:PRINT"Datum : ";A;" . ";B;" . ";C
2450 PRINT:PRINT"vom : 20.02.";C;"    bis : 20.03.";C
2460 PRINT"Sie k”nnen sich diese Woche viel Aufregung ersparen, wenn Sie sich nicht st„n-"
2470 PRINT "dig mit zus„tzlicher und obendrein oft auch noch berflssiger Arbeit belasten."
2480 PRINT "Konzentrieren Sie sich aufs Wesentliche und versuchen Sie nicht, alles allein"
2490 PRINT "zu machen. Man ist Ihnen n„hmlich nur zu gern behilflich. Privat meistern Sie"
2500 PRINT "eine kleine Hrde souver„n. Nur keine Panik!"
2510 PRINT:PRINT:PRINT"          ********** Bitte [Space Bar] drcken **********"
2520 D$=INKEY$:IF D$=" " THEN 2540
2530 GOTO 2520
2540 BEEP:BEEP:BEEP
2550 GOTO 10
