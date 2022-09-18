#charset "us-ascii"

/*
 * Korenvliet is copyright 2016 by Alexander van Oostenrijk. All rights are reserved.
 * You may use, distribute and modify this code under the terms of the GPL license, a
 * copy of which should accompany this file. 
 * If not, please visit http://www.gnu.org/licenses/gpl-3.0.en.html.
 */

#include <adv3.h>
#include <en_us.h>

atrium: Room 'Atrium'
  "Korenvliet's atrium is an extension of the living room, with some large skylights to let in as much
  natural light as possible. Open archways lead north, to a living room, and east to a hallway. There is
  also a glass door leading south, to a patio. A small drain is in the floor in the corner of the room. "
  north = living
  east = hallway
  south = atriumDoorInside
  down = drainAtriumToSewer
;

+ drainAtriumToSewer: DrainDown
;

+ Decoration 'light/skylight*light/skylights' 'skylights'
  "The skylights provide beautiful natural lighting for this room. "
  isPlural = true
;

+ rope: Thing 'coil/rope' 'coil of rope'
  "There seems to be about twenty yards of rope. "
  initSpecialDesc = "A coil of rope lies on the floor. "
;

+ atriumDoorInside: Door ->atriumDoorOutside 'glass door*doors' 'glass door'
  desc() {
    "The door's surface is divided into a number of small glass panes. ";
    if(self.isOpen) {
      "You can see a patio on the other side. ";
    } else {
      "Though the glass, you can see a patio on the other side. ";
    }
  }  
;
