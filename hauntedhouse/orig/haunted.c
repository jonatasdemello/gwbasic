/*
HAUNTED HOUSE ADVENTURE
***********************
By Jenny Tyler and Les Howarth

Ported from Microsoft BASIC to ANSI C89 by John Elliott

*/
#define _CRT_SECURE_NO_WARNINGS

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#ifdef __MSDOS__
#include <conio.h>
#include <dos.h>
#endif

/* Counts of fixed-size arrays */
#define ROOM_COUNT   64
#define VERB_COUNT   28
#define WORD_COUNT   36
#define OBJECT_COUNT 18

/* The original BASIC has no option but to hardcode room and
 * object numbers. In C we can at least use the preprocessor 
 * to make things a little more readable */
#define OBJ_NULL        0	/* Flag 0 => candle lit */
#define OBJ_PAINTING    1
#define OBJ_RING        2
#define OBJ_SPELLS      3
#define OBJ_GOBLET      4
#define OBJ_SCROLL      5
#define OBJ_COINS       6
#define OBJ_STATUE      7
#define OBJ_CANDLESTICK 8
#define OBJ_MATCHES     9
#define OBJ_VACUUM     10
#define OBJ_BATTERIES  11
#define OBJ_SHOVEL     12
#define OBJ_AXE        13
#define OBJ_ROPE       14
#define OBJ_BOAT       15
#define OBJ_AEROSOL    16
#define OBJ_CANDLE     17
#define OBJ_KEY        18
#define OBJ_NORTH      19
#define OBJ_SOUTH	   20
#define OBJ_WEST       21
#define OBJ_EAST       22
#define OBJ_UP         23	/* Flag 23 => Front door open */
#define OBJ_DOWN       24	/* Flag 24 => Vacuum cleaner running */
#define OBJ_DOOR       25	/* Flag 25 => Wooden door open */
#define OBJ_BATS       26	/* Flag 26 => Bats active */
#define OBJ_GHOSTS     27	/* Flag 27 => Ghosts active */
#define OBJ_DRAWER     28
#define OBJ_DESK       29
#define OBJ_COAT       30
#define OBJ_RUBBISH    31
#define OBJ_COFFIN     32
#define OBJ_BOOKS      33
#define OBJ_XZANFAR    34	/* Flag 34 => magical barrier has been removed */
#define OBJ_WALL       35	/* Flag 35 => move was successful */
#define OBJ_SPELLS2    36

#define VERB_NULL       0
#define VERB_HELP       1
#define VERB_INVENTORY  2
#define VERB_GO         3
#define VERB_NORTH      4
#define VERB_SOUTH      5
#define VERB_WEST       6
#define VERB_EAST       7
#define VERB_UP         8
#define VERB_DOWN       9
#define VERB_GET       10
#define VERB_TAKE      11
#define VERB_OPEN      12
#define VERB_EXAMINE   13
#define VERB_READ      14
#define VERB_SAY       15
#define VERB_DIG       16
#define VERB_SWING     17
#define VERB_CLIMB     18
#define VERB_LIGHT     19
#define VERB_UNLIGHT   20
#define VERB_SPRAY     21
#define VERB_USE       22
#define VERB_UNLOCK    23
#define VERB_LEAVE     24
#define VERB_SCORE     25
#define VERB_SAVE      26
#define VERB_LOAD      27
#define VERB_QUIT      28

#define ROOM_DCORNER     0
#define ROOM_OGARDEN     1
#define ROOM_WOODPILE    2
#define ROOM_YARD        3
#define ROOM_WEEDPATCH   4
#define ROOM_FOREST      5
#define ROOM_TFOREST     6
#define ROOM_TREE        7
#define ROOM_CORNER      8
#define ROOM_EKITCHEN    9
#define ROOM_KITCHEN    10
#define ROOM_SCULLERY   11
#define ROOM_DUSTY      12
#define ROOM_REARTURRET 13
#define ROOM_CLEARING   14
#define ROOM_PATH       15
#define ROOM_SIDE       16
#define ROOM_BHALLWAY   17
#define ROOM_DARKALCOVE 18
#define ROOM_SMALLDARK  19
#define ROOM_BSTAIRCASE 20
#define ROOM_WPASSAGE   21
#define ROOM_SLIPPERY   22
#define ROOM_CLIFFTOP   23
#define ROOM_CRUMBLING  24
#define ROOM_GLOOMY     25
#define ROOM_POOL_LIGHT 26
#define ROOM_VAULTED    27
#define ROOM_THICKDOOR  28
#define ROOM_TROPHY     29
#define ROOM_CELLAR     30
#define ROOM_CLIFFPATH1 31
#define ROOM_CUPBOARD   32
#define ROOM_FRONTHALL  33
#define ROOM_SITTING    34
#define ROOM_SECRET     35
#define ROOM_MSTAIRS    36
#define ROOM_DINING     37
#define ROOM_DEEPCELLAR 38
#define ROOM_CLIFFPATH2 39
#define ROOM_CLOSET     40
#define ROOM_FRONTLOBBY 41
#define ROOM_LIBRARY    42
#define ROOM_STUDY      43
#define ROOM_COBWEBBY   44
#define ROOM_VERYCOLD   45
#define ROOM_SPOOKY     46
#define ROOM_CLIFFPATH3 47
#define ROOM_VERANDAH   48
#define ROOM_FRONTPORCH 49
#define ROOM_FRONTTOWER 50
#define ROOM_SCORRIDOR  51
#define ROOM_GALLERY    52
#define ROOM_MARSHWALL  53
#define ROOM_MARSH      54
#define ROOM_SOGGYPATH  55
#define ROOM_TRAILING   56
#define ROOM_GATE       57
#define ROOM_BRAILING   58
#define ROOM_BTOWER     59
#define ROOM_DEBRIS     60
#define ROOM_BRICKWORK  61
#define ROOM_RSARCH     62
#define ROOM_CLIFFTOP2  63

