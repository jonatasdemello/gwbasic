#charset "us-ascii"

/*
 * Korenvliet is copyright 2016 by Alexander van Oostenrijk. All rights are reserved.
 * You may use, distribute and modify this code under the terms of the GPL license, a
 * copy of which should accompany this file. 
 * If not, please visit http://www.gnu.org/licenses/gpl-3.0.en.html.
 */

#include <adv3.h>
#include <en_us.h>

underLake: OutdoorRoom 'Lake (under water)'
  "You are swimming underwater somewhere in the middle of the lake. The lake floor throws up clouds of mud as you pass by. It seems possible to swim south from here. "
  up = lake
  south = underBay
  cannotGoThatWayMsg = 'It\'s best not to venture too far underwater. '
;
