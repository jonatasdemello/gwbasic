
                                3D-EXP

                          By Rich Geldreich

                            May 22nd, 1992
                            

	3D-EXP  is  a  little   QuickBASIC  4.5  wireframe  program  I
developed to show people that,  yes,  it is possible to  produce  some
cool 3-D animation in a high level language(in this case, QuickBASIC).
Try it out(compiled).  I'm sure you'll like it.
	
	So how did you get it so fast, you ask?  Easy.  Just don't use
any  floating point math!!   That's the secret.   Integer only math is
MUCH quicker than floating point math...  This program is an excellent
example.   One thing of interest:  Did you know that the "/" divide is
actually a floating point  divide(even  if you are dividing integers)?
Use the "\" divide symbol whenever you don't need a decimal  answer...

	The  program  is  documented,   so I'm not going to explain it
here.  Have fun- it's public domain.  Just don't distribute a modified
version of it unless you also put your name on it too. Thanks.


	Integer   math   is   actually  very  easy(if  you  understand
fractions).   Lets say you want to  multiply a number by .8 The normal
code to do this would be:

	B% = A% * .8
	
	That's okay... but there's a much quicker way. Why not this:
	
	B% = (A% * 8) \ 10
	
	At first this statement looks slower because it has  an  extra
divide. It's not- it's actually MUCH quicker. Why? 

	The  ".8"  in  the  first  statement  invokes  an  ultra slow,
mediocre floating point multiply.   The second  statement,   which  is
actually:

	B% =  8 * A&
	     --------
	        10
	
	does not. Clear as mud, right? Have fun figuring out this one...
	

	If you have any questions or ideas, write/call:
	

	Rich Geldreich
	410 Market St.
	Gloucester City, NJ 08030
	(609)-742-8752
	
	