/* Compass directions */
#define DIR_NORTH 1
#define DIR_SOUTH 2
#define DIR_WEST  3
#define DIR_EAST  4
#define DIR_UP    5
#define DIR_DOWN  6

/* Global variables corresponding to BASIC's use of variables: */
char *gl_msg;			/* M$ -- parser message			*/
char gl_msgbuf[101];	/* Buffer for temporary message	*/
char gl_msgbuf2[202];	/* For use when the candle is waning or out */
char gl_command[81];	/* Q$ -- user command           */
char gl_verb[81];		/* X$ -- first word of user command */
char gl_noun[81];		/* W$ -- second word of user command */
int  gl_vb;				/* VB -- verb number */
int  gl_ob;				/* OB -- noun number */

/* Prototypes for what, in BASIC, would be line-numbered subroutines */
void help();
void inventory();
void move();
void get();
void vopen();
void examine();
void vread();
void say();
void dig();
void swing();
void spray();
void climb();
void light();
void unlight();
void use();
void unlock();
void leave();
void score();
void save();
void load();
void quit();
void getkey();


/* The game's vocabulary -- in the original BASIC, the V$() and O$() arrays */
struct vocab
{
	char obj  [WORD_COUNT + 1][14];
	char verb [VERB_COUNT + 1][10];
} gl_vocab =
{
	/* Nouns. The first OBJECT_COUNT of these correspond to portable objects */
	{ "",
	  "PAINTING","RING","MAGIC SPELLS","GOBLET","SCROLL","COINS","STATUE","CANDLESTICK",
	  "MATCHES","VACUUM","BATTERIES","SHOVEL","AXE","ROPE","BOAT","AEROSOL","CANDLE","KEY",
	  "NORTH","SOUTH","WEST","EAST","UP","DOWN",
	  "DOOR","BATS","GHOSTS","DRAWER","DESK","COAT","RUBBISH",
	  "COFFIN","BOOKS","XZANFAR","WALL","SPELLS" },
	/* Verbs */
	{ "",
	  "HELP","CARRYING?","GO","N","S","W","E","U","D","GET","TAKE","OPEN","EXAMINE","READ","SAY",
	  "DIG","SWING","CLIMB","LIGHT","UNLIGHT","SPRAY","USE","UNLOCK","LEAVE","SCORE",
	  "SAVE","LOAD","QUIT" }
};

/* The game's state. This is all stored in one structure to make it easy to do the 
 * save and restore. */
