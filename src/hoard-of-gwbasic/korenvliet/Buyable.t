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
 *   New action: buy
 */
DefineTAction(Buy);
VerbRule(Buy)
  ('buy' | 'acquire') singleDobj
  : BuyAction
  verbPhrase = 'buy/buying (what)'
;

modify Thing
  dobjFor(Buy)
  {
    preCond = [touchObj]
    verify() { illogical(cannotBuyMsg); }
  }
  cannotBuyMsg = '{That dobj/he} {is} not something {you/he} can buy. '
;

/* 
 *   Buyable is a Thing that can be bought. Once bought, you can't buy it again.
 *   You can't take a buyable before buying it.
 */
class Buyable: Thing
  bought = nil
  dobjFor(Take) {
    check() {
      if(bought == nil) {
        failCheck('That would be stealing, you know. ');
      }
    }
  }
  dobjFor(Buy) {
    verify() { }
    check() {
      if(bought != nil) {
        failCheck('You\'ve bought it already. It\'s yours. ');
      }
    }
    action() {
      bought = true;
      "The clerk rings up your purchase on the cash register. You pay her and take the <<self.name>>. ";
      self.moveInto(me);
    }
  }
;