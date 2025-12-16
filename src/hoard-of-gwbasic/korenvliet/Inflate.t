#charset "us-ascii"

/*
 * Korenvliet is copyright 2016 by Alexander van Oostenrijk. All rights are reserved.
 * You may use, distribute and modify this code under the terms of the GPL license, a
 * copy of which should accompany this file. 
 * If not, please visit http://www.gnu.org/licenses/gpl-3.0.en.html.
 */

#include <adv3.h>
#include <en_us.h>

/*
 *   New action: inflate
 */
DefineTAction(Inflate);
VerbRule(Inflate)
  ('inflate' | 'blow up') singleDobj
  : InflateAction
  verbPhrase = 'inflate/inflating (what)'
;

modify Thing
  dobjFor(Inflate)
  {
    preCond = [touchObj]
    verify() { illogical(cannotInflateMsg); }
  }
  cannotInflateMsg = '{That dobj/he} {is} not something {you/he} can inflate. '
;

/*
 *   New action: deflate
 */
DefineTAction(Deflate);
VerbRule(Deflate)
  ('deflate') singleDobj
  : DeflateAction
  verbPhrase = 'deflate/deflating (what)'
;

modify Thing
  dobjFor(Deflate)
  {
    preCond = [touchObj]
    verify() { illogical(cannotDeflateMsg); }
  }
  cannotDeflateMsg = '{That dobj/he} {is} not something {you/he} can deflate. '
;