struct state
{
	char magic[40];					/* Magic number (checked when state is loaded) */
	char desc [ROOM_COUNT][40];		/* Location descriptions */
	char route[ROOM_COUNT][5];		/* Connections between locations. 
									 * The above two are in the file because they 
									 * can change as the game progresses. */
	short carried[WORD_COUNT + 1];	/* For each object, 1 if currently carried, else 0 */
	short flag   [WORD_COUNT + 1];	/* For portable objects, 1 if hidden, 0 if visible. For 
									 * non-portable objects, used for other state */
	short location[OBJECT_COUNT + 1]; /* The location of each object */
	short rm;						/* The location of the player */
	short ll;						/* The number of turns for which the candle will burn */
} gl_state, gl_initstate = 
{
	/* Initial state of the game */
	"Haunted House v1.0 gamestate\032",
	/* Descriptions */
	{ 
		"DARK CORNER","OVERGROWN GARDEN","BY LARGE WOODPILE","YARD BY RUBBISH",
		"WEEDPATCH","FOREST","THICK FOREST","BLASTED TREE",
		"CORNER OF HOUSE","ENTRANCE TO KITCHEN","KITCHEN & GRIMY COOKER","SCULLERY DOOR",
		"ROOM WITH INCHES OF DUST","REAR TURRET ROOM","CLEARING BY HOUSE","PATH",
		"SIDE OF HOUSE","BACK OF HALLWAY","DARK ALCOVE","SMALL DARK ROOM",
		"BOTTOM OF SPIRAL STAIRCASE","WIDE PASSAGE","SLIPPERY STEPS","CLIFFTOP",
		"NEAR CRUMBLING WALL","GLOOMY PASSAGE","POOL OF LIGHT","IMPRESSIVE VAULTED HALLWAY",
		"HALL BY THICK WOODEN DOOR","TROPHY ROOM","CELLAR WITH BARRED WINDOW","CLIFF PATH",
		"CUPBOARD WITH HANGING COAT","FRONT HALL","SITTING ROOM","SECRET ROOM",
		"STEEP MARBLE STAIRS","DINING ROOM","DEEP CELLAR WITH COFFIN","CLIFF PATH",
		"CLOSET","FRONT LOBBY","LIBRARY OF EVIL BOOKS","STUDY WITH DESK AND HOLE IN WALL",
		"WEIRD COBWEBBY ROOM","VERY COLD CHAMBER","SPOOKY ROOM","CLIFF PATH BY MARSH",
		"RUBBLE-STREWN VERANDAH","FRONT PORCH","FRONT TOWER","SLOPING CORRIDOR",
		"UPPER GALLERY","MARSH BY WALL","MARSH","SOGGY PATH",
		"BY TWISTED RAILING","PATH THROUGH IRON GATE","BY RAILINGS","BENEATH FRONT TOWER",
		"DEBRIS FROM CRUMBLING FACADE","LARGE FALLEN BRICKWORK","ROTTING STONE ARCH","CRUMBLING CLIFFTOP",
	},
	/* Routes */
	{ "SE","WE", "WE", "SWE","WE",  "WE", "SWE", "SW",
	  "NS","SE", "WE", "NW", "SE",  "W",  "NE",  "NSW",
	  "NS","NS", "SE", "WE", "NWUD","SE", "WSUD","NS",
	  "N", "NS", "NSE","WE", "WE",  "NSW","NS",  "NS",
	  "S", "NSE","NSW","S",  "NSUD","N",  "N",   "NS",
	  "NE","NW", "NE", "W",  "NSE", "WE", "W",   "NS",
	  "SE","NSW","E",  "WE", "NW",  "S",  "SW",  "NW",
	  "NE","NWE","WE", "WE", "WE",  "NWE","NWE", "W" },
	/* Nothing carried */
	{ 0 },
	/* All objects visible (see initialise() below) */
	{ 0 },
	/* Initial locations of objects */
	{ 0,ROOM_SPOOKY,	 /* Painting */
		ROOM_DEEPCELLAR, /* Ring */
		ROOM_SECRET,     /* Magic spells */
		ROOM_FRONTTOWER, /* Goblet */
		ROOM_REARTURRET, /* Scroll */
		ROOM_DARKALCOVE, /* Coins */
		ROOM_THICKDOOR,	 /* Statue */
		ROOM_LIBRARY,	 /* Candlestick */
		ROOM_KITCHEN,	 /* Matches */
		ROOM_GLOOMY,	 /* Vacuum cleaner */
		ROOM_POOL_LIGHT, /* Batteries */
		ROOM_WEEDPATCH,	 /* Shovel */
		ROOM_WOODPILE,	 /* Axe */
		ROOM_TREE,		 /* Rope */
		ROOM_CLIFFPATH3, /* Boat */
		ROOM_DEBRIS,	 /* Aerosol */
		ROOM_STUDY,		 /* Candle */
		ROOM_CUPBOARD    /* Key */
		}
	
};

void initialise()
{
	memcpy(&gl_state, &gl_initstate, sizeof(gl_state));
	/* Render a number of objects invisible */
	gl_state.flag[OBJ_KEY   ] = 
	gl_state.flag[OBJ_CANDLE] =
	gl_state.flag[OBJ_RING  ] = 
	gl_state.flag[OBJ_BATS  ] = 
	gl_state.flag[OBJ_DRAWER] = 
	gl_state.flag[OBJ_UP    ] = 1;

	gl_state.ll = 60;			/* Candle countdown = 60 */
	gl_state.rm = ROOM_GATE;	/* Start in room 57 */
	gl_msg = "OK";
}

/* Clear screen. The default implementation does this by printing 25 
 * newlines. Feel free to susbstitute a platform-specific escape 
 * code. */
