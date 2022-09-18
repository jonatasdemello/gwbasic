#charset "us-ascii"

/*
 * Korenvliet is copyright 2016 by Alexander van Oostenrijk. All rights are reserved.
 * You may use, distribute and modify this code under the terms of the GPL license, a
 * copy of which should accompany this file. 
 * If not, please visit http://www.gnu.org/licenses/gpl-3.0.en.html.
 */

#include <adv3.h>
#include <en_us.h>

landfill: OutdoorRoom 'Edge of a landfill'
  desc() {
    "This is the edge of a large landfill. The terrain drops
    sharpy to the east so that you cannot continue on in that direction. A rocky path
    leads west. A large wooden sign stuck in the ground here. ";
    if(airship.location == landfill) {
      "\bThere is a hot-air balloon here. ";
    }
  }
  west = path
  east: NoTravelMessage { "You would fall right into the landfill. "; }
;

+ Distant 'rocky path' 'path' 
  "A rocky path leads away from the edge of the landfill to the west. "
;

+ Heavy 'large wooden sign*signs' 'large sign'
  "The text on the sign is mostly faded; it was probably some information
  about the construction project going on here. However, someone has scrawled
  some graffiti on the sign: \"A suitable spot.\""
;

+ Decoration 'landfill' 'landfill' 
  "The landfill seems to go on for miles. You think you can see a small raised plateau
  somewhere in the middle of it. "
;  

+ Distant 'plateau/barn' 'plateau'
  "There is a small plateau far off in the middle of the landfill. 
  An old barn seems perched on top of it. "
;

airship: Heavy 'hot-air balloon/airship/ship' 'hot-air balloon'
  "This is a DIY hot-air balloon. It was built out of a wicker basket, a crashed
  weather balloon, a wood stove, and a length of rope. The wood stove is burning
  and it's ready to fly! "
  
  dobjFor(Fly) {
    verify() {}
    action() {
      if(airship.location == landfill) {
        "Amazingly, your contraption works. By regulating the heat of the burning
        wood stove, you manage to lift off the balloon and soar off into the skies.
        With careful maneuvering, you set it down on the plateau in the middle of
        the landfill.\b";
        airship.moveInto(plateau);
        me.moveInto(plateau);
        me.lookAround(true);
      } else {
        "You get in your hot-air balloon and fly it back to the edge of the landfill.\b";
        airship.moveInto(landfill);
        me.moveInto(landfill);
        me.lookAround(nil);
      }
    }
  }
  dobjFor(Enter) remapTo(Fly, airship)
;
