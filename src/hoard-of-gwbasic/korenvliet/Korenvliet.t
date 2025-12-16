#charset "us-ascii"

/*
 * Korenvliet is copyright 2016 by Alexander van Oostenrijk. All rights are reserved.
 * You may use, distribute and modify this code under the terms of the GPL license, a
 * copy of which should accompany this file. 
 * If not, please visit http://www.gnu.org/licenses/gpl-3.0.en.html.
 */

#include <adv3.h>
#include <en_us.h>

versionInfo: GameID
  IFID = '566d7c14-014b-4cb2-84d6-ad2670a352b4'
  name = 'Korenvliet'
  byline = 'by Independent Software (www.independent-software.com)'
  htmlByline = 'by <a href="mailto:info@independent-software.com">Independent Software</a>'
  version = '1.2'
  authorEmail = 'Independent Software <info@independent-software.com>'
  desc = '"You were recently informed that your eccentric uncle Wout had passed away. 
    There is a persistent rumor that the old crackpot left the Korenvliet estate
    to whomever manages to locate his will.\b\bYou\'ve dutifully travelled down 
    to the village where the estate is located to start your search of the grounds.\b\b
    This game is based on the original <i>korenvl.bas</i> GW-BASIC programme, whose
    author is unknown.'
  
  showAbout() {
    "Korenvliet is an introductory-level interactive fiction. It isn't a very long game,
    and its puzzles are reasonably simple.\b
    Korenvliet is copyright 2016 by Alexander van Oostenrijk of Independent Software. It
    was created using TADS 3, a free text-adventure development language.\b";
  }
  
  showCredit() {
    "This game is based on the original <i>korenvl.bas</i> GW-BASIC programme, whose
    author is unknown. This improved implementation is the work of Independent
    Software (www.independent-software.com).\b
    While faithful to the original, some puzzles have been made clearer and hints
    were sprinkled throughout the game. The original version had no room or item
    descriptions. ";
  }
;

gameMain: GameMainDef
  initialPlayerChar = me
  maxScore = 8
  
  showIntro()
  {
    "<b>KORENVLIET</b>\n
    A short adventure by Alexander van Oostenrijk @ Independent Software (www.independent-software.com), 
    based on the original <i>korenvl.bas</i> (author unknown).\n
    Copyright 2016.\n
    First-time players should type \"about\".\n
    Version <<versionInfo.version>>\b
    
    You were recently informed that your eccentric uncle Wout had passed away. 
    There is a persistent rumor that the old crackpot left the Korenvliet estate
    to whomever manages to locate his will - even you, his least favorite nephew.\b\b
    Today, you've dutifully travelled down to the village where the estate is 
    located to start your search of the grounds.\b";
  }
  
  setAboutBox()
  {
    "<ABOUTBOX><CENTER>
    <b><<versionInfo.name>></b>\b
    Version <<versionInfo.version>>\b
    <<versionInfo.byline>>
    </CENTER></ABOUTBOX>";
  }  
;
    
+ me: Actor
  location = mainStreet
  isFat = true
;


