#charset "us-ascii"

/*
 * Korenvliet is copyright 2016 by Alexander van Oostenrijk. All rights are reserved.
 * You may use, distribute and modify this code under the terms of the GPL license, a
 * copy of which should accompany this file. 
 * If not, please visit http://www.gnu.org/licenses/gpl-3.0.en.html.
 */

#include <adv3.h>
#include <en_us.h>

mainStreet: OutdoorRoom 'Main Street'
  "This is the cobbled main street of the village which has grown around the sprawling estate over time. 
  The impressive front door of the stately villa of Korenvliet is to the east, 
  while there is a small supermarket to the west and a village clinic to the southwest. A narrow path 
  leads to a forest to the south, and there seems to be a vacant lot to the north. "
  west = supermarketEntrance
  southwest = insideClinic
  east = frontDoorOutside
  south = forest
  north = lot
  northwest : FakeConnector { "You could follow the street out of the village, but you don't want to leave yet without uncle Wout's will. " } 
  southeast : FakeConnector { "You could follow the street out of the village, but you don't want to leave yet without uncle Wout's will. " } 
;

+ clinicEntrance: Enterable ->insideClinic 'village clinic/hospital' 'village clinic'
  "Only able to handle the simplest of cases, the local clinic is small and somewhat derelict. A glass door leads inside. "
; 

+ supermarketEntrance: Enterable ->insideSupermarket 'small local supermarket/shop/store/market' 'small supermarket'
  "Although it says \"supermarket\" over the door, this is really only a convenience store. There are some half-hearted 
  advertisements glued to the inside of the windows, but it is obvious that the store's continued existence is a 
  matter of inertia. A small sign saying \"open\" is on the double doors that lead inside. "
  dobjFor(TravelVia) {
    check() { 
      if(me.contents.length() != 0) failCheck('You cannot go into the supermarket with all the things you are carrying. '); 
    }
  }
;

+ forestPath: Enterable ->forest 'narrow path/forest' 'forest path'
  "The narrow path disappears between the trees. ";
;

+ toVacantLot: Enterable ->lot 'vacant lot' 'vacant lot'
  "The vacant lot to the north is a bit of an eyesore here in the village center. ";
;

+ Decoration 'small sign' 'sign'
  "The small sign reads \"open\", with \"hello, we are\" above that in a smaller type. The 
  doors to the store are open too, so clearly that statement is true. "
;

+ Decoration 'half-hearted advertisement*advertisements' 'advertisements'
  "The advertisements heartily recommend some cleaning products. "
  isPlural = true
;

+ Decoration 'cobbled main street/cobble*cobbles' 'street'
  "The street is fairly wide, level, and covered in cobbles. It runs through the village from 
  the northwest to the southeast. "
;

+ frontDoorOutside: Door ->frontDoorInside 'front door*doors' 'front door'
  "Korenvliet's front door is a heavy oaken affair. It's wide, heavy, and above all impressive. "
;

+ foyerEntrance: Fixture 'stately korenvliet/estate/villa/house/foyer' 'Korenvliet'
  "Delapidated yet intimidating, it is clear that the village was built around the Korenvliet Estate. Its sprawling grounds cover
  an area larger than the rest of the village combined. In fact, the village grounds are likely owned by the estate... it could
  all be yours if only you could find uncle Wout's will. "
  dobjFor(Enter) remapTo(Enter, frontDoorOutside)
;


