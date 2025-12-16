'Code supplement for the projection article at QBCM
'3d projection test
'applied to a plane
'Relsoft 2004
'rel.betterwebber.com

DEFINT A-Z
REM $DYNAMIC


TYPE Point3d
        x       AS SINGLE           '3d x coord
        y       AS SINGLE           'ditto
        z       AS SINGLE           'ditto
END TYPE


CONST LENS = 256                    'camera lens(FOV)
CONST XCENTER = 160                 'middle coords of screen 13
CONST YCENTER = 100                 'our center of projection


CLS
SCREEN 13


LOCATE 1, 1
PRINT "Q-B-C-M"                     'out text to project ala Star-Wars

I = 0                               'check out how many pixels we have
FOR y = 0 TO 7
FOR x = 0 TO 60
    C = POINT(x, y)
    IF C <> 0 THEN
        I = I + 1
    END IF
NEXT x
NEXT y

REDIM Text(I - 1) AS Point3d
I = 0
Scale = 3                           'scale factor
z = 0
FOR y = 7 TO 0 STEP -1              'Right-handed system (Y goes up)
FOR x = 0 TO 60                     'X goes right
    C = POINT(x, 7 - y)
    IF C <> 0 THEN
        Text(I).x = (x - 30) * Scale        'center it
        Text(I).y = (y - 4) * Scale
        Text(I).z = z
        I = I + 1
    END IF
NEXT x
    z = z + 15                      'and Z goes into you
NEXT y


    'loop through each pixel and project it.
FOR I = 0 TO UBOUND(Text)
    sx! = Text(I).x                        'coords
    sy! = Text(I).y                        'cleans the projectioon
    sz! = Text(I).z                        'algo. ;*)
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
NEXT I

C$ = INPUT$(1)                  'wait for Keypress
DEF SEG

CLS
SCREEN 0
WIDTH 80
C$ = INPUT$(1)


END

