#charset "us-ascii"

/*
 * Korenvliet is copyright 2016 by Alexander van Oostenrijk. All rights are reserved.
 * You may use, distribute and modify this code under the terms of the GPL license, a
 * copy of which should accompany this file. 
 * If not, please visit http://www.gnu.org/licenses/gpl-3.0.en.html.
 */

#include <adv3.h>
#include <en_us.h>

hallway: Room 'Hallway'
  desc() { 
    "This short L-shaped hallways runs from a wooden door to the north to an open archway to the west. There is also a small
    door set in the east wall. A large portrait of uncle Wout ";
    if(safe.discovered) {
      "with a wall safe behind it ";
    }
    "dominates the south wall. ";
  }
  north = hallwayDoorInside
  west = atrium
  east = outsideCellarDoor
;

+ outsideCellarDoor: LockableWithKey, Door ->insideCellarDoor 'small cellar door*doors' 'small door'
  "A small door is set in the east wall. This door has a handle but no keyhole. "
;

+ hallwayDoorInside: Door 'north wooden door*doors' 'north door'
  desc() {
    "This is a simple interior door leading north. It has a handle but no lock. ";
    if(self.isOpen) {
      "You can see a study on the other side. ";
    }
  }
;

+ satchel: OpenableContainer 'spacious large leather satchel/bag/sack' 'leather satchel'
  "The leather satchel is spacious and can be carried easily when slung over the shoulder. "
;

++ snorkel: Wearable 'snorkel' 'snorkel'
  "A rubber snorkel. It allows you to breathe underwater. "
  dobjFor(Remove) {
    check() {
      if(me.location == underLake || me.location == underBay || me.location == undergroundStream || me.location == cave) {
        failCheck('Not now! You\'re underwater! ');
      }
    }
  }
;

+ portrait: Fixture 'picture/painting/portrait' 'portrait of uncle Wout'
  "From the painted portrait, uncle Wout glares in the distance from under his bushy eyebrows. Uncle Wout was never
  a likeable fellow, but he did manage to build up this vast estate. "
  dobjFor(Move) {
    verify() {}
    check() {
      if(safe.discovered) {
        failCheck('There\'s nothing else behind the portrait. ');
      }
    }
    action() {
      safe.discover();
      label.discover();
      dial.discover();
      "You find a wall safe behind the portrait. ";
      addToScore(1, 'finding the wall safe');
    }
  }
  dobjFor(LookBehind) remapTo(Move, portrait)
;

+ safe: Hidden, LockableContainer, Fixture 'wall safe/vault' 'wall safe'
  "It's a combination wall safe. There is a single dial on it. There's also a small label on the safe. "
  hasBeenOpened = nil
  dobjFor(Unlock) {
    check() {
      failCheck('There\'s a numbered dial on the safe. You\'ll need to set it to specific numbers in order to umlock the safe. ');
    }
  }
  dobjFor(Lock) {
    check() {
      failCheck('There\'s realy no need to lock the safe again. ');
    }
  }
;

++ will: Readable 'will/testament' 'will'
  desc() {
    "This looks like uncle Wout's will. ";
    if(!isRead) {
      "You should read it to find out what it says. ";
    }
  }
  readDesc() {
    "You read the document. This is what it says:\b";
    "*** LAST WILL AND TESTAMENT ***\b
     I, Wout van Duysz ter Ghasth, in good health and with all my faculties, 
    leave all my possessions, including the Korenvliet estate, to whomever
    succeeds in opening this safe.\b
    Congratulations.\b";
    finishGameMsg(ftVictory, [finishOptionFullScore]);
  }
  isRead = nil;
;

+ label: Hidden, Fixture 'small label' 'small label'
  "The label is glued to the safe door. There are some doodles on it that look
  like a bottle, a goblet and finally something unrecognizable. It might be a table, a desk, or a box. "
;

+ dial: Hidden, NumberedDial, Fixture 'dial*dials' 'dial'
  "The dial can be turned to any number from 0 to 99; it's currently at <<curSetting>>. "
  minSetting = 0
  maxSetting = 99
  combination = [97, 64, 19]
  storedSettings = []
  makeSetting(val)
  {
    inherited(val);
    storedSettings += toInteger(val);
    if(storedSettings.length > 3) {
      storedSettings = storedSettings.sublist(storedSettings.length - 2);
    }
    if(storedSettings == combination)
    {
      safe.makeLocked(nil);
      "As you turn the dial to <<val>>, a quiet click comes from <<safe.theName>>. ";
      if(!safe.hasBeenOpened) {
        addToScore(1, 'opening the safe');
      }
      safe.hasBeenOpened = true;
    } else {
      safe.makeLocked(true);
    }
  }
;