void cls()
{
#ifdef __MSDOS__
	union REGS rg;

	rg.x.ax = 0x0F00;		/* Get current mode */
	int86(0x10, &rg, &rg);
	rg.h.ah = 0;			/* And select it */
	int86(0x10, &rg, &rg);
#else
	int n;

	for (n = 0; n < 25; n++) putchar('\n');
#endif
}

int main(int argc, char **argv)
{
	int i;
	char *s;

	initialise();
	while (1)
	{
		cls();
		printf("HAUNTED HOUSE\n-------------\nYOUR LOCATION\n%s\nEXITS:\n", gl_state.desc[gl_state.rm]);

		for (i = 0; gl_state.route[gl_state.rm][i]; i++)
		{
			/* To remove trailing comma: do it before each entry, thus. */
			if (i > 0) putchar (',');
			putchar(gl_state.route[gl_state.rm][i]);
			/* putchar(','); */
		}
		putchar('\n');
		/* List objects (if any) present */
		for (i = 1; i <= OBJECT_COUNT; i++)
		{
			if (gl_state.location[i] == gl_state.rm && gl_state.flag[i] == 0)
				printf("YOU CAN SEE %s HERE\n", gl_vocab.obj[i]);
		}
		printf("=========================\n%s\n", gl_msg);
		gl_msg = "WHAT";
		fputs("WHAT WILL YOU DO NOW?", stdout);
		fflush(stdout);
		/* Read player input */
		if (!fgets(gl_command, sizeof(gl_command) - 1, stdin))
		{
			printf("THANKS FOR PLAYING\n");
			return 1;
		}
		/* Force into upper case. The BASIC version didn't do this;
		 * instead, it required Caps Lock to be turned on. */
		for (i = 0; gl_command[i]; i++)
		{
			if (islower(gl_command[i])) 
				gl_command[i] = toupper(gl_command[i]);
		}
		/* Remove trailing newline, if present */
		s = strchr(gl_command, '\n');
		if (s) *s = 0;	
		/* Parse into verb + noun. Find the first space. */
		s = strchr(gl_command, ' ');
		if (s)
		{
			*s = 0;
			strcpy(gl_verb, gl_command);
			/* Skip any additional spaces between verb and noun */
			++s;
			while (*s == ' ') ++s;
			strcpy(gl_noun, s);
		}
		else	/* No space. Treat the whole thing as the verb. */
		{
			gl_noun[0] = 0;
			strcpy(gl_verb, gl_command);
		}
		/* Match verb and noun against vocab. Verb/noun numbers
		 * 0 are used to mean 'unknown', so the vocab tables are 1-based. */
		gl_vb = VERB_NULL;
		gl_ob = OBJ_NULL;
		for (i = 1; i <= VERB_COUNT; i++)
		{
			if (!strcmp(gl_verb, gl_vocab.verb[i]))
			{
				gl_vb = i;
				break;
			}
		}
		for (i = 1; i <= WORD_COUNT; i++)
		{
			if (!strcmp(gl_noun, gl_vocab.obj[i]))
			{
				gl_ob = i;
				break;
			}
		}
		if (gl_noun[0] != 0 && gl_ob == OBJ_NULL) /* Unrecognised noun string */
			gl_msg = "THAT'S SILLY";
		if (gl_noun[0] == 0)				/* Verb only */
			gl_msg = "I NEED TWO WORDS";
		if (gl_vb == VERB_NULL)		
		{
			if (gl_ob > OBJ_NULL)
			{
				sprintf(gl_msgbuf, "YOU CAN'T '%s %s'", gl_verb, gl_noun);
				gl_msg = gl_msgbuf;
			}
			else gl_msg = "YOU DON'T MAKE SENSE";
		}
		/* Attempt to use an object that isn't currently held */
		if (gl_vb > VERB_NULL && gl_ob > OBJ_NULL && gl_state.carried[gl_ob] == 0)
		{
			sprintf(gl_msgbuf, "YOU DON'T HAVE '%s'", gl_noun);
			gl_msg = gl_msgbuf;
		}
		/* If bats are attacking the player, lock out all verbs (including 
		 * meta verbs) except SPRAY. */
		if (gl_state.flag[OBJ_BATS] == 1 && gl_state.rm == ROOM_REARTURRET 
				&& (rand() % 3) != 2 && gl_vb != VERB_SPRAY)
		{
			gl_msg = "BATS ATTACKING!";
			/* Fortunately, a turn aborted due to bat attack does not cause 
			 * the candle to expend a turn's wax. */
			continue;
		}
		/* If in the cobwebby room and the vacuum cleaner isn't running, there's a 50% chance of
		 * activating the ghosts. */
		if (gl_state.rm == ROOM_COBWEBBY && (rand() % 2) == 1 && gl_state.flag[OBJ_DOWN] != 1)
		{
			gl_state.flag[OBJ_GHOSTS] = 1;
		}
		/* If the candle is lit, decrease its timer. */
		if (gl_state.flag[OBJ_NULL]) --gl_state.ll;	
		/* And when the timer reaches 0, the candle goes out. */
		if (gl_state.ll < 1) gl_state.flag[OBJ_NULL] = 0;

		/* Handle the appropriate verb. */
		switch(gl_vb)
		{
			case VERB_HELP:       help(); break;
			case VERB_INVENTORY:  inventory(); break;
			case VERB_GO:         
			case VERB_NORTH:    
			case VERB_SOUTH:    
			case VERB_WEST:      
			case VERB_EAST:      
			case VERB_UP:        
			case VERB_DOWN:       move(); break;
			case VERB_GET:       
			case VERB_TAKE:       get(); break;
			case VERB_OPEN:       vopen(); break;
			case VERB_EXAMINE:    examine(); break;
			case VERB_READ:       vread(); break;
			case VERB_SAY:        say(); break;
			case VERB_DIG:        dig(); break;
			case VERB_SWING:      swing(); break;
			case VERB_CLIMB:      climb(); break;
			case VERB_LIGHT:      light(); break;
			case VERB_UNLIGHT:    unlight(); break;
			case VERB_SPRAY:      spray(); break;
			case VERB_USE:        use(); break;
			case VERB_UNLOCK:     unlock(); break;
			case VERB_LEAVE:      leave(); break;
			case VERB_SCORE:      score(); break;
			case VERB_SAVE:       save(); break;
			case VERB_LOAD:       load(); break;
			case VERB_QUIT:       quit(); break;

		}
		/* If the candle is waning or out, append a warning.
		 * In the original BASIC, the warning message would 
		 * replace the result of the verb subroutine, 
		 * possibly overwriting valuable information.
		 */
		if (gl_state.ll == 10) 
		{
			sprintf(gl_msgbuf2, "%s\nYOUR CANDLE IS WANING!", gl_msg);
			gl_msg = gl_msgbuf2;
		}
		if (gl_state.ll == 1)  
		{
			sprintf(gl_msgbuf2, "%s\nYOUR CANDLE IS OUT!", gl_msg);
			gl_msg = gl_msgbuf2;
		}
	}

	return 0;
}

