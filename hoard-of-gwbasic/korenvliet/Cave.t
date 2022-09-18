#charset "us-ascii"

/*
 * Korenvliet is copyright 2016 by Alexander van Oostenrijk. All rights are reserved.
 * You may use, distribute and modify this code under the terms of the GPL license, a
 * copy of which should accompany this file. 
 * If not, please visit http://www.gnu.org/licenses/gpl-3.0.en.html.
 */

#include <adv3.h>
#include <en_us.h>

cave: Room 'Underground Cave'
  "You are swimming in a small underground cave, filled completely with water. It's extremely dark here. An underground stream leads east. "
  east = undergroundStream
;

+ bottle: Thing 'empty champagne chablis bottle' 'empty bottle' 
  "This looks like a discarded bottle of Chablis. There is a small note in it that says \"97\". " 
  initSpecialDesc = "An empty bottle is lying on the cave floor. "
;
  
