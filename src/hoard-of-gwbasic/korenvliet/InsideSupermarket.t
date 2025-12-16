#charset "us-ascii"

/*
 * Korenvliet is copyright 2016 by Alexander van Oostenrijk. All rights are reserved.
 * You may use, distribute and modify this code under the terms of the GPL license, a
 * copy of which should accompany this file. 
 * If not, please visit http://www.gnu.org/licenses/gpl-3.0.en.html.
 */

#include <adv3.h>
#include <en_us.h>

insideSupermarket: Room 'Inside Supermarket'
  "Though proudly labelled 'supermarket', this is really only a small self-service convenience store. The few 
  aisles are loaded with canned foods and cleaning products. "
  out = mainStreet
  east asExit(out)
;

+ UntakeableActor 'slumped spotty clerk/girl/woman/person/youth' 'clerk'
  "The clerk's a spotty youth slumped behind her cash register. Clearly she'd rather be doing something else. "
  isHer = true
  initSpecialDesc = "A clerk hovers behind a cash register near the exit to the east."
  cannotKissActorMsg = 'Were you looking for a discount? '
  cannotEatMsg = 'You\'re not that hungry. In fact, in this game you never will be, so we\'ve got that out of the way. '
  uselessToAttackMsg = 'Violence will get you nowhere with the clerk. Well, in jail maybe. '  
;

+ Decoration 'cash register' 'cash register'
  "The cash register is battered and faded with age. "
;

+ Decoration 'aisle*aisles' 'aisles'
  "The few aisles in the store are loaded with everyday items, most of which are nonperishable and look like they've
  been here for quite some time. There's a section of canned foods and a section of cleaning products. "
  isPlural = true
;

+ Decoration 'cleaning section/product*products/sections' 'cleaning products'
  "There are various brands of cleaning products available, none of which are of interest to you. "
  isPlural = true
;

+ Decoration 'canned section/food/can*cans/sections' 'canned food' 
  "The canned food in the store won't perish. Good thing too, because most of the cans look like they've been sitting
  on the shelves for quite some time. Luckily this game doesn't require you to eat, because the options don't seem
  very inviting. "
;
    
+ axe: Buyable 'sharp tool/axe*tools/axes' 'axe'
  "It's a small outdoorsman's axe. Its handle is made of hard black plastic and it has a sharp steel blade. "
  initSpecialDesc = "A small outdoorsman's axe hangs on the wall in the tools section, which is otherwise empty. "
  iobjFor(CutWith)
  {
    preCond = [objHeld]
    verify() {}
  }
  dobjFor(Buy) {
    action() {
      inherited;
      addToScore(1, 'buying an axe');
    }
  }  
;

+ sneakers: Buyable, Wearable 'pair of black sneakers/shoes' 'pair of sneakers'
  initSpecialDesc = "A pair of sneakers sits on a shelf near the cash register. "
  desc() {
    "A pair of sneakers. They're black and about your size. ";
    if(me.isFat) {
      "If you ever decided to get in shape, you could jog in style with these. ";
    }
  }
  dobjFor(Buy) {
    action() {
      inherited;
      addToScore(1, 'buying a pair of sneakers');
    }
  }  
;