void help()
{
	int i;

	printf("WORDS I KNOW:\n");
	for (i = 1; i <= VERB_COUNT; i++)
	{
		/* Again, it would be better to be rid of the trailing comma */
		if (i > 1) putchar (',');
		printf("%s", gl_vocab.verb[i]);
	}
	putchar('\n');
	gl_msg = "";
	getkey();
}

void inventory()
{
	int i, j;

	printf("YOU ARE CARRYING:\n");
	for (i = 1, j = 0; i <= OBJECT_COUNT; i++)
	{
		if (gl_state.carried[i])
		{
			/* Again, it would be better to be rid of the trailing comma */
			if (j) putchar(',');
			j++;
			printf("%s,", gl_vocab.obj[i]);
		}
	}
	putchar('\n');
	gl_msg = "";
	getkey();
}

void move()
{
	int i;
	int d = 0;	/* direction */
	char *route = gl_state.route[gl_state.rm];

	if (gl_ob == OBJ_NULL)
	{
		d = gl_vb - (VERB_NORTH - 1); 
	}
	else if (gl_ob >= OBJ_NORTH && gl_ob <= OBJ_DOWN)
	{
		d = gl_ob - (OBJ_NORTH - 1);
	}
	/* Convert up/down for the staircases to N/S/E/W */
	switch (gl_state.rm)
	{
		case ROOM_BSTAIRCASE: 
				 if (d == DIR_UP)   d = DIR_NORTH;
				 if (d == DIR_DOWN) d = DIR_WEST;
				 break;
		case ROOM_SLIPPERY: 
				 if (d == DIR_UP)   d = DIR_SOUTH;
				 if (d == DIR_DOWN) d = DIR_WEST;
				 break;
		case ROOM_MSTAIRS: 
				 if (d == DIR_UP)   d = DIR_NORTH;
				 if (d == DIR_DOWN) d = DIR_SOUTH;
				 break;
	}
	if (gl_state.flag[OBJ_ROPE])
	{
		gl_msg = "CRASH! YOU FELL OUT OF THE TREE!";
		gl_state.flag[OBJ_ROPE] = 0;
		return;
	}
	if (gl_state.flag[OBJ_GHOSTS] && gl_state.rm == ROOM_GALLERY)
	{
		gl_msg = "GHOSTS WILL NOT LET YOU MOVE";
		return;
	}
	if (gl_state.rm == ROOM_VERYCOLD && gl_state.carried[OBJ_PAINTING] && gl_state.flag[OBJ_XZANFAR] == 0)
	{
		gl_msg = "A MAGICAL BARRIER TO THE WEST";
		return;
	}
	if (gl_state.rm == ROOM_POOL_LIGHT && gl_state.flag[OBJ_NULL] == 0 && (d == 1 || d == 4))
	{
		gl_msg = "YOU NEED A LIGHT";
		return;
	}
	if (gl_state.rm == ROOM_MARSH && !gl_state.carried[OBJ_BOAT])
	{
		gl_msg = "YOU'RE STUCK!";
		return;
	}
	if (gl_state.carried[OBJ_BOAT] && 
		(gl_state.rm != ROOM_MARSHWALL && 
		 gl_state.rm != ROOM_MARSH     && 
		 gl_state.rm != ROOM_SOGGYPATH && 
		 gl_state.rm != ROOM_CLIFFPATH3))
	{
		gl_msg = "YOU CAN'T CARRY A BOAT!";
		return;
	}
	if (gl_state.rm > ROOM_POOL_LIGHT && gl_state.rm < ROOM_CELLAR && !gl_state.flag[OBJ_NULL])
	{
		gl_msg = "TOO DARK TO MOVE";
		return;
	}
	gl_state.flag[OBJ_WALL] = 0;
	for (i = 0; route[i]; i++)
	{
		if (route[i] == 'N' && d == DIR_NORTH) 
		{ 
			gl_state.rm -= 8; 
			gl_state.flag[OBJ_WALL] = 1;
			break;
		}
		if (route[i] == 'S' && d == DIR_SOUTH) 
		{ 
			gl_state.rm += 8; 
			gl_state.flag[OBJ_WALL] = 1;
			break;
		}
		if (route[i] == 'W' && d == DIR_WEST) 
		{ 
			gl_state.rm--; 
			gl_state.flag[OBJ_WALL] = 1;
			break;
		}
		if (route[i] == 'E' && d == DIR_EAST) 
		{ 
			gl_state.rm++;
			gl_state.flag[OBJ_WALL] = 1;
			break;
		}
	}
	gl_msg = (gl_state.flag[OBJ_WALL]) ? "OK" : "CAN'T GO THAT WAY!";
	if (d < DIR_NORTH) gl_msg = "GO WHERE?";
	if (gl_state.rm == ROOM_FRONTLOBBY && gl_state.flag[OBJ_UP] == 1)
	{
		strcpy(gl_state.route[ROOM_FRONTPORCH], "SW");
		gl_msg = "THE DOOR SLAMS SHUT!";
		gl_state.flag[OBJ_UP] = 0;
	}
}


