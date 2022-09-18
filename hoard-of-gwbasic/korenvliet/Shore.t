#charset "us-ascii"

/*
 * Korenvliet is copyright 2016 by Alexander van Oostenrijk. All rights are reserved.
 * You may use, distribute and modify this code under the terms of the GPL license, a
 * copy of which should accompany this file. 
 * If not, please visit http://www.gnu.org/licenses/gpl-3.0.en.html.
 */

#include <adv3.h>
#include <en_us.h>

shore: OutdoorRoom 'Lakeshore'
  "The small brook ends here and flows into a large lake. Thick bushes block passage along the shore. 
  You could follow the brook back to the west. "
  west = brook
  east = lakeEntrance
;

+ Decoration 'bush*bushes' 'bushes'
  "The undergrowth is very thick along the shore of the lake. The only way out of here is along the
  brook. "
  isPlural = true
;

+ lakeEntrance: Enterable ->lake 'large lake/water/pond/body/shore' 'lake'
  "The lake is a sizeable body of water. It flows right around Korenvliet. You can see the shore
  on the other side far away in the distance. "
  dobjFor(TravelVia) {
    check() { 
      if(!boat.isIn(me.location)) {
        failCheck('You will need a boat of some kind to venture onto the lake. ');
      }
      if(!boat.isInflated) {
        failCheck('Your rubber boat needs to be inflated first. ');
      }
    }
    action() {
      boat.moveInto(me.location);
      inherited;
    }
  }
  iobjFor(PutIn) {
    verify() {}
    action() {
      if(gDobj == boat) {
        if(boat.isInflated) {
          "If you put the boat in the water, it'll just drift off. Simply go into the lake with the boat. ";
        } else {
          "The uninflated boat will just sink. ";
        }
      } else {
        "If you put that in the lake, you'll lose it. ";
      }
    }
  }
  iobjFor(PutOn) {
    verify() {}
    action() {
      if(gDobj == boat) {
        if(boat.isInflated) {
          "If you put the boat in the water, it'll just drift off. Simply go into the lake with the boat. ";
        } else {
          "The uninflated boat will just sink. ";
        }
      } else {
        "If you put that in the lake, you'll lose it. ";
      }
    }
  }  
;

+ smallbrookAtLake: Fixture 'wide muddy small brook/river/channel/creek/water' 'small brook'
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

