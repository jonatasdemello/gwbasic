#charset "us-ascii"

/*
 * Korenvliet is copyright 2016 by Alexander van Oostenrijk. All rights are reserved.
 * You may use, distribute and modify this code under the terms of the GPL license, a
 * copy of which should accompany this file. 
 * If not, please visit http://www.gnu.org/licenses/gpl-3.0.en.html.
 */

#include <adv3.h>
#include <en_us.h>

lot: OutdoorRoom 'Vacant lot'
  "This is a vacant lot filled with rubble. It seems the municipality was going to build something here, but
  never got round to it. Of course, there's not too much going on in this village, which 
  exists by the graces of the vast Korenvliet estate.\b
  You can see the main street to the south, while a rocky path leads off to the east. "
  south = mainStreet
  east = path
;

+ Decoration 'rubble*rocks' 'rubble'
  "There's only rubble here. It seems no construction has started yet on this vacant lot. ";
;

+ Distant 'rocky path' 'rocky path'
  "A rocky path winds its way to the east. "
;
  

