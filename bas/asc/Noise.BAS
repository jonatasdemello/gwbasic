10 REM Program name: CLOCK
20 REM This program presents the time as seen by the system.
30 REM Along with the time a "ticking" sound is made.
40 CLS
50 PRINT "What frequency (cycles per second) do you want the ticking of the"
60 INPUT "clock to be? The sound can be between 37 and 32,000 CPS. ";S
70 S= ABS(S)
80 IF S < 37 THEN X=1
90 INPUT "How many seconds between each tick";Q
100 Q=18.2*Q
110 LOCATE 5,1,0,12,13
120 PRINT "Press the ESC key to stop the clock."
130 LOCATE 10,10,0,12,13
140 PRINT TIME$, DATE$
150 IF X = 1 THEN GOTO 110
160 SOUND S,1
170 SOUND 32767,Q
180 E$=INKEY$:IF E$=CHR$(27) THEN GOTO 40
190 GOTO 110
200 END
