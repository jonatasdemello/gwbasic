#charset "us-ascii"

/*
 * Korenvliet is copyright 2016 by Alexander van Oostenrijk. All rights are reserved.
 * You may use, distribute and modify this code under the terms of the GPL license, a
 * copy of which should accompany this file. 
 * If not, please visit http://www.gnu.org/licenses/gpl-3.0.en.html.
 */

#include <adv3.h>
#include <en_us.h>

/*
 * Drain (down) implementation. Can be inherited
 * where one must set destination = xxx.
 */
DrainDown: Door
  vocabWords = 'small drain/manhole*drains/manholes'
  name = 'drain'
  desc = "This drain seems to lead into a sewer pipe. A person could probably squeeze into it. "
  canTravelerPass(traveler) {
    return !me.isFat;
  }
  explainTravelBarrier(traveler) {
    "You're too fat to squeeze into the drain. Perhaps you could manage it if you lost some weight first. ";
  }
  noteTraversal(traveler) {
    "With some effort, you squeeze yourself feet first into the drain. ";
  }
;

/*
 *   Drain (up) implementation. Can be inherited where one must set destination
 *   = xxx.
 */
DrainUp: Door 
  vocabWords = 'small drain/manhole*drains/manholes'
  name = 'drain'
  desc = "The drain is a squareish opening that seems to lead out of the sewer pipe. A person could probably squeeze through it. "
  canTravelerPass(traveler) {
    return !me.isFat;
  }
  explainTravelBarrier(traveler) {
    "You're too fat to push yourself through the drain. Perhaps you could manage it if you lost some weight first. ";
  }
  noteTraversal(traveler) {
    "With some effort, you squeeze yourself head first through the drain. ";
  }
;

// -------------------------

sewerUnderLiving: Room 'Sewer'
  "You are inside the north end of a dimly lit, round concrete sewer pipe. The pipe continues to the south. There is a drain here, leading up. "
  up = drainToLiving
  out asExit(up)
  south = sewerLeftCurve
;

+ drainToLiving: DrainUp
  masterObject = drainLivingToSewer
;

sewerUnderStudy: Room 'Sewer'
  "You are inside the north end of a dimly lit, round concrete sewer pipe. The pipe continues to the south. There is a drain here, leading up. "
  up = drainToStudy
  out asExit(up)
  south = sewerFork
;

+ drainToStudy: DrainUp
  masterObject = drainStudyToSewer
;

sewerLeftCurve: Room 'Curve in the sewer' 
  "You are inside a round concrete sewer pipe. It's s tight fit, and it's very dark here. The pipe curves from the north to the east. "
  north = sewerUnderLiving
  east = sewerFork
;

sewerFork: Room 'Fork in the sewer'
  "You are inside a round concrete sewer pipe. It's a tight fit, and it's very dark here. The pipe forks here, leading off to the north, south and west. "
  north = sewerUnderStudy
  west = sewerLeftCurve
  south = sewerRightCurve
;

sewerRightCurve: Room 'Curve in the sewer'
  "You are inside a round concrete sewer pipe. It's a tight fit, and it's very dark here. The pipe curves from the north to the west. "
  north = sewerFork
  west = sewerUnderAtrium
;

sewerUnderAtrium: Room 'Sewer'
  "You are inside a dimly lit, round concrete sewer pipe. The pipe continues to the east as well as downwards. There is a drain here, leading up. "
  up = drainToAtrium
  out asExit(up)
  east = sewerRightCurve
  down = sewerUnderCellar
;

+ drainToAtrium: DrainUp
  masterObject = drainAtriumToSewer
;

sewerUnderCellar: Room 'Sewer'
  "You are at the end of a dimly lit, round concrete sewer pipe. The pipe continues upwards from here. There is a drain here, leading west. "
  west = drainToCellar
  out asExit(west)
  up = sewerUnderAtrium
;

+ drainToCellar: DrainUp
  masterObject = drainCellarToSewer
;
  






