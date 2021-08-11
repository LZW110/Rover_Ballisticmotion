
!*****************************************************************************
!
! RK4 TAKES ONE RUNGE-KUTTA STEP.
!
!  DISCUSSION:
!
!    IT IS ASSUMED THAT AN INITIAL VALUE PROBLEM, OF THE FORM
!
!      DU/DT = F ( T, U )
!      U(T0) = U0
!*****************************************************************************

	SUBROUTINE RK4(DIM,T0,U0,DT,F,U1,force,torque)
   
	IMPLICIT NONE

	EXTERNAL F

	INTEGER :: DIM
	DOUBLE PRECISION :: T0, U0(DIM), DT, U1(DIM),force(3),torque(3)
	DOUBLE PRECISION :: F1(DIM), F2(DIM), F3(DIM), F4(DIM)

	CALL F(T0,            U0,               F1, force, torque)
	CALL F(T0+DT/2.0D+00, U0+DT*F1/2.0D+00, F2, force, torque)
	CALL F(T0+DT/2.0D+00, U0+DT*F2/2.0D+00, F3, force, torque)
	CALL F(T0+DT,         U0+DT*F3,         F4, force, torque)

	U1=U0+DT*(F1+2.0D0*F2+2.0D0*F3+F4)/6.0D0
    
	RETURN

	END SUBROUTINE RK4

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
! CRK4 TAKES ONE RUNGE-KUTTA STEP.
!
!  DISCUSSION:
!
!    IT IS ASSUMED THAT AN INITIAL VALUE PROBLEM, OF THE FORM
!
!      DU/DT = F ( T, U )
!      U(T0) = U0
!  变步长龙格库塔
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    SUBROUTINE CRK4(DIM,ABSTOL,T0,U0,DT,F,U1,force,torque,DTT,cbn,outval)

	EXTERNAL F
	INTEGER:: DIM,P21,I,J,K
	DOUBLE PRECISION :: T0, T1,T2,DTT,U0(DIM), DT, U1(DIM),U2(DIM),force(3),torque(3),ABSTOL
	DOUBLE PRECISION :: F1(DIM), F2(DIM), F3(DIM), F4(DIM),TMP1,TMP2,TMP3
	DOUBLE PRECISION :: cbn(3,3),outval(25)

	P21=15D0
	I=1D0
	J=1D0
	K=1D0
 	CALL RK4(DIM,T0,U0,DT,F,U1,force,torque)
	T1=T0+DT
    CALL RK4(DIM,T0,U0,DT*0.5,F,U2,force,torque)
	T2=T0+DT*0.5
    
	TMP1=ABS(U1(1)-U2(1))
	DO I=1,3
	   IF(ABS(U1(I)-U2(I)).GT.TMP1) THEN
		 TMP1=ABS(U1(I)-U2(I))
	   END IF
	END DO
    IF (TMP1<ABSTOL) THEN
	   DTT=DT
	   DO WHILE(TMP1<ABSTOL)
	      T2=T1
		  U2=U1
		  DTT=DTT*2
		  CALL RK4(DIM,T0,U0,DTT,F,U1,force,torque)
		  T1=DTT+T0
          TMP1=ABS(U1(1)-U2(1))
	      DO J=1,3
	        IF(ABS(U1(J)-U2(J)).GT.TMP1) THEN
		      TMP1=ABS(U1(J)-U2(J))
		    END IF
	      END DO
	   END DO
	ELSE
	   DTT=DT/2
	   DO WHILE(TMP1>=ABSTOL)
	      T1=T2
		  U1=U2
          DTT=DTT/2
		  CALL RK4(DIM,T0,U0,DTT,F,U2,force,torque)
		  T2=DTT+T0
          TMP1=ABS(U1(1)-U2(1))
	      DO K=1,3
	         IF(ABS(U1(K)-U2(K)).GT.TMP1) THEN
		      TMP1=ABS(U1(K)-U2(K))
		     END IF
	      END DO
	   END DO
	END IF

	CALL RK4(DIM,T0,U0,DTT,F,U1,force,torque)
!CALL RK4(DIM,T0,U0,DT,F,U1,force,torque)
!	CALL B2N(U1(10:13),cbn)
!	write(*,*) torque
	U1(10:13)=U1(10:13)/SQRT(DOT_PRODUCT(U1(10:13),U1(10:13)))
	CALL B2N(U1(10:13),cbn)
	CALL Q2W(U1(10:13),cbn)

	!T0=T0+DT
	RETURN  

	END SUBROUTINE CRK4
!*****************************************************************************
!
! GETDT: ESTIMATE RUNGE-KUTTA TIME STEP.
!
!*****************************************************************************


	SUBROUTINE GETDT()

	USE GLOBAL

	IMPLICIT NONE

	DOUBLE PRECISION :: ACC

	ACC=ABS(4.0D0*PI/3.0D0*KAPPA-4.0D0*PI**2.0D0)
	DT=SQRT(2.0D0*RESO_H/ACC)/RESO_N

	RETURN

	END SUBROUTINE GETDT





