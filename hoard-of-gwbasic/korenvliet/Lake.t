#charset "us-ascii"

/*
 * Korenvliet is copyright 2016 by Alexander van Oostenrijk. All rights are reserved.
 * You may use, distribute and modify this code under the terms of the GPL license, a
 * copy of which should accompany this file. 
 * If not, please visit http://www.gnu.org/licenses/gpl-3.0.en.html.
 */

#include <adv3.h>
#include <en_us.h>

lake: Floorless, OutdoorRoom 'Lake'
  "You are in the middle of the lake. The shore to the west is quite far away. To the south, the lake opens out into waters
  known as the South Bay. "
  west = shore
  south = bay
  down: NoTravelMessage { "That would take you under water! You could dive if you think that's a good idea. " }
  cannotGoThatWayMsg = 'It\'s best not to venture any further on the lake; you might lose sight of the shore. '
  bottomRoom = underLake
;

+ Distant 'shore/lakeshore' 'shore'
  "You can see the lake shore in the distance. "
;

+ Distant 'south bay' 'south bay'
  "The South Bay is a part of the lake famous for its fishing. "
;

