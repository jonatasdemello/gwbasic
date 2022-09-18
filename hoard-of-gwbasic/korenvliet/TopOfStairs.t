#charset "us-ascii"

/*
 * Korenvliet is copyright 2016 by Alexander van Oostenrijk. All rights are reserved.
 * You may use, distribute and modify this code under the terms of the GPL license, a
 * copy of which should accompany this file. 
 * If not, please visit http://www.gnu.org/licenses/gpl-3.0.en.html.
 */

#include <adv3.h>
#include <en_us.h>

topOfStairs: Room 'Top of stairs'
  "You are at the top of a dimly lit flight of stairs going down. The brick walls here are cold and musty. 
  In the west wall is a small door. "
  east = eastCellar
  down = stairsDown
  west = insideCellarDoor
;

+ stairsDown : StairwayDown ->stairsUp 'stairway/stairs' 'stairway down'
  "A flight of concrete steps leads down into the darkness. "
;

+ insideCellarDoor: Lockable, Door 'small wooden cellar door*doors' 'cellar door'
  "A small wooden door is set in the west wall. The door has a latch on it. "
  initiallyLocked = true
;