10 CLS
20 LOCATE 2,10,0:PRINT"Instructions for?"
30 LOCATE 6,10:PRINT"1. Math Tutor"
40 LOCATE 8,10:PRINT"2. Keyboard"
50 LOCATE 10,10:PRINT"3. Working problems"
60 LOCATE 12,10:PRINT"4. Tests/Exercises"
70 LOCATE 14,10:PRINT"5. Analysis of tests"
80 LOCATE 16,10:PRINT"6. Setting up programs"
90 LOCATE 18,10:PRINT"7. How to escape"
100 LOCATE 20,10:PRINT"8. Return to menu"
110 E$=INPUT$(1)
120 IF E$<"1" OR E$>"8" GOTO 110
130 SEL=VAL(E$)
140 ON SEL GOTO 150,250,340,1020,1110,1190,1280,1370
150 CLS
160 LOCATE 1,1:PRINT"Math Tutor has been designed to give youcomplete control in selecting the prob- lems that best suit your tutoring needs."
170 LOCATE 5,1:PRINT"You can control the format, type, and   limits of each problem.  You can controlthe sequential order in which these pro-blems are presented.  You can control   the length and time limits of the test"
180 PRINT"or exercise.  Finally, you can even con-trol the seed from which these problems are randomly generated."
190 LOCATE 14,1:PRINT"By varying the parameters listed above, you can literally make millions of dif- ferent tests.  Yet, duplicate the param-eters and the exact test reappears."
200 LOCATE 19,1:PRINT"The PROGRAM SET-UP section of the menu  allows you to change the parameters and make a hard copy for later reference."
210 LOCATE 23,1,0:PRINT"To return to instructions, press ESC."
220 E$=INPUT$(1)
230 IF E$<>CHR$(27) GOTO 220
240 GOTO 10
250 CLS
260 LOCATE 4,1:PRINT"Only the keys that are necessary for a  response are active.  This prevents mis-strike errors which would confound the  evaluation of a student's math skills."
270 LOCATE 9,1:PRINT"The calculator or typewriter keyboards  may be used for entering numerics.  If  the calculator key board is inactive,   press the NUM LOCK key."
280 LOCATE 14,1:PRINT"The cursor movement and backspace keys  are inactive.  To move the cursor back- wards, press the small c.  This single"
290 PRINT"key cursor control allows rapid correc- tion of mistakes and removes the task ofcursor positioning from the student."
300 LOCATE 21,1,0:PRINT"To return to instructions, press ESC."
310 E$=INPUT$(1)
320 IF E$<>CHR$(27) GOTO 310
330 GOTO 10
340 CLS
350 LOCATE 1,1:PRINT"As soon as a problem is presented on thescreen, the time lapse clock starts.  Itwill run until the ";CHR$(17);CHR$(196);CHR$(217);" key is pressed."
360 LOCATE 4,1:PRINT"This key notifies the computer that the student is finished with the problem."
370 LOCATE 7,1:PRINT"The problem is then graded and the stu- dent is notified of the results.  The   results will be one of the following:"
380 LOCATE 11,2:PRINT"1. Correct!"
390 LOCATE 13,2:PRINT"2. Correct, but time has run out!"
400 LOCATE 15,2:PRINT"3. Wrong, the correct answer is ---"
410 LOCATE 17,1:PRINT"Both 2 and 3 above are counted as missedproblems in the overall grading."
420 LOCATE 20,1:PRINT"The student may critique the problem foras long as he likes before calling for  the next problem."
430 LOCATE 24,9:PRINT"(To continue, press ";CHR$(17);CHR$(196);CHR$(217);")";
440 E$=INPUT$(1)
450 IF E$=CHR$(27) GOTO 10
460 IF E$<>CHR$(13) GOTO 440
470 CLS
480 LOCATE 1,1:PRINT"The student will solve the problem digitby digit just as if done on paper.  The cursor positions itself and prompts the student for each entry."
490 LOCATE 6,1:PRINT"The problem below, though not as intri- cate in cursor movement as multipicationor long division, will give you the feelof digit entries and their corrections. Try experimenting with the problem."
500 LOCATE 13,18:PRINT"7 5 6"
510 LOCATE 15,16:PRINT"+ 5 3 4"
520 LOCATE 16,18:PRINT"�����"
530 LOCATE 24,1:PRINT"     (To correct an entry, press c)    ";
540 YAX=17:XAX=22
550 FOR I=1 TO 4
560 LOCATE YAX,XAX,1
570 J$(I)=INPUT$(1)
580 IF J$(I)<>"c" AND J$(I)<>"C" GOTO 640
590 GOSUB 1000
600 IF I=1 GOTO 560
610 IF I=3 THEN XAX=XAX+4 ELSE IF I=4 THEN XAX=XAX-2 ELSE XAX=XAX+2
620 I=I-1
630 GOTO 560
640 IF J$(I)<"0" OR J$(I)>"9" GOTO 570
650 PRINT J$(I)
660 ON I GOSUB 920,940,960,980
670 IF I=2 THEN XAX=XAX-4 ELSE IF I=3 THEN XAX=XAX+2 ELSE XAX=XAX-2
680 NEXT I
690 SWAP J$(4),J$(3)
700 Y$=""
710 FOR I=1 TO 4
720 Y$=J$(I)+Y$
730 NEXT I
740 Y$=" "+Y$
750 LOCATE 18,1:PRINT"Press ";CHR$(17);CHR$(196);CHR$(217);
760 E$=INPUT$(1)
770 IF E$<>"c" AND E$<>"C" GOTO 800
780 LOCATE 20,1:PRINT"The cursor moves back to the last line  entered.  Enter your corrections.          "
790 GOTO 540
800 IF E$<>CHR$(13) GOTO 760
810 IF Y$=" 1290" GOTO 820 ELSE GOTO 840
820 LOCATE 20,1:PRINT"Correct!"SPC(32)
830 GOTO 850
840 LOCATE 20,1:PRINT"Wrong, the correct answer is 1290       "
850 LOCATE 21,1:PRINT STRING$(40,CHR$(32))
860 LOCATE 24,1:PRINT"To return to menu, press ESC (else c)";
870 E$=INPUT$(1)
880 IF E$="c" OR E$="C" GOTO 530
890 IF E$<>CHR$(27) GOTO 870
900 GOTO 10
910 GOTO 10
920 LOCATE 20,1:PRINT"The cursor moves one space.  The carry  is maintained in the student's head.   "
930 RETURN
940 LOCATE 20,1:PRINT"The cursor moved two spaces, and awaits the first digit of a two digit entry.  "
950 RETURN
960 LOCATE 20,1:PRINT"The cursor moves right and awaits the   second digit of the two digit entry.     "
970 RETURN
980 LOCATE 20,1:PRINT"The computer waits to see if you want tomake a correction.  If not, press ";CHR$(17);CHR$(196);CHR$(217)
990 RETURN
1000 LOCATE 20,1:PRINT"If you aren't at the beginning, the cur-sor steps back.  Enter your correction.     "
1010 RETURN
1020 CLS
1030 LOCATE 2,1:PRINT"Problems are presented to the student inan EXERCISE or a TEST.  Exercises allow students to rework the missed problems, while tests do not."
1040 LOCATE 7,1:PRINT"After a test, program execution pauses  until you enter the continue code.  You may then look at each missed problem anddetermine what tutoring is needed."
1050 LOCATE 12,1:PRINT"Use PROGRAM SET-UP to tailor exercises  and tests to meet your student's needs."
1060 LOCATE 15,1:PRINT"A good starting point for your analysis is the end-of-year tests and exercises  already set-up in the program.  The pro-grams you set-up will be in addition to these and available under SAVED PROGRAMSon the menu."
1070 LOCATE 22,1,0:PRINT"To return to instructions, press ESC."
1080 E$=INPUT$(1)
1090 IF E$<>CHR$(27) GOTO 1080
1100 GOTO 10
1110 CLS
1120 LOCATE 5,1:PRINT"After a test, Math Tutor only shows you the problems the student missed.  This  removes the confusion of looking throughthe whole test and makes it obvious justwhich math skill is lacking."
1130 LOCATE 11,1:PRINT"The lack of a math skill may be due to  the format, type, or limits of the pro- blem.  A quick PROGRAM SET-UP will soon determine the exact cause."
1140 LOCATE 16,1:PRINT"Once the exact cause is known, a PROGRAMSET-UP can be made that will tutor the  student in developing this skill."
1150 LOCATE 20,1,0:PRINT"To return to instructions, press ESC."
1160 E$=INPUT$(1)
1170 IF E$<>CHR$(27) GOTO 1160
1180 GOTO 10
1190 CLS
1200 LOCATE 2,1:PRINT"Each grade, 1 thru 6, has an end-of-yearexercise or test available for immediatecall from the menu.  Additionally, you  may have up to six personalized programswhich can also be called from the menu."
1210 LOCATE 8,1:PRINT"These personalized programs, called PRO-GRAM SET-UPS, are derived from recalled programs and require only changing the  parameters you want."
1220 LOCATE 13,1:PRINT"When you are satisfied with the changes,the PROGRAM SET-UP is saved under a namethat you choose."
1230 LOCATE 17,1:PRINT"You may then ask for a hard copy of the parameters and even scan the series of  problems that will be presented to your student."
1240 LOCATE 22,1,0:PRINT"To return to instructions, press ESC."
1250 E$=INPUT$(1)
1260 IF E$<>CHR$(27) GOTO 1250
1270 GOTO 10
1280 CLS
1290 LOCATE 2,1:PRINT"Escape from the program is only allowed at certain times to insure that your re-sponses aren't lost."
1300 LOCATE 6,1:PRINT"In the problem solving part of the pro- gram, escape is not allowed in the midstof working a problem.  However, once theproblem has been graded, you may escape by pressing the ESC key."
1310 LOCATE 12,1:PRINT"Likewise, in the set-up part of the pro-gram, no escape is allowed in the midst of changing a parameter, but is allowed immediately before or after."
1320 LOCATE 17,1:PRINT"The escape route will take you to a datacollection part of the program where youwill be given the choice of re-doing thework or returning to the menu."
1330 LOCATE 22,1,0:PRINT"To return to instructions, press ESC."
1340 E$=INPUT$(1)
1350 IF E$<>CHR$(27) GOTO 1340
1360 GOTO 10
1370 CLS
1380 LOCATE 13,11,0:PRINT"One moment, please!"
1390 CHAIN "a:tutor"
