!******************************************************************
!
!	SUBROUTINE LOADSVAR: LOAD THE SURFACE INTERPOLATION PARAMETERS
!
!******************************************************************

	SUBROUTINE LOADSVAR

	USE GLOBAL

	IMPLICIT NONE

	INTEGER :: I, J,KK
	INTEGER :: TMP1(6)
	DOUBLE PRECISION :: TMP2(93)

!	ALLOCATE(SMTH(N_F,31,3))
	ALLOCATE(SECS(N_F,3,2))

!	OPEN(UNIT=53, FILE='SMTH.TXT', STATUS='OLD')
!	KK=0D0
	!WRITE(*,*) N_F
!	DO I=1,N_F
!	  READ(53,*) TMP2
   !   IF(I==2457D0) THEN
!	  WRITE(*,*) TMP2
!	  END IF
!	  DO J=1,31
!	  	SMTH(I,J,:)=TMP2(3*(J-1)+1:3*J)
!	  END DO
!	  KK=KK+1D0
!WRITE(*,*) KK
!	END DO

!	CLOSE(53)

	OPEN(UNIT=55, FILE='SECS.TXT', STATUS='OLD')

	DO I=1,N_F

	  READ(55,*) TMP1

	  DO J=1,3
	    SECS(I,J,:)=TMP1(2*(J-1)+1:2*J)
	  END DO

	END DO

	CLOSE(55)

	RETURN

	END SUBROUTINE LOADSVAR

!******************************************************************
!
!	SUBROUTINE LOADGVAR: LOAD THE GRAVITATIONAL FIELD PARAMETERS
!
!******************************************************************

	SUBROUTINE LOADGVAR

	USE GLOBAL

	IMPLICIT NONE

	INTEGER :: I

	ALLOCATE(VS(N_V,3))
	ALLOCATE(FS(N_F,3))
	ALLOCATE(ES(N_E,4))
	ALLOCATE(LES(N_E))
	ALLOCATE(NES(N_E,6))
	ALLOCATE(NFS(N_F,3))

	OPEN(UNIT=61, FILE='VS.TXT', STATUS='OLD')
	DO I=1,N_V
	   READ(61,*) VS(I,:)
	END DO
	CLOSE(61)
	
	OPEN(UNIT=62, FILE='ES.TXT', STATUS='OLD')
	OPEN(UNIT=65, FILE='LES.TXT', STATUS='OLD')
	OPEN(UNIT=67, FILE='NES.TXT', STATUS='OLD')
	DO I=1,N_E
	   READ(62,*) ES(I,:)
	   READ(65,*) LES(I)
	   READ(67,*) NES(I,:)
	END DO
	CLOSE(62)
	CLOSE(65)
	CLOSE(67)

	OPEN(UNIT=63, FILE='FS.TXT', STATUS='OLD')
	OPEN(UNIT=68, FILE='NFS.TXT', STATUS='OLD')
	DO I=1,N_F
	   READ(63,*) FS(I,:)
	   READ(68,*) NFS(I,:)	   
	END DO
	CLOSE(63)
	CLOSE(68)

	RETURN

	END SUBROUTINE LOADGVAR

!******************************************************************
!
!	SUBROUTINE LOADNUMS: LOAD THE NUMBERS OF POLYHEDRON MODEL
!
!******************************************************************

	SUBROUTINE LOADNUMS

	USE GLOBAL

	IMPLICIT NONE

	OPEN(UNIT=60, FILE='NUMS.TXT', STATUS='OLD')
	READ(60,*) N_V, N_E, N_F
	CLOSE(60)

	RETURN

	END SUBROUTINE LOADNUMS