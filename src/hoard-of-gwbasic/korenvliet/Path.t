#charset "us-ascii"

/*
 * Korenvliet is copyright 2016 by Alexander van Oostenrijk. All rights are reserved.
 * You may use, distribute and modify this code under the terms of the GPL license, a
 * copy of which should accompany this file. 
 * If not, please visit http://www.gnu.org/licenses/gpl-3.0.en.html.
 */

#include <adv3.h>
#include <en_us.h>

path: OutdoorRoom 'Rocky path'
  "You are walking down a rocky path that leads from a vacant lot to the west to the
  edge of a landfill to the east. "
  west = lot
  east = landfill
;

+ Distant 'landfill' 'landfill'
  "The rocky path leads up to a landfill to the east. "
;

+ Distant 'vacant lot' 'vacant lot'
  "The rocky path ends at a vacant lot to the west. "
;

+ net: Thing 'fishing net*nets' 'fishing net'
  "The fishing net is not very large, but it will work for catching small and medium-sized fish (if you're 
  the patient sort). "
  initSpecialDesc = "A fishing net lies discarded along that path. "
;
