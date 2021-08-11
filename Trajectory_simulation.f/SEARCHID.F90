!****************************************************************************
!
!  SUBROUTINE SEARCHID: 
!
!****************************************************************************

	SUBROUTINE SEARCHID1(FPT,IDCF)

	USE GLOBAL
	
	IMPLICIT NONE

	INTEGER :: I,J,IDCF
	DOUBLE PRECISION :: FPT(3)
	DOUBLE PRECISION :: V0(3),V1(3),V2(3),V3(3),V4(3)
	DOUBLE PRECISION :: DET0,DET1,DET2,DET3,DET4
	DOUBLE PRECISION :: A0(4,4),A1(4,4),A2(4,4),A3(4,4),A4(4,4)
	
	FPT=0.8*FPT
	IDCF=1
	V1=(/0,0,0/)


	DO I=1,N_F
		V2=VS(FS(I,1),:)
		V3=VS(FS(I,2),:)
		V4=VS(FS(I,3),:)

		A0(1,:)=(/V1(1),V1(2),V1(3),1.0D0/)
		A0(2,:)=(/V2(1),V2(2),V2(3),1.0D0/)
		A0(3,:)=(/V3(1),V3(2),V3(3),1.0D0/)
		A0(4,:)=(/V4(1),V4(2),V4(3),1.0D0/)
		CALL BSDET(A0,4,DET0)

		A1(1,:)=(/FPT(1),FPT(2),FPT(3),1.0D0/)
		A1(2,:)=(/V2(1),V2(2),V2(3),1.0D0/)
		A1(3,:)=(/V3(1),V3(2),V3(3),1.0D0/)
		A1(4,:)=(/V4(1),V4(2),V4(3),1.0D0/)
		CALL BSDET(A1,4,DET1)

		A2(1,:)=(/V1(1),V1(2),V1(3),1.0D0/)
		A2(2,:)=(/FPT(1),FPT(2),FPT(3),1.0D0/)
		A2(3,:)=(/V3(1),V3(2),V3(3),1.0D0/)
		A2(4,:)=(/V4(1),V4(2),V4(3),1.0D0/)
		CALL BSDET(A2,4,DET2)

		A3(1,:)=(/V1(1),V1(2),V1(3),1.0D0/)
		A3(2,:)=(/V2(1),V2(2),V2(3),1.0D0/)
		A3(3,:)=(/FPT(1),FPT(2),FPT(3),1.0D0/)
		A3(4,:)=(/V4(1),V4(2),V4(3),1.0D0/)
		CALL BSDET(A3,4,DET3)

		A4(1,:)=(/V1(1),V1(2),V1(3),1.0D0/)
		A4(2,:)=(/V2(1),V2(2),V2(3),1.0D0/)
		A4(3,:)=(/V3(1),V3(2),V3(3),1.0D0/)
		A4(4,:)=(/FPT(1),FPT(2),FPT(3),1.0D0/)
		CALL BSDET(A4,4,DET4)

		IF((DET0.GE.0).AND.(DET1.GE.0).AND.(DET2.GE.0).AND.(DET3.GE.0).AND.(DET4.GE.0)) THEN
			IDCF=I
			ELSE IF ((DET0.LE.0).AND.(DET1.LE.0).AND.(DET2.LE.0).AND.(DET3.LE.0).AND.(DET4.LE.0)) THEN
			IDCF=I
		END IF

      
	END DO
	
 FPT=FPT/0.8
331	RETURN

	END SUBROUTINE SEARCHID1

!****************************************************************************
!
!  SUBROUTINE SEARCHID2: 
!
!****************************************************************************

	SUBROUTINE SEARCHID2(IDCF,OX,IDC)

	USE GLOBAL
	
	IMPLICIT NONE

	INTEGER :: IDCF,IDC(2)
	DOUBLE PRECISION :: UV_TEST1(2),UV_TEST2(2),UV_TEST3(2)
	DOUBLE PRECISION :: OX(6)
	
		A=SMTH(IDCF,ODR(:,1),:)
		CALL ORBLOCO(OX(1:3),UV_TEST1)
		A=SMTH(IDCF,ODR(:,2),:)
		CALL ORBLOCO(OX(1:3),UV_TEST2)
		A=SMTH(IDCF,ODR(:,3),:)
		CALL ORBLOCO(OX(1:3),UV_TEST3)
		IDC(1)=IDCF
		IF((UV_TEST1(1).GE.0).AND.(UV_TEST1(2).GE.0)) THEN
			IDC(2)=1
			ELSE IF((UV_TEST2(1).GE.0).AND.(UV_TEST2(2).GE.0)) THEN
			IDC(2)=2
			ELSE IF((UV_TEST3(1).GE.0).AND.(UV_TEST3(2).GE.0)) THEN
			IDC(2)=3
		END IF            
		
	RETURN                                             !寻找每次碰撞时的局部坐标

	END SUBROUTINE SEARCHID2