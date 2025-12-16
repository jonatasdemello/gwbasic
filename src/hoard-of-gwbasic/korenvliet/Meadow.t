#charset "us-ascii"

/*
 * Korenvliet is copyright 2016 by Alexander van Oostenrijk. All rights are reserved.
 * You may use, distribute and modify this code under the terms of the GPL license, a
 * copy of which should accompany this file. 
 * If not, please visit http://www.gnu.org/licenses/gpl-3.0.en.html.
 */

#include <adv3.h>
#include <en_us.h>

meadow: OutdoorRoom 'Meadow'
  "You are in a vast, grassy meadow sprinkled with daisies. To the north are the trees of a small forest, while you can hear the gurgling of
  water from the east. "
  north = forest
  east = brook
  south: FakeConnector { "The meadow is vast and seems to go on forever. There seems little point in going that far from Korenvliet. "; }
  west: FakeConnector { "The meadow is vast and seems to go on forever. There seems little point in going that far from Korenvliet. "; }
;

+ Decoration 'grass*grasses' 'grass'
  "The grass in this meadow is tall. "
;

+ Decoration 'daisy*daisies' 'daisies'
  "There are small white daisies everywhere in the meadow. It's very pretty here. "
  isPlural = true
;

+ Distant 'small tree/forest*trees' 'forest'
  "To the north, the first trees of a small forest are visible at the edge of the meadow. ";
;

+ balloon: Thing 'large grey crashed weather balloon*balloons' 'balloon'
  "It's a somewhat large grey balloon made from some lightweight material. Likely it's a crashed weather balloon. "
  initSpecialDesc = "A weather balloon seems to have crashed here. "
  
  dobjFor(Build) {
    verify() {}
    check() {
      if(!book.isRead) {
        failCheck('Interesting! It\'s a shame you have no idea how to do that. ');
      }
      if(!balloon.isIn(me.location)) failCheck('For starters, you\'ll need a balloon. ');
      if(!basket.isIn(me.location)) failCheck('You\'ll need some kind of gondola. ');
      if(!rope.isIn(me.location)) failCheck('You\'ll need some rope or cables. ');
      if(!stove.isIn(me.location)) failCheck('You\'ll need a stove. ');
      if(!wood.isIn(me.location)) failCheck('You\'ll need some fuel. ');
      if(!matchbook.isIn(me.location)) failCheck('You\'ll need some matches or a lighter to light the wood with. ');
      if(!me.isIn(landfill)) {
        failCheck('This does not appear to be a suitable spot to build a hot-air balloon. ');
      }
    }
    action() {
      "Using the items you have collected, you set to work on building a hot-air balloon. The book you've read 
      provides guidance and while it takes some hours of work, in the end you get it done. It will fly. ";
      matchbook.moveInto(nil);
      basket.moveInto(nil);
      rope.moveInto(nil);
      stove.moveInto(nil);
      wood.moveInto(nil);
      balloon.moveInto(nil);
      airship.moveInto(landfill);
    }
  }
;


