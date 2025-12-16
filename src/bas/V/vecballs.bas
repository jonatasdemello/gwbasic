'''vector balls!!!!
'''SetvideoSeg by Plasma357

'''Rel.betterwebber.com

DECLARE SUB BubbleSort (Model() AS ANY)
DECLARE SUB LoadSpace (Model() AS ANY, radius%, NumBalls%)
DECLARE SUB DrawModel (Model() AS ANY, Balls%(), Mask%())
DECLARE SUB SetVideoSeg (Segment%)
DECLARE SUB RotateAndProject (Model() AS ANY, AngleX%, AngleY%, AngleZ%)

DEFINT A-Z
REM $DYNAMIC



TYPE Point3d
        x       AS SINGLE                   'Normal 3d coords
        y       AS SINGLE
        z       AS SINGLE
        xr      AS SINGLE                   'Rotated  3d coords
        yr      AS SINGLE
        zr      AS SINGLE
        scrx    AS INTEGER                  'Translated and projected
        scry    AS INTEGER                  '2d Coords
        cull    AS INTEGER                   'visibility check
        idx     AS INTEGER
END TYPE

CONST FALSE = 0, TRUE = NOT FALSE

CONST LENS = 256                            'Z
CONST XCENTER = 160                         '??
CONST YCENTER = 100                         '??


CONST PI = 3.14151693#

REDIM SHARED Vpage(32009)  AS INTEGER
DIM SHARED Lcos(359) AS SINGLE
DIM SHARED Lsin(359) AS SINGLE

'Polyhedra stuff
REDIM SHARED Model(1) AS Point3d               '3d  Coords
DIM SHARED Thetax, Thetay, Thetaz
DIM SHARED zcenter, camx%, camy%, camz%


'PreCalc sin and cos lookuptable

FOR i = 0 TO 359
    a! = i * PI / 180
    Lcos(i) = COS(a!)
    Lsin(i) = SIN(a!)
NEXT i


CLS
SCREEN 13
RANDOMIZE TIMER

size = ((16 ^ 2) + 4) \ 2               '16*16 sprite
DIM SHARED Balls(size, 31)              'sprite
DIM SHARED BallsMask(size, 31)          'mask

FOR i = 0 TO 31                         'get our balls
    LINE (0, 0)-(15, 15), 0, BF         'clear box
    clr = 55 * (INT(RND * 128))         'random colors
    CIRCLE (8, 8), 7, clr               'draw
    PAINT (8, 8), clr + 8, clr
    CIRCLE (8, 8), 7, clr + 8
    CIRCLE (5, 5), 1, 15
    PAINT (5, 5), 15
    GET (0, 0)-(15, 15), Balls(0, i)    'get sprite
    FOR y = 0 TO 15                     'make mask
    FOR x = 0 TO 15
        IF POINT(x, y) = 0 THEN
            PSET (x, y), 255            'maskit
        ELSE
            PSET (x, y), 0
        END IF
    NEXT x
    NEXT y
    GET (0, 0)-(15, 15), BallsMask(0, i)     'get mask
NEXT i

LoadSpace Model(), 50, 31               'load model


camx% = 0
camy% = 0
camz% = 0

Thetax = 0'INT(RND * 360)
Thetay = 0'INT(RND * 360)
Thetaz = 0'INT(RND * 360)

Vpage(6) = 2560
Vpage(7) = 200
Layer = VARSEG(Vpage(0)) + 1
SetVideoSeg Layer
Finished = 0

DO

     K$ = INKEY$
     SELECT CASE UCASE$(K$)
        CASE "A"
            camz% = camz% + 1
        CASE "Z"
            camz% = camz% - 1
        CASE "S"
            camy% = camy% + 1
        CASE "X"
            camy% = camy% - 1
        CASE "D"
            camx% = camx% + 1
        CASE "C"
            camx% = camx% - 1
        CASE CHR$(0) + "H"
            Thetay = (Thetay + 1) MOD 360
        CASE CHR$(0) + "P"
            Thetay = (Thetay - 1)
                   IF Thetay < 0 THEN Thetay = 359
        CASE CHR$(0) + "K"
            Thetax = (Thetax - 1)
                   IF Thetax < 0 THEN Thetax = 359
        CASE CHR$(0) + "M"
            Thetax = (Thetax + 1) MOD 360
        CASE CHR$(0) + CHR$(&H53)
            Thetaz = (Thetaz - 1)
                   IF Thetaz < 0 THEN Thetaz = 359
        CASE CHR$(0) + CHR$(&H52)
            Thetaz = (Thetaz + 1) MOD 360
        CASE ELSE
    END SELECT
            

     Thetax = (Thetax + 1) MOD 360
     Thetay = (Thetay + 1) MOD 360
     Thetaz = (Thetaz + 1) MOD 360
     RotateAndProject Model(), Thetax, Thetay, Thetaz
     BubbleSort Model()
     SetVideoSeg Layer
     LINE (0, 0)-(319, 199), 0, BF
     DrawModel Model(), Balls(), BallsMask()
     SetVideoSeg &HA000
     WAIT &H3DA, 8
     PUT (0, 0), Vpage(6), PSET

LOOP UNTIL K$ = CHR$(27)


CLS
SCREEN 0
WIDTH 80

END

REM $STATIC
SUB BubbleSort (Model() AS Point3d)
'Not the best sorting but gets the job done. ;*)
'don't you fret, I will teach you 3 more sorting algos. :*)

min = LBOUND(Model)
max = UBOUND(Model)
FOR i = min TO max      'loop through all the balls
FOR j = i TO max - 1
    IF Model(j).zr > Model(j + 1).zr THEN  'Swap if not in order
        SWAP Model(j), Model(j + 1)
    END IF
NEXT j
NEXT i


END SUB

SUB DrawModel (Model() AS Point3d, Balls(), Mask()) STATIC
'uses masks to make transparent sprite bliting.

FOR i = 0 TO UBOUND(Model)
    x% = INT(Model(i).scrx)
    y% = INT(Model(i).scry)
    IF NOT Model(i).cull THEN
        PUT (x%, y%), BallsMask(0, Model(i).idx), AND       'put the balls
        PUT (x%, y%), Balls(0, Model(i).idx), OR
    END IF
NEXT i

END SUB

SUB LoadSpace (Model() AS Point3d, radius, NumBalls)
'////Initialize the starting values of our balls
REDIM Model(NumBalls) AS Point3d
FOR i = 0 TO UBOUND(Model)
    ax! = RND - .5
    ay! = RND - .5
    az! = RND - .5
    dist! = SQR(ax! ^ 2 + ay! ^ 2 + az! ^ 2)
    Model(i).x = ax! / dist! * (20 + (RND * radius))
    Model(i).y = ay! / dist! * (20 + (RND * radius))
    Model(i).z = az! / dist! * (20 + (RND * radius))
    Model(i).idx = INT(RND * 31)
NEXT i

END SUB

SUB RotateAndProject (Model() AS Point3d, AngleX, AngleY, AngleZ) STATIC
''Right handed system
''when camera components increase:
''x=goes left
''y=goes down
''z goes into the screen

'''rotation: counter-clockwise of each axis
''ei.  make yourself perpenicular to the axis
''wave your hand from the center of your body to the left.
''That's how it rotates. ;*)


