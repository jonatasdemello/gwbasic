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
 *   New action: jog
 */
DefineIAction(Jog)
  execAction() {
    if(!sneakers.isWorn) {
      "You'll need to wear some running shoes in order to jog. ";
      exit;
    }
    if(!me.isIn(meadow)) {
      "You should find a place where there is enough space to run a few laps. ";
      exit;
    }
    "You give yourself a strenuous workout by running some laps around the meadow. ";
    if(me.isFat) {
      "\bYou are now sweating like a race-horse, but it looks like you've lost a few pounds!";
      me.isFat = nil;
      addToScore(1, 'getting in shape');
    }
  }
;

VerbRule(Jog)
  'jog' | 'run' | 'exercise'
  : JogAction
  verbPhrase = 'jog/jogging'
;

