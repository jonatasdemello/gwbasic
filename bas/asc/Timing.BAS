1 'TIMING - times statements accurately by interval averaging - Hal Sampson
2 SZ$="00:00:01":FZ$="00:00:11":QZ$=TIME$:STOP:TIME$="00":SOUND 37,1:SOUND 37,1
3 IF TIME$<SZ$ THEN 3 ELSE WHILE TIME$<FZ$:IZ%=IZ%+1
9 'Replace with statement(s) to be timed.  (e.g. this takes about 3 ms)
65527 WEND
65528 PRINT USING "##.###";10000/IZ%-5.2005;:PRINT " ms":TIME$=QZ$
