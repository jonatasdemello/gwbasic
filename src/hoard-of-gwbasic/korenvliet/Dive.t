#charset "us-ascii"

/*
 * Korenvliet is copyright 2016 by Alexander van Oostenrijk. All rights are reserved.
 * You may use, distribute and modify this code under the terms of the GPL license, a
 * copy of which should accompany this file. 
 * If not, please visit http://www.gnu.org/licenses/gpl-3.0.en.html.
 */

#include <adv3.h>
#include <en_us.h>

DefineIAction(Dive)
  execAction()
  {
    if(me.isIn(shore)) {
      "You wouldn't get very far in the cold lake water. It would be better to find a boat if you wish to
      go onto the lake. ";
      exit;
    }
    if(!me.isIn(lake) && !me.isIn(bay)) {
      "You can't dive here. ";
      exit;
    } 
    if(!snorkel.isWorn) {
      "You'll need to wear a snorkel in order to breathe under water. ";
      exit;
    }
    if(me.location == lake) {
      "You dive underwater.\b";
      me.moveInto(underLake);
      me.lookAround(true);
    }
    if(me.location == bay) {
      "You dive underwater.\b";
      me.moveInto(underBay);
      me.lookAround(true);
    }
  }
;

VerbRule(Dive)
  'dive' | 'swim'
  : DiveAction
  verbPhrase = 'dive/diving'
;

