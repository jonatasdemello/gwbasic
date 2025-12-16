#charset "us-ascii"

/*
 * Korenvliet is copyright 2016 by Alexander van Oostenrijk. All rights are reserved.
 * You may use, distribute and modify this code under the terms of the GPL license, a
 * copy of which should accompany this file. 
 * If not, please visit http://www.gnu.org/licenses/gpl-3.0.en.html.
 */

#include <adv3.h>
#include <en_us.h>

conservatory: Room 'Conservatory'
  "Through its plate glass windows, Korenvliet's conservatory offers a wide view of the gardens outside. The windows
  stretch from floor level to ceiling height and are set in a wrought iron framework, which in turn is built against
  the brick wall of the villa. A glass door leads west to the study. "
  west = conservatoryDoorInside
;

+ conservatoryDoorInside: Door 'glass door*doors' 'glass door' 
  desc() {
    "The door's surface is divided into a number of small glass panes. ";
    if(self.isOpen) {
      "You can see the study on the other side. ";
    } else {
      "Though the glass, you can see the study on the other side. ";
    }
  }
;

+ matchbook: Thing 'small matchbook/match*matchbooks/matches' 'matchbook'
  "It's a small book of twenty matches. "
  initSpecialDesc = "A matchbook lies discarded on a windowsill. "
;