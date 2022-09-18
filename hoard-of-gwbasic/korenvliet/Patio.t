#charset "us-ascii"

/*
 * Korenvliet is copyright 2016 by Alexander van Oostenrijk. All rights are reserved.
 * You may use, distribute and modify this code under the terms of the GPL license, a
 * copy of which should accompany this file. 
 * If not, please visit http://www.gnu.org/licenses/gpl-3.0.en.html.
 */

#include <adv3.h>
#include <en_us.h>

patio: OutdoorRoom 'Patio'
  "This is a small flagstone patio outside the Korenvliet villa proper. To the north 
  is the villa wall, with a glass door set into it. You can see a small forest to the west, 
  and you hear the sound of gurgling water from the south. "
  north = atriumDoorOutside
  west = forest
  south = brook
;

+ atriumDoorOutside: Door 'glass door*doors' 'glass door'
  desc() {
    "The door's surface is divided into a number of small glass panes. ";
    if(self.isOpen) {
      "You can see Korenvliet's atrium on the other side. ";
    } else {
      "Though the glass, you can see Korenvliet's atrium on the other side. ";
    }
  }  
;

+ Decoration 'well-laid floor/flagstone/stone*flagstones/stones' 'flagstone'
  "The patio floor is made of well-laid flagstones. "
;

+ Distant 'forest/trees' 'forest'
  "The first trees of a small forest are to the west of the patio. "
;

+ stove: Thing 'small metal wood stove*stoves' 'wood stove'
  "This small metal stove provides heat by burning wood. It's small enough to be portable. "
;

+ boat: Thing 'yellow rubber boat' 'rubber boat' 
  desc() {
    "An inflatable yellow rubber boat. It is currently <<isInflated ? "inflated" : "not inflated so that you can easily carry it">>. ";
  }
  isInflated = nil
  
  dobjFor(Inflate) {
    verify() {
      if(isInflated) illogicalAlready('The rubber boat is already inflated. ');
    }
    action() {
      "You inflate the boat. Now you're out of breath. ";
      isInflated = true;
    }
  }
  
  dobjFor(Deflate) {
    verify() {
      if(!isInflated) illogicalAlready('The rubber boat not inflated. ');
    }
    action() {
      "You let all the air out of the rubber boat. ";
      isInflated = nil;
    }
  }
;