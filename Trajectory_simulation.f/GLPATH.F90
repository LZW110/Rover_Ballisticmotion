!****************************************************************************
!
!	SUBROUTINE GLPATH: GENERATING GLOBAL PATH
!
!****************************************************************************

	SUBROUTINE GLPATH()

	USE GLOBAL

	IMPLICIT NONE
	
	INTEGER :: MD,IDX(2)
	DOUBLE PRECISION :: TMP(13),T,GLX(3),UV(2),GPTH(3)
    character( len = 512 ) :: cFile

	OPEN(UNIT=315, FILE='MOTOLOG.TXT', STATUS='OLD')
!	READ(315,*,END=816) aa,F
    write( cFile , * ) O
	!OPEN(UNIT=316,FILE='GLPATH.TXT')
	cFile = 'GLPATH' // Trim(AdjustL(cFile)) // '.txt'
    Open( 316 , File = cFile )

!TIME,XYZ REAL PATH,XYZ GROUND PATH 		
	DO WHILE (1)
	  READ(315,*,END=816) TMP
	  MD=INT(TMP(1))
	!  T=TMP(7)
	T=TMP(2)
	GLX=TMP(3:5)
	 ! IDX=INT(TMP(2:3))
	  !ID=IDX
	 ! A=SMTH(ID(1),ODR(:,ID(2)),:)
	  !IF (MD.EQ.1) THEN
	   ! GLX=TMP(8:10)
		!CALL ORBLOCO(GLX,UV)
		!CALL QFUN(UV(1),UV(2),GPTH)		
		WRITE(316,"(7(F22.12))") T,GLX
	  !ELSE
	!	UV=TMP(5:6)
	!	CALL QFUN(TMP(5),TMP(6),GLX)
	!	WRITE(316,"(7(F22.12))") T,GLX
	 ! END IF
	END DO

816 CLOSE(315)
    CLOSE(316)

	RETURN

	END SUBROUTINE