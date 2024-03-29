10 REM CREATE LEAGUE RECORDS        (CREATE)
12 REM Developed by William W. Klaproth,  Moraga Ca.  94556    September 1982
20 REM MASTER FILE DESCRIPTIONS FOR ALL BOWLING PROGRAMS
30 OPEN "B:TEAMS.HDR" AS #1 LEN = 64
40 FIELD #1, 2 AS TM$, 30 AS NAM$, 2 AS RCNT$, 2 AS GAM$, 4 AS PINS$, 2 AS AVG$, 2 AS HIG$, 2 AS HIS$, 4 AS PTSW$, 4 AS PTSL$, 2 AS B1ID$, 2 AS B2ID$, 2 AS B3ID$, 2 AS B4ID$, 2 AS B5ID$
50 FIELD #1, 2 AS HDRID$, 30 AS LEAGUE$, 2 AS WEEKS$, 2 AS TEAMS$, 4 AS FILLER$, 2 AS BWLPERTM$, 2 AS NXTID$, 2 AS HCPBASE$, 4 AS HCPPCNT$
60 OPEN "B:BOWLERS.HDR" AS #2 LEN = 64
70 FIELD #2, 2 AS BBO$, 30 AS BNAM$, 2 AS BRCNT$, 2 AS BGAM$, 4 AS BPINS$, 2 AS BAVG$, 2 AS BHIG$, 2 AS BHIS$, 2 AS BHCP$, 2 AS BHIGH$, 2 AS BHISH$, 2 AS BTM$,2 AS GAM2$, 2 AS SER5$, 2 AS SER6$,2 AS CURSER$,2 AS AVGLSTYR$
80 OPEN "B:TEAM.DET" AS #3 LEN = 16
90 FIELD #3,2 AS DTM$, 2 AS TMO$, 2 AS TDAY$, 2 AS TG1$, 2 AS TG2$, 2 AS TG3$, 2 AS TSER$, 2 AS DPTSW$
100 OPEN "B:BOWLER.DET" AS #4 LEN = 16
110 FIELD #4,2 AS DBO$, 2 AS BMO$, 2 AS BDAY$, 2 AS BG1$, 2 AS BG2$, 2 AS BG3$, 2 AS BSER$
120 DIM BNUM%(5)
130 BID% = 1
140 CLS
150 PRINT "LEAGUE INITIALIZATION PROGRAM"
160 PRINT " "
170 PRINT "ENTER LEAGUE HEADER DATA"
180 INPUT "NAME OF LEAGUE:";LNAM$
190 INPUT "NO OF WEEKS:";IWK%
200 INPUT "NO OF TEAMS:";ITM%
210 INPUT "BOWLERS PER TEAM:";IBO%
220 INPUT "HANDICAP BASE AVERAGE:";IHB%
230 INPUT "HANDICAP PERCENTAGE:";IPCT
240 PRINT "LEAGUE NAME:";LNAM$
250 PRINT "WEEKS  TEAMS  BOWLERS/TM"
260 PRINT USING "   ##  ";IWK%,ITM%,IBO%
270 PRINT "HANDICAP BASED ON";IPCT;"% OF";IHB%
280 INPUT "HAS DATA BEEN ENTERED CORRECTLY? Y/N:";ANS$
290 IF ANS$ = "Y" GOTO 330
300 IF ANS$ = "y" GOTO 330
310 CLS
320 GOTO 130
330 FOR T% = 1 TO ITM%
340 CLS
350 PRINT "ENTER DATA FOR TEAM NO:";T%
360 INPUT "TEAM NAME:";TNAM$
370 LSET NAM$ = TNAM$
380 RSET RCNT$ = MKI$(0)
390 RSET GAM$ = MKI$(0)
400 RSET PINS$ = MKS$(0)
410 RSET AVG$ = MKI$(0)
420 RSET HIG$ = MKI$(0)
430 RSET HIS$ = MKI$(0)
440 RSET PTSW$ = MKS$(0)
450 RSET PTSL$ = MKS$(0)
460 RSET TM$ = MKI$(T%)
470 FOR B% = 1 TO IBO%
480 PRINT "BOWLER NO:";B%
490 INPUT "BOWLER NAME:";INAM$
500 INPUT "ENTER AVERAGE LAST YEAR:";IAVGLSTYR%
510 LSET BNAM$ = INAM$
520 RSET BRCNT$ = MKI$(0)
530 RSET BGAM$ = MKI$(0)
540 RSET BPINS$ = MKS$(0)
550 RSET BAVG$ = MKI$(0)
560 RSET BHIG$ = MKI$(0)
570 RSET BHIS$ = MKI$(0)
580 RSET BHCP$ = MKI$(0)
590 RSET BHIGH$ = MKI$(0)
600 RSET BHISH$ = MKI$(0)
610 RSET BTM$ = MKI$(T%)
620 RSET GAM2$ = MKI$(0)
630 RSET SER5$ = MKI$(0)
640 RSET SER6$ = MKI$(0)
650 RSET CURSER$ = MKI$(0)
660 RSET AVGLSTYR$ = MKI$(IAVGLSTYR%)
670 RSET BBO$ = MKI$(BID%)
680 PUT #2,BID%
690 BNUM%(B%) = BID%
700 BID% = BID% + 1
710 NEXT B%
720 RSET B1ID$ = MKI$(BNUM%(1))
730 RSET B2ID$ = MKI$(BNUM%(2))
740 RSET B3ID$ = MKI$(BNUM%(3))
750 RSET B4ID$ = MKI$(BNUM%(4))
760 RSET B5ID$ = MKI$(BNUM%(5))
770 RECNO% = T% +1
780 PUT #1, RECNO%
790 NEXT T%
800 CLS
810 PRINT "SUBSTITUTE NO:";BID%
820 PRINT "Enter sub name and telephone number (align telephone number under mask.         To quit, enter *END in first four positions of name."
830 PRINT "            ....................(TEL-XXXX)"
840 INPUT "BOWLER NAME:",INAM$
850 IF LEFT$(INAM$,4) = "*END" OR LEFT$(INAM$,4) = "*end" GOTO 1070
860 INPUT "ENTER AVERAGE LAST YEAR:";IAVGLSTYR%
870 LSET BNAM$ = INAM$
880 RSET BRCNT$ = MKI$(0)
890 RSET BGAM$ = MKI$(0)
900 RSET BPINS$ = MKS$(0)
910 RSET BAVG$ = MKI$(0)
920 RSET BHIG$ = MKI$(0)
930 RSET BHIS$ = MKI$(0)
940 RSET BHCP$ = MKI$(0)
950 RSET BHIGH$ = MKI$(0)
960 RSET BHISH$ = MKI$(0)
970 RSET BTM$ = MKI$(0)
980 RSET GAM2$ = MKI$(0)
990 RSET SER5$ = MKI$(0)
1000 RSET SER6$ = MKI$(0)
1010 RSET CURSER$ = MKI$(0)
1020 RSET AVGLSTYR$ = MKI$(IAVGLSTYR%)
1030 RSET BBO$ = MKI$(BID%)
1040 PUT #2,BID%
1050 BID% = BID% + 1
1060 GOTO 800
1070 LSET LEAGUE$ = LNAM$
1080 RSET HDRID$ = MKI$(0)
1090 RSET WEEKS$ = MKI$(IWK%)
1100 RSET TEAMS$ = MKI$(ITM%)
1110 RSET BWLPERTM$ = MKI$(IBO%)
1120 RSET NXTID$ = MKI$(BID%)
1130 RSET HCPBASE$ = MKI$(IHB%)
1140 RSET HCPPCNT$ = MKS$(IPCT)
1150 PUT #1,1
1160 PRINT "LEAGUE INITIALIZED FOR"; ITM%; " TEAMS, "; IBO%; " BOWLERS PER TEAM"
1170 PRINT "NEXT AVAILABLE BOWLER ID IS:";BID%
1180 PRINT "Initializing Team DETAIL file - Please standby . . "
1190 FOR T% = 1 TO (T% * 50 + 100)
1200 RSET DTM$ = MKI$(0)
1210 PUT #3,T%
1220 NEXT T%
1230 FOR B% = 1 TO (BID% * 50 + 100)
1240 RSET DBO$ = MKI$(0)
1250 PUT #4,B%
1260 NEXT B%
1270 PRINT "Processing Completed - Returning to MENU"
1280 CLOSE
1290 RUN "A:MENU"
