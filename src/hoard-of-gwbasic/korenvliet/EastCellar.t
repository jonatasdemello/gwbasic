#charset "us-ascii"

/*
 * Korenvliet is copyright 2016 by Alexander van Oostenrijk. All rights are reserved.
 * You may use, distribute and modify this code under the terms of the GPL license, a
 * copy of which should accompany this file. 
 * If not, please visit http://www.gnu.org/licenses/gpl-3.0.en.html.
 */

#include <adv3.h>
#include <en_us.h>

eastCellar: Room 'East wine cellar'
  "Korenvliet's wine cellar is large and musty. Arched pillars supporting the brick ceiling of the room
  stretch off into the gloom to the west. There is a case of chablis in the corner. A small drain
  is set at floor level in the east wall. "
  east = drainCellarToSewer
  in asExit(east)
  west: OneWayRoomConnector
  {
    -> westCellar
    canTravelerPass(traveler) { return !panther.isIn(eastCellar); }
    explainTravelBarrier(traveler)
    {
      "The panther won't let you. It growls at you threateningly. ";
    }
  }
;

+ drainCellarToSewer : DrainDown
;

+ chablis: Decoration 'wooden case/chablis/champagne/wine*champagnes/wines' 'case of chablis'
  "It's a wooden case full of bottles of expensive champagne. There seems to be a bottle missing from the case. "
;

+ panther: UntakeableActor 'imported panther' 'panther'
  "Panthers aren't common in this part of the world, so you suspect that it must have been imported from the
  far east. Apparently uncle Wout felt his wine cellar had to be guarded by an actual panther.\b 
  That panther seems hungry. Perhaps it's been stuck in the cellar for a long time. "
  isHim = true
  initSpecialDesc = "A panther is sitting on the floor here. "
  cannotKissActorMsg = 'Would you like to have your face shredded? I thought not. '
  cannotEatMsg = 'Eating a live panther would be a new one for the Guiness Book of World Records. Maybe now it is not the time to attempt it. '
  uselessToAttackMsg = 'Would you like to have your face shredded? I thought not. '
  
  iobjFor(GiveTo) {
    verify() {}
    action()
    {
      if(gDobj == salmon)
      {
        "The panther snatches the salmon from your hand and disappears into the gloom. ";
        salmon.moveInto(nil);
        panther.moveInto(nil);
        addToScore(1, 'fed a panther');
      }
      else
      {
        "The panther does not seem interested. ";
      }
    }
  }
;
