#charset "us-ascii"

/*
 * Korenvliet is copyright 2016 by Alexander van Oostenrijk. All rights are reserved.
 * You may use, distribute and modify this code under the terms of the GPL license, a
 * copy of which should accompany this file. 
 * If not, please visit http://www.gnu.org/licenses/gpl-3.0.en.html.
 */

#include <adv3.h>
#include <en_us.h>

undergroundStream: Room 'Underground stream'
  "You are swimming in an underground stream. This rocky passage is rather tight and it's extremely dark here. The stream continues to the east and west. "
  east = underBay
  west = cave
;
