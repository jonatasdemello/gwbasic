#!/bin/sh
#
#  archive.sh
#  Chris Nystrom (chris@gnu.ai.mit.edu) Oct 1996
#

PROGNAME=$1
rm -f $PROGNAME *.o core
cd ..
tar cf $PROGNAME.tar $PROGNAME
gzip $PROGNAME.tar
mv $PROGNAME.tar.gz $PROGNAME.tgz
uuencode $PROGNAME.tgz < $PROGNAME.tgz > $PROGNAME.uue
shar -o $PROGNAME -l50 -c $PROGNAME/*
volcheck
mcopy -n $PROGNAME.* a:

