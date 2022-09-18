#charset "us-ascii"

/*
 * Korenvliet is copyright 2016 by Alexander van Oostenrijk. All rights are reserved.
 * You may use, distribute and modify this code under the terms of the GPL license, a
 * copy of which should accompany this file. 
 * If not, please visit http://www.gnu.org/licenses/gpl-3.0.en.html.
 */

#include <adv3.h>
#include <en_us.h>

barn: Room 'Abandoned barn'
  "This is a rickety, abandoned farm. Its walls are made of wooden planks 
  with are quite rotted in places and the floor is covered in dust. The 
  barn is empty apart from lots of cobwebs and an old wooden table. An exit leads out to the plateau. "
  south = plateau
  out asExit(south)
;

+ Heavy, Surface 'old wooden table*tables' 'wooden table'
  "The wooden table is old and worn. Someone has scratched the number \"19\" into its surface. "
;

+ Decoration 'cobweb/web*cobwebs/webs/dust' 'cobwebs'
  "This barn must have been abandoned for quite some time. There are cobwebs in every corner. "
  isPlural = true
;

+ plateauExit: Enterable ->plateau 'plateau' 'plateau'
  "The farm's old doors open onto the plateau outside. "
;