'Precalculate the SIN and COS of each angle
cx! = Lcos(AngleX)
sx! = Lsin(AngleX)
cy! = Lcos(AngleY)
sy! = Lsin(AngleY)
cz! = Lcos(AngleZ)
sz! = Lsin(AngleZ)

'''After2 hours of work, I was able to weed out the constants from
'''Rotate and project N to reduce my muls to 9 instead of 12. woot!!!!

xx! = cy! * cz!
xy! = sx! * sy! * cz! - cx! * sz!
xz! = cx! * sy! * cz! + sx! * sz!

yx! = cy! * sz!
yy! = cx! * cz! + sx! * sy! * sz!
yz! = -sx! * cz! + cx! * sy! * sz!

zx! = -sy!
zy! = sx! * cy!
zz! = cx! * cy!

FOR i = 0 TO UBOUND(Model)

        x! = Model(i).x
        y! = Model(i).y
        z! = Model(i).z

        RotX! = (x! * xx! + y! * xy! + z! * xz!) - camx%
        RotY! = (x! * yx! + y! * yy! + z! * yz!) - camy%
        RotZ! = (x! * zx! + y! * zy! + z! * zz!) - camz%

        Model(i).xr = RotX!
        Model(i).yr = RotY!
        Model(i).zr = RotZ!
        Model(i).cull = FALSE

        'Project
        Distance% = (LENS - RotZ!)
        IF Distance% > 0 THEN
            Model(i).scrx = (LENS * RotX! / Distance%) + XCENTER
            Model(i).scry = -(LENS * RotY! / Distance%) + YCENTER
        ELSE
            Model(i).cull = TRUE
        END IF
NEXT i

END SUB

SUB SetVideoSeg (Segment) STATIC
'By Plasma 357 (Jon Petrosky)

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

