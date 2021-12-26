100 KEY OFF : CLS : PRINT : 'Game Menu program
110 PRINT "   This is a shareware program.         David H. Ahl"
120 PRINT "   Thank you for sending $20.00         12 Indian Head Road"
130 PRINT "   to the address at the right.         Morristown, NJ 07960" : PRINT
140 PRINT : X$="BASIC COMPUTER ADVENTURES" : GOSUB 320 : PRINT
150 X$="(c) David H. Ahl, 1986-87" : GOSUB 320 : PRINT
160 FOR I=1 TO 11 : READ GAME$ : PRINT I "  " GAME$ : NEXT I
170 PRINT : PRINT : INPUT "Which game would you like to play (number)";A
180 IF A<1 OR A>11 THEN INPUT "Not a valid choice (1 to 11 please)";A : GOTO 180
190 ON A GOTO 200,210,220,230,240,250,260,270,280,290,300
200 RUN "MARCO" : DATA "The journey of Marco Polo, 1271"
210 RUN "WESTHO" : DATA "Westward Ho over the Oregon Trail, 1847"
220 RUN "AUTORACE" : DATA "The World's longest auto race, 1908"
230 RUN "ORIENT" : DATA "A Myterious Arms Deal on the Orient Express, 1923"
240 RUN "EARHART" : DATA "Around the world flight of Amelia Earhart, 1937"
250 RUN "APP" : DATA "Walk the entire Appalachian Trail (present day)"
260 RUN "TOUR" : DATA "The Tour de France bicycle race (present day)"
270 RUN "SUBWAY" : DATA "Deliver packages using the NY Subway System (present)"
280 RUN "HONGKONG" : DATA "Collect bags of gold around Hong Kong, 1997"
290 RUN "NEPTUNE" : DATA "Space voyage to Neptune, 2100"
300 KEY ON : CLS : END : DATA "Quit and return to BASIC"
310 '
320 'Subroutine to print centered lines
330 PRINT TAB((60-LEN(X$))/2) X$ : RETURN
340 END
