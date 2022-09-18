500 REM    X,Y,Z OF THE SUN
501 REM    (EQUINOX 1950.0)
502 REM
503 INPUT "J,F ";J,F
504 J8=J-2415020: R1=3.14159265/180
505 T=(J8+F)/36525
506 P0=1.396041+0.000308*(T+0.5)
507 P0=P0*(T-0.499998)
508 A=100: GOSUB 529: G0=A+358.475833
509 L0=A+279.696678-P0
510 A=1336: GOSUB 529  
511 C0=A+270.434164-P0
512 A=162: GOSUB 529  
513 V0=A+212.603219
514 A=53: GOSUB 529: M0=A+319.529425
515 A=8: GOSUB 529: J0=A+225.444651
516 G=G0+T*(-0.950250-0.000150*T)
517 C=C0+T*(307.883142-0.001133*T)
518 L=L0+T*(0.768920+0.000303*T)
519 V=V0+T*(197.803875+0.001286*T)
520 M=M0+T*(59.8585+0.000181*T)
521 J=J0+T*154.906654
522 G=G*R1: C=C*R1: L=L*R1
523 V=V*R1: M=M*R1: J=J*R1
524 GOSUB 532  
525 PRINT "X: ";X
526 PRINT "Y: ";Y
527 PRINT "Z: ";Z
528 END
529 REM   NORMALIZATION
530 A=360*(A*T-INT(A*T)): RETURN
531 REM
532 X=0.000011*COS(2*G-L-2*J)
533 X=X+0.000011*COS(2*G+L-2*V)
534 X=X-0.000012*COS(G+L-V)
535 X=X-0.000012*COS(4*G-L-8*M+3*J)
536 X=X+0.000012*COS(4*G+L-8*M+3*J)
537 X=X-0.000014*COS(C-2*L)
538 X=X+0.000017*COS(C)
539 X=X+0.000018*SIN(2*G+L-2*V)
540 X=X-0.000021*T*COS(G+L)
541 X=X-0.000026*SIN(G-L-J)
542 X=X+0.000035*COS(2*G-L)
543 X=X+0.000063*T*COS(G-L)
544 X=X+0.000105*COS(2*G+L)
545 X=X+0.008374*COS(G+L)
546 X=X-0.025127*COS(G-L)
547 X=X+0.999860*COS(L)
548 REM
549 Y=0.000010*SIN(2*G+L-2*V)
550 Y=Y-0.000010*SIN(2*G-L-2*J)
551 Y=Y-0.000011*SIN(G+L-V)
552 Y=Y+0.000011*SIN(4*G-L-8*M+3*J)
553 Y=Y+0.000011*SIN(4*G+L-8*M+3*J)
554 Y=Y+0.000013*SIN(C-2*L)
555 Y=Y+0.000016*SIN(C)
556 Y=Y-0.000017*COS(2*G+L-2*V)
557 Y=Y-0.000019*T*SIN(G+L)
558 Y=Y-0.000024*COS(G-L-J)
559 Y=Y-0.000032*SIN(2*G-L)
560 Y=Y-0.000057*T*SIN(G-L)
561 Y=Y+0.000097*SIN(2*G+L)
562 Y=Y+0.007683*SIN(G+L)
563 Y=Y+0.023053*SIN(G-L)
564 Y=Y+0.917308*SIN(L)
565 REM
566 Z=-0.000010*COS(G-L-J)
567 Z=Z-0.000014*SIN(2*G-L)
568 Z=Z-0.000025*T*SIN(G-L)
569 Z=Z+0.000042*SIN(2*G+L)
570 Z=Z+0.003332*SIN(G+L)
571 Z=Z+0.009998*SIN(G-L)
572 Z=Z+0.397825*SIN(L)
573 RETURN
575 REM  ------------------------
576 REM  APPEARED IN ASTRONOMICAL
577 REM  COMPUTING, SKY & TELE-
578 REM  SCOPE, NOVEMBER, 1985
579 REM  ------------------------
