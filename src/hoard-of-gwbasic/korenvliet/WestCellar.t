#charset "us-ascii"

/*
 * Korenvliet is copyright 2016 by Alexander van Oostenrijk. All rights are reserved.
 * You may use, distribute and modify this code under the terms of the GPL license, a
 * copy of which should accompany this file. 
 * If not, please visit http://www.gnu.org/licenses/gpl-3.0.en.html.
 */

#include <adv3.h>
#include <en_us.h>

westCellar: Room 'West wine cellar'
  "Korenvliet's wine cellar is large and musty. Arched pillars supporting the brick ceiling of the room
  stretch off into the gloom to the east. A flight of stairs leads up. "
  east = eastCellar
  up = stairsUp
;

+ stairsUp : StairwayUp 'stairway/stairs' 'stairway up'
  "A flight of concrete steps leads up. "
;

+ goblet: Thing 'crystal goblet/sticker*goblets/stickers' 'crystal goblet'
  "It's a beautiful crystal goblet which must be quite valuable. Even more interestingly, there's a
  sticker glued to it on which the number \"64\" is written. "
  initSpecialDesc = "In the dim light, you see the sparkle of a crystal goblet sitting in a corner. "
;

