!****************************************************************************
!
!  SUBROUTINE ORBODE: 
!
!****************************************************************************

	SUBROUTINE ORBODE(T, Y, YP,force)

	USE GLOBAL

	IMPLICIT NONE


	DOUBLE PRECISION :: T, Y(6), YP(6),force(3)
	DOUBLE PRECISION :: GF(3), TMP1(3), TMP2(3)

	CALL CALGF(Y(1:3),GF)
	CALL CROSS(OMG,Y(1:3),TMP1)
	CALL CROSS(OMG,TMP1,TMP2)
	CALL CROSS(OMG,Y(4:6),TMP1)

	YP(1:3)=Y(4:6)
	YP(4:6)=KAPPA*GF-TMP1*2.0D0-TMP2

    WRITE(*,*) "SOLVING MOTION EQUATIONS ..."
	print *,force


	RETURN
	
	END SUBROUTINE ORBODE

!****************************************************************************
!
!  SUBROUTINE SURFODE: 
!	U=Y(1)	V=Y(2)	DU=Y(3)	DV=Y(4)
!
!****************************************************************************

	SUBROUTINE SURFODE(T,Y,YP)

	USE GLOBAL

	IMPLICIT NONE

	DOUBLE PRECISION :: T, Y(4), YP(4)
	DOUBLE PRECISION :: Q(3), QU(3), QV(3), QUU(3), QUV(3), QVV(3) 
	DOUBLE PRECISION :: GF(3), TMP1(3), TMP2(3), TMP3(3), TMP4(3), F(3), R1, R2
	DOUBLE PRECISION :: TMP5(3), NFC

	CALL QFUN(Y(1),Y(2),Q)
	CALL QUFUN(Y(1),Y(2),QU)
	CALL QVFUN(Y(1),Y(2),QV)
	CALL QUUFUN(Y(1),Y(2),QUU)
	CALL QUVFUN(Y(1),Y(2),QUV)
	CALL QVVFUN(Y(1),Y(2),QVV)

	CALL CALGF(Q,GF)
	CALL CROSS(OMG,Q,TMP1)
	CALL CROSS(OMG,TMP1,TMP2)

	TMP1=Y(3)*QU+Y(4)*QV
	CALL CROSS(OMG,TMP1,TMP3)
	TMP4=QUU*Y(3)**2.0D0+2.0D0*QUV*Y(3)*Y(4)+QVV*Y(4)**2.0D0
!	F=KAPPA*GF-TMP2-MU*TMP1-2.0D0*TMP3-TMP4

	CALL NFORCE(Y,NFC)

	TMP5 = 2.5D0*CRR*NFC*TMP1   !滚动摩擦阻力
	F=(KAPPA*GF-TMP2-MU*TMP1-2.0D0*TMP3-TMP4-TMP5)/MASS

	CALL LINSV(QU,QV,F,R1,R2)

	YP(1:2)=Y(3:4)		
	YP(3)=R1
	YP(4)=R2

	RETURN
	
	END SUBROUTINE SURFODE



!****************************************************************************
!
!  SUBROUTINE HORBODE: 接触时
!
!****************************************************************************

	SUBROUTINE HORBODE(T, Y, YP, force, torque)

	USE GLOBAL

	IMPLICIT NONE
    INTEGER::  L, I, J
	DOUBLE PRECISION :: T, Y(13), YP(13),force(3),torque(3),GF(3)
	DOUBLE PRECISION ::  TMP1(3), TMP2(3),Cbn(3,3), Cnb(3,3),TMP3(3),W(4,4),TMP4(4),TMP5(3),TMP6(3)

