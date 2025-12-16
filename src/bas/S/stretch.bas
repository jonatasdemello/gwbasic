'''vector balls!!!!
'''Scaling of sprite snd sprite projection enabled
'''SetvideoSeg by Plasma357
'''Compile for speed. :*)

'''Rel.betterwebber.com
DECLARE SUB BubbleSort (Model() AS ANY)
DECLARE SUB LoadSpace (Model() AS ANY, radius%, NumBalls%)
DECLARE SUB DrawModel (Model() AS ANY, Balls%())
DECLARE SUB SetVideoSeg (Segment%)
DECLARE SUB RotateAndProject (Model() AS ANY, AngleX%, AngleY%, AngleZ%)
DECLARE SUB StretchSprite (px%, py%, newwid%, newhei%, idx%, Buffer%())

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
        NHei    AS INTEGER
        Nwid    AS INTEGER
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

FOR i = 0 TO 31                         'get our balls
    LINE (0, 0)-(15, 15), 0, BF         'clear box
    clr = 55 * (INT(RND * 128))         'random colors
    CIRCLE (8, 8), 7, clr               'draw
    PAINT (8, 8), clr + 8, clr
    CIRCLE (8, 8), 7, clr + 8
    CIRCLE (5, 5), 1, 15
    PAINT (5, 5), 15
    GET (0, 0)-(15, 15), Balls(0, i)    'get sprite
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
zdir = -1
DO
    camz% = camz% + zdir
    IF camz% > 200 THEN
        zdir = -zdir
    ELSEIF camz% < -164 THEN
        zdir = -zdir
    END IF
            

     Thetax = (Thetax + 1) MOD 360
     Thetay = (Thetay + 1) MOD 360
     Thetaz = (Thetaz + 1) MOD 360
     RotateAndProject Model(), Thetax, Thetay, Thetaz
     BubbleSort Model()
     SetVideoSeg Layer
     LINE (0, 0)-(319, 199), 0, BF
     DrawModel Model(), Balls()
     SetVideoSeg &HA000
     WAIT &H3DA, 8
     PUT (0, 0), Vpage(6), PSET

LOOP UNTIL INKEY$ <> ""


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

SUB DrawModel (Model() AS Point3d, Balls()) STATIC
'uses a stretch sprite routine to do sprite projection

FOR i = 0 TO UBOUND(Model)
    x% = INT(Model(i).scrx)
    y% = INT(Model(i).scry)
    IF NOT Model(i).cull THEN
        StretchSprite x%, y%, Model(i).Nwid, Model(i).NHei, Model(i).idx, Vpage()
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
CY! = Lcos(AngleY)
sy! = Lsin(AngleY)
cz! = Lcos(AngleZ)
sz! = Lsin(AngleZ)

'''After2 hours of work, I was able to weed out the constants from
'''Rotate and project N to reduce my muls to 9 instead of 12. woot!!!!

xx! = CY! * cz!
xy! = sx! * sy! * cz! - cx! * sz!
xz! = cx! * sy! * cz! + sx! * sz!

yx! = CY! * sz!
yy! = cx! * cz! + sx! * sy! * sz!
yz! = -sx! * cz! + cx! * sy! * sz!

zx! = -sy!
zy! = sx! * CY!
zz! = cx! * CY!

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
            Model(i).NHei = 16 * 256 / Distance%
            Model(i).Nwid = 16 * 256 / Distance%
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

SUB StretchSprite (px%, py%, newwid%, newhei%, idx, Buffer())

'balls is a GET/PUT array
'uses 8.8 fixed point math for lil speed inside the IDE
'clipping supported

wid% = Balls(0, idx) \ 8
Hei% = Balls(1, idx)
xstep% = (wid% * 256 \ newwid%)
ystep% = (Hei% * 256 \ newhei%)

y% = py%
x% = px%
'Clip/Crop it
IF y% < 0 THEN
        CY = -y%
        newhei% = newhei% - CY
        y% = 0
        miny% = CY
ELSEIF y% > 199 THEN
        EXIT SUB
ELSE
        Ndy = y% + newhei%
        IF Ndy > 199 THEN
                newhei% = newhei% - (Ndy - (200))
        END IF
END IF

IF x% < 0 THEN
        cx = -x%
        newwid% = newwid% - cx
        x% = 0
        minx% = cx
ELSEIF x% > 319 THEN
        EXIT SUB
ELSE
        Ndx = x% + newwid%
        IF Ndx > 319 THEN
                newwid% = newwid% - (Ndx - 320)
        END IF
END IF

'ax=x
'bx=wid
'cx=y
'dx=hei


Vseg% = VARSEG(Buffer(0))
Voff% = VARPTR(Buffer(8))

u& = 0
v& = 0
T20Mw = 320 - newwid%
di& = Voff% + y% * 320& + x%        'start coords

v& = miny% * ystep%
minxstep& = minx% * xstep%

FOR y% = 0 TO newhei% - 1
    u& = minxstep&
    ya = v& \ 256
    Temp& = (ya) * wid% + VARPTR(Balls(2, idx))
    Offset& = Temp&
FOR x% = 0 TO newwid% - 1
    xa = u& \ 256
    Offset& = Temp& + xa
    DEF SEG = VARSEG(Balls(0, idx))
    C% = PEEK(Offset&)
    IF C% THEN
        DEF SEG = Vseg%
        POKE di&, C%
    END IF
    u& = u& + xstep%
    di& = di& + 1
NEXT x%
    v& = v& + ystep%
    di& = di& + T20Mw
NEXT y%

END SUB

