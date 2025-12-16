#charset "us-ascii"

/*
 * Korenvliet is copyright 2016 by Alexander van Oostenrijk. All rights are reserved.
 * You may use, distribute and modify this code under the terms of the GPL license, a
 * copy of which should accompany this file. 
 * If not, please visit http://www.gnu.org/licenses/gpl-3.0.en.html.
 */

#include <adv3.h>
#include <en_us.h>

bay: Floorless, OutdoorRoom 'South Bay'
  "This part of the lake is called the South Bay, famous for its fishing. It's a fairly deep part of the lake 
  and the water is cold here. From here, you could go back north to the middle of the lake. "
  north = lake
  down: NoTravelMessage { "That would take you under water! You could dive if you think that's a good idea. " }
  cannotGoThatWayMsg = 'It\'s best not to venture any further on the lake; you might lose sight of the shore. '
  bottomRoom = underBay
;

+ salmon: Thing 'salmon/fish' 'salmon'
  "The salmon is a large fish. It's known to be plentiful in the bay near Korenvliet. "
  isLive = true  
  initSpecialDesc = "A salmon is splashing around in the water here. "
  dobjFor(Take) {
    check() {
      if(isLive && !net.isIn(me.location)) {
        failCheck('You try to grab it, but the salmon slips through your fingers! ');
      }
    }
    action() {
      isLive = nil;
      inherited;
      addToScore(1, 'catching a fish');
    }
  }
;