100 REM WHATMON.BAS - DETERMINES WHAT VIDEO MONITOR BOARD IS INSTALLED
110 GOSUB 550:REM LOAD ASSEMBLY LANGUAGE SUBROUTINE
120 CLS:PRINT "MONITOR BOARD INSTALLED IS ";
130 REM -----
140 DEF SEG=0
150 IF PEEK(&H463)<>&HB4 THEN 220
155 DEF SEG
160 STATUS=INP(&H3BA)
170 FOR X=1 TO 30000
180 IF INP(&H3BA)<>STATUS THEN PRINT "HERCULES":END
190 NEXT X
200 PRINT "REGULAR MONOCHROME":END
210 REM -----
220 DEF SEG
230 REGAH%=&H1A:REGAL%=&H0             :REM FILL "REGISTERS"
240 REGBH%=&H0:REGBL%=&H0
250 REGCH%=&H0:REGCL%=&H0
260 REGDH%=&H0:REGDL%=&H0
270 INTERRUPT%=&H10:GOSUB 400          :REM CALL ASSEMBLY LANGUAGE SUBROUTINE
280 IF (REGAL% AND &HFF)=&H1A THEN PRINT "VGA":END
290 REM -----
300 REGAH%=&H12:REGAL%=&H0             :REM FILL "REGISTERS"
310 REGBH%=&H0:REGBL%=&H10
320 REGCH%=&H0:REGCL%=&H0
330 REGDH%=&H0:REGDL%=&H0
340 INTERRUPT%=&H10:GOSUB 400          :REM CALL ASSEMBLY LANGUAGE SUBROUTINE
350 IF (REGBL% AND &HFF)=&H10 THEN PRINT "CGA":END
360 REM -----
370 PRINT "EGA":END
380 REM ----------------------------------------------------------------------
390 REM SET UP AND CALL ASSEMBLY LANGUAGE SUBROUTINE
400 DEF SEG=&H4B                      :REM POINT TO SEGMENT
410 POKE 31,INTERRUPT%                :REM INTERRUPT TO CALL
420 POKE 4,REGAH%:POKE 3,REGAL%
430 POKE 6,REGBH%:POKE 5,REGBL%
440 POKE 8,REGCH%:POKE 7,REGCL%
450 POKE 10,REGDH%:POKE 9,REGDL%
460 ASMSUB=0:CALL ASMSUB  :REM CALL ASSEMBLY LANGUAGE SUB. FOR INTERPRETER
470 REM CALL ABSOLUTE(0)      :REM CALL ASSEMBLY LANGUAGE SUB. FOR COMPILER
480 REGAH%=PEEK(4):REGAL%=PEEK(3)
490 REGBH%=PEEK(6):REGBL%=PEEK(5)
500 REGCH%=PEEK(8):REGCL%=PEEK(7)
510 REGDH%=PEEK(10):REGDL%=PEEK(9)
520 DEF SEG:RETURN                    :REM RETURN TO BASIC SEGMENT
530 REM ----------------------------------------------------------------------
540 REM LOAD AN ASSEMBLY LANGUAGE SUBROUTINE
550 DEF SEG=&H4B:FOR I=0 TO 51:READ B:POKE I,B:NEXT:DEF SEG:RETURN
560 REM -----
570 DATA &HEB,&H09,&H90
580 DATA &H00,&H00,&H00,&H00,&H00,&H00,&H00,&H00       :REM REGISTERS AX-DX
590 DATA &H2E,&HA1,&H03,&H00
600 DATA &H2E,&H8B,&H1E,&H05,&H00
610 DATA &H2E,&H8B,&H0E,&H07,&H00
620 DATA &H2E,&H8B,&H16,&H09,&H00
630 DATA &HCD,&H21                                     :REM INTERRUPT XX
640 DATA &H2E,&HA3,&H03,&H00
650 DATA &H2E,&H89,&H1E,&H5,&H0
660 DATA &H2E,&H89,&H0E,&H07,&H00
670 DATA &H2E,&H89,&H16,&H09,&H00
680 DATA &HCB                                          :REM RETF
690 LOCATE 1,1:PRINT REGBL% AND 7