void get()
{
	if (gl_ob > OBJECT_COUNT)
	{
		sprintf(gl_msgbuf, "I CAN'T GET %s", gl_noun);
		gl_msg = gl_msgbuf;
		return;
	}
	if (gl_state.location[gl_ob] != gl_state.rm)
	{
		gl_msg = "IT ISN'T HERE";
	}
	if (gl_state.flag[gl_ob])
	{
		sprintf(gl_msgbuf, "WHAT %s?", gl_noun);
		gl_msg = gl_msgbuf;
	}
	if (gl_state.carried[gl_ob])
	{
		gl_msg = "YOU ALREADY HAVE IT";
	}
	if (gl_ob > OBJ_NULL && gl_state.location[gl_ob] == gl_state.rm && gl_state.flag[gl_ob] == 0)
	{
		gl_state.carried[gl_ob]  = 1;
		gl_state.location[gl_ob] = ROOM_COUNT + 1;
		sprintf(gl_msgbuf, "YOU HAVE THE %s", gl_noun);
		gl_msg = gl_msgbuf;
	}
}

void vopen()
{
	if (gl_state.rm == ROOM_STUDY && (gl_ob == OBJ_DRAWER || gl_ob == OBJ_DESK))
	{
		gl_state.flag[OBJ_CANDLE] = 0;
		gl_msg = "DRAWER OPEN";
	}
	if (gl_state.rm == ROOM_THICKDOOR && gl_ob == OBJ_DOOR)
	{
		gl_msg = "IT'S LOCKED";
	}
	if (gl_state.rm == ROOM_DEEPCELLAR && gl_ob == OBJ_COFFIN)
	{
		gl_msg = "THAT'S CREEPY!";
		gl_state.flag[OBJ_RING] = 0;
	}
}

void examine()
{
	switch(gl_ob)
	{
		case OBJ_COAT: 
				gl_state.flag[OBJ_KEY] = 0; 
				gl_msg = "SOMETHING HERE!"; 
				break;
		case OBJ_RUBBISH: 
				gl_msg = "THAT'S DISGUSTING!"; 
				break;
		case OBJ_DRAWER:
		case OBJ_DESK: 
				gl_msg = "THERE IS A DRAWER"; 
				break;
		case OBJ_BOOKS:
		case OBJ_SCROLL:  
				vread(); 
				break;
		case OBJ_WALL: 
				if (gl_state.rm == ROOM_STUDY) gl_msg = "THERE IS SOMETHING BEYOND.."; 
				break;
		case OBJ_COFFIN: 
				vopen(); 
				break;
	}
}

