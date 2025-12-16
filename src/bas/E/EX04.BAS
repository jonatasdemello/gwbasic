CONST UP = 1
CONST DOWN = 2
CONST LEFT = 3
CONST RIGHT = 4

TYPE objectType
  x AS INTEGER
  y AS INTEGER
END TYPE
DIM object AS objectType
initScreen
object.x = 41
object.y = 24

DO
  SELECT CASE INKEY$
    CASE CHR$(0) + CHR$(72): move UP, object
    CASE CHR$(0) + CHR$(80): move DOWN, object
    CASE CHR$(0) + CHR$(75): move LEFT, object
    CASE CHR$(0) + CHR$(77): move RIGHT, object
    CASE CHR$(32): EXIT DO
  END SELECT
LOOP 
LOCATE 1,1: PRINT "Thank you for playing"
END


SUB initScreen () 
  SCREEN 12
  COLOR 9
  WIDTH 80,50
  LOCATE 24,41
  PRINT CHR$(1)
END SUB


SUB move (way AS INTEGER, object AS objectType)
  LOCATE object.y, object.x
  PRINT CHR$(0)       ' erase previous image 
  SELECT CASE way
    CASE UP: IF object.y > 1 THEN object.y = object.y - 1
    CASE DOWN: IF object.y < 49 THEN object.y = object.y + 1  
    CASE LEFT: IF object.x > 1 THEN object.x = object.x - 1
    CASE RIGHT: IF object.x < 79 THEN object.x = object.x + 1
  END SELECT
  LOCATE object.y, object.x
  PRINT CHR$(1)       ' draw current image
END SUB

