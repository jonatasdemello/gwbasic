#charset "us-ascii"

/*
 * Korenvliet is copyright 2016 by Alexander van Oostenrijk. All rights are reserved.
 * You may use, distribute and modify this code under the terms of the GPL license, a
 * copy of which should accompany this file. 
 * If not, please visit http://www.gnu.org/licenses/gpl-3.0.en.html.
 */

#include <adv3.h>
#include <en_us.h>

forest: OutdoorRoom 'In a forest'
  "You find yourself among trees of all sizes in a small forest to the south of the village main street. To the east
  you can glimpse a small patio, and to the south the forest thins and turns into a meadow. "
  destName = 'the forest'
  north = mainStreet
  east = patio
  south = meadow
;

+ Decoration 'undergrowth/bush*bushes' 'undergrowth'
  "There is surprisingly little undergrowth in this forest. Perhaps the taller trees block most of the sunlight. "
;

+ Distant 'meadow*meadows' 'meadow'
  "The green grass of a meadow is visible through the trees to the south. "
;

+ Distant 'patio*patios' 'patio'
  "A flagstone patio is visible through the trees to the south. It's probably part of the Korenvliet estate. "
;

+ Fixture 'tall tree/sapling*trees/saplings' 'trees'
  "The trees found in this forest are a mixed group. There are tall, older trees with wide trunks as well as
  young saplings. There doesn't seem to be much maintenance going on. Nevertheless, there is little undergrowth 
  and the forest floor is clear of debris. "
  isPlural = true
  isCut = nil
  isWarned = nil
  
  dobjFor(Climb) {
    verify() { }
    action() {
      if(!isWarned) {
        "The trees that are strong enough to climb also have rather slippery trunks. Climbing one may
        be dangerous. ";
        isWarned = true;
      }
      else {
        "You try to climb one of the trees, but the thin branches crack and break and the slippery trunk offers
        little traction. You scramble with all your might, but lose your grip and fall down, twisting your 
        ankle quite badly.\b
        You end up dragging yourself to the local clinic to have your ankle seen to. Be more careful!\b";
        me.moveInto(bed);
        me.makePosture(lying);
        me.lookAround(true);
        isWarned = nil; /* Can climb again if desired. */
      }
    }
  }
  
  dobjFor(CutWith)
  {
    preCond = [touchObj]
    verify()
    {
      if(isCut) {
        illogicalAlready('You\'ve already done that. There\'s no need to damage any more trees. ');
      }
    }
    action()
    {
      isCut = true;
      "Using your axe, you chop off some branches from a nearby tree. The dead wood falls to the ground with a whump. ";
      wood.discover();
    }
  }        
;

/*
 *   This wood will be discovered when you cut a tree.
 */
+ wood: Hidden 'some dry dead wood/branch*branches' 'some wood' 
  "It's a small quantity of dry, dead wood. "
  aName = name // Remove article
;


