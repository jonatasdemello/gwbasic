5 cls
10 INPUT "Enter in a month ",m
20 input "Enter in a date ",d
30 input "Enter in a year ",y
40 if (m = 1 and (d = 31)) or (m = 3 and (d = 31)) or (m = 5 and (d = 31)) or (m = 7 and (d = 31)) or (m = 8 and (d = 31)) or (m = 10 and (d = 31)) or (m = 12 and (d = 31)) then let a = 1
50 if (m = 4 and (d = 30)) or (m = 6 and (d = 30)) or (m = 8 and (d = 30)) or (m = 9 and (d = 30)) or (m = 11 and (d = 30)) then let a = 2
60 if (y mod 4 = 0) and (m = 2) and (d = 28) then print "Tomorrow's date is 2/29/"y""
70 if (y mod 100 = 0) and (y mod 400 = 0) and (m = 2) and (d = 28) then print "Tomorrow's date is 2/29/"y""
80 if (y mod 4 <> 0) and (m = 2) and (d = 28) then print "Tomorrow's date is 3/1/"y""
81 if (m = 12) and (d = 31) then a = 3
100 if a = 1 then print "Tomorrow's date is "m+1"/1/"y""
110 if a = 2 then print "Tomorrow's date is "m+1"/1/"y""
115 if a = 3 then print "Tomorrow's date is 1/1/"y+1"
120 if a > 3 then print "Tomorrow's date is "m"/"d+1"/"y""