void vread()
{
	if (gl_state.rm == ROOM_LIBRARY && gl_ob == OBJ_BOOKS)
	{
		gl_msg = "THEY ARE DEMONIC WORKS";
	}
	if ((gl_ob == OBJ_SPELLS || gl_ob == OBJ_SPELLS2) && 
		gl_state.carried[OBJ_SPELLS] && 
		gl_state.flag[OBJ_XZANFAR] == 0)
	{
		gl_msg = "USE THIS WORD WITH CARE 'XZANFAR'";
	}
	if (gl_state.carried[OBJ_SCROLL] && gl_ob == OBJ_SCROLL) 
	{
		gl_msg = "THE SCRIPT IS IN AN ALIEN TONGUE";
	}
}

void say()
{
	sprintf(gl_msgbuf, "OK '%s'", gl_noun);
	if (gl_state.carried[OBJ_SPELLS] && gl_ob == OBJ_XZANFAR)	/* "XZANFAR" while holding spellbook */
	{
		gl_msg = "*MAGIC OCCURS*";
		if (gl_state.rm == ROOM_VERYCOLD) 
		{
			gl_state.flag[OBJ_XZANFAR] = 1;
		}
		else 
		{
			gl_state.rm = rand() % 64;
		}
	}
}

void dig()
{
	if (gl_state.carried[OBJ_SHOVEL])
	{
		if (gl_state.rm == ROOM_CELLAR)
		{
			gl_msg = "DUG THE BARS OUT";
			strcpy(gl_state.desc [gl_state.rm], "HOLE IN WALL");
			strcpy(gl_state.route[gl_state.rm], "NSE");
		}
		else gl_msg = "YOU MADE A HOLE";
	}
}

void swing()
{
	if (gl_state.rm == ROOM_TREE && !gl_state.carried[OBJ_ROPE]) 
		gl_msg = "THIS IS NO TIME TO PLAY GAMES";
	if (gl_ob == OBJ_ROPE && gl_state.carried[OBJ_ROPE])
		gl_msg = "YOU SWUNG IT";
	if (gl_ob == OBJ_AXE && gl_state.carried[OBJ_AXE])
	{
		if (gl_state.rm == ROOM_STUDY)
		{
			gl_msg = "YOU BROKE THE THIN WALL";
			strcpy(gl_state.desc [gl_state.rm], "STUDY WITH SECRET ROOM");
			strcpy(gl_state.route[gl_state.rm], "WN");
		}
		else gl_msg = "WHOOSH!";
	}
}

void climb()
{
	if (gl_ob == OBJ_ROPE)
	{
		if (gl_state.carried[OBJ_ROPE]) 
		{
			gl_msg = "IT ISN'T ATTACHED TO ANYTHING";
		}
		else if (gl_state.rm == ROOM_TREE)
		{
			if (gl_state.flag[OBJ_ROPE])
			{
				gl_msg = "GOING DOWN!";
				gl_state.flag[OBJ_ROPE] = 0;
			}
			else
			{
				gl_msg = "YOU SEE THICK FOREST AND CLIFF SOUTH";
				gl_state.flag[OBJ_ROPE] = 1;
			}
		}
	}
}

void light()
{
	if (gl_ob == OBJ_CANDLE && gl_state.carried[OBJ_CANDLE])
	{
		if      (!gl_state.carried[OBJ_CANDLESTICK]) gl_msg = "IT WILL BURN YOUR HANDS";
		else if (!gl_state.carried[OBJ_MATCHES]    ) gl_msg = "NOTHING TO LIGHT IT WITH";
		else
		{
			gl_msg = "IT CASTS A FLICKERING LIGHT";
			gl_state.flag[OBJ_NULL] = 1;
		}
	}
}

void unlight()
{
	if (gl_state.flag[OBJ_NULL])
	{
		gl_state.flag[OBJ_NULL] = 0;
		gl_msg = "EXTINGUISHED";
	}
}

void spray()
{
	if (gl_ob == OBJ_BATS && gl_state.carried[OBJ_AEROSOL])
	{
		gl_msg = "HISSSS";
		if (gl_state.flag[OBJ_BATS]) 
		{
			gl_state.flag[OBJ_BATS] = 0;
			gl_msg = "PFFT! GOT THEM";
		}
	}
}

