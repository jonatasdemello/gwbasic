10 REM Documentation for the Genealogy ON DISPLAY Programs
20 REM All data is in the form of DATA statements.
30 REM By:  Melvin O. Duke.  Updated February 1984.
40 DATA Genealogy
50 DATA User's Manual
60 DATA -5
70 DATA 1
80 INDENT = 0
90 DASHES$ = "+"+STRING$(54,45)+"+"
100 TRIM.LINE$ = "(Trim-line)"
110 REM Program begins here
120 READ TITLE$, DOC.NAME$, PAGE.NO, LINE.NO
130 IF PAGE.NO MOD 2 = 0 THEN TAB.POS = 8 ELSE TAB.POS = 13
140 GOSUB 500  'For trim line and heading space
150 FOR I = 1 TO 6 : LPRINT : NEXT I
160 LPRINT CHR$(14);  'Set Expanded Print
170 LPRINT TAB(TAB.POS-2);TITLE$
180 LPRINT CHR$(18);  'Return to normal
190 FOR I = 1 TO 3 : LPRINT : NEXT I
200 LPRINT CHR$(27); "E"; 'Set Emphasized mode
210 LPRINT TAB(TAB.POS+12);"ON DISPLAY"
220 LPRINT CHR$(27); "F"; 'Return to normal
222 LPRINT : LPRINT : LPRINT
224 LPRINT TAB(TAB.POS+11);"Version 2.0"
230 FOR I = 1 TO 11 : LPRINT : NEXT I
240 LPRINT TAB(TAB.POS+10); DOC.NAME$
250 LINE.NO = LINE.NO + 27
260 '
270 READ REPLY$
280 IF LEFT$(REPLY$,1) = "." THEN GOSUB 850: GOTO 270
290 IF LINE.NO > 44 THEN GOSUB 610
300 REM Print the line if not a command
303 REM First, change tildes to quotes
304 FOR Q = 1 TO LEN(REPLY$)
305  IF MID$(REPLY$,Q,1)="~"THEN MID$(REPLY$,Q,1)=CHR$(34)
306 NEXT Q
310 LPRINT TAB(TAB.POS);REPLY$
320 LINE.NO = LINE.NO + 1
330 IF PAGE.NO MOD 2 = 0 THEN TAB.POS = 8 ELSE TAB.POS = 13
340 GOTO 270
350 REM Data for the Copyright Page
354 DATA ".pa"
358 DATA "Anyone may request a copy of these"
362 DATA "programs by sending a blank, double-"
366 DATA "sided, double-density diskette to the"
370 DATA "author of the programs."
378 DATA ".sp"
382 DATA "An addressed, postage-paid return"
386 DATA "mailer must accompany the diskette (no"
390 DATA "exceptions, please).
394 DATA ".sp"
398 DATA "A copy of the programs with documenta-"
402 DATA "tion will be sent by return mail."
410 DATA ".vt 2"
415 DATA "Users are encouraged to copy and share"
420 DATA "the programs with others."
430 DATA ".vt 6"
434 DATA "If you are using these programs, and"
438 DATA "finding them of value, your contribution"
442 DATA "($35 suggested) will be anticipated."
446 DATA ".sp"
450 DATA "Melvin O. Duke"
454 DATA "P. O. Box 20836"
458 DATA "San Jose, CA  95160"
462 DATA ".vt 4"
466 DATA "Copyright (c) 1983, 1984, by:"
470 DATA "Melvin O. Duke."
474 DATA ".sp"
478 DATA "All rights reserved."
482 '
500 REM Top of each page routine
510 IF PAGE.NO MOD 2 = 0 THEN TAB.POS = 8 ELSE TAB.POS = 13
520 LPRINT
530 LPRINT TAB(30); TRIM.LINE$
540 LPRINT DASHES$ 'Dashes
550 FOR I = 1 TO 6
560  LPRINT
570 NEXT I
580 LINE.NO = LINE.NO + 6
590 RETURN
600 '
610 REM Bottom of each page Routine
620 IF PAGE.NO < 1 THEN LPRINT : LPRINT : LPRINT : GOTO 740
630 LPRINT TAB(TAB.POS); STRING$(40,45)  'on line 46
640 LPRINT TAB(TAB.POS+3); TITLE$+" ON DISPLAY.  Version 2.0" 'on line 47
650 IF PAGE.NO MOD 2 = 1 THEN 690
660 LPRINT TAB(TAB.POS);"Page";PAGE.NO;
670 LPRINT TAB(TAB.POS+27);"User's Manual"
680 GOTO 740
690 LPRINT TAB(TAB.POS); "User's Manual";
700 IF PAGE.NO < 10 THEN DELTA = 34
710 IF PAGE.NO >  9 THEN DELTA = 33
720 IF PAGE.NO > 99 THEN DELTA = 32
730 LPRINT TAB(TAB.POS+DELTA); "Page"; PAGE.NO  'on line 48
740 LPRINT : LPRINT : LPRINT
750 LPRINT DASHES$ 'dashes after 51
760 LPRINT TAB(30); TRIM.LINE$
770 LPRINT CHR$(12);
780 PAGE.NO = PAGE.NO + 1
790 LINE.NO = 1
800 IF REPLY$ = ".eof" THEN 820  'Bypass after last page
810 GOSUB 500  'For top of next page
820 IF PAGE.NO MOD 2 = 0 THEN TAB.POS = 8 ELSE TAB.POS = 13
830 RETURN
840 '
850 REM Command Processor
860 IF LEFT$(REPLY$,3) = ".h1" THEN 960
870 IF LEFT$(REPLY$,3) = ".h2" THEN 1100
880 IF LEFT$(REPLY$,3) = ".h3" THEN 1210
890 IF LEFT$(REPLY$,3) = ".sp" THEN 1320
900 IF LEFT$(REPLY$,4) = ".eof" THEN 1370
910 IF LEFT$(REPLY$,3) = ".pa" THEN 1410
915 IF LEFT$(REPLY$,3) = ".pn" THEN PAGE.NO = VAL(RIGHT$(REPLY$,LEN(REPLY$)-3)) : RETURN
920 IF LEFT$(REPLY$,3) = ".vt" THEN 1480
930 IF LEFT$(REPLY$,3) = ".pk" THEN 1590
940 IF LEFT$(REPLY$,3) = ".in" THEN 1720
950 STOP
960 REM Head 1 Processor
970 FOR I = LINE.NO TO 44
980  LPRINT
990 NEXT I
1000 GOSUB 610  'Bottom of page Routine
1010 IF PAGE.NO MOD 2 = 0 THEN GOSUB 1410  'For h1 on Odd pages
1020 LPRINT CHR$(14);  'Set expanded print
1030 IF PAGE.NO MOD 2 = 0 THEN ADJUST = -4 ELSE ADJUST = -7
1040 LPRINT TAB(TAB.POS+ADJUST); RIGHT$(REPLY$,LEN(REPLY$)-4)
1050 LPRINT CHR$(18);  'Return to normal
1060 LINE.NO = LINE.NO+1
1070 IF PAGE.NO MOD 2 = 0 THEN TAB.POS = 8 ELSE TAB.POS = 13
1080 RETURN
1090 '
1100 REM Head 2 Processor
1110 IF LINE.NO = 7 THEN 1130 'skip spacing if at top of page
1120 IF LINE.NO > 43 THEN GOSUB 1410 ELSE LPRINT:LPRINT:LINE.NO = LINE.NO+2
1130 LPRINT CHR$(27); "E"; 'Set emphasized print
1140 LPRINT TAB(TAB.POS); RIGHT$(REPLY$,LEN(REPLY$)-4)
1150 LPRINT CHR$(27); "F"; 'Return to normal
1160 LPRINT
1170 LINE.NO = LINE.NO + 2
1180 IF PAGE.NO MOD 2 = 0 THEN TAB.POS = 8 ELSE TAB.POS = 13
1190 RETURN
1200 '
1210 REM Head 3 Processor
1220 IF LINE.NO = 7 THEN 1240 'skip spacing if at top of page
1230 IF LINE.NO > 43 THEN GOSUB 1410 ELSE LPRINT:LPRINT:LINE.NO = LINE.NO+2
1240 LPRINT CHR$(27); "E"; 'Set emphasized print
1250 LPRINT TAB(TAB.POS); RIGHT$(REPLY$,LEN(REPLY$)-4)
1260 LPRINT CHR$(27); "F"; 'Return to normal
1270 LPRINT
1280 LINE.NO = LINE.NO + 2
1290 IF PAGE.NO MOD 2 = 0 THEN TAB.POS = 8 ELSE TAB.POS = 13
1300 RETURN
1310 '
1320 REM Single Space Processor
1330 IF LINE.NO = 7 THEN 1350
1340 IF LINE.NO > 44 THEN GOSUB 1410 ELSE LPRINT : LINE.NO = LINE.NO + 1
1350 IF PAGE.NO MOD 2 = 0 THEN TAB.POS = 8 ELSE TAB.POS = 13
1360 RETURN
1370 REM End of File Processor
1380 GOSUB 1410 'Bottom of Page
1390 LPRINT CHR$(12);
1400 GOTO 7120
1410 REM Page Eject Processor
1420 FOR I = LINE.NO TO 44
1430  LPRINT
1440  LINE.NO = LINE.NO + 1
1450 NEXT I
1460 GOSUB 610  'Bottom of Page Processing
1470 RETURN
1480 REM Vertical Tab Processor
1490 IF LINE.NO = 7 THEN 1580
1500 IF LINE.NO > 44 THEN GOSUB 610  'End of page
1510 QTY = VAL(RIGHT$(REPLY$,LEN(REPLY$)-3))
1520 FOR I = 1 TO QTY
1530  LPRINT
1540  LINE.NO = LINE.NO + 1
1550  IF LINE.NO > 44 THEN I = QTY
1560 NEXT I
1570 IF PAGE.NO MOD 2 = 0 THEN TAB.POS = 8 ELSE TAB.POS = 13
1580 RETURN
1590 REM Pack Processor
1600 IF LINE.NO > 44 THEN GOSUB 610
1610 IF TAB.POS = 8 THEN ADJUST = 4
1620 IF TAB.POS = 13 THEN ADJUST = 7
1630 TAB.POS = TAB.POS + ADJUST + INDENT
1640 LPRINT CHR$(15); 'Packed printing
1650 WIDTH "lpt1:", 132 'set condensed width
1660 LPRINT TAB(TAB.POS); RIGHT$(REPLY$,LEN(REPLY$)-3)
1670 LPRINT CHR$(18); 'Return to normal
1680 WIDTH "lpt1:", 80  'return to normal
1690 LINE.NO = LINE.NO + 1
1700 IF PAGE.NO MOD 2 = 0 THEN TAB.POS = 8 ELSE TAB.POS = 13
1710 RETURN
1720 REM Indent Processor
1730 INDENT = VAL(RIGHT$(REPLY$,LEN(REPLY$)-3))
1740 RETURN
2000 DATA ".h1 USING THE PROGRAMS"
2010 DATA ".pn 23"
2020 DATA ".h2 GETTING STARTED"
2030 DATA "The user should perform the following"
2040 DATA "steps in starting the Genealogy ON"
2050 DATA "DISPLAY programs.  (Note: The steps"
2060 DATA "essentially provide for making BASIC"
2070 DATA "available, and starting the menu.)"
2080 DATA ".sp
2090 DATA "1.  Insert the PC DOS diskette into"
2100 DATA "    Drive 'a:'."
2110 DATA ".sp
2120 DATA "2.  If using the PCjr, insert the"
2130 DATA "    BASIC Cartridge into either slot."
2140 DATA ".sp
2150 DATA "3.  Turn the Printer On."
2160 DATA ".sp"
2170 DATA "4.  Turn the System On."
2180 DATA ".sp"
2190 DATA "5.  Type today's date if the system"
2200 DATA "    asks the user to Enter today's date."
2210 DATA ".sp"
2220 DATA "6.  Type the correct time if the system"
2230 DATA "    asks the user to Enter the time."
2240 DATA ".sp"
2250 DATA "7.  Type: basic/s:256"
2260 DATA "          and press the enter key."
2270 DATA ".sp"
2280 DATA "Note:  The /s:256 is essential, in order"
2290 DATA "to use files whose records are as long"
2300 DATA "as those of Genealogy ON DISPLAY."
2310 DATA ".pa"
2320 DATA "Without the /s:256 BASIC gives an:"
2330 DATA ".sp"
2340 DATA ".pk Illegal Function Call"
2350 DATA ".sp"
2360 DATA "error message when the programs try to"
2370 DATA "use a file."
2380 DATA ".sp"
2390 DATA "8.  Replace the DOS Diskette with the"
2400 DATA "    Genealogy ON DISPLAY diskette in"
2410 DATA "    Drive 'a:'."
2420 DATA ".sp"
2430 DATA "9.  Type: run ~menu~"
2440 DATA "           and press the enter key."
2450 DATA ".sp"
2460 DATA "10.  Follow any instructions which appear"
2470 DATA "     at the bottom of each screen."
2480 DATA ".pa"
2490 DATA ".h2 FIRST TIME USAGE"
2500 DATA ".h3 Backing up the Distribution Diskette"
2510 DATA "Good procedures indicate that upon"
2520 DATA "receipt of any program or programs, it"
2530 DATA "is highly desirable for you to make"
2540 DATA "back-up copies for your own protection."
2550 DATA "Such is surely the case with the"
2560 DATA "Genealogy ON DISPLAY programs."
2570 DATA ".h3 Preparing a New Data Diskette"
2580 DATA "Begin with a formatted diskette,"
2590 DATA "which was formatted without including"
2600 DATA "DOS (no /s).
2610 DATA ".sp"
2620 DATA "If you do not have one available,"
2630 DATA "it will be necessary to format one."
2640 DATA "Refer to FORMAT Command in the DOS"
2650 DATA "Manual."
2660 DATA ".pa"
2670 DATA ".h3 Copying the Menu Program"
2680 DATA "The Menu program must be copied to the"
2690 DATA "data diskette, so that it will be"
2700 DATA "available whenever any of the individual"
2710 DATA "programs are completed."
2720 DATA ".sp"
2730 DATA "Copy the Menu Program to the Data"
2740 DATA "diskette with the following:"
2750 DATA ".sp"
2760 DATA "1.  Bring up DOS and BASIC in the"
2770 DATA "    normal manner."
2780 DATA ".sp"
2790 DATA "2.  Insert the Program Diskette in"
2800 DATA "      Drive 'a:'."
2810 DATA ".sp"
2820 DATA "3.  Type:  load ~menu~"
2830 DATA "      and press the enter key."
2840 DATA ".sp"
2850 DATA "4.  Replace the Program Diskette with"
2860 DATA "      the Data Diskette (which was newly"
2870 DATA "      formatted) in Drive 'a:'."
2880 DATA ".sp"
2890 DATA "5.  Type:  save ~menu~"
2900 DATA "      and press the enter key."
2910 DATA ".pa"
2920 DATA ".h3 Creating the Data Files"
2930 DATA "Assuming that the menu program has just"
2940 DATA "been saved from the previous step (if it"
2950 DATA "has not, bring up DOS and BASIC, have the"
2960 DATA "Program Diskette in place, and type:"
2970 DATA "load ~menu~ and press the enter key."
2980 DATA "Then,) type:"
2990 DATA ".sp"
3000 DATA "  run"
3010 DATA "    and press the enter key."
3020 DATA ".sp"
3030 DATA "Follow any directions which appear at"
3040 DATA "the bottom of the screen, which will show"
3050 DATA "you which diskette to have in place in"
3060 DATA "Drive 'a:'."
3070 DATA ".sp"
3080 DATA "When the menu is displayed, select the"
3090 DATA "'creatper' program by typing:"
3100 DATA ".sp"
3110 DATA "  1"
3120 DATA "    and press the enter key."
3130 DATA ".sp"
3140 DATA "This will cause the creation of a Persons"
3150 DATA "File, which will contain 500 'empty'"
3160 DATA "records, into which you will shortly be"
3170 DATA "entering data about the persons on your"
3180 DATA "list."
3190 DATA ".sp"
3200 DATA "Next, select the 'creatmar' program, by"
3210 DATA "typing:"
3220 DATA ".sp"
3230 DATA "  2"
3240 DATA "    and press the enter key."
3250 DATA ".pa"
3260 DATA "This will cause the creation of a"
3270 DATA "Marriages File, which will contain 200"
3280 DATA "'empty' records, into which you will"
3290 DATA "shortly be entering data about the"
3300 DATA "marriages on your list."
3310 DATA ".sp"
3320 DATA "Finally, select the 'creatord' program,"
3330 DATA "by typing:"
3340 DATA ".sp"
3350 DATA "  3"
3360 DATA "    and press the enter key."
3370 DATA ".sp"
3380 DATA "This will cause the creation of the"
3390 DATA "Ordinances File, which will contain"
3400 DATA "500 'empty' records, into which you"
3410 DATA "will shortly be entering data about"
3420 DATA "ordinances for the people on your list."
3430 DATA ".h3 Caution
3440 DATA "A word of extreme caution:  Once you"
3450 DATA "have run the 'creatper' program, the"
3460 DATA "'creatmar' program, and the 'creatord'"
3470 DATA "programs, you do NOT, repeat NOT, want"
3480 DATA "to run them again (at least not"
3490 DATA "against the same files)."
3500 DATA ".sp"
3510 DATA "To do so would mean that you would"
3520 DATA "wipe-out any previous data that was in"
3530 DATA "the files at the time that you ran the"
3540 DATA "programs again."
3550 DATA ".pa"
3560 DATA ".h2 HOW TO OPERATE."
3570 DATA ".h3 Selecting an individual program.
3580 DATA "Individual programs, which perform"
3590 DATA "individual functions, are selected by"
3600 DATA "the user through the use of a menu."
3610 DATA ".sp"
3620 DATA "Begin by bringing up DOS and BASIC in"
3630 DATA "a normal manner.  Have the Program"
3640 DATA "Diskette in place.  Then type:"
3650 DATA ".sp"
3660 DATA "  run ~menu~"
3670 DATA "    and press the enter key."
3680 DATA ".sp"
3690 DATA "Following a logo on the screen, there"
3700 DATA "will appear a menu, which numbers the"
3710 DATA "individual programs, identifies their"
3720 DATA "names, and describes their functions."
3730 DATA ".sp"
3740 DATA "A user selects the individual program"
3750 DATA "which he desires by typing a number,"
3760 DATA "and then he presses the enter key.  The"
3770 DATA "program which he selected is then loaded"
3780 DATA "and run."
3790 DATA ".h3 Operating the updatper program."
3800 DATA "After selecting the updatper program,"
3810 DATA "the user should make sure that the data"
3820 DATA "diskette is in Drive 'a:'.  He should"
3830 DATA "then press any key to continue."
3840 DATA ".pa"
3850 DATA "After the logo is displayed, the user"
3860 DATA "is asked which record he wants to up-"
3870 DATA "date.  He should respond with a valid"
3880 DATA "number in the range of 1 to 500."
3890 DATA ".sp"
3900 DATA "The current content of the record is"
3910 DATA "shown.  If the record has never been"
3920 DATA "used, the record-number shown will be"
3930 DATA "negative.  As long as this number is"
3940 DATA "negative, it will be bypassed for any"
3950 DATA "further processing.  The user should"
3960 DATA "enter the record-number."
3970 DATA ".sp"
3980 DATA "The user is prompted for input.  He may"
3990 DATA "bypass any field by pressing the enter"
4000 DATA "key.  He may also bypass all remaining"
4010 DATA "fields by typing / and then pressing"
4020 DATA "the enter key."
4030 DATA ".sp"
4040 DATA "Note:  Dates should be entered as:"
4050 DATA "dd Mmm yyyy, such as: 06 Jan 1943."
4060 DATA ".sp"
4070 DATA "When finished with his updating, he is"
4080 DATA "asked to indicate what he wants to do"
4090 DATA "with the record.  He may either 'save'"
4100 DATA "it, he may 'forget' it, or he may make"
4110 DATA "'more' changes to the record.  As soon"
4120 DATA "as he says 'save', the record is saved"
4130 DATA "and he is once more prompted about the"
4140 DATA "next record to update."
4150 DATA ".sp"
4160 DATA "When he is through, he should indicate"
4170 DATA "that he wants to update record 0."
4180 DATA ".pa"
4190 DATA ".h3 Operating the updatmar program."
4200 DATA "After selecting the updatmar program,"
4210 DATA "the user should make sure that the"
4220 DATA "data diskette is in Drive 'a:'.  He"
4230 DATA "should then press any key to continue."
4240 DATA ".sp"
4250 DATA "After the logo is displayed, the user"
4260 DATA "is asked which record he wants to up-"
4270 DATA "date.  He should respond with a valid"
4280 DATA "number in the range of 1 to 200."
4290 DATA ".sp"
4300 DATA "The current content of the record is"
4310 DATA "shown.  If the record has never been"
4320 DATA "used, the record-number shown will be"
4330 DATA "negative.  As long as this number is"
4340 DATA "negative, it will be bypassed for any"
4350 DATA "further processing.  The user should"
4360 DATA "enter the record-number."
4370 DATA ".sp"
4380 DATA "The user is prompted for input.  He may"
4390 DATA "bypass any field by pressing the enter"
4400 DATA "key.  He may also bypass all remaining"
4410 DATA "fields by typing / and then pressing"
4420 DATA "the enter key."
4430 DATA ".sp"
4440 DATA "When finished with his updating, he is"
4450 DATA "asked to indicate what he wants to do"
4460 DATA "with the record.  He may either 'save'"
4470 DATA "it, he may 'forget' it, or he may make"
4480 DATA "'more' changes to the record.  As soon"
4490 DATA "as he says 'save', the record is saved"
4500 DATA "and he is once more prompted about the"
4510 DATA "next record to update."
4520 DATA ".sp"
4530 DATA "When he is through, he should indicate"
4540 DATA "that he wants to update record 0."
4550 DATA ".pa"
4560 DATA ".h2 Operating the updatord program."
4570 DATA "After selecting the updatord program,"
4580 DATA "the user should make sure that the data"
4590 DATA "diskette is in Drive 'a:'.  He should"
4600 DATA "then press any key to continue."
4610 DATA ".sp"
4620 DATA "After the logo is displayed, the user"
4630 DATA "is asked which record he wants to up-"
4640 DATA "date.  He should respond with a valid"
4650 DATA "number in the range of 1 to 500."
4660 DATA ".sp"
4670 DATA "The user is prompted for input.  He may"
4680 DATA "bypass any field by pressing the enter"
4690 DATA "key.  He may also bypass all remaining"
4700 DATA "fields by typing / and then pressing"
4710 DATA "the enter key."
4720 DATA ".sp"
4730 DATA "Dates should be entered as: dd Mmm yyyy,"
4740 DATA "such as:  05 Aug 1922."
4750 DATA ".sp"
4760 DATA "When finished with his updating, he is"
4770 DATA "asked to indicate what he wants to do"
4780 DATA "with the record.  He may either 'save'"
4790 DATA "it, he may 'forget' it, or he may make"
4800 DATA "'more' changes to the record.  As soon"
4810 DATA "as he says 'save', the record is saved"
4820 DATA "and he is once more prompted about the"
4830 DATA "next record to update."
4840 DATA ".sp"
4850 DATA "When he is through, he should indicate"
4860 DATA "that he wants to update record 0."
4870 DATA ".pa"
4880 DATA ".h3 Operating the indexpc program."
4890 DATA "The 'indexpc' program is fundamental to"
4900 DATA "the creation of a parent/child index,"
4910 DATA "which associates parents with their"
4920 DATA "children."
4930 DATA ".sp"
4940 DATA "It should be run after any additions"
4950 DATA "of persons to the Persons File, when-"
4960 DATA "ever birthdates are added or changed,"
4970 DATA "or when identification of parents have"
4980 DATA "been added or changed."
4990 DATA ".sp"
5000 DATA "Select the 'indexpc' program, and make"
5010 DATA "sure that the data diskette is in"
5020 DATA "Drive 'a:'.  Then press any key to"
5030 DATA "continue."
5040 DATA ".sp"
5050 DATA "A file named 'pcindex' will be created"
5060 DATA "on the data diskette on Drive 'a:'."
5070 DATA ".pa"
5080 DATA ".h3 Operating the indexmar program."
5090 DATA "The 'indexmar' program is fundamental"
5100 DATA "to the creation of a marriages index,"
5110 DATA "which associates spouses with each"
5120 DATA "other."
5130 DATA ".sp"
5140 DATA "It should be run after marriages are"
5150 DATA "added to the Marriages File, whenever"
5160 DATA "marriage-dates are added or changed,"
5170 DATA "or whenever changes are made which re-"
5180 DATA "identify spouses."
5190 DATA ".sp"
5200 DATA "Select the 'indexmar' program, and make"
5210 DATA "sure that the data diskette is in"
5220 DATA "Drive 'a:'.  Then press any key to"
5230 DATA "continue."
5240 DATA ".sp"
5250 DATA "A data file named 'mindex' will be"
5260 DATA "created on the data diskette in Drive"
5270 DATA "'a:'."
5280 DATA ".pa"
5290 DATA ".h3 Operating the display program."
5300 DATA "Before running the display program,"
5310 DATA "the user should know that any changes"
5320 DATA "that he has made to the data files may"
5330 DATA "have made his indexes out-of-date."
5340 DATA "This will have happened if the user"
5350 DATA "has entered a new person, a new"
5360 DATA "marriage, a new relationship (such as"
5370 DATA "a reference to a parent), a new"
5380 DATA "birth-date, a new marriage-date, or"
5390 DATA "a new Name."
5400 DATA ".sp"
5410 DATA "The indexes are still correct if the"
5420 DATA "user has entered new death-dates,"
5430 DATA "burial-dates, or any information about"
5440 DATA "locations (cities, counties, states)"
5450 DATA "of births, deaths, ordinances, etc."
5460 DATA ".sp"
5470 DATA "If the indexes are out-of-date, the"
5480 DATA "user should update them before running"
5490 DATA "the 'display' program, by running the"
5500 DATA "'indexper' and 'indexmar' programs."
5510 DATA ".sp"
5520 DATA "After selecting the 'display' program,"
5530 DATA "the user should make sure that the Data"
5540 DATA "Diskette is in Drive 'a:'.  He should"
5550 DATA "then press any key to continue."
5560 DATA ".sp"
5570 DATA "After the logo is displayed, the user"
5580 DATA "is asked for the record-number of the"
5590 DATA "person that he wants to locate.  He"
5600 DATA "should enter a number which he knows to"
5610 DATA "be valid."
5620 DATA ".pa"
5630 DATA "The personal information about that"
5640 DATA "person will then be shown on the display."
5650 DATA ".sp"
5660 DATA "The user may then enter 'ps' (print"
5670 DATA "the screen), he may enter 'pc' (for a"
5680 DATA "pedigree chart), he may enter 'fg' (for"
5690 DATA "a family group), he may enter 'o' (for"
5700 DATA "ordinance information), he may enter 'p'"
5710 DATA "followed by a valid number (requesting"
5720 DATA "information about a person), he may enter"
5730 DATA "'m' followed by a valid number (requesting"
5740 DATA "information about a marriage), or he may"
5750 DATA "enter 'q' (asking to quit)."
5760 DATA ".sp"
5770 DATA "When the pedigree information appears,"
5780 DATA "the user may then enter 'ps' (print the"
5790 DATA "screen, he may enter 'fg' (requesting"
5800 DATA "a family group), he may enter 'pc'"
5810 DATA "(asking that the pedigree chart be"
5820 DATA "re-drawn), he may enter 'l' followed by"
5830 DATA "a valid number (requesting personal"
5840 DATA "information about a person on the stated"
5850 DATA "line), he may enter 'm' followed by a"
5860 DATA "valid number (requesting information"
5870 DATA "about a marriage), or he may enter 'q'"
5880 DATA "(asking to quit)."
5890 DATA ".pa"
5900 DATA "When the family group information appears,"
5910 DATA "the user may enter 'ps' (print the"
5920 DATA "screen), he may enter 'f' (asking for the"
5930 DATA "father), he may enter 'm' (asking for the"
5940 DATA "mother), he may enter 'p' followed by a"
5950 DATA "valid number (asking for about a person),"
5960 DATA "he may enter 'c' followed by a valid"
5970 DATA "number (asking for information about a"
5980 DATA "child), he may enter 'm' followed by a"
5990 DATA "valid number (requesting information"
6000 DATA "about a marriage, or he may enter 'q'"
6010 DATA "(asking to quit)."
6020 DATA ".sp"
6030 DATA "When the ordinance information appears,"
6040 DATA "The user may then enter 'ps' (print"
6050 DATA "the screen), he may enter 'pc' (for a"
6060 DATA "pedigree chart), he may enter 'fg' (for"
6070 DATA "a family group), he may enter 'o' (for"
6080 DATA "ordinance information), he may enter 'p'"
6090 DATA "followed by a valid number (requesting"
6100 DATA "information about a person), he may enter"
6110 DATA "'m' followed by a valid number (requesting"
6120 DATA "information about a marriage), or he may"
6130 DATA "enter 'q' (asking to quit)."
6140 DATA ".pa"
6150 DATA ".h2 Operating the Pedigree Program"
6160 DATA "After selecting the 'pedigree' program,"
6170 DATA "the user should make sure that the"
6180 DATA "data diskette is in Drive 'a:'.  He"
6190 DATA "should then press any key to continue."
6200 DATA ".sp"
6210 DATA "He should then follow any instructions"
6220 DATA "which appear at the bottom of the display."
6230 DATA ".sp"
6240 DATA "Note:  The pedigree program was designed"
6250 DATA "to use a form which is Copyrighted, 1966,"
6260 DATA "The Genealogical Society of the Church of"
6270 DATA "Jesus Christ of Latter Day Saints, Inc."
6280 DATA "Stock #GA-054"
6290 DATA ".sp"
6300 DATA "If such a form is not available, the"
6310 DATA "content of the pedigree can be printed"
6320 DATA "on any available printer paper."
6330 DATA ".pa"
6340 DATA ".h2 Operating the Family Program"
6350 DATA "After selecting the 'family' program,"
6360 DATA "the user should make sure that the"
6370 DATA "data diskette is in Drive 'a:'.  He"
6380 DATA "should then press any key to continue."
6390 DATA ".sp"
6400 DATA "He should then follow any instructions"
6410 DATA "which appear at the bottom of the"
6420 DATA "display."
6430 DATA ".sp"
6440 DATA "Note:  The family program was designed"
6450 DATA "to use a Family Group Record form, which"
6460 DATA "was copyrighted 1972 by the Genealogical"
6470 DATA "Society of the Church of Jesus Christ of"
6480 DATA "Latter Day Saints, Inc.  Stock #GA-032."
6490 DATA ".sp"
6500 DATA "If such a form is not available, the"
6510 DATA "content of the pedigree can be printed"
6520 DATA "on any available printer paper."
6530 DATA ".pa"
6540 DATA ".h3 Operating the other programs."
6550 DATA "After selecting one of the other programs,"
6560 DATA "the user should make sure that the data"
6570 DATA "diskette is in Drive 'a:'.  He should"
6580 DATA "then press any key to continue."
6590 DATA ".sp"
6600 DATA "Note:  See the Table of Contents for the"
6610 DATA "names of the other programs."
6620 DATA ".sp"
6630 DATA "After the logo is displayed, the user"
6640 DATA "observes the information that is being"
6650 DATA "shown on the display screen, and waits"
6660 DATA "for the program to complete."
6670 DATA ".pa"
6680 DATA ".h2 HOW TO STOP."
6681 DATA "The user may stop at any time, by"
6682 DATA "pressing (and holding down) the Function"
6683 DATA "(FN) key, and then pressing the Break"
6684 DATA "(B) key on the PCjr."
6685 DATA ".sp"
6690 DATA "The user may stop at any time, by"
6700 DATA "pressing (and holding down) the control"
6710 DATA "(Ctrl) key, and then pressing the Break"
6720 DATA "key on the PC, PPC, or PC/XT."
6730 DATA ".sp"
6740 DATA ".h3 Stopping the Update Programs."
6750 DATA "The user may stop one of the update"
6760 DATA "programs (updatper, updatmar, or"
6770 DATA "updatord) by requesting an update of"
6780 DATA "record 0."
6790 DATA ".h3 Stopping the Display Program."
6800 DATA "The user may stop the display program"
6810 DATA "by typing 'q' or 'quit' when he is asked"
6820 DATA "for his next action, or he may type"
6830 DATA "'p0', to request person-number 0."
6840 DATA ".h3 Stopping the Pedigree Program."
6850 DATA "The user may stop the pedigree program"
6860 DATA "by asking for a printout of the pedigree"
6870 DATA "for person-number 0."
6875 DATA ".pa"
6880 DATA ".h3 Stopping the Family Program."
6890 DATA "The user may stop the family program"
6900 DATA "by asking for a printout of the family"
6910 DATA "whose marriage-number is 0."
6930 DATA ".h3 Stopping the Other Programs."
6940 DATA "The other programs may only be stopped"
6950 DATA "with the 'function-break' or the"
6960 DATA "'control-break' sequence, as indicated"
6965 DATA "above.  However, the user is cautioned"
6970 DATA "that if he does this while writing new"
6980 DATA "indexes to the diskette (during the"
6990 DATA "running of the 'indexpc' or 'indexmar'"
7000 DATA "programs), the index that is currently"
7010 DATA "being written may be destroyed, and"
7020 DATA "will have to be re-built before the"
7030 DATA "'display', 'pedigree', 'family', and"
7040 DATA "'alphamar' programs are run."
7060 DATA ".sp"
7070 DATA "The damaged index can be re-built by"
7080 DATA "re-running the 'indexpc' or 'indexmar'"
7090 DATA "program which was stopped with the"
7100 DATA "'function-break' or 'control-break'"
7105 DATA "sequence."
7110 DATA ".eof"
7120 END
