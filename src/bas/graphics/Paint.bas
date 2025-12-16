'  Written by Shadow. If you submit this to any site please leave the
'  original commenting.
'  Contact me by email at AIMkeepsfreezn@netscape.net .
' ********************************************************************

CLS
PRINT " Welcome to Shadow's Creative Paint Program!"
PRINT ""
PRINT "Instructions:"
PRINT ""
PRINT "Use the arrow keys to move."
PRINT " w = Change color forward "
PRINT " s = Change color backwards "
PRINT " a = Make circle bigger "
PRINT " d = Make circle smaller "
PRINT " x = Clear the screen"
PRINT ""
PRINT "********************************"
PRINT " Press c to paint!"
PRINT "(Any other key will end this program.) "
INPUT cont$
IF cont$ = "c" THEN
SCREEN 12
LET x = 100  'The x coordinate of the circle
LET y = 100  'The y coordinate of the circle
LET c = 5    'This will be the size
LET I = 1    'This will be the color
DO
CIRCLE (x, y), c, I
PAINT (x, y), I
press$ = INKEY$
 ' line below says if you press the up arrow key, move the circle up
IF y > 20 THEN IF press$ = CHR$(0) + CHR$(72) THEN y = y - 10
 ' line below says if you press the down arrow key, move the circle down
IF y < 460 THEN IF press$ = CHR$(0) + CHR$(80) THEN y = y + 10
 ' line below says if you press the left arrow key, move the circle left
IF x > 20 THEN IF press$ = CHR$(0) + CHR$(75) THEN x = x - 10
 ' line below says if you press the right arrow key, move the circle right
IF x < 620 THEN IF press$ = CHR$(0) + CHR$(77) THEN x = x + 10
IF press$ = "w" THEN I = I + 1   ' adds one to the color number
IF press$ = "a" THEN c = c + 1   ' adds one to the circle size
IF press$ = "s" THEN I = I - 1   ' subtracts one from the color number
IF press$ = "d" THEN c = c - 1   ' subtracts one from the circle size
IF c > 9 THEN c = 1    ' loops size when it gets to high
IF c < 1 THEN c = 9    ' loops size when it gets too low
IF I > 15 THEN I = 1   ' loops color when it gets too high
IF I < 1 THEN I = 15   ' loops color when it gets too low
IF press$ = "x" THEN
LINE (x - 630, y - 480)-(x + 640, y + 480), 0, BF  ' clears screen
END IF
LOOP UNTIL press$ = CHR$(27)   ' continue to color until escape is pressed

END IF

  

