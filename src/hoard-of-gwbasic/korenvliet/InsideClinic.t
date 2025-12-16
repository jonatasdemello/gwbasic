#charset "us-ascii"

/*
 * Korenvliet is copyright 2016 by Alexander van Oostenrijk. All rights are reserved.
 * You may use, distribute and modify this code under the terms of the GPL license, a
 * copy of which should accompany this file. 
 * If not, please visit http://www.gnu.org/licenses/gpl-3.0.en.html.
 */

#include <adv3.h>
#include <en_us.h>

insideClinic: Room 'Inside Clinic'
  "Faded public notices line the walls of the single small room that comprises the local medical clinic. The walls
  are painted an obligatory institutional green. There is a single bed in a corner. There doesn't seem to be much 
  here in the way of medical supplies and instruments, since serious (or most) cases are sent to the district hospital 
  in the next town. A glass door leads northeast out to the vilage main street. "
  destName = 'the clinic'
  out = mainStreet
  northeast asExit(out) 
;

+ bed: Bed, Fixture 'single bed' 'bed'
  "It's a battered hospital bed. The sheets are clean, though. "
;

+ Decoration 'sheet*sheets' 'sheets'
  "The sheets are tightly tucked into the hospital bed. "
  isPlural = true
;

+ Decoration 'faded public poster/notice*posters/notices'
  noteIndex = 0
  desc() {
    "There are various public notices on the wall that are well out of date. ";
    switch(noteIndex) {
      case 1: "There's a hand-printed note dated two years ago saying that all dental cases should be referred to the district hospital. Some bored patient has drawn a doodle in a corner. "; break;
      case 2: "One home-printed notice says 'SILENCE' in fat letters. "; break;
      case 3: "A large poster exclaims, \"Excercise is GOOD for you.\" with a faded photo of happy joggers in a meadow. "; break;
      default: "An uninviting photograph of a toddler's mouth suggests that brushing your teeth twice a day is good, while eating apples regularly is even better. "; break;
    }
    noteIndex++;
    if(noteIndex > 3) noteIndex = 0;
  }
  isPlural = true
;