!	CALL CALGF(Y(1:3),GF)
	CALL CROSS(OMG,Y(1:3),TMP1)
	CALL CROSS(OMG,TMP1,TMP2)
	CALL CROSS(OMG,Y(4:6),TMP1)

	YP(1:3)=Y(4:6)
	YP(4:6)=KAPPA*gGF-TMP1*2.0D0-TMP2-force/MASS

	TMP1=MATMUL(Jr,Y(7:9))
	CALL CROSS(TMP1, Y(7:9), TMP2)
	TMP3=MATMUL(INV_Jr,TMP2)

	CALL B2N(Y(10:13),Cbn)
	Cnb=TRANSPOSE(Cbn)
	TMP5=MATMUL(Cnb,torque)
	TMP6=MATMUL(INV_Jr,TMP5)
	
	YP(7:9) = TMP3-TMP6

	DO I=1,4
		DO J=1,4
		W(I,J)=0
		END DO
	END DO

	W(1,2)=-Y(7)
	W(1,3)=-Y(8)
	W(1,4)=-Y(9)
	W(2,1)=Y(7)
	W(2,3)=Y(9)
	W(2,4)=-Y(8)
	W(3,1)=Y(8)
	W(3,2)=-Y(9)
	W(3,4)=Y(7)
	W(4,1)=Y(9)
	W(4,2)=Y(8)
	W(4,3)=-Y(7)

!	W(1,2)=Y(9)
!	W(1,3)=-Y(8)
!	W(1,4)=Y(7)
!	W(2,1)=-Y(9)
!	W(2,3)=Y(7)
!	W(2,4)=Y(8)
!	W(3,1)=Y(8)
!	W(3,2)=-Y(7)
!	W(3,4)=Y(9)
!	W(4,1)=-Y(7)
!	W(4,2)=-Y(8)
!	W(4,3)=-Y(9)

	TMP4=MATMUL(W,Y(10:13))
	YP(10:13)=0.5D0*TMP4

	RETURN
	
	END SUBROUTINE HORBODE



!****************************************************************************
!
!  SUBROUTINE HORBODE2: 不接触时
!
!****************************************************************************

	SUBROUTINE HORBODE2(T, Y, YP, force, torque)

	USE GLOBAL

	IMPLICIT NONE
    INTEGER::  L, I, J
	DOUBLE PRECISION :: T, Y(13), YP(13),force(3),torque(3),GF(3)
	DOUBLE PRECISION ::  TMP1(3), TMP2(3),Cbn(3,3), Cnb(3,3),TMP3(3),W(4,4),TMP4(4),TMP5(3),TMP6(3)
!WRITE(*,*)  "GGGGGG"
	CALL CALGF(Y(1:3),GF)
	!WRITE(*,*)  GF
	gGF=GF
	CALL CROSS(OMG,Y(1:3),TMP1)
	CALL CROSS(OMG,TMP1,TMP2)
	CALL CROSS(OMG,Y(4:6),TMP1)

	YP(1:3)=Y(4:6)
	YP(4:6)=KAPPA*GF-TMP1*2.0D0-TMP2


	TMP1=MATMUL(Jr,Y(7:9))
	CALL CROSS(TMP1, Y(7:9), TMP2)
	TMP3=MATMUL(INV_Jr,TMP2)

	CALL B2N(Y(10:13),Cbn)
	Cnb=TRANSPOSE(Cbn)
	TMP5=MATMUL(Cnb,torque)
	TMP6=MATMUL(INV_Jr,TMP5)
	
	YP(7:9) = TMP3

	DO I=1,4
		DO J=1,4
		W(I,J)=0
		END DO
	END DO

	W(1,2)=-Y(7)
	W(1,3)=-Y(8)
	W(1,4)=-Y(9)
	W(2,1)=Y(7)
	W(2,3)=Y(9)
	W(2,4)=-Y(8)
	W(3,1)=Y(8)
	W(3,2)=-Y(9)
	W(3,4)=Y(7)
	W(4,1)=Y(9)
	W(4,2)=Y(8)
	W(4,3)=-Y(7)

!	W(1,2)=Y(9)
!	W(1,3)=-Y(8)
!	W(1,4)=Y(7)
!	W(2,1)=-Y(9)
!	W(2,3)=Y(7)
!	W(2,4)=Y(8)
!	W(3,1)=Y(8)
!	W(3,2)=-Y(7)
!	W(3,4)=Y(9)
!	W(4,1)=-Y(7)
!	W(4,2)=-Y(8)
!	W(4,3)=-Y(9)

	TMP4=MATMUL(W,Y(10:13))
	YP(10:13)=0.5D0*TMP4

	RETURN
	
	END SUBROUTINE HORBODE2

