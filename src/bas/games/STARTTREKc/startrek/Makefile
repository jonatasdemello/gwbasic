#
#       Super Star Trek Classic
#
#	This program is free software; you can redistribute it
#	and/or  modify in any way you want.
#

#CC	= mcc
#CC	= c89
CC	= gcc
#CC	= acc
#CC	= cc
#CC     = purify acc

#CFLAGS	= -g 
#CFLAGS	= -O 
CFLAGS	= -O -Wall -g
#CFLAGS	= -O -g
OBJS	= startrek.o
LIBS	= -lm
PROGS	= startrek
INSTALL	= /etc/install
LBIN	= /usr/games

all:		$(PROGS) 

startrek:	$(OBJS)
		$(CC) $(LDFLAGS) -o startrek $(OBJS) $(LIBS)

clean:
		rm -f $(PROGS) *.o core startrek.0*

install:
		$(INSTALL) -f $(LBIN) -u bin -g bin -m 755 $(PROGS)
		strip $(LBIN)/$(PROGS)

archive:	clean
		./archive.sh startrek
