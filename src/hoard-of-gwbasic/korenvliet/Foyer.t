#charset "us-ascii"

/*
 * Korenvliet is copyright 2016 by Alexander van Oostenrijk. All rights are reserved.
 * You may use, distribute and modify this code under the terms of the GPL license, a
 * copy of which should accompany this file. 
 * If not, please visit http://www.gnu.org/licenses/gpl-3.0.en.html.
 */

#include <adv3.h>
#include <en_us.h>

foyer: Room 'Foyer'
  "Korenvliet's foyer is large and imposing. Its walls are panelled in the finest wood, and the floor
  is a rich mahogany parquet. There is an occasional table by the door. A heavy front door leads west 
  to the main street, while a panelled door 
  leading further into the villa stands <<panelledDoorOutside.isOpen ? "open" : "closed">> to the south. "
  out = frontDoorInside
  west asExit(out)
  south = panelledDoorOutside
;

+ panelledDoorOutside: Door ->panelledDoorInside 'panelled door*doors' 'panelled door'
  desc() {
    "A handsome panelled door to the south offers further access to the villa. ";
    if(self.isOpen) {
      "You can see a living room on the other side. ";
    }
  }
;

+ frontDoorInside: Door 'front door*doors' 'front door'
  "Korenvliet's front door is a heavy oaken affair. It leads out to the village main street. "
;

+ basket: Thing 'heavy large squarish sturdy wicker basket' 'basket'
  "The basket is sturdy, squarish, about two feet on a side, and made of strong wicker. "
  initSpecialDesc = "A large wicker basket sits in a corner. "
;

+ Surface, Heavy 'small occasional table*tables/furniture' 'table' 
  "The square occasional table is a beautiful piece of workmanship, like so much of the furniture
  in Korenvliet. Its solid hardwood construction makes it very heavy. "
;

++ note: Readable 'folded letter*letters' 'letter'
  "This is a letter written in uncle Wout's hand. "
  initSpecialDesc = "A folded letter lies on the occasional table. "
  readDesc = "The letter is directed to a local construction company. Uncle Wout is complaining
    about a landfill having cut off access a barn belonging to the Korenvliet estate. It seems
    uncle Wout never got around to posting it. "
;
