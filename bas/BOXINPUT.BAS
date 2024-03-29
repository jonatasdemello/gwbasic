5 CLS:KEY OFF:FOR I=1 TO 10:KEY I,"":NEXT:KEY 6,"GOTO 4000"+CHR$(13):KEY 2,"GOTO 50"+CHR$(13):KEY 10,"RUN"+CHR$(34)+"BLUEMENU"+CHR$(34)+CHR$(13):LIST 7-43
7 '**********************   SELECTED INPUT ROUTINE   *************************
10 '浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
11 '�                Format-protecting Sting-input Routine                    �
13 '�                                                                         �
15 '�    This program provides a simple sub-routine which will permit selec-  �
17 '� tive keyboard input to a string or single element response prompt. The  �
19 '� ability to disable any and/or all keys except those absolutely essen-   �
21 '� tial to the input provide programming flexibilty and reduces operator   �
23 '� error opportunity.  This program is provided in two forms, color with   �
25 '� selective SCREEN Function demonstration, and monochrome which uses a    �
27 '� visible scroll method for printing and clearing. Both BLUEBERY.BAS and  �
29 '� LABELPRO.BAS use this protected input procedure as well as many other   �
31 '� programming techniques demonstrated on BLUEBERY Pie A La Mode.          �
33 '�                                                                         �
35 '�    MONO Version < F2 >   COLOR Version  < F6 >    BLUEMENU  < F10 >     �
37 '�                                                                         �
39 '�                       (u) G I N A C O  - 1983             Ver 5.2/320   �
41 '藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
43 '   ***** < F2 > MON0  ***** < F6 >  COLOR  ***** < F10 > BLUEMENU  *******
50 CLS:CLEAR:FOR I=1 TO 10:KEY I,"":NEXT:KEY 2,"GOTO 100"+CHR$(13):KEY 10,"RUN"+CHR$(34)+"BLUEMENU"+CHR$(34)+CHR$(13):KEY 6,"GOTO 4000"+CHR$(13):LIST 51-69
51 '**************************   MONOCHROME VERSION  **************************
52 '浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
53 '�                 Format-protecting Sting-input Routine
54 '�                                                                         �
55 '�    The monochrome version is straight forward. Follow the prompts and   �
56 '� you will be participate in a deomonstration of protected keyboard in-   �
57 '� put. The TONES used to indicate an attempt to enter an illegal stroke   �
58 '� or command are somewhat exagerated for demonstation purposes only. When �
59 '� you patch this routine into your program, you may wish to alter the     �
60 '� various SOUND statements to a shorter duration and a single tone or     �
61 '� pitch in the vicinity of 2000.  Sound 2000,4 is a comfortable tone and  �
62 '� duration.  This version uses a single SCREEN statement.  The color ver- �
63 '� sion uses the multiple SCREEN technique for demonstation purposes.      �
64 '�                                                                         �
65 '�    CONTINUE     < F2 >   COLOR Version  < F6 >    BLUEMENU  < F10 >     �
66 '�                                                                         �
67 '�                       (u) G I N A C O  - 1983             Ver 5.2/320   �
68 '藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
69 '   ***** < F2 > MON0  ***** < F6 >  COLOR  ***** < F10 > BLUEMENU  *******
100 REM ===== MONO VERSION LEAD IN LINE =====
110 FOR I!=1 TO 10:KEY I!,"":NEXT:LOCATE,,,O,7:SCREEN 0,0,0:
120 A$ = ""
130 B$ = ""
140 C$ = ""
150 D$ = ""
160 DEFINT A-Z
170 I% = 0
180 DIM A$(200),B$(200),C$(200),INPTR$(50),FIN$(50)
190 FINLEN% = 0
200 P! = 0
210 IN$ = ""
220 CLS
230 KEY OFF
240 GOSUB 1490
250 GOSUB 1020
260 GOSUB 1170
270 GOSUB 1340
280 LOCATE 3,22
290 PRINT " Protected-Format String-Input Routine "
300 LOCATE 5,11
310 PRINT "This is an example of a limited keystoke input routine which"
320 LOCATE 6,11
330 PRINT "prevents keyboard input of destructive or unauthorized char-"
340 LOCATE 7,11
350 PRINT "acters or keys.  Note that the backspace key will not deface"
360 LOCATE 8,11
370 PRINT "the format border.  Also, the EDIT cursor keys on the numer-"
380 LOCATE 9,11
390 PRINT "ic key pad and the F(KEYS) are disabled.  The routine can be"
400 LOCATE 10,11
410 PRINT "easily modified by the call statement to accept any specific"
420 LOCATE 11,11
430 PRINT "characters or symbols using a CHR$ identification.   This is"
440 LOCATE 12,11
450 PRINT "demonstrated below by  accepting only the alpha characters A"
460 LOCATE 13,11
470 PRINT "through z in Line 1 and only 0 thru 9 in Line 2.  An examin-"
480 LOCATE 15,26
490 PRINT "  Press <ENTER> to Continue  ";
500 IN$ = INKEY$
510 IF IN$ = "" THEN 500
520 IF IN$ = CHR$(13) THEN 560
530 SOUND 300,3
540 SOUND 400,3
550 GOTO 500
560 LOCATE 3,20:PRINT STRING$(42,"�"):LOCATE 3,28:
570 PRINT "  Continued Description "
580 FOR I=4 TO 14:LOCATE I,7:PRINT SPC(65):NEXT
590 LOCATE 5,10:PRINT "ation of the call statements will show that acceptable input is"
600 LOCATE 6,10
610 PRINT "established by setting an upper and lower CHR$ range."
620 LOCATE 8,10
630 PRINT "This sub-routine is simple to extract and use. BLUEBERY.BAS and"
640 LOCATE 9,10
650 PRINT "and LABELPRO.BAS provide practical examples of this routine and"
660 LOCATE 10,10
670 PRINT "other programming techniques demonstrated on this disk."
680 LOCATE 15,26
690 PRINT "  Press <ENTER> to Continue  "
700 IN$ = INKEY$
710 IF IN$ = "" THEN 700
720 IF IN$ = CHR$(13) THEN 760
730 SOUND 300,3
740 SOUND 400,3
750 GOTO 700
760 FOR L% = 4 TO 14:LOCATE L%,10:PRINT SPC(65):NEXT
770 LOCATE 3,20:PRINT STRING$(50,"�")
780 LOCATE 3,22
790 PRINT " Protected-Format String-Input Routine "
800 LOCATE 17,20
810 PRINT "  ENTER APPROPRIATE KEYBOARD CHARACTERS  ";
820 LOCATE 23,29
830 PRINT "  Press < F6 > to Quit  "
840 LOCATE 19,10
850 PRINT "LINE 1: (A to z) <30 Max>"
860 LOCATE 19,40
870 PRINT STRING$(30,254)
880 LOCATE 21,10
890 PRINT "LINE 2: (#'S only) <10 Max>"
900 LOCATE 21,40
910 PRINT STRING$(10,254)
920 FOR I=8 TO 12:LOCATE I,7:PRINT SPC(68):NEXT
930 LOCATE 8,10
940 PRINT "Line #1 Printout: "
950 LOCATE 10,10
960 PRINT "line #2 Printout: "
970 GOTO 1780
980 LOCATE 8,40:PRINT STRING$(30,254):LOCATE 10,40:PRINT STRING$(10,254);
990 LOCATE 19,40:PRINT STRING$(30,254):LOCATE 21,40:PRINT STRING$(10,254);
1000 GOTO 1780
1010 =====  TOP BOX PRINTOUT =====
1020 WW% = 69
1030 TL% = 3
1040 LL% = 15
1050 LC% = 6
1060 LOCATE TL%,LC%,0,0,7
1070 PRINT TLC$; STRING$(WW%,HL$);TRC$;
1080 FOR I% = (TL% + 1) TO (LL% - 1)
1090   LOCATE I%,LC%,0
1100   PRINT VL$;
1110   LOCATE I%, (LC% + WW% + 1),0
1120   PRINT VL$;
1130 NEXT
1140 LOCATE LL%,LC%,0
1150 PRINT BLC$; STRING$(WW%,HL$);BRC$;
1160 RETURN
1170 REM =====  PRINT BOX 1 =====
1180 WW% = 76
1190 TL% = 1
1200 LL% = 24
1210 LC% = 2
1220 LOCATE TL%,LC%,0
1230 PRINT TLC$; STRING$(WW%,HL$);TRC$;
1240 FOR I% = (TL% + 1) TO (LL% - 1)
1250   LOCATE I%,LC%,0
1260   PRINT VL$;
1270   LOCATE I%, (LC% + WW% + 1),0
1280   PRINT VL$;
1290 NEXT
1300 LOCATE LL%,LC%,0
1310 PRINT BLC$; STRING$(WW%,HL$);BRC$;
1320 RETURN
1330 REM =====  PRINT BOX 2 =====
1340 WW% = 69
1350 TL% = 17
1360 LL% = 23
1370 LC% = 6
1380 LOCATE TL%,LC%,0
1390 PRINT TLC$; STRING$(WW%,HL$);TRC$;
1400 FOR I% = (TL% + 1) TO (LL% - 1)
1410   LOCATE I%,LC%,0
1420   PRINT VL$;
1430   LOCATE I%, (LC% + WW% + 1),0
1440   PRINT VL$;
1450 NEXT
1460 LOCATE LL%,LC%,0
1470 PRINT BLC$; STRING$(WW%,HL$);BRC$;
1480 RETURN
1490 REM =====  INITIALIZATION ROUTINE =====
1500 TLC$ = CHR$(201)
1510 TRC$ = CHR$(187)
1520 HL$ = CHR$(205)
1530 BLC$ = CHR$(200)
1540 BRC$ = CHR$(188)
1550 VL$ = CHR$(186)
1560 RETURN
1570 REM =====  INPUT ROUTINE FOR LETTER RESPONSES =====
1580 KEY 6, CHR$(64)
1590 FIN$ = ""
1600 IF FINLEN% = 0 THEN FINLEN% = 255
1610 IF INKEY$ > < "" THEN 1610
1620 INPTR$ = INKEY$
1630 IF INPTR$ = "" THEN 1620
1640 IF INPTR$ = CHR$(64) THEN 2000
1650 IF INPTR$ = CHR$(13) THEN RETURN
1660 IF INPTR$ < > CHR$(8) THEN 1710
1670 IF LEN(FIN$) = 0 THEN SOUND 400,3 : GOTO 1620
1680 PRINT CHR$(29);"�"; CHR$(29);
1690 FIN$ = LEFT$(FIN$, LEN(FIN$) - 1)
1700 GOTO 1620
1710 IF LEN(FIN$) = FINLEN% THEN SOUND 600,4 : GOTO 1620
1720 IF INPTR$ = CHR$(32) THEN 1740
1730 IF ( ASC(INPTR$) < ASC(BEGIN$) OR ASC(INPTR$) > ASC(BOTTOM$)) THEN SOUND 200,4 : SOUND 400,3 : SOUND 600,2 : GOTO 1620
1740 PRINT INPTR$;
1750 FIN$ = FIN$ + INPTR$
1760 GOTO 1620
1770 END
1780 REM =====  ACTUAL INPUT COMMAND ROUTINE =====
1790 REM =====  INPUT FOR ALPHA CHARACTERS ON LINE 1 =====
1800 LOCATE 19,40,1,0,7
1810 FINLEN% = 30
1820 BEGIN$ = CHR$(65)
1830 BOTTOM$ = CHR$(122)
1840 GOSUB 1570
1850 A$ = FIN$
1860 LOCATE 8,40,0
1870 PRINT A$
1880 REM =====  INPUT FOR NUMBERS ONLY ON LINE 2 =====
1890 LOCATE 21,40,1,0,7
1900 FINLEN% = 10
1910 BEGIN$ = CHR$(48)
1920 BOTTOM$ = CHR$(57)
1930 GOSUB 1570
1940 B$ = FIN$
1950 LOCATE 10,40,0
1960 PRINT B$
1970 FOR I% = 1 TO 3000
1980 NEXT
1990 GOTO 980
2000 CLS
2010 END
4000 CLS:FOR I=1 TO 10:KEY I,"":NEXT:KEY 2,"GOTO 4100"+CHR$(13):KEY 10,"RUN"+CHR$(34)+"BLUEMENU"+CHR$(34)+CHR$(13):KEY 6,"GOTO 69"+CHR$(13):LIST 4002-4038
4002 '********************  COLOR/GRAPHICS VERSION  *************************
4004 '浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
4006 '�             Format-protecting Sting-input Routine                   �
4008 '�                                                                     �
4010 '�     The comments which appear on the Lead-in and Monochrome version �
4012 '� apply equally to this version. You will obtain more information as  �
4014 '� the program progresses.  One warning. This program is written in a  �
4016 '� Multi-screen format. Should you break out of the program when the   �
4018 '� active and visual screen are not the same, it will appear that you  �
4020 '� cannot control or regain your cursor.  Do not give up and BOOT the  �
4022 '� system.  Enter the following commands (even if you cannot see them  �
4024 '� on the screen) and you should regain control of the cursor. You can �
4026 '� then do as you wish and see the commands. Type and <ENTER> in this  �
4027 '� sequence. (You should gain control after one of them): SCREEN,,0    �
4028 '� SCREEN,,1 and SCREEN,,2                                             �
4029 '�                                                                     �
4030 '�   CONTINUE     < F2 >    MONO Version  < F6 >    BLUEMENU  < F10 >  �
4032 '�                                                                     �
4034 '�                   (u) G I N A C O  - 1983             Ver 5.2/320   �
4036 '藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様�
4038 ' ***** < F2 > MON0  ***** < F6 >  COLOR  ***** < F10 > BLUEMENU  ****
4100 FOR I=1 TO 10:KEY I,"":NEXT:LOCATE,,,0,7:SCREEN 0,1,0,0:A$="":B$="":C$="":D$="":DEFINT A-Z:I=0:DIM A$(200),B$(200),C$(200),INPTR$(50),FIN$(50):FINLEN=0:P!=0:IN$="":SCREEN,,2:CLS:SCREEN,,1:CLS:SCREEN,,0:CLS
4110 CLS:KEY OFF:GOSUB 4470:GOSUB 4420:GOSUB 4440:GOSUB 4460
4120 LOCATE 3,22:PRINT" Protected-Format String-Input Routine ":LOCATE 5,11:PRINT"This is an example of a limited keystoke input routine which":LOCATE 6,11:PRINT"prevents keyboard input of destructive or unauthorized char-"
4130 LOCATE 7,11:PRINT"acters or keys.  Note that the backspace key will not deface":LOCATE 8,11:PRINT"the format border.  Also, the EDIT cursor keys on the numer-":LOCATE 9,11:PRINT"ic key pad and the F(KEYS) are disabled.  The routine can be"
4140 LOCATE 10,11:PRINT"easily modified by the call statement to accept any specific":LOCATE 11,11:PRINT"characters or symbols using a CHR$ identification.   This is":LOCATE 12,11:PRINT"demonstrated below by  accepting only the alpha characters A"
4150 LOCATE 13,11:PRINT"through z in Line 1 and only 0 thru 9 in Line 2.  An examin-":LOCATE 15,28:PRINT"  Press <ENTER> to Continue  "
4160 SCREEN,,2,0:GOSUB 4420:GOSUB 4440:GOSUB 4460
4170 IN$=INKEY$:IF IN$="" THEN 4170
4180 IF IN$=CHR$(13) THEN 4200
4190 SOUND 300,3:SOUND 400,3:GOTO 4170
4200 'SCREEN,,2,0:GOSUB 1040:GOSUB 1220:GOSUB 1400
4210 SCREEN,,2,2:LOCATE 3,28:PRINT"  Continued Description ":LOCATE 5,10:PRINT"ation of the call statements will show that acceptable input is":LOCATE 6,10:PRINT"established by setting an upper and lower CHR$ range."
4220 LOCATE 8,10:PRINT"This sub-routine is simple to extract and use. BLUEBERY.BAS and":LOCATE 9,10:PRINT"and LABELPRO.BAS provide practical examples of this routine and"
4230 LOCATE 10,10:PRINT"other programming techniques demonstrated on this disk.":LOCATE 12,10:PRINT"This program also demonstates use of multiple SCREEN statements":LOCATE 13,10:PRINT"which have specific use in color/graphic displays.
4240 SCREEN ,,0,2:FOR L=4 TO 14:LOCATE L,10:PRINT SPC(65):NEXT:LOCATE 15,21:PRINT"  ENTER APPROPRIATE KEYBOARD CHARACTERS  ";:LOCATE 23,31:PRINT"  Press < F6 > to Quit  ":SCREEN,,2,2
4250 LOCATE 15,28:PRINT"  Press <ENTER> to Continue  "
4260 IN$=INKEY$:IF IN$="" THEN 4260
4270 IF IN$=CHR$(13) THEN 4290
4280 SOUND 300,3:SOUND 400,3:GOTO 4260
4290 SCREEN,,0,0
4300 LOCATE 19,10:PRINT"LINE 1: (A to z)":LOCATE 19,40:PRINT STRING$(30,254):LOCATE 21,10:PRINT "LINE 2: (#'S only)":LOCATE 21,40:PRINT STRING$(10,254)
4310 SCREEN 0,1,0,0:COLOR 3,0:LOCATE 8,10:PRINT"Line #1 Printout: ":LOCATE 10,10:PRINT "line #2 Printout: ":COLOR 7,0
4320 SCREEN 0,1,1,0:CLS:COLOR 3,0:LOCATE 8,10:PRINT"Line #1 Printout: ":LOCATE 10,10:PRINT "line #2 Printout: ":LOCATE 20,30:PRINT"PRESS <ENTER> TO CONTINUE";:COLOR 7,0:SCREEN,,0,0
4330 SCREEN,,1,0:LOCATE 8,40:COLOR 4,0:PRINT STRING$(30,254);:LOCATE 10,40:PRINT STRING$(10,254);:COLOR 7,0:SCREEN,,0,0:'LOCATE 08,40:PRINT SPC(30):LOCATE 10,40:PRINT SPC(10);
4340 GOTO 4660
4350 SCREEN,,0,1:LOCATE 8,40:PRINT SPC(30):LOCATE 10,40:PRINT SPC(30);:SCREEN,,1,1
4360 SCREEN ,,1,1:LOCATE 8,20  'PRINT"PRESS <ENTER> TO CONTINUE";
4370 IN$=INKEY$:IF IN$="" THEN 4370
4380 IF IN$=CHR$(13) THEN 4400
4390 SOUND 600,4:SOUND 400,4:GOTO 4370
4400 SCREEN ,,0,0
4410 GOTO 4300
4420 COLOR 6,0:WW=69:TL=3:LL=15:LC=6:LOCATE TL,LC,0,0,7:PRINT TLC$;STRING$(WW,HL$);TRC$;:FOR I=(TL+1)TO(LL-1):LOCATE I,LC,0:PRINT VL$;:LOCATE I,(LC+WW+1),0:PRINT VL$;:NEXT:LOCATE LL,LC,0:PRINT BLC$;STRING$(WW,HL$);BRC$;:COLOR 7,0:RETURN
4430 REM =====  PRINT BOX 1 =====
4440 COLOR 7,0:WW=76:TL=1:LL=24:LC=2:LOCATE TL,LC,0:PRINT TLC$;STRING$(WW,HL$);TRC$;:FOR I=(TL+1)TO(LL-1):LOCATE I,LC,0:PRINT VL$;:LOCATE I,(LC+WW+1),0:PRINT VL$;:NEXT:LOCATE LL,LC,0:PRINT BLC$;STRING$(WW,HL$);BRC$;:COLOR 7,0:RETURN
4450 REM =====  PRINT BOX 2 =====
4460 WW=69:TL=17:LL=23:LC=6:LOCATE TL,LC,0:PRINT TLC$;STRING$(WW,HL$);TRC$;:FOR I=(TL+1)TO(LL-1):LOCATE I,LC,0:PRINT VL$;:LOCATE I,(LC+WW+1),0:PRINT VL$;:NEXT:LOCATE LL,LC,0:PRINT BLC$;STRING$(WW,HL$);BRC$;:RETURN
4470 REM =====  INITIALIZATION ROUTINE =====
4480 TLC$=CHR$(201):TRC$=CHR$(187):HL$=CHR$(205):BLC$=CHR$(200):BRC$=CHR$(188):VL$=CHR$(186):RETURN
4490 REM =====  INPUT ROUTINE FOR LETTER RESPONSES =====
4500 KEY 6,CHR$(64)
4510 FIN$="":IF FINLEN=0 THEN FINLEN=255
4520 IF INKEY$><""THEN 4520
4530 INPTR$=INKEY$:IF INPTR$=""THEN 4530
4540 IF INPTR$=CHR$(64)THEN 64000
4550 IF INPTR$=CHR$(13)THEN RETURN
4560 IF INPTR$<>CHR$(8)THEN 4610
4570 IF LEN(FIN$)=0 THEN SOUND 400,3:GOTO 4530
4580 PRINT CHR$(29);"�";CHR$(29);
4590 FIN$=LEFT$(FIN$,LEN(FIN$)-1)
4600 GOTO 4530
4610 IF LEN(FIN$)=FINLEN THEN SOUND 600,4:GOTO 4530
4620 IF INPTR$=CHR$(32) THEN 4640
4630 IF (ASC(INPTR$)<ASC(BEGIN$) OR ASC(INPTR$)>ASC(BOTTOM$)) THEN SOUND 200,4:SOUND 400,3:SOUND 600,2:GOTO 4530
4640 PRINT INPTR$;:FIN$=FIN$+INPTR$:GOTO 4530
4650 END
4660 REM ===== ACTUAL INPUT COMMAND ROUTINE =====
4670 LOCATE 19,40,1,0,7:FINLEN=30:BEGIN$=CHR$(65):BOTTOM$=CHR$(122):GOSUB 4490:A$=FIN$:COLOR 7,0:LOCATE 8,40,0:PRINT A$:SCREEN,,1,0:LOCATE 8,40,0:PRINT A$:SCREEN,,0
4680 LOCATE 21,40,1:FINLEN=10:BEGIN$=CHR$(48):BOTTOM$=CHR$(57):GOSUB 4490:B$=FIN$:COLOR 7,0:LOCATE 10,40,0:PRINT B$:SCREEN,,1,0:LOCATE 10,40,0:PRINT B$:FOR I=1 TO 3000:NEXT:GOTO 4350:
64000 CLS:END
65000 REM ===== SAVE ROUTINE =====
65100 SAVE"B:BOXINPUT.BAS"
