1 '                   CALCULATING SAMPLE SIZES
2 '               Written by Tracy L. Gustafson, M.D.
3 '              Round Rock, Texas. Version 3.0, 1984
4 ON ERROR GOTO 5000:CHAIN MERGE "EPIMRG",5
22 DATA "CALCULATING SAMPLE SIZES",22,26
30 AF=0:PRINT:PRINT TAB(20);"1.)  For a population survey":PRINT
35 PRINT TAB(20);"2.)  For a paired case-control study":PRINT
40 PRINT TAB(20);"3.)  For an unpaired case-control study":PRINT:PRINT
45 PRINT TAB(25);:INPUT "Enter choice:  ",ASUB:IF ABS(ASUB-2)>1 THEN BEEP:GOTO 45
50 D1="the true population rate ":D2="and your sample rate ":D3="  How certain must you be ":D4="POPULATION"
55 CLS:ON ASUB GOTO 65,110,115
60 PRINT "Enter your best estimate of the ";D4;" RATE of the study characteristic":PRINT TAB(23);:INPUT "(err towards 50%)      Percent = ",P:PRINT:RETURN
65 PRINT TAB(22);"SAMPLE SIZE FOR ";D4;" SURVEY":PRINT TAB(22);STRING$(33,205):PRINT
70 PRINT "  HOW LARGE is the population from which you want to select your sample?":PRINT TAB(24);:INPUT "(you may approximate)  ",PS:PRINT:GOSUB 60
75 PRINT "   What is the MAXIMUM difference between ";D1:PRINT TAB(8);D2;:INPUT "that you can tolerate?     Percent = ",XD:PRINT
80 PRINT D3;"that the difference between ";D1:PRINT TAB(25);D2;"is <";XD;"% ?"
85 PRINT TAB(22);:INPUT "1) 90%   2) 95%   3) 99%   4) 99.9%          ",C
90 IF C=1 THEN XZA=1.645 ELSE IF C=2 THEN XZA=1.96 ELSE IF C=3 THEN XZA=2.575 ELSE IF C=4 THEN XZA=3.29 ELSE BEEP:GOTO 80
95 P=P/100:XD=XD/100:SN=XZA*XZA*P*(1-P)/(XD*XD):SN=SN/(1+SN/PS)
100 GOSUB 220:PRINT:PRINT:COLOR CLR2,CLR1:PRINT TAB(23);
105 PRINT "The SAMPLE SIZE required is ";INT(SN+.5);:GOTO 205
110 AF=0:PRINT TAB(18);"SAMPLE SIZE FOR PAIRED CASE-CONTROL STUDY":PRINT TAB(18);STRING$(41,205):GOTO 120
115 AF=1:PRINT TAB(17);"SAMPLE SIZE FOR UNPAIRED CASE-CONTROL STUDY":PRINT TAB(17);STRING$(43,205):D4="CONTROL GROUP"
120 GOSUB 60:PRINT TAB(10); "Do you expect the TEST GROUP rate to be HIGHER or LOWER":PRINT TAB(20);:INPUT "than the control group rate? (H or L)  ",A$:PRINT
125 IF A$<>"h" AND A$<>"H" AND A$<>"l" AND A$<>"L" THEN BEEP:GOTO 120
130 PRINT "    What is the SMALLEST DIFFERENCE between the test group and controls":PRINT TAB(12);:INPUT "that you want to be able to detect?    Percent = ",XD
135 IF A$="h" OR A$="H" THEN PT=P+XD ELSE PT=P-XD
140 PRINT:PRINT D3;"that you detect a difference as small as";XD;"% ":PRINT TAB(30);"(if it exists) ?":PRINT TAB(17);
145 INPUT "1) 70%   2) 80%   3) 90%   4) 95%   5) 99%        ",C:PRINT
150 IF C=1 THEN XZB=.5250001 ELSE IF C=2 THEN XZB=.842 ELSE IF C=3 THEN XZB=1.282 ELSE IF C=4 THEN XZB=1.645 ELSE IF C=5 THEN XZB=2.327 ELSE BEEP:GOTO 140
155 PRINT "  ";D3;"that any difference between your samples":PRINT TAB(14);
160 PRINT "that you may detect is not simply due to chance?":PRINT TAB(20);
165 INPUT "1) 90%   2) 95%   3) 99%   4) 99.9%            ",C
170 IF C=1 THEN XZA=1.645 ELSE IF C=2 THEN XZA=1.96 ELSE IF C=3 THEN XZA=2.575  ELSE IF C=4 THEN XZA=3.29 ELSE BEEP:GOTO 155
175 PRINT:PRINT TAB(14);:INPUT "Enter the number of CONTROLS per CASE desired:  ",CC:P=P/100:XD=XD/100:PT=PT/100
180 IF AF=0 THEN SN=(XZA*SQR(P*(1-P))+XZB*SQR(PT*(1-PT)))/XD:GOTO 190
185 PC=P:P=(P+PT)/2:SN=(XZA*SQR(2*P*(1-P))+XZB*SQR(PT*(1-PT)+PC*(1-PC)))/XD
190 SN=SN*SN*(CC+1)/(2*CC):PRINT
195 GOSUB 220:COLOR CLR2,CLR1:DQ="The number of ":PRINT TAB(19);:IF AF=0 AND CC=1 THEN PRINT DQ;"PAIRS required is: ";INT(SN+.5);:GOTO 205
200 PRINT DQ;"CASES required is: ";INT(SN+.5);TAB(80):PRINT TAB(18);DQ;"CONTROLS required is: ";INT(SN+.5)*CC;
205 PRINT TAB(80):COLOR CLR1,CLR2:LOCATE 25,15
210 INPUT;"Do you want to calculate another SAMPLE SIZE?   ",A$:IF A$="y" OR A$="Y" THEN 20
215 LOCATE 23,1:END
220 PLAY "MB T180 L32 O2 EG#BG#E O4 EG#BG#E O3 EG#BG#E O2 L7 BG# L3 E.":RETURN
5000 BEEP:IF ERR<>53 AND ERR<>71 THEN 5010 ELSE LOCATE 10,10:PRINT "Please place EPISTAT in drive A: (or other default).":PRINT TAB(25);"Press any key to continue:"
5005 A$=INKEY$:IF A$="" THEN 5005 ELSE RESUME
5010 ON ERROR GOTO 0:END
