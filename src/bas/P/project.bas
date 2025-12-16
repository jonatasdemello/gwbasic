'Code supplement for the projection article at QBCM
'3d projection test
'applied to a plane
'SetVideoSeg by Plasma357
'Relsoft 2004
'rel.betterwebber.com


DECLARE SUB AF.Print (Xpos%, Ypos%, Text$, col%)
DECLARE SUB SetVideoSeg (Segment%)


DEFINT A-Z
REM $DYNAMIC


TYPE Point3D
        x       AS SINGLE           '3d x coord
        y       AS SINGLE           'ditto
        z       AS SINGLE           'ditto
END TYPE


CONST LENS = 256                    'camera lens(FOV)
CONST XCENTER = 160                 'middle coords of screen 13
CONST YCENTER = 100                 'our center of projection



REDIM SHARED Vpage(32009) AS INTEGER            'our buffer

Gsize = 16
size% = Gsize * Gsize                       '16 * 16 grid
DIM SHARED Plane(size% - 1) AS Point3D      'dim out plane

Scale = 4                           'scale factor
                                    'change to a smaller if you want to
                                    'reduce the size.
z = 0                               'start 256 units away from screen
i = 0                               'index for pixels

HalfSize = Gsize \ 2                '1/2 of our grid for centering
FOR y = HalfSize - 1 TO -HalfSize STEP -1           'loop through it
FOR x = HalfSize - 1 TO -HalfSize STEP -1           'and calculate each coord

    Plane(i).x = x * Scale          'make the model bigger
    Plane(i).y = y * Scale
    Plane(i).z = z
    i = i + 1                       'increment array index
NEXT x
    z = z + 20                      'go out into the screen 20 units
                                    'every line.
NEXT y


CLS
SCREEN 13
centeroffset = (HalfSize) * Scale
FOR i = 0 TO UBOUND(Plane)
    sx% = Plane(i).x + centeroffset           'check out our model in 2d
    sy% = Plane(i).y + centeroffset
    PSET (sx%, sy%), 15
NEXT i

LOCATE 9, 1
PRINT "This is the plane we are"
PRINT "going to project onto"
PRINT "the screen using our"
PRINT "projection formula"
PRINT
PRINT "press any key..."

C$ = INPUT$(1)

CLS
    'loop through each pixel and project it.
FOR i = 0 TO UBOUND(Plane)
    sx! = Plane(i).x                        'coords
    sy! = Plane(i).y                        'no camera control yet
    sz! = Plane(i).z                        '
    Distance% = (LENS - sz!)                'get Distance
    IF Distance% > 0 THEN                   'if dist>>0 then
        'Projection formula
        x% = (LENS * sx! / Distance%) + XCENTER
        y% = -(LENS * sy! / Distance%) + YCENTER
        PSET (x%, y%), 15         'Draw each star
    ELSE
                                    'do nothing
                                    'you wouldn't wan't to
                                    'divide by 0 would ya? :*)
                                    'and in geometry, distance is
                                    'always positive. ;*)
    END IF
NEXT i

LOCATE 1, 1
PRINT "This is how a plane would look "
PRINT "like projected on screen,"
PRINT "and this is the start of"
PRINT "more things to come."
PRINT
PRINT "press any key..."
C$ = INPUT$(1)                  'wait for Keypress


'/==========================================================================
'////////Start of camera control
'/==========================================================================

camx% = 0               'Let ouir camera be at Point(0,0,0) centered
camy% = 0
camz% = 0

Vpage(6) = 2560                     'SetVideoSEG stuff
Vpage(7) = 200                      'GET/PUT array
Layer = VARSEG(Vpage(0)) + 1
Finished = 0

DO

     K$ = INKEY$                'get keypress
     SELECT CASE UCASE$(K$)     'and control our camera
        CASE "A"
            camz% = camz% + 1       'add
        CASE "Z"
            camz% = camz% - 1       'subtract
        CASE "S"
            camy% = camy% + 1
        CASE "X"
            camy% = camy% - 1
        CASE "D"
            camx% = camx% + 1
        CASE "C"
            camx% = camx% - 1
        CASE ELSE
    END SELECT

    SetVideoSeg Layer                           'Set draw to buffer
    LINE (0, 0)-(319, 199), 0, BF               'CLS

    'Print values of our camera
    AF.Print 0, 0, "Camera Values:", 23
    AF.Print 0, 8, "camera x = " + LTRIM$(STR$(camx%)), 23
    AF.Print 0, 16, "camera y = " + LTRIM$(STR$(camy%)), 23
    AF.Print 0, 24, "camera z = " + LTRIM$(STR$(camz%)), 23

    'Control instructions
    AF.Print 160, 0, "Controls:[ESC]=quit", 69
    AF.Print 160, 8, "D=[+] / C=[-]", 69
    AF.Print 160, 16, "S=[+] / X=[-]", 69
    AF.Print 160, 24, "A=[+] / Z=[-]", 69

    'Draw our projected plane depending on camera values
    GOSUB DRAWPLANE
    SetVideoSeg &HA000          'set draw to screen
    WAIT &H3DA, 8               'vsynch
    PUT (0, 0), Vpage(6), PSET  'blit our buffer to screen

