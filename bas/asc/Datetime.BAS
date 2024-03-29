10 'Set Date and Time - Russ Williams, Feb 24, 1983
20 'DATETIME is for people who are too lazy to type in the entire date
30 'each time they turn on their PC.  It lets you type in just the day
40 'number if the month and year have not changed, or just the month and
50 'day numbers if the year has not changed.  The time can be entered with
60 'either a colon or a dash, or with no separator at all, e.g. "905".
70 'Time can be entered either 24-hour clock style, or 12-hour style with a
80 '"p" suffix for PM, e.g. "315p" for "3:15 PM".  It is suggested that you
90 'add an AUTOEXEC to your DOS disk, containing the command BASIC DATETIME
100 'to invoke this program each time you boot-up DOS.
110 'Your DOS disk must be writable, because the program writes a small file
120 'to save the last date & time entered.
130 DEFINT A-Z: ON ERROR GOTO 330
140 OPEN "DATETIME.FIL" FOR INPUT AS #1: LINE INPUT #1,DTTM$
150 ON ERROR GOTO 0: CLOSE: PRINT "Current date is ";LEFT$(DTTM$,10)
160 INPUT "Date (MM-DD-YY or MM-DD or DD or null): ",DT$
170 IF DT$="" THEN DT$=LEFT$(DTTM$,10): GOTO 200
180 J=INSTR(DT$,"-"): IF J=0 THEN J=3: DT$=LEFT$(DTTM$,2)+"-"+DT$+"-"+MID$(DTTM$,9,2)
190 J=INSTR(3,DT$,"-"): IF J=0 THEN DT$=DT$+"-"+MID$(DATE$,9,2)
200 DATE$=DT$: PRINT "New date is ";DATE$"
210 PRINT "Current time is ";RIGHT$(DTTM$,8)
220 INPUT "Time (HH:MM or HH-MM or HHMM, 'p' suffix for PM): ",TM$
230 IF TM$="" THEN TM$=RIGHT$(DTTM$,8): GOTO 300
240 M=0: IF RIGHT$(TM$,1)="p" THEN M=12: TM$=LEFT$(TM$,LEN(TM$)-1)
250 J=INSTR(TM$,":"): IF J=0 THEN J=INSTR(TM$,"-")
260 IF J=0 THEN TM$=LEFT$(TM$,LEN(TM$)-2)+":"+MID$(TM$,LEN(TM$)-1):J=LEN(TM$)-2
270 K=VAL(LEFT$(TM$,J-1)): K$=MID$(TM$,J)
280 IF K=12 THEN IF MID$(K$,J+1,2)="00" THEN M=-M ELSE M=12-M
290 TM$=MID$(STR$(K+M)+K$,2)
300 TIME$=TM$: PRINT "New time is ";TIME$
310 OPEN "DATETIME.FIL" FOR OUTPUT AS #1
320 PRINT #1,DATE$+" "+TIME$: CLOSE: SYSTEM
330 DTTM$="01-01-1983 00:00:00": RESUME 150
