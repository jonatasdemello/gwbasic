#charset "us-ascii"

/*
 * Korenvliet is copyright 2016 by Alexander van Oostenrijk. All rights are reserved.
 * You may use, distribute and modify this code under the terms of the GPL license, a
 * copy of which should accompany this file. 
 * If not, please visit http://www.gnu.org/licenses/gpl-3.0.en.html.
 */

#include <adv3.h>
#include <en_us.h>

study: Room 'Study'
  "This is a well-appointed study. A large mahogany desk sits in the center of the room, 
  and a grandfather clock stands against the north wall. A small drain is in the floor in the corner of the room.\b 
  Wooden doors lead west and south, and a glass door leads east to a conservatory. "
  east = conservatoryDoorOutside
  west = studyDoorInside
  south = hallwayDoorOutside
  down = drainStudyToSewer
;

+ drainStudyToSewer: DrainDown
;

+ studyDoorInside: Door 'west wooden door*doors' 'west door'
  desc() {
    "This is a simple interior door leading west. It has a handle but no lock. ";
    if(self.isOpen) {
      "You can see the living room on the other side. ";
    }    
  }
;

+ conservatoryDoorOutside: Door ->conservatoryDoorInside 'east glass door*doors' 'glass door' 
  desc() {
    "The door's surface is divided into a number of small glass panes. ";
    if(self.isOpen) {
      "It leads to a conservatory. ";
    } else {
      "Through the glass, you can see a conservatory on the other side. ";
    }
  }
;

+ hallwayDoorOutside: Door ->hallwayDoorInside 'south wooden door*doors' 'south door'
  desc() {
    "This is a simple interior door leading south. It has a handle but no lock. ";
    if(self.isOpen) {
      "You can see a hallway on the other side. ";
    }
  }
;

+ grandfatherClock: Heavy, OpenableContainer 'tall grandfather clock*clocks' 'grandfather clock'
  "The tall grandfather clock isn't ticking, but then it must not have been wound for some time. It seems
  the clock can be opened to access its internals. "
;

++ goggles: Wearable 'swimming pair/goggles/glasses' 'pair of swimming goggles'
  "A pair or rubber swimming goggles. These help to see underwater. Why uncle Wout would store them
  in his grandfather clock is a mystery, but then he was always a distracted sort. "
  isPlural = true
;

+ Surface, Heavy 'mahogany desk/table*desks/tables/furniture' 'desk'
  "The desk is a solid piece of workmanship, done beautifully in mahogany. 
  It must be worth a fortune. The desk has a single drawer, which is <<drawer.isOpen ? "open" : "closed">>. "
  dobjFor(Open) remapTo(Open, drawer)
  dobjFor(Close) remapTo(Close, drawer)
;

++ drawer: OpenableContainer, Component 'drawer*drawers' 'drawer'
;

+++ book: Readable 'leather-bound leather book*books' 'leather-bound book'
  "The book is bound in rich leather. It seems to be a treatise on the construction of hot air balloons. "
  isRead = nil
  readDesc() {
    "You glean from the book that amateur hot air balloon construction requires a balloon, a stove 
    with some fuel, a gondola and some cable or rope. It also states that one should build that balloon in \"a suitable spot\". 
    Well, that would be an interesting if risky project. It's amazing what old Wout got up to in his old age. Since there 
    has been no news of hot air balloon experiments near the village, he must not have gotten around to actually doing it. ";
    if(!isRead) {
      addToScore(1, 'reading some literature');  
    }
    isRead = true;
  }
;

