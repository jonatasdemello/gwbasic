8 MUSIC = 1
9 SCREEN 1: SCREEN 0: COLOR 4, 0: CLS
10 PRINT "ษออออออออออออออออออออออออออออออออออออออป"
11 PRINT "บ                                      บ"
12 PRINT "บ                                      บ"
13 PRINT "บ                                      บ"
14 PRINT "บ                                      บ"
15 PRINT "บ                                      บ"
17 PRINT "บ                                      บ"
18 PRINT "บ                                      บ"
19 PRINT "บ                                      บ"
20 PRINT "บ                                      บ"
21 PRINT "บ                                      บ"
22 PRINT "บ                                      บ"
23 PRINT "บ                                      บ"
25 PRINT "บ                                      บ"
26 PRINT "บ                                      บ"
27 PRINT "บ                                      บ"
28 PRINT "บ                                      บ"
29 PRINT "บ                                      บ"
30 PRINT "บ                                      บ"
31 PRINT "บ                                      บ"
32 PRINT "บ                                      บ"
33 PRINT "บ                                      บ"
34 PRINT "ศออออออออออออออออออออออออออออออออออออออผ"
35 LOCATE 3, 10, 0, 7: COLOR 14: PRINT "$ALE  OF  THE  CENTURY"
37 LOCATE 6, 7, 0, 7: COLOR 17: PRINT "SELECT ONE OF THE FOLLOWING:"
40 LOCATE 10, 5, 0, 7: COLOR 5: PRINT "(A) START THE GAME"
45 LOCATE 12, 5, 0, 7: COLOR 9: PRINT "(B) CONTINUE A GAME"
50 LOCATE 14, 5, 0, 7: COLOR 10: PRINT "(C) READ INSTRUCTIONS"
55 LOCATE 16, 5, 0, 7: COLOR 12: PRINT "(D) VIEW THE $ALE $UPERSTARS LIST"
60 LOCATE 18, 5, 0, 7: COLOR 11: PRINT "(E) QUIT THIS PROGRAM"
65 LOCATE 22, 2, 0, 7: COLOR 15: PRINT "c. Falcon Software Inc. & M. Sao Pedro"
70 B$ = INKEY$
75 IF B$ = "" THEN GOTO 70
80 IF B$ = "A" OR B$ = "a" THEN GOTO 500
85 IF B$ = "B" OR B$ = "b" THEN GOTO 40
90 IF B$ = "C" OR B$ = "c" THEN GOTO 110
95 IF B$ = "D" OR B$ = "d" THEN GOTO 40
100 IF B$ = "E" OR B$ = "e" THEN SYSTEM
105 GOTO 70
110 COLOR 15, 1: CLS
115 PRINT "<<<$ALE OF THE CENTURY: INSTRUCTIONS>>>"
120 PRINT "Objective:                             "
125 PRINT "The object of the game is to accumulate"
130 PRINT "the most money by answering math       "
135 PRINT "questions. You get $5 for each correct "
140 PRINT "answer, and lose $5 for each incorrect "
145 PRINT "answer.                                "
150 PRINT "Game Play:                             "
155 PRINT "To buzz in an answer, press <SPACE BAR>"
160 PRINT "to try. You will be timed. If you go   "
165 PRINT "over the time limit, it will be        "
170 PRINT "considered an incorrect answer.        "
175 PRINT "Press 1, 2, 3, 4, or 5 to choose an"
177 PRINT "answer.   ": PRINT ""
180 PRINT "PLEASE PRESS <ENTER> TO CONTINUE"
185 COLOR 1: INPUT ENTER$: CLS : COLOR 15
190 PRINT "<<<$ALE OF THE CENTURY: INSTRUCTIONS>>>"
195 PRINT "Sales:                                 "
200 PRINT "During the game, if you are the leader,"
205 PRINT "you will have the oppurtunity to buy   "
210 PRINT "special items for the cost of some of  "
215 PRINT "your total. Buzz in to get one.        "
220 PRINT "Fame Game:                             "
225 PRINT "A long math problem will be given. If  "
230 PRINT "guessed correctly, it will entitle the "
235 PRINT "player to take a spin on the number    "
240 PRINT "board. Money, Prizes, and total        "
245 PRINT "additions will be present. Press the   "
250 PRINT "buzzer to stop this board.             "
255 PRINT "Speed Round:                           "
260 PRINT "After the 3rd fame game, the 60-second "
265 PRINT "speed round will begin. Play is the    "
270 PRINT "same, except after time is up, the game"
275 PRINT "is over.                               "
280 PRINT "                                       "
285 PRINT "PRESS <ENTER> TO CONTINUE": COLOR 1: INPUT ENTER$: CLS : COLOR 15
290 PRINT "<<<$ALE OF THE CENTURY: INSTRUCTIONS>>>"
295 PRINT "Winner's Round:                        "
300 PRINT "If you accumulate the most money, you  "
305 PRINT "will be entitled to the Winner's       "
310 PRINT "Round. In this round, you first select "
315 PRINT "a hidden prize behind a lettered board."
320 PRINT "Then, according to your total, you will"
325 PRINT "be entitled to a prize. You may select "
330 PRINT "it or continue or play more to build up"
335 PRINT "your total (Choose CONTINUE from the   "
340 PRINT "main menu). If your total hits $750.00 "
345 PRINT "you will retire with the jackpot and   "
350 PRINT "all the prizes!!!!!!!!!!!!             "
355 PRINT "Commands:                        "
360 PRINT "<SPACE BAR> Buzz in                    "
370 PRINT "<\> Quit Game                          "
375 PRINT "Credits:                               "
380 PRINT "fc - 1993 Falcon Software Inc.         "
385 PRINT "          & Michael Sao Pedro          "
395 PRINT "<<This is Shareware. It may be given   "
400 PRINT "out freely.>>                          "
405 PRINT "                                       "
410 PRINT "PRESS <ENTER> TO RETURN TO THE MENU.": COLOR 1: INPUT ENTER$: GOTO 9
500 COLOR 15, 0: CLS
505 PRINT "<<<$ALE OF THE CENTURY: NAME INPUT>>>"
510 PRINT "": PRINT "": PRINT "WHAT IS YOUR NAME (8 CHAR. MAX)?"
515 INPUT NAME1$
520 PRINT "": PRINT "": PRINT "IS THIS CORRECT (Y/N)?"
525 B$ = INKEY$
530 IF B$ = "Y" OR B$ = "y" THEN GOTO 540
535 IF B$ = "N" OR B$ = "n" THEN GOTO 500 ELSE GOTO 525
540 PRINT "": PRINT "": PRINT "DO YOU WANT THE SOUND ON (Y/N)?"
545 B$ = INKEY$
550 IF B$ = "Y" OR B$ = "y" THEN MUSIC = 1: GOTO 560
555 IF B$ = "N" OR B$ = "n" THEN MUSIC = 0 ELSE GOTO 545
560 REM "VARIABLE SETUP"
570 WINTOTAL = 0
575 GAME = 1
580 SCORE1 = 20
600 QUESTION = 1
605 REM "$ALE PRIZES (DURING GAME)"
606 DIM PRIZEA$(30): DIM PRIZEA(30)
607 PRIZEA$(1) = "DINETTE SET": PRIZEA(1) = 1599
608 PRIZEA$(2) = "35-INCH TV AND VCR": PRIZEA(2) = 1000
609 PRIZEA$(3) = "LIVINGROOM FURNITURE": PRIZEA(3) = 2009
610 PRIZEA$(4) = "KITCHEN APPLIANCES": PRIZEA(4) = 600
611 PRIZEA$(5) = "GIANT STUFFED TOYS": PRIZEA(5) = 459
612 PRIZEA$(6) = "GOLF CLUBS": PRIZEA(6) = 1025
613 PRIZEA$(7) = "TRIP TO CANCUN": PRIZEA(7) = 1698
614 PRIZEA$(8) = "TRIP TO NEW YORK CITY": PRIZEA(8) = 2099
615 PRIZEA$(9) = "TRIP TO THE BAHAMAS": PRIZEA(9) = 2599
616 PRIZEA$(10) = "TRIP TO HAWAII": PRIZEA(10) = 3595
617 PRIZEA$(11) = "NEW COMPUTER": PRIZEA(11) = 2199
618 PRIZEA$(12) = "DELUXE STEREO SYSTEM": PRIZEA(12) = 799
619 PRIZEA$(13) = "GOLD MONEY CLIP": PRIZEA(13) = 650
620 PRIZEA$(14) = "FOX STOLE": PRIZEA(14) = 1789
621 PRIZEA$(15) = "BEVERLY HILLS SHOPPING SPREE": PRIZEA(15) = 1500
622 PRIZEA$(16) = "REFRIGERATOR FREEZER": PRIZEA(16) = 1129
623 PRIZEA$(17) = "CANOPY BED": PRIZEA(17) = 2479
624 PRIZEA$(18) = "ROLLTOP DESK": PRIZEA(18) = 1745
625 PRIZEA$(19) = "TRIP TO ENGLAND": PRIZEA(19) = 3210
626 PRIZEA$(20) = "JUKEBOX": PRIZEA(20) = 3000
627 PRIZEA$(21) = "MOTORCYCLE": PRIZEA(21) = 2999
628 PRIZEA$(22) = "SLOT MACHINE": PRIZEA(22) = 725
629 PRIZEA$(23) = "GAME TABLE": PRIZEA(23) = 1679
630 PRIZEA$(24) = "GRANDFATHER CLOCK": PRIZEA(24) = 1845
631 PRIZEA$(25) = "24K GOLD NECKLACE": PRIZEA(25) = 2350
632 PRIZEA$(26) = "PURE SILVER BRACELET": PRIZEA(26) = 3509
633 PRIZEA$(27) = "DIAMOND EARRINGS": PRIZEA(27) = 2400
634 PRIZEA$(28) = "EMERALD RING": PRIZEA(28) = 3009
635 PRIZEA$(29) = "FAXING MACHINE": PRIZEA(29) = 700
636 PRIZEA$(30) = "DESIGNER CURTAINS": PRIZEA(30) = 559
637 REM "FAME GAME PRIZES"
638 DIM PRIZEB$(15): DIM PRIZEB(15)
639 PRIZEB$(1) = "$700": PRIZEB(1) = 700
640 PRIZEB$(2) = "WASHER AND DRYER": PRIZEB(2) = 799
641 PRIZEB$(3) = "$500": PRIZEB(3) = 500
642 PRIZEB$(4) = "21 INCH TELEVISION": PRIZEB(4) = 499
643 PRIZEB$(5) = "DINNERWARE": PRIZEB(5) = 679
644 PRIZEB$(6) = "HOME SECURITY SYSTEM": PRIZEB(6) = 549
645 PRIZEB$(7) = "$800": PRIZEB(7) = 800
646 PRIZEB$(8) = "$600": PRIZEB(8) = 600
647 PRIZEB$(9) = "GENUINE LEATHER WALLET": PRIZEB(9) = 450
648 PRIZEB$(10) = "VIDEO GAME ASSORTMENT": PRIZEB(10) = 600
649 PRIZEB$(11) = "PASTA MAKER": PRIZEB(11) = 325
650 PRIZEB$(12) = "MICROWAVE": PRIZEB(12) = 499
651 PRIZEB$(13) = "CAMCORDER": PRIZEB(13) = 729
652 PRIZEB$(14) = "NEW ARMOIR": PRIZEB(14) = 855
653 PRIZEB$(15) = "VANITY": PRIZEB(15) = 605
654 REM "GAME BOARD PRIZES"
655 DIM PRIZEC$(10): DIM PRIZEC(10)
656 PRIZEC$(1) = "HOME ENTERTAINMENT CENTER": PRIZEC(1) = 4595
657 PRIZEC$(2) = "$3,000": PRIZEC(2) = 3000
658 PRIZEC$(3) = "MINK COAT": PRIZEC(3) = 4000
659 PRIZEC$(4) = "TRIP TO ALASKA": PRIZEC(4) = 4298
660 PRIZEC$(5) = "4 PURE SILVER BARS": PRIZEC(5) = 3149
661 PRIZEC$(6) = "3 ATCs": PRIZEC(6) = 2499
662 PRIZEC$(7) = "$10,000": PRIZEC(7) = 10000
663 PRIZEC$(8) = "ARTWORK": PRIZEC(8) = 2500
664 PRIZEC$(9) = "$5,000": PRIZEC(9) = 5000
665 PRIZEC$(10) = "BEDROOM SET": PRIZEC(10) = 3255
666 REM "LOG-TERM PRIZES"
667 DIM PRIZED$(8): DIM PRIZED(8)
668 PRIZED$(1) = "DINING ROOM SET": PRIZED(1) = 4100
669 PRIZED$(2) = "10 PURE GOLD BARS": PRIZED(2) = 8000
670 PRIZED$(3) = "SAILBOAT": PRIZED(3) = 11509
671 PRIZED$(4) = "21-DAY TRIP TO AUSTRALIA with $2000": PRIZED(4) = 13950
672 PRIZED$(5) = "NEW CORVETTE": PRIZED(5) = 31259
673 PRIZED$(6) = "ALL THE PRIZES": PRIZED(6) = PRIZED(1) + PRIZED(2) + PRIZED(3) + PRIZED(4) + PRIZED(5)
674 OPEN "I", 1, "C:\BASIC\SAVING\JACKPOT.DAT"
675 INPUT #1, PRIZED(8)
676 CLOSE 1
677 PRIZED$(7) = "ALL THE PRIZES + CA$H JACKPOT": PRIZED(7) = PRIZED(8) + PRIZED(6)
678 RANDOMIZE TIMER
679 ZY = INT(RND * 5)
680 IF ZY = 0 THEN NAME2$ = "JOESPH"
681 IF ZY = 1 THEN NAME2$ = "RON"
682 IF ZY = 2 THEN NAME2$ = "CATHIE"
683 IF ZY = 3 THEN NAME2$ = "JULIET"
684 IF ZY = 4 THEN NAME2$ = "MARC"
685 IF ZY = 5 THEN NAME2$ = "RONALD"
686 ZY = INT(RND * 5)
687 IF ZY = 0 THEN NAME3$ = "KATHRINE"
688 IF ZY = 1 THEN NAME3$ = "PUNKY"
689 IF ZY = 2 THEN NAME3$ = "MARY"
690 IF ZY = 3 THEN NAME3$ = "MIKEL"
691 IF ZY = 4 THEN NAME3$ = "AMELIA"
692 IF ZY = 5 THEN NAME3$ = "CASEY"
693 SCORE2 = 20
694 SCORE3 = 20
700 COLOR 4, 0: CLS
710 PRINT "ษออออออออออออออออออออออออออออออออออออออป"
711 PRINT "บ ษอป    ษออออออออออออออออออออออออออป  บ"
712 PRINT "บ บ บ    บ                          บ  บ"
713 PRINT "บ ศอผ    บ                          บ  บ"
714 PRINT "บ        บ                          บ  บ"
715 PRINT "บ ษออออป บ                          บ  บ"
717 PRINT "บ บ    บ บ                          บ  บ"
718 PRINT "บ ศออออผ บ                          บ  บ"
719 PRINT "บ        บ                          บ  บ"
720 PRINT "บ        บ                          บ  บ"
721 PRINT "บ        ศออออออออออออออออออออออออออผ  บ"
722 PRINT "บ                                      บ"
723 PRINT "บ                                      บ"
725 PRINT "บ                                      บ"
726 PRINT "บ  ษออออออออออหออออออออออหออออออออออป  บ"
727 PRINT "บ  บ          บ          บ          บ  บ"
728 PRINT "บ  ฬออออออออออฮออออออออออฮออออออออออน  บ"
729 PRINT "บ  บ          บ          บ          บ  บ"
730 PRINT "บ  บ          บ          บ          บ  บ"
731 PRINT "บ  บ          บ          บ          บ  บ"
732 PRINT "บ  ศออออออออออสออออออออออสออออออออออผ  บ"
733 PRINT "บ                                      บ"
734 PRINT "ศออออออออออออออออออออออออออออออออออออออผ"
735 LOCATE 16, 6, 1, 7: COLOR 15: PRINT LEFT$(NAME3$, 8)
740 LOCATE 16, 17, 1, 7: COLOR 15: PRINT LEFT$(NAME2$, 8)
745 LOCATE 16, 28, 1, 7: COLOR 15: PRINT LEFT$(NAME1$, 8)
747 LOCATE 5, 4, 1, 7: COLOR 5: PRINT "TIME"
750 LOCATE 19, 8, 1, 7: COLOR 9: PRINT SCORE3
755 LOCATE 19, 19, 1, 7: COLOR 9: PRINT SCORE2
760 LOCATE 19, 30, 1, 7: COLOR 9: PRINT SCORE1
762 REM "QUESTIONS: REGULAR"
765 PLAY "MF P2"
770 RANDOMIZE TIMER
775 Z = INT(RND * 4)
780 IF Z = 1 OR Z = 0 OR Z = 4 THEN GOTO 790
785 IF Z = 2 OR Z = 3 THEN GOTO 817
790 A = INT(RND * 1000): B = INT(RND * 1000)
795 LOCATE 3, 19, 1, 7: COLOR 14: PRINT A
800 LOCATE 4, 17, 1, 7: PRINT "+"
805 LOCATE 5, 19, 1, 7: PRINT B
810 LOCATE 6, 17, 1, 7: PRINT "-------"
815 ANS = A + B: GOTO 850
817 A = INT(RND * 2500): B = INT(RND * 2500)
820 LOCATE 3, 19, 1, 7: COLOR 14: PRINT A
825 LOCATE 4, 17, 1, 7: PRINT "+"
830 LOCATE 5, 19, 1, 7: PRINT B
835 LOCATE 6, 17, 1, 7: PRINT "-------"
840 ANS = A + B: GOTO 850
850 REM "INPUTS"
853 TIME = 4500
855 B$ = INKEY$
860 IF B$ = "" THEN GOTO 875
865 IF B$ = " " THEN GOTO 1070
875 TIME = TIME - 1: COLOR 0: LOCATE 7, 3, 0, 7: PRINT "   ": COLOR 21: LOCATE 7, 3, 0, 7: PRINT TIME: COLOR 4: LOCATE 7, 3, 0, 7: PRINT "บ": LOCATE 7, 8, 0, 7: PRINT "บ"
880 IF TIME = 1000 AND GAME = 1 THEN GOTO 915
885 IF TIME = 1500 AND GAME = 2 THEN GOTO 915
890 IF TIME = 2000 AND GAME = 3 THEN GOTO 915
895 IF TIME = 2500 AND GAME = 4 THEN GOTO 915
900 IF TIME = 3000 AND GAME = 5 THEN GOTO 915
905 IF TIME = 3750 AND GAME = 6 THEN GOTO 915
907 IF TIME = 4250 AND GAME >= 7 THEN GOTO 915
910 GOTO 855
915 RANDOMIZE TIMER: WHO = INT(RND * 3)
920 IF WHO = 0 OR WHO = 2 THEN GOTO 930
925 IF WHO = 1 OR WHO = 3 THEN GOTO 1000
930 IF MUSIC = 1 THEN PLAY "D64D64D64D64D64D64D64D64"
935 COLOR 14: LOCATE 15, 4, 0, 7: PRINT "ษออออออออออป"
940 LOCATE 16, 4, 1, 7: PRINT "บ          บ"
945 LOCATE 17, 4, 1, 7: PRINT "ฬออออออออออน"
950 LOCATE 18, 4, 1, 7: PRINT "บ          บ"
955 LOCATE 19, 4, 1, 7: PRINT "บ          บ"
960 LOCATE 20, 4, 1, 7: PRINT "บ          บ"
965 LOCATE 21, 4, 1, 7: PRINT "ศออออออออออผ"
970 LOCATE 16, 6, 1, 7: COLOR 31: PRINT LEFT$(NAME3$, 8)
975 LOCATE 10, 11, 1, 7: COLOR 10: PRINT ANS: PLAY "MF P4"
980 LOCATE 3, 4, 1, 7: COLOR 10: PRINT "๛"
985 IF MUSIC = 1 THEN PLAY ">>>C16C16C16C16<<<"
990 PLAY "MF P4": SCORE3 = SCORE3 + 5
995 GOTO 1150
1000 IF MUSIC = 1 THEN PLAY "F64F64F64F64F64F64F64F64"
1005 COLOR 14: LOCATE 15, 15, 1, 7: PRINT "ษออออออออออป"
1010 LOCATE 16, 15, 1, 7: PRINT "บ          บ"
1015 LOCATE 17, 15, 1, 7: PRINT "ฬออออออออออน"
1020 LOCATE 18, 15, 1, 7: PRINT "บ          บ"
1025 LOCATE 19, 15, 1, 7: PRINT "บ          บ"
1030 LOCATE 20, 15, 1, 7: PRINT "บ          บ"
1035 LOCATE 21, 15, 1, 7: PRINT "ศออออออออออผ"
1040 LOCATE 16, 17, 1, 7: COLOR 31: PRINT LEFT$(NAME2$, 8)
1045 LOCATE 10, 11, 1, 7: COLOR 10: PRINT ANS: PLAY "MF P4"
1050 LOCATE 3, 4, 1, 7: COLOR 10: PRINT "๛"
1055 IF MUSIC = 1 THEN PLAY ">>>C16C16C16C16<<<"
1060 PLAY "MF P4": SCORE2 = SCORE2 + 5
1065 GOTO 1150
1070 REM "PLAYER INPUT ANSWER"
1075 IF MUSIC = 1 THEN PLAY "C64C64C64C64C64C64C64C64"
1080 COLOR 14: LOCATE 15, 26, 0, 7: PRINT "ษออออออออออป"
1085 LOCATE 16, 26, 0, 7: PRINT "บ          บ"
1090 LOCATE 17, 26, 0, 7: PRINT "ฬออออออออออน"
1095 LOCATE 18, 26, 0, 7: PRINT "บ          บ"
1100 LOCATE 19, 26, 0, 7: PRINT "บ          บ"
1105 LOCATE 20, 26, 0, 7: PRINT "บ          บ"
1110 LOCATE 21, 26, 0, 7: PRINT "ศออออออออออผ"
1115 LOCATE 16, 28, 0, 7: COLOR 31: PRINT LEFT$(NAME1$, 8)
1117 TIME = 500
1118 RANDOMIZE TIMER: CHOICE = INT(RND * 14)
1119 IF CHOICE = 0 OR CHOICE = 3 OR CHOICE = 6 THEN LETANS$ = "A" ELSE IF CHOICE = 9 OR CHOICE = 10 OR CHOICE = 11 THEN LETANS$ = "D"
1120 IF CHOICE = 1 OR CHOICE = 4 OR CHOICE = 7 THEN LETANS$ = "B" ELSE IF CHOICE = 12 OR CHOICE = 13 OR CHOICE = 14 THEN LETANS$ = "E"
1121 IF CHOICE = 2 OR CHOICE = 5 OR CHOICE = 8 THEN LETANS$ = "C"
1122 IF LETANS$ = "A" THEN LETANS1 = ANS: GOTO 1123 ELSE NUMB = INT(RND * 9): LETANS1 = NUMB * 10 + ANS
1123 IF LETANS$ = "B" THEN LETANS2 = ANS: GOTO 1124 ELSE NUMB = INT(RND * 9): LETANS2 = ANS - (NUMB * 10)
1124 IF LETANS$ = "C" THEN LETANS3 = ANS: GOTO 0 ELSE NUMB = INT(RND * 10): LETANS3 = NUMB * 10 + ANS
0    IF LETANS$ = "D" THEN LETANS4 = ANS: GOTO 1 ELSE NUMB = INT(RND * 11): LETANS4 = NUMB * 10 + ANS
1    IF LETANS$ = "E" THEN LETANS5 = ANS: GOTO 1125 ELSE NUMB = INT(RND * 8): LETANS5 = NUMB * 10 + (ANS - 20)
1125 LOCATE 4, 28, 0, 7: COLOR 15: PRINT "1: "; LETANS1
1126 LOCATE 5, 28, 0, 7: COLOR 15: PRINT "2: "; LETANS2
1127 LOCATE 6, 28, 0, 7: COLOR 15: PRINT "3: "; LETANS3
2    LOCATE 7, 28, 0, 7: COLOR 15: PRINT "4: "; LETANS4
3    LOCATE 8, 28, 0, 7: COLOR 15: PRINT "5: "; LETANS5
1128 B$ = INKEY$: IF B$ <> "1" AND B$ <> "2" AND B$ <> "3" AND B$ <> "4" AND B$ <> "5" AND B$ <> "3" THEN GOTO 1132
1129 IF B$ = "1" AND LETANS1 = ANS OR B$ = "4" AND LETANS4 = ANS THEN GOTO 1135
1130 IF B$ = "2" AND LETANS2 = ANS OR B$ = "5" AND LETANS5 = ANS THEN GOTO 1135
1131 IF B$ = "3" AND LETANS3 = ANS OR B$ = "3" AND LETANS3 = ANS THEN GOTO 1135 ELSE GOTO 1139
1132 TIME = TIME - 1: COLOR 0: LOCATE 7, 3, 0, 7: PRINT "   ": COLOR 21: LOCATE 7, 3, 0, 7: PRINT TIME: COLOR 4: LOCATE 7, 3, 0, 7: PRINT "บ": LOCATE 7, 8, 0, 7: PRINT "บ"
1133 IF TIME = 0 THEN GOTO 1139 ELSE GOTO 1128
1135 LOCATE 3, 4, 1, 7: COLOR 10: PRINT "๛"
1136 IF MUSIC = 1 THEN PLAY ">>>C16C16C16C16<<<"
1137 PLAY "MF P4": SCORE1 = SCORE1 + 5
1138 GOTO 1150
1139 LOCATE 3, 4, 1, 7: COLOR 5: PRINT "X"
1140 IF MUSIC = 1 THEN PLAY "<<<<C2>>>>"
1141 PLAY "MF P4": SCORE1 = SCORE1 - 5
1142 GOTO 1150
1150 REM "<<<<<<<<<<<LOOP BEGINS>>>>>>>>>>>>>>"
1155 Q = Q + 1
1156 FOR Z = 1 TO 1000
1157 B$ = INKEY$
1158 NEXT Z
1160 IF Q = 7 OR Q = 16 OR Q = 25 THEN GOTO 1200
1165 GOTO 700
1200 IF MUSIC = 1 THEN PLAY "C64D64E64F64G64F64E64D64C64D64E64F64G64F64E64D64C64"
1201 LOCATE 3, 11, 1, 7: PRINT "                          "
1202 LOCATE 4, 11, 1, 7: PRINT "                          "
1203 LOCATE 5, 11, 1, 7: PRINT "                          "
1204 LOCATE 6, 11, 1, 7: PRINT "                          "
1205 LOCATE 7, 11, 1, 7: PRINT "                          "
1206 LOCATE 8, 11, 1, 7: PRINT "                          "
1207 LOCATE 9, 11, 1, 7: PRINT "                          "
1208 LOCATE 10, 11, 1, 7: PRINT "                          "
1210 LOCATE 3, 19, 1, 7: COLOR 14: PRINT "$ALE BARGAIN"
1211 LOCATE 4, 11, 1, 7: COLOR 15: PRINT "Player in the lead"
1212 LOCATE 5, 11, 1, 7: COLOR 15: PRINT "  can buy this:"


