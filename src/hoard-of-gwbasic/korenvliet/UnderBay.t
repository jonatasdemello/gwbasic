#charset "us-ascii"

/*
 * Korenvliet is copyright 2016 by Alexander van Oostenrijk. All rights are reserved.
 * You may use, distribute and modify this code under the terms of the GPL license, a
 * copy of which should accompany this file. 
 * If not, please visit http://www.gnu.org/licenses/gpl-3.0.en.html.
 */

#include <adv3.h>
#include <en_us.h>

underBay: OutdoorRoom 'South Bay (under water)'
  desc() {
    "You are swimming underwater somewhere in the South Bay. The water is very cold. The lake floor throws up clouds of mud as you pass by. It seems possible to swim north from here. ";
    if(goggles.isWorn) {
      "You also spot what looks like a tunnel in the lake floor to the west. ";
    }
  }
  up = bay
  north = underLake
  west: OneWayRoomConnector
  {
    -> undergroundStream
    isConnectorListed = nil
    canTravelerPass(traveler) { return goggles.isWornBy(traveler); }
    explainTravelBarrier(traveler)
    {
      "The water is far too muddy in that direction. You can't see a thing. ";
    }
  }
  cannotGoThatWayMsg = 'It\'s best not to venture too far underwater. '
;