LOOP UNTIL K$ = CHR$(27)


DEF SEG         'restore default segment

CLS
SCREEN 0
WIDTH 80


END


'/==========================================================================
'////////Draw our 3d grid
'/==========================================================================

DRAWPLANE:
    'loop through each pixel and project it.
    FOR i = 0 TO UBOUND(Plane)
        sx! = Plane(i).x - camx%    'coords
        sy! = Plane(i).y - camy%    'sub tracted by the
        sz! = Plane(i).z - camz%    'camera
                                    'we can still directly subtract
                                    'camera offsets to our original
                                    'coords as we are not rotating yet. ;*)

        Distance% = (LENS - sz!)                'get Distance
        IF Distance% > 0 THEN                   'if dist>>0 then
            'Projection formula
            x% = XCENTER + (LENS * sx! / Distance%)
            y% = YCENTER - (LENS * sy! / Distance%)
            PSET (x%, y%), 15         'Draw each star
        ELSE
                                        'do nothing
                                        'you wouldn't wan't to
                                        'divide by 0 would ya? :*)
                                        'and in geometry, distance is
                                        'always positive. ;*)
        END IF
NEXT i

RETURN

REM $STATIC
SUB AF.Print (Xpos%, Ypos%, Text$, col%)
'Prints the standard 8*8 CGA font
'Paramenters:
'Segment=the Layer to print to
'Xpos,Ypos=the coordinates of the text
'Text$=the string to print
'col= is the color to print(gradient)

x% = Xpos%
y% = Ypos%
Spacing% = 8
  FOR i% = 0 TO LEN(Text$) - 1
    x% = x% + Spacing%
    Offset% = 8 * ASC(MID$(Text$, i% + 1, 1)) + 14
    FOR j% = 0 TO 7
      DEF SEG = &HFFA6
      Bit% = PEEK(Offset% + j%)
      IF Bit% AND 1 THEN PSET (x%, y% + j%), col% + j%
      IF Bit% AND 2 THEN PSET (x% - 1, y% + j%), col% + j%
      IF Bit% AND 4 THEN PSET (x% - 2, y% + j%), col% + j%
      IF Bit% AND 8 THEN PSET (x% - 3, y% + j%), col% + j%
      IF Bit% AND 16 THEN PSET (x% - 4, y% + j%), col% + j%
      IF Bit% AND 32 THEN PSET (x% - 5, y% + j%), col% + j%
      IF Bit% AND 64 THEN PSET (x% - 6, y% + j%), col% + j%
      IF Bit% AND 128 THEN PSET (x% - 7, y% + j%), col% + j%
    NEXT j%
  NEXT i%

END SUB

SUB SetVideoSeg (Segment) STATIC

DEF SEG

IF VideoAddrOff& = 0 THEN ' First time the sub is called

' We need to find the location of b$AddrC, which holds the graphics
' offset (b$OffC) and segment (b$SegC). Since b$AddrC is in the default
' segment, we can find it by setting it to a certain value, and then
' searching for that value.

SCREEN 13 ' Set b$SegC to A000 (00A0 in memory)
PSET (160, 100), 0 ' Set b$OffC to 7DA0 (not needed in the IDE)

FOR Offset& = 0 TO 32764 ' Search for b$AddrC, which is
IF PEEK(Offset&) = &HA0 THEN ' in the default segment and
IF PEEK(Offset& + 1) = &H7D THEN ' should have a value of
IF PEEK(Offset& + 2) = &H0 THEN ' A0 7D 00 A0.
IF PEEK(Offset& + 3) = &HA0 THEN
VideoAddrOff& = Offset& + 2 ' If we found it, record the
EXIT FOR ' offset of b$SegC and quit
END IF ' looking. (Oddly, changing
END IF ' the b$OffC doesn't seem to
END IF ' do anything, so this is why
END IF ' this sub only changes b$SegC)
NEXT

END IF

' Change b$SegC to the specified Segment

POKE VideoAddrOff&, Segment AND &HFF
POKE VideoAddrOff& + 1, (Segment AND &HFF00&) \ &H100



END SUB