void use()
{
	if (gl_ob == OBJ_VACUUM && gl_state.carried[OBJ_VACUUM] && gl_state.carried[OBJ_BATTERIES])
	{
		gl_msg = "SWITCHED ON";
		gl_state.flag[OBJ_DOWN] = 1;
	}
	if (gl_state.flag[OBJ_GHOSTS] == 1 && gl_state.flag[OBJ_DOWN] == 1)
	{
		gl_msg = "WHIZZ- VACUUMED THE GHOSTS UP!";
		gl_state.flag[OBJ_GHOSTS] = 0;
	}
}

void unlock()
{
	if (gl_state.rm == ROOM_STUDY && (gl_ob == OBJ_DESK || gl_ob == OBJ_DRAWER)) 
	{
		vopen();
	}
	if (gl_state.rm == ROOM_THICKDOOR && 
		gl_ob == OBJ_DOOR && 
		gl_state.flag[OBJ_DOOR] == 0 && 
		gl_state.carried[OBJ_KEY])
	{
		gl_state.flag[OBJ_DOOR] = 1;
		strcpy(gl_state.route[gl_state.rm], "SEW");
		strcpy(gl_state.desc [gl_state.rm], "HUGE OPEN DOOR");
		gl_msg = "THE KEY TURNS!";
	}
}

void leave()
{
	if (gl_state.carried[gl_ob])
	{
		gl_state.carried[gl_ob] = 0;
		gl_state.location[gl_ob] = gl_state.rm;
		gl_msg = "DONE";
	}
}

void score()
{
	int i, s;
	
	for (s = 0, i = 1; i <= OBJECT_COUNT; i++)
	{
		if (gl_state.carried[i]) ++s;
	}
	if (s == 17 && gl_state.carried[OBJ_BOAT] == 0)
	{
		if (gl_state.rm == ROOM_GATE)
		{
			s *= 2;
			printf("DOUBLE SCORE FOR REACHING HERE!\n");
		}
		else
		{
			printf("YOU HAVE EVERYTHING\nRETURN TO THE GATE FOR FINAL SCORE\n");
		}
	}
	printf("YOUR SCORE=%d\n", s);
	if (s > 18)
	{
		printf("WELL DONE! YOU FINISHED THE GAME\n");
		exit(0);
	}
	getkey();
}

void save()
{
	char *p, savename[261];
	FILE *fp;

	gl_msg = "NOT SAVED";
	printf("SAVE POSITION TO FILE>");
	fflush(stdout);
	if (!fgets(savename, sizeof(savename) - 1, stdin))
	{
		return;
	}
	p = strchr(savename, '\n');
	if (p) *p = 0;
	if (savename[0] == 0)
	{
		return;
	}
	fp = fopen(savename, "wb");
	if (!fp)
	{
		perror(savename);
		getkey();
		return;
	}
	gl_msg = "OK";
	if (fwrite(&gl_state, 1, sizeof(gl_state), fp) < (int)sizeof(gl_state))
	{
		gl_msg = "NOT SAVED";
	}
	if (fclose(fp))
	{
		gl_msg = "NOT SAVED";
	}
}


void load()
{
	char *p, savename[261];
	FILE *fp;
	struct state tempstate;

	printf("LOAD POSITION FROM FILE>");
	fflush(stdout);
	gl_msg = "NOT LOADED";
	if (!fgets(savename, sizeof(savename) - 1, stdin))
	{
		return;
	}
	p = strchr(savename, '\n');
	if (p) *p = 0;
	if (savename[0] == 0)
	{
		return;
	}
	fp = fopen(savename, "rb");
	if (!fp)
	{
		perror(savename);
		getkey();
		return;
	}
	gl_msg = "OK";
	if (fread(&tempstate, 1, sizeof(tempstate), fp) < (int)sizeof(tempstate))
	{
		gl_msg = "NOT LOADED";
	}
	fclose(fp);
	if (memcmp(tempstate.magic, gl_state.magic, (int)sizeof(gl_state.magic)))
	{
		gl_msg = "NOT A VALID GAME STATE FILE";
	}
	else
	{
		memcpy(&gl_state, &tempstate, sizeof(gl_state));
	}
}

void quit()
{
	printf("WANT TO QUIT?");
	fflush(stdout);

	while (1)
	{
		char c = getchar();

		if (c == 'N' || c == 'n') return;
		if (c == 'Y' || c == 'y' || c == EOF) break;
	}

	printf("\nLIKE TO SAVE THE GAME FIRST?");
	fflush(stdout);

	while (1)
	{
		char c = getchar();

		if (c == 'N' || c == 'n' || c == EOF) break;
		if (c == 'Y' || c == 'Y') 
		{
			save();
			break;
		}
	}


	printf("THANKS FOR PLAYING\n");
	exit(0);
}


void getkey()
{
	printf("Press RETURN to continue  ");
	fflush(stdout);
	getchar();
}

