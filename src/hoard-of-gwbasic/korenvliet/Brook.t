#charset "us-ascii"

/*
 * Korenvliet is copyright 2016 by Alexander van Oostenrijk. All rights are reserved.
 * You may use, distribute and modify this code under the terms of the GPL license, a
 * copy of which should accompany this file. 
 * If not, please visit http://www.gnu.org/licenses/gpl-3.0.en.html.
 */

#include <adv3.h>
#include <en_us.h>

brook: OutdoorRoom 'Small brook'
  "The grounds of the Korenvliet estate end here at a small brook with slippery banks, which blocks further passage 
  to the south. You could follow the brook to the east where it flows into a lake. Through some trees to the north 
  you can glimpse a flagstone patio, and there is a vast meadow to the west. "
  north = patio
  east = shore
  west = meadow
  south: NoTravelMessage { "The brook is too wide to jump, and the banks are very slippery. Better not. "; } 
;

+ Distant 'flagstone patio*patios' 'patio'
  "A flagstone patio, which must be part of the estate, can be seem through some trees to the north. "
;

+ Distant 'meadow' 'meadow'
  "A vast meadow liest to the west. "
;

+ Distant 'lake' 'lake'
  "The small brook appears to end at a lake to the east. "
;

+ smallbrook: Fixture 'wide muddy small brook/river/channel/creek/water' 'small brook' 
  "The brook is quite wide, and its muddy banks are very slippery. "
  isWarned = nil
  dobjFor(Enter) {
    verify {}
    action() {
      if(!isWarned) {
        "The muddy bank of the brook is very slippery. Stepping into the brook might be dangerous. ";
        isWarned = true;
      }
      else {
        "Stepping into the brook, you slip on the muddy bank and fall awkwardly, spraining your wrist
        quite painfully.\bYou make your way to the local clinic for treatment. Be more careful in the future! \b";
        me.moveInto(bed);
        me.makePosture(lying);
        me.lookAround(true);
        isWarned = nil; /* Can try again if desired. */
      }
    }
  }
  dobjFor(JumpOver) {
    verify {}
    action() {
      if(!isWarned) {
        "The muddy bank of the brook is very slippery. Trying to jump might be dangerous. ";
        isWarned = true;
      }
      else {
        "Trying to jump the brook, you slip on the muddy bank and fall awkwardly, spraining your wrist
        quite painfully.\bYou make your way to the local clinic for treatment. Be more careful in the future! \b";
        me.moveInto(bed);
        me.makePosture(lying);
        me.lookAround(true);
        isWarned = nil; /* Can try again if desired. */
      }
    }
  }
  iobjFor(PutIn) {
    verify() {}
    action() {
      if(gDobj == boat) {
        "The brook isn't very deep. The sharp shones on the bed would rip your boat to shreds. ";
      } else {
        "If you put that in the brook, you'll lose it. ";
      }
    }
  }
  iobjFor(PutOn) {
    verify() {}
    action() {
      if(gDobj == boat) {
        "The brook isn't very deep. The sharp shones on the bed would rip your boat to shreds. ";
      } else {
        "If you put that in the brook, you'll lose it. ";
      }
    }
  }

;

