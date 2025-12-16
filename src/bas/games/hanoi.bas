100 a=1: b=3: t=0
110 print "Towers of hanoi"
120 input "Number of rings ? ";n:n=int(n)
130 gosub 200
140 print "Total moves = ";t
150 print
160 load "menu.bas"
200 if n<=0 then return
210 n=n-1: b=6-b-a
220 gosub 200
230 b=6-b-a: n=n+1
240 t=t+1:print "move ring ";n;" from ";a;" to ";b
250 n=n-1: a=6-b-a
260 gosub 200
270 a=6-b-a: n=n+1
280 return

