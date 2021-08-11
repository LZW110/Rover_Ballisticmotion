!****************************************************************************
!
!	PROGRAM: 
!
!	PURPOSE: 
!
!****************************************************************************

	PROGRAM SURFMOTO
    USE GLOBAL
	IMPLICIT NONE
    
	WRITE(*,*) "LOADING NUMBERS ..."
	CALL LOADNUMS

	WRITE(*,*) "LOADING SURFACE VARIANTS ..."
	CALL LOADSVAR

	WRITE(*,*) "LOADING GRAVITY VARIANTS ..."
	CALL LOADGVAR
	
    WRITE(*,*) "ESTIMATING VALUE OF DELTA TIME ..."
    CALL GETDT

	WRITE(*,*) "SOLVING MOTION EQUATIONS ..."
!	CALL ODESLVR

    call CPU_TIME(TIMEBEGIN)

	CALL TRJCAL

!	WRITE(*,*) "CENERATING GLOBAL PATH IN XYZ ..."
!	CALL GLPATH

	WRITE(*,*) "FINISHED!"

	call CPU_TIME(TIMEEND)
	WRITE(*,*) "CPU_TIME:"
	write(*,*) TIMEEND-TIMEBEGIN

	END PROGRAM SURFMOTO

	
	
	
