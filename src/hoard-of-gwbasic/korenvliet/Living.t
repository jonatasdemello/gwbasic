#charset "us-ascii"

/*
 * Korenvliet is copyright 2016 by Alexander van Oostenrijk. All rights are reserved.
 * You may use, distribute and modify this code under the terms of the GPL license, a
 * copy of which should accompany this file. 
 * If not, please visit http://www.gnu.org/licenses/gpl-3.0.en.html.
 */

#include <adv3.h>
#include <en_us.h>

living: Room 'Living Room'
  "Korenvliet's large and comfortable living room is richly decorated. A patterned oriental rug
  is in the center of the room with a settee before it, flanked by a velvet armchair and a wooden
  rocker chair. A crystal chandelier hangs from the vaulted ceiling. In the corner there is a small 
  drain in the floor.\b
  There is a panelled door to the south, a wooden door to the east and an open archway to the south. "
  north = panelledDoorInside
  east = studyDoorOutside
  south = atrium
  down = drainLivingToSewer
;

+ drainLivingToSewer: DrainDown
;

+ Heavy 'oriental patterned rug/tapestry/carpet' 'oriental rug'
  "The oriental rug on the floor is huge, stretching almost from wall to wall. Its weaving
  is rich and thick, and the patterns exquisite. "
  dobjFor(LookUnder) {
    action() {
      "Nope, no will. ";
    }
  }
;

+ Chair, Heavy 'settee/sofa/couch*furniture' 'settee' 
  "The style of this settee shows that it was imported from the East Indies, like much of the
  other furniture in the estate. It looks quite comfortable, if old-fashioned. "
;

+ Chair, Heavy 'velvet armchair/chair*furniture' 'velvet armchair'
  "The velvet armchair is heavy and wide. "
;

+ Chair, Heavy 'wooden rocker chair/rocker*furniture' 'rocker chair'
  "This wooden chair is mounted on rockers. It would be helpful to get to sleep. "
;

+ Decoration 'crystal chandelier*chandeliers' 'chandelier'
  "Though the living room is brightly lit at the moment, in the evening this crystal
  chandelier must provide a splendid light. "
;

+ panelledDoorInside: Door 'panelled door*doors' 'panelled door'
  desc() {
    "This door's surface is cut into handsome panels. ";
    if(self.isOpen) {
      "You can see Korenvliet's foyer to the south. ";
    } else {
      "It leads south. ";
    }
  }
;

+ studyDoorOutside: Door ->studyDoorInside 'wooden door*doors' 'wooden door'
  desc() { 
    "This is a simple interior door leading east. It has a handle but no lock. ";
    if(self.isOpen) {
      "You can see a study on the other side. ";
    }   
  }
;
