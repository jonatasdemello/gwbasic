#charset "us-ascii"

/*
 * Korenvliet is copyright 2016 by Alexander van Oostenrijk. All rights are reserved.
 * You may use, distribute and modify this code under the terms of the GPL license, a
 * copy of which should accompany this file. 
 * If not, please visit http://www.gnu.org/licenses/gpl-3.0.en.html.
 */

#include <adv3.h>
#include <en_us.h>

plateau: OutdoorRoom 'Plateau'
  desc() {
    "This is a raised plateau in the middle of the landfill. For some reason,
    this small elevation was spared while everything else was dug up. The ground
    drops quite sharply around the edges. There is an old barn to the north. ";
    if(airship.location == plateau) {
      "\bThere is a hot-air balloon here. ";
    }
  }
  north = barn
  down: NoTravelMessage { "The plateau is rather high. It's impossible to climb down. "; }
  east: NoTravelMessage { "You can't go there; you would fall right off the plateau. "; }
  west asExit(east)
  south asExit(east)
  northwest asExit(east)
  northeast asExit(east)
  southwest asExit(east)
  southeast asExit(east)
;

+ barnEntrance: Enterable ->barn 'old abandoned barn/door*barns/doors' 'old barn'
  "There's an old barn just north of here, its doors standing wide open. The building
  only just fits on top of the plateau. "
; 

+ Distant 'landfill' 'landfill'
  "You can see the edge of the landfill where you launched your balloon far off in the
  distance. "
;



