10 PRINT TAB(30);"CANNONEER"
20 PRINT:PRINT:PRINT
30 PRINT"You are the commander of a gun crew for a long-range"
40 PRINT"cannon. You must give your crew the proper angle "
50 PRINT"of elevation in degrees to put your rounds on the "
60 PRINT"target. A hit by one of your high explosive rounds "
70 PRINT"within a hundered meters of the target will destroy it. "
80 PRINT
90  SEC = 18.2 'clock ticks to make 1 second used for sound stmt
100 R=INT(4000*RND(6)+10000)
110 PRINT"The maximum range of your gun is ";R;" meters."
120 Z=0
130 PRINT
140 S1=0
150 T=INT(R*(.1+.8*RND(6)))
160 S=0
170 GOTO 380
180 PRINT"Barrel cannot be depressed below one degree."
190 GOTO 410
200 PRINT"Barrel elevation cannot exceed 89 degrees."
210 GOTO 410
220 PRINT"Forward observer reports round was long by ";ABS(E);" meters."
230 GOTO 410
240 PRINT"Forward observer reports round was short by ";ABS(E);" meters."
250 GOTO 410
260 PRINT"### TARGET DESTROYED###     ";S;" rounds fired."
270 S1=S1+S
280 IF Z=4 THEN 590
290 Z=Z+1
300 PRINT
310 FOR J = 1 TO 5
320 FOR FREQ = 500 TO 3500 STEP 100
330 SOUND FREQ,.35
340 NEXT FREQ
350 NEXT J
360 PRINT"Forward observer has sighted new activity!!!"
370 GOTO 150
380 PRINT"      Range to target is ";T;" meters."
390 PRINT"      Fire for effect!"
400 PRINT:PRINT
410 INPUT "Elevation? ",B
420 IF B>89 THEN 200
430 IF B<1 THEN 180
440 SOUND 400,.5*SEC
450 FOR FREQ = 3000 TO 4000 STEP 10
460  SOUND FREQ, .02*SEC
470 NEXT FREQ
480 SOUND 150,.5*SEC
490 S=S+1
500 IF S<6 THEN 550
510 PRINT
520 SOUND 100,10
530 PRINT"BOOM!!!  You have just been destroyed by enemy fire."
540 PRINT:PRINT:PRINT: GOTO 630
550 B2=2*B/57.3 : I = R*SIN(B2) : X=T-I : E=INT(X)
560 IF ABS(E)<100 THEN 260 'target destroyed
570 IF E>100 THEN 240 'round short
580 GOTO 220 'over target
590 PRINT:PRINT:PRINT"Total rounds expended: ";S1
600 IF S1>18 THEN 630
610 PRINT "Nice shooting! There could be a promotion in ths for you."
620 GOTO 650
630 PRINT "The cook can do better! Did you sleep through artillery"
640 PRINT "school? You need a refresher at Fort Sill."
650 PRINT: INPUT "Another target? (Y or N)";Z$
660 IF Z$="Y" OR Z$= "y" THEN 100
670 PRINT "You deserve some R&R. See you later."
680 END
