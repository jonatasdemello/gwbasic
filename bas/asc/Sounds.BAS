10 '            SOUNDS.BAS
20 '
30 '            By: Andrew Tuline
40 '
50 ' The sound generation on the IBM PC is performed mostly by the 8253 timer
60 'chip. This IC has 3 - 16 bit counters, each serving a different purpose
70 'on the system board.
80 '
90 '    Timer 0 is used for Dynamic Memory refresh.
100 '   Timer 1 is used for the time of day function.
110 '   Timer 2 is used for the speaker cassette interface.
120 '
130 '   The 8253 Timer is highly versatile and can be programmed for many
140 'different functions. These include a programmable rate generator, an
150 'event counter, a binary rate multiplier, real time clock, and others.
160 'The programmer may optinally change the mode of operation by addressing
170 'the control register. There are 2 registers for each counter, one for
180 'storing data to the timer and the other to read data from the timer.
190 'There are 6 modes of operation. Mode 3, the square wave generator will
200 'be discussed here. The control register is setup as follows:
210 '
220 '        -------------------------------------------------------------
230 'bit:    !  D7     D6   !  D5     D4   !  D3     D2     D1   !  D0   !
240 '        -------------------------------------------------------------
250 'def:    !  SC1    SC0  !  RL1    RL0  !  M2     M1     M0   !  BCD  !
260 '        -------------------------------------------------------------
270 '
280 'SC1,SC0 - Select the timer and must be 10 binary to select counter 2.
290 '
300 'RL1,RL0 - Read/Load
310 ' 0   0    Counter latching. When loaded, causes the present count to be
320 '          latched into a storage register for later reading.
330 ' 0   1    Read/Load LSB of counter only.
340 ' 1   0    Read/Load MSB of counter only.
350 ' 1   1    Read/Load LSB first then MSB.
360 '
370 'M2,M1,M0 - Select different modes. Must be 011 binary to select mode 3.
380 '
390 '  BCD   - Binary or Decimal counter.
400 '   0    - Sets counter to binary mode.
410 '   1    - Sets counter to decimal mode.
420 '
430 'Note: The larger the value loaded into the counter, the lower will be
440 'the resultant frequency. The number loaded sets the period of the
450 'tone which is the inverse of the frequency.
460 '
470 'Finally, the user must enable the speaker by setting a bit at I/O address
480 '61H (hexadecimal).
490 '
500 'Addresses
510 '
520 '42H - Counter 2 data register
530 '43H - Control register
540 '61H - Bit 1 enables disables the speaker.
550 '      Value of 4DH disables, 4FH enables.
560 '
570 'Examples
580 '
590 'Single Tone
600 OUT &H43,&HA6:'Binary 1010 0110
610 '              Read/Load MSB only
620 '              Mode 3
630 '              Counter 2
640 '              Binary Counter
650 OUT &H42,&H10:'Loads counter with 1000H
660 OUT &H61,&H4F
670 FOR I=1 TO 1000:NEXT
680 OUT &H61,&H4D:'disable speaker
690 '
700 'Increasing Frequency
710 OUT &H43,&HB7:'R/L LSB then MSB, Mode 3, BCD, Counter 2
720 OUT &H61,&H4F:'Enable speaker
730 FOR I=1000 TO 10 STEP -1:'Note: Decreasing value to be output
740 OUT &H42,I MOD 256:'LSB of I
750 OUT &H42,INT(I/256):'MSB of I
760 NEXT
770 '
780 'Weird Sounds
790 OUT &H43,&HA6:'R/L MSB, mode 3, counter 2, binary
800 FOR J=1 TO 20
810 FOR I=25 TO 5 STEP -1
820 OUT &H42,I
830 NEXT I
840 NEXT J
850 '
860 'Random Sounds
870 OUT &H43,&H96:'R/L LSB only, mode 3, counter 2, binary
880 FOR I=1 TO 200
890 OUT &H42,RND*255
900 NEXT I
910 OUT &H61,&H4D
920 '
930 'Assembly Language Random Number Generator
940 '
950 '1) Initialize
960 '1) Initialize      MOV     AL,0B6H        ;Mode 3, counter 2, binary
970 '                   OUT     43H,AL         ;R/L LSB then MSB
980 '                   MOV     AX,0FFFFH      ;store large number in counter
990 '                   OUT     42H,AX
1000 '
1010 '2) Read random #
1020 '                  MOV     AL,80H        ;counter 2,latch,rest don't care
1030 '                  OUT     43H,AL
1040 '                  IN      AX,42H
1050 '
1060 'I haven't tried the above in a program, but it should work reasonably.
1070 'And there you have it folks. A complete introductory to better sound
1080 'generation on your handy little PC. Last, but not least is a little
1090 'program to strobe your cassette port and output the data to the speaker,
1100 'written in assembly language. I have run this, and it works (sorta).
1110 '
1120 'TOP:      IN      AL,62H
1130 '          AND     AL,10H
1140 '          SHR     AL,1
1150 '          SHR     AL,1
1160 '          SHR     AL,1
1170 '          OR      AL,45H
1180 '          OUT     61H,AL
1190 '          JMP     TOP
1200 '
