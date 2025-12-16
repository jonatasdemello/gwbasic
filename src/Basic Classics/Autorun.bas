10 rem
20 rem 4/23/02 Anthony Wood
30 rem
35 cls
40 defint p,k,y
50 a$="AW Software":x2=(64-len(a$))/2:y2=2
60 gosub 2025
70 a$="P R E S E N T S ":y=3
80 gosub 1030
90 x=12+64*5:gosub 3030    ' CLASSIC graphic
100 x=25+64*8:gosub 3030   ' BASIC graphic
110 x=32+64*11:gosub 3030  ' GAMES
120 gosub 800 ' wait for key
300 cls
310 print"Instructions  (April 2002)"
320 print"------------":print
330 print"Welcome to my collection of classic BASIC games."
340 print"The easiest way to play a game is to open one of"
350 print"the game folders and drag a game's icon on to this"
360 print"window.  The game will then load and run.  Note: you"
365 print"will need to use UPPERCASE letters for most games."
370 print
380 print"Each game included in this collection is an original,"
390 print"un-cut classic game from the '70s and early '80s."
400 print"Although these versions are TRS-80 versions, they are very"
410 print"similar, if not identical, to versions for other computers"
420 print"of the day (Apple II, PDP-11, etc.)"
430 gosub 800 ' wait for key
500 cls
510 print"How It Works"
520 print"------------":print
530 print"You are running a TRS-80 Microsoft Level 2 BASIC compatible 
540 print"interpreter that runs on Windows.  It will run original 
550 print"tokenized or ASCII programs.  Even this program running"
560 print"right now is BASIC code (try File | Debug Console | LIST)."
565 print"I wrote the interpreter in 2002, and the BASIC software in the"
570 print"AW Software folder between 1978 and 1983.":print
580 print"But the more interesting stuff is in the other folders.  These"
590 print"are classic games, written by others.  Games like Hamurabi,"
600 print"Elisa, Star Trek, etc.":print
610 print"Enjoy this blast from the past!"
620 print"Anthony Wood,  www.awsoftware.org";
799 goto 799
800 rem
802 rem wait for a key
804 rem
806 print@64*15,"Press any key to continue";
810 fork=1to400:if inkey$<>"" then return else next
820 print@64*14,"                         ";
830 fork=1to50:if inkey$<>"" then return else next
840 goto 806
1000 rem
1010 rem Horizontal scroll string a$ from left side to center, line y
1020 rem
1030 for x=63 to (64-len(a$))/2 step -1
1040   l = 63 - x + 1
1050   if l > len(a$) then l = len(a$)
1060   print@y*64+x,left$(a$,l);" ";
1065   for d=1to10:nextd
1070 next
1080 return
2000 rem
2010 rem fly a string from the bottom of the screen to position x2,y2
2020 rem
2025 forp=1tolen(a$)
2030    x0 = rnd(62)
2035    x1 = x0
2040    y1 = 15
2050    dx = (x2 - x1)/(y1-y2)
2060    for y=y1 to y2+1 step -1
2070      print@y*64+x1,mid$(a$,p,1);
2080      x1=x1+dx
2085      ford=1to4:nextd  
2090    next
2095    print@y2*64+x2,mid$(a$,p,1);
2100    REM AGAIN to erase
2110    x1 = x0
2120    for y=y1 to y2+1 step -1
2130      print@y*64+x1," ";
2140      x1=x1+dx
2150    next
2160 x2=x2+1
2170 ' for d=1 to 1000:next d
2180 next
2190 return
3000 rem
3010 rem draw a graphic
3020 rem
3030 read p,l
3040 if p=0 and l=0 return
3045 p=p+x ' manualy eyeballed offset to put in right spot
3050 for a=1 to l:read v:poke p,v:p=p+1:next
3060 goto 3030
8000 rem
8010 rem data for CLASSIC graphic (used advdraw2.bas to produce)
8020 rem
8100 DATA  15360 , 26 
8110 DATA  150 , 131 , 137 , 128 , 149 , 128 , 128 , 168 , 131 , 131 , 148 , 168 , 131 , 131 , 132 , 168 , 131 , 131 , 132 , 130 , 171 , 131 , 128 , 150 , 131 , 137 
8120 DATA  15424 , 26 
8130 DATA  149 , 128 , 160 , 128 , 149 , 128 , 128 , 170 , 131 , 131 , 149 , 160 , 131 , 131 , 148 , 160 , 131 , 131 , 148 , 128 , 170 , 128 , 128 , 149 , 128 , 160 
8140 DATA  15488 , 26 
8150 DATA  130 , 131 , 129 , 128 , 131 , 131 , 129 , 130 , 128 , 128 , 129 , 128 , 131 , 131 , 128 , 128 , 131 , 131 , 128 , 130 , 131 , 131 , 128 , 130 , 131 , 129 
8160 DATA  0 , 0 
9000 rem
9010 rem data for BASIC graphic (used advdraw2.bas to produce)
9020 rem
9030 DATA  15360 , 19 
9040 DATA  151 , 131 , 169 , 128 , 150 , 131 , 169 , 128 , 150 , 131 , 137 , 128 , 131 , 151 , 129 , 168 , 131 , 131 , 132 
9050 DATA  15424 , 19 
9060 DATA  151 , 131 , 169 , 128 , 151 , 131 , 171 , 128 , 146 , 131 , 169 , 128 , 128 , 149 , 128 , 170 , 128 , 128 , 144 
9070 DATA  15488 , 18 
9080 DATA  131 , 131 , 129 , 128 , 129 , 128 , 130 , 128 , 130 , 131 , 129 , 128 , 131 , 131 , 129 , 128 , 131 , 131 
9090 DATA  0 , 0 
9100 rem
9120 rem data for GAMES graphic
9130 rem
9140 DATA  15360 , 19 
9150 DATA  150 , 131 , 137 , 128 , 150 , 131 , 169 , 128 , 150 , 173 , 135 , 148 , 168 , 131 , 131 , 128 , 150 , 131 , 137 
9160 DATA  15424 , 19 
9170 DATA  149 , 130 , 171 , 128 , 151 , 131 , 171 , 128 , 149 , 170 , 128 , 149 , 170 , 131 , 131 , 128 , 146 , 131 , 169 
9180 DATA  15488 , 19 
9190 DATA  130 , 131 , 129 , 128 , 129 , 128 , 130 , 128 , 129 , 130 , 128 , 129 , 128 , 131 , 131 , 128 , 130 , 131 , 129 
9200 DATA  0 , 0 


