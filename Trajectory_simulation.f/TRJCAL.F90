!****************************************************************************
!
!  SUBROUTINE TRJCAL: 
!
!****************************************************************************

	SUBROUTINE TRJCAL

	USE GLOBAL

	IMPLICIT NONE

	INTERFACE
     SUBROUTINE freemem (A)
      !DEC$ ATTRIBUTES C, ALIAS:'_pcm_freemem' :: freemem
      integer A
     END SUBROUTINE freemem
    END INTERFACE

    INTERFACE
     SUBROUTINE calcont (id,Jr,r_EF,WINI, v_EF, force, torque, outval,err,VBB,fa)
      !DEC$ ATTRIBUTES C, ALIAS:'_pcm_calcont' :: calcont
      integer id,err
	  real(8) Jr(3,3),r_EF(3), v_EF(3), WINI(3),force(3), torque(3), outval(25),VBB(2),fa(3),NEWfa(3)
     END SUBROUTINE calcont
    END INTERFACE

	INTERFACE
	SUBROUTINE defcont (dcnt,rr)
      !SUBROUTINE defcont (  ask , oade,oadf,inde,indf,fe,ff,pare,parf,enmx,mode,modf,rate,ratf,depe,depf,dmod,dcmp,dexp,tmod,tdpt,roce,rvel,dcnt,rr,nname,nfncse,nfncsf)
      !DEC$ ATTRIBUTES C, ALIAS:'_defcont' :: defcont
      !integer ask, oade,oadf,inde,indf,dmod,tmod,dcnt,rr,nname,nfncse,nfncsf
	   integer dcnt,rr
      !real(8) fe,ff,pare,parf,enmx,mode,modf,rate,ratf,depe,depf,dcmp,dexp,tdpt,roce,rvel
     END SUBROUTINE defcont
    END INTERFACE

	EXTERNAL  ORBODE,HORBODE,RES,HORBODE2,RES2

	INTEGER :: I, FFG , J, backflag, index, num, indexb, cflg,SHL,E_INDEX
	DOUBLE PRECISION :: T,TT
	DOUBLE PRECISION :: TMP(3), TMP1(3), TMP2(3), TMP3(3)
	DOUBLE PRECISION :: Cbn(3,3) , TCbn(3,3), TTCbn(3,3)
	DOUBLE PRECISION :: HX(13), HX1(13), DXT, HHX(13), VCC(2),NEWVCC(2),fa(3),NEWfa(3),HXBB(13)
	DOUBLE PRECISION :: HXB(13), VCB,HXP(13)
	DOUBLE PRECISION :: DELATV, JHX(13),INIRV(1000,6)
	DOUBLE PRECISION :: GF(3), GFN(3), GFM, HM, AL, ACC, VNN, NVR(3), VN(3),HHXP(13),FFORCE(3),TTORQUE(3),CHUSHU
	DOUBLE PRECISION :: TB, BTCBN(3,3), FORCEB(3), FTORQUE(3), VCBB
	DOUBLE PRECISION :: PE,ZE,YE,TOTAL_E,TME3(3),TME(1,3),TME1(1,3),TME2(3,1),EE,ENERGY_INDEX,Q_TOTAL_E

    INTEGER :: AA,B,C, VVA,VB,VC
	POINTER (p, VVA)
	POINTER (qq, VB)
    POINTER (r, VC) 
	REAL(8) :: force(3), torque(3), outval(25), ooutval(25),NEWoutval(25)
	CHARACTER( len = 20 ) :: cFile, namFile !zyl

      p = LOC(AA)
	  qq=LOC(B)
	  r = LOC(C)
      call defcont(qq,r)
	  !print *,B
      !print *,C

!-------------读入---------------------------------
	OPEN(UNIT=80, FILE='OUT_133P_2_8.TXT', STATUS='OLD')
	DO I=1,1000
		READ(80,*) INIRV(I,:)
	END DO
	CLOSE(80)
!----------------------------------------------------
		
!TIME INITIALIZATION
    DO J = 1,1
	SHL=0D0
	ENERGY_INDEX = 10000D0
	WRITE(*,*) J
	     
   
	VCB=0.0D0
	VCBB=10000D0
	FFG=0
    T=0.0D0
	backflag=0
	HX(1:6)=INIRV(J,1:6)    
    HX(1:6) = HX(1:6)*(1+0.010534/2/sqrt(dot_product(hx(1:6),hx(1:6))))

   ! HX(1:6)=(/0.0049943,0.97623,0.06984,&
  !                          0.0,    0.0,    0.0/)
	!HX(1:3)=(0.0105/SQRT(DOT_PRODUCT(HX(1:3),HX(1:3)))+1)*HX(1:3)
!WRITE(*,*)  HX(1:3)
!STOP
	HX(7:9)=WINI
	HX(10:13)=QINI
	index=0
	num=0
	cflg=0
  
	WRITE(cFile,'(I6)') J
	namFile = 'GLPATH' // Trim(AdjustL(cFile)) // '.TXT'
	Open( 316 , File = namFile )

    namFile = 'force' // Trim(AdjustL(cFile)) // '.TXT'
	Open( 318 , File = namFile )

    namFile = 'out' // Trim(AdjustL(cFile)) // '.TXT'   
	Open( 317 , File = namFile)


!INTEGRATION
	DO WHILE(1)

		CALL B2N(HX(10:13), Cbn)
		TCbn=TRANSPOSE(Cbn)
		ooutval=outval
		JHX=HX
		indexb=index
		num=num+1
		backflag=0

	   IF (outval(7)/=0) THEN
			 GOTO 125
	   ELSE
			IF(outval(2)/=0) THEN
				 VCC(1)=SQRT(DOT_PRODUCT(HX(4:6),HX(4:6)))
			END IF
	   END IF
!WRITE(*,*)  "KKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK"
125   CALL calcont(qq,TCbn,HX(1:3),HX(7:9), HX(4:6), force, torque, outval, r, VCC, fa)

	  CALL B2N(HX(10:13), Cbn)
	  TCbn=TRANSPOSE(Cbn)

		IF(outval(7)==0)  THEN
		   HXBB = HX
		   forceb = force
		   ftorque = torque
		   TB = T
		   BTCBN = TCbn
		END IF

      IF((outval(7).NE.0) .AND. (ooutval(7).EQ.0).AND.(backflag.EQ.0)) THEN	 
	  !!LZW
	    ! IF((outval(7).NE.0) .AND. (ooutval(7).EQ.0)) THEN	 
	        HXB = HXBB
	        VCC(1) = SQRT(DOT_PRODUCT(HXBB(4:6),HXBB(4:6)))
			VCB = VCC(1)*0.50
			FFG=1
			HHX = HXBB
			TT = TB
			TTCBN = BTCBN
			FFORCE = FORCEB
			TTORQUE = FTORQUE
	  END IF

	  IF(backflag.EQ.1) THEN
			ooutval=outval
			JHX=HX
	  ELSE
			chushu=1.0D0
	  END IF


!------------------判断是否折回去重算------------------------
	IF(outval(9).GT.pmax) THEN
		 IF (ooutval(9).EQ.0) THEN
			  backflag=1
			  T=TT
			  HX=HHX
			  HXP=HHXP
			  TCbn=TTCbn
			  force=fforce
			  torque=ttorque
			  chushu=chushu*10.0
			  CALL RK4(13,T,HX,DT/1000/chushu,HORBODE,HX1,force,torque)

			  T = T+DT/1000/chushu
			  HX = HX1
			  HX(10:13)=HX(10:13)/SQRT(DOT_PRODUCT(HX(10:13),HX(10:13)))
			  CALL B2N(HX(10:13), Cbn)
			  TCbn=TRANSPOSE(Cbn)
			  GOTO 125
		 ELSE
			  backflag=0
		 END IF
	END IF
!-------------------------------------------------------------------------------------


	  gforce=force
	  gtorque=torque

    IF(outval(1).LT.100) THEN
		cflg=0
		force = (/0.0D0, 0.0D0, 0.0D0/)
		torque = force		
		CALL RK4(13,T,HX,DT,HORBODE2,HX1,force,torque)
		T = T+DT
	    HX = HX1

		HX(10:13)=HX(10:13)/SQRT(DOT_PRODUCT(HX(10:13),HX(10:13)))
	ELSE 				
	    IF(outval(7)==0) THEN
		  CALL RK4(13,T,HX,DT/100,HORBODE2,HX1,force,torque)
		  T = T+DT/100
	      HX = HX1
		  HX(10:13)=HX(10:13)/SQRT(DOT_PRODUCT(HX(10:13),HX(10:13)))
	    ELSE
		  CALL RK4(13,T,HX,DT/5000/(EDGE*10),HORBODE,HX1,force,torque)
		  CALL B2N(HX(10:13), Cbn)

		  T = T+DT/5000/(EDGE*10)
	      HX = HX1
		  HX(10:13)=HX(10:13)/SQRT(DOT_PRODUCT(HX(10:13),HX(10:13)))
		END IF
		cflg=1
	END IF 

       
       !DELATV  = DOT_PRODUCT(JHX(4:6), JHX(4:6))-DOT_PRODUCT(HX(4:6), HX(4:6))
	   !DELATV = DOT_PRODUCT(HX(4:6), outval(23:25))
 
	   DELATV = outval(9)-ooutval(9)
	! IF((FFG.EQ.1).AND.(DELATV.LT.0))   THEN
	  ! IF ((SQRT(DOT_PRODUCT(HX(4:6),HX(4:6))).GE.VCB).AND.(FFG.EQ.1).AND.(DELATV.LT.0)) THEN
	   !!LZW
	   IF((FFG.EQ.1).AND.((outval(6)-0).LT.1D-8).AND.(OOUTVAL(6)/=0).OR.((FFG.EQ.1).AND.(DELATV.LT.0).AND.(SQRT(DOT_PRODUCT(HX(4:6),HX(4:6)))>VCB)))  THEN
       !IF (((FFG.EQ.1).AND.(ABS(outval(6)-1).LT.1D-8).AND.(ABS(ooutval(6)-2).LT.1D-8)).OR.((FFG.EQ.1).AND.(ABS(outval(6)-0).LT.1D-8).AND.(ABS(ooutval(6)-1).LT.1D-8))) THEN
		!	HX(1:3) = HXB(1:3)   !拉回碰撞前位置
		    HX(1:3)=HX(1:3)*1.00005D0
			HX(4:6) = VCB*HX(4:6)/SQRT(DOT_PRODUCT(HX(4:6),HX(4:6)))
			force = (/0.0D0, 0.0D0, 0.0D0/)
			torque = force
            CALL B2N(HX(10:13), Cbn)
 			TCbn=TRANSPOSE(Cbn)
			!!!!!!!!!!!!!!!!!!!!!!!!!!!!311
     !       NEWoutval=OUTVAL
	!	312	IF(NEWOUTVAL(7)==0.AND.NEWOUTVAL(2)/=0) THEN
	!		   NEWVCC(1)=SQRT(DOT_PRODUCT(HX(4:6),HX(4:6)))
	!		ELSE
	!		   NEWVCC(1)=VCC(1)
	!		END IF
	!		CALL calcont(qq,TCbn,HX(1:3),HX(7:9), HX(4:6), force, torque, NEWoutval, r, NEWVCC, NEWfa)
	!		IF(NEWoutval(7)/=0) THEN
	!		 HX(1:3)=HX(1:3)*1.000005D0
     !    !     !HX(4:6) = VCB*HX(4:6)/SQRT(DOT_PRODUCT(HX(4:6),HX(4:6)))
	!		 force = (/0.0D0, 0.0D0, 0.0D0/)
	!		torque = force
     !       CALL B2N(HX(10:13), Cbn)
 	 !  	TCbn=TRANSPOSE(Cbn)
	!		GOTO 312
	!		END IF
			!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!311
     !  END IF
			WRITE(*,*)  "---T----"
			WRITE(*,*)  T
			!WRITE(*,*)  "OUT"
			!WRITE(*,*)  OUTVAL(7)

			
            CALL CALGF(HX(1:3),GF)
			CALL CROSS(OMG,HX(1:3),TMP)
			CALL CROSS(OMG,TMP,TMP2)
	
		!	NVR = fa/SQRT(DOT_PRODUCT(fa,fa))   !outval(23:25)/SQRT(DOT_PRODUCT(outval(23:25),outval(23:25)))
		    NVR = -ooutval(23:25)
			TMP3=KAPPA*GF-TMP2

			VN=DOT_PRODUCT(NVR,HX(4:6))*NVR
			GFN=DOT_PRODUCT(NVR,TMP3)*NVR
			GFM=SQRT(DOT_PRODUCT(GFN,GFN))
			VNN=SQRT(DOT_PRODUCT(VN,VN))
			HM=VNN**2/GFM

			WRITE(*,*)  "---HX(4:6)---"
			WRITE(*,*)  SQRT(DOT_PRODUCT(HX(4:6),HX(4:6)))
		    WRITE(*,*) "---DELATV---"
	        WRITE(*,*) DELATV
			WRITE(*,*) "---VCBB---"
			WRITE(*,*) VCBB
			WRITE(*,*) "---VCB---"
			WRITE(*,*) VCB
			WRITE(*,*) "---HM---"
			WRITE(*,*) HM
	     	WRITE(*,*) "---FFG---"
			WRITE(*,*) FFG

			IF(VCB.LE.0.01D0) THEN
				WRITE(*,*) "1------STOP!"
				SHL=1
				PE = 0.5*MASS*(HX(4)**2+HX(5)**2+HX(6)**2)
ZE = 0.5*(HX(7)**2*Jr(1,1)+HX(8)**2*Jr(2,2)+HX(9)**2*Jr(3,3))
CALL CALPE(HX(1:3),EE)
CALL CROSS(OMG,HX(1:3),TME3)
YE = KAPPA*EE*MASS-0.5*DOT_PRODUCT(TME3,TME3)*MASS
TOTAL_E = YE+ZE+PE
				WRITE(316,172) SHL,index, T, HX(1:13)
					WRITE(317,"(19(E32.22))") outval(7:25)
						WRITE(318,"(7(E32.22))") force,PE,ZE,YE,TOTAL_E
				GOTO 419
			END IF

			!IF(HM.LE.0.00001D0) THEN
			IF(HM.LE.EDGE/2/LU)  THEN
				WRITE(*,*) "2------STOP!"
				SHL=2
				PE = 0.5*MASS*(HX(4)**2+HX(5)**2+HX(6)**2)
ZE = 0.5*(HX(7)**2*Jr(1,1)+HX(8)**2*Jr(2,2)+HX(9)**2*Jr(3,3))
CALL CALPE(HX(1:3),EE)
CALL CROSS(OMG,HX(1:3),TME3)
YE = KAPPA*EE*MASS-0.5*DOT_PRODUCT(TME3,TME3)*MASS
TOTAL_E = YE+ZE+PE
				WRITE(316,172) SHL,index, T, HX(1:13)
					WRITE(317,"(19(E32.22))") outval(7:25)
						WRITE(318,"(7(E32.22))") force,PE,ZE,YE,TOTAL_E
				GOTO 419
			END IF

			IF(VCBB<VCB) THEN
				WRITE(*,*) "3------STOP!"
				SHL=3
				PE = 0.5*MASS*(HX(4)**2+HX(5)**2+HX(6)**2)
ZE = 0.5*(HX(7)**2*Jr(1,1)+HX(8)**2*Jr(2,2)+HX(9)**2*Jr(3,3))
CALL CALPE(HX(1:3),EE)
CALL CROSS(OMG,HX(1:3),TME3)
YE = KAPPA*EE*MASS-0.5*DOT_PRODUCT(TME3,TME3)*MASS
TOTAL_E = YE+ZE+PE
				WRITE(316,172) SHL,index, T, HX(1:13)
					WRITE(317,"(19(E32.22))") outval(7:25)
						WRITE(318,"(7(E32.22))") force,PE,ZE,YE,TOTAL_E
				GOTO 419
			END IF

			 VCBB=VCB
			 index=index+1 
             FFG=0
	   END IF


       IF (SQRT(DOT_PRODUCT(HX(1:3),HX(1:3))).GT.ESR) THEN
		    WRITE(*,*) "------escape!"
			GOTO 419
		    !stop
	   END IF

!!!!!!!!!!!!!!!!!!!!!!能量
PE = 0.5*MASS*(HX(4)**2+HX(5)**2+HX(6)**2)
ZE = 0.5*(HX(7)**2*Jr(1,1)+HX(8)**2*Jr(2,2)+HX(9)**2*Jr(3,3))
CALL CALPE(HX(1:3),EE)
CALL CROSS(OMG,HX(1:3),TME3)
!YE = KAPPA*EE*MASS-0.5*DOT_PRODUCT(TME3,TME3)*MASS
YE = (KAPPA*EE-0.5*DOT_PRODUCT(TME3,TME3))*MASS
TOTAL_E = YE+ZE+PE
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
IF((SQRT(DOT_PRODUCT(FORCE,FORCE))-0)<1D-8)  THEN
  IF((TOTAL_E-ENERGY_INDEX)>1D-8)  THEN
  SHL = 4D0
  WRITE(*,*) "4------STOP!"
  	WRITE(316,172) SHL,index, T, HX(1:13)
			WRITE(317,"(19(E32.22))") outval(7:25)
			WRITE(318,"(7(E32.22))") force,PE,ZE,YE,TOTAL_E
    GOTO 419
  ELSE
     ENERGY_INDEX = TOTAL_E 
  END IF
END IF



	if((mod(num,3)==0.and.cflg==1).or.(index-indexb==1).or.(num==1)) then
		WRITE(316,172) SHL,index, T, HX(1:13)
			WRITE(317,"(19(E32.22))") outval(7:25)
			WRITE(318,"(7(E32.22))") force,PE,ZE,YE,TOTAL_E
	elseif(cflg==0.and.mod(num,300)==0) then
			WRITE(316,172) SHL,index, T, HX(1:13)
			WRITE(317,"(19(E32.22))") outval(7:25)
			WRITE(318,"(7(E32.22))") force,PE,ZE,YE,TOTAL_E
    elseif(ooutval(7)==0.and.outval(7)/=0) then
	      WRITE(316,172) SHL,index, T, HX(1:13)
			WRITE(317,"(19(E32.22))") outval(7:25)
			WRITE(318,"(7(E32.22))") force,PE,ZE,YE,TOTAL_E
	elseif(ooutval(7)/=0.and.outval(7)==0) then
	      WRITE(316,172) SHL,index, T, HX(1:13)
			WRITE(317,"(19(E32.22))") outval(7:25)
			WRITE(318,"(7(E32.22))") force,PE,ZE,YE,TOTAL_E
   end if 

	END DO
532			 call CPU_TIME(TIMEEND)
	         WRITE(*,*) "CPU_TIME:"
	         write(*,*) TIMEEND-TIMEBEGIN
419	CLOSE(316)
	CLOSE(317)

END DO

172 FORMAT(I8,' ',I8,' ',E22.12,' ',E22.12,' ',E22.12,' ',E22.12,' ',E22.12,' ',E22.12,' ',E22.12,' ',&
			E22.12,' ',E22.12,' ',E22.12,' ',E22.12,' ',E22.12,' ',E22.12,' ',E22.12)

	RETURN

	END SUBROUTINE TRJCAL

!*****************************************************************************
!
! RES:接触
!
!*****************************************************************************
      SUBROUTINE RES(T,Y,YPRIME,CJ,DELTA,IRES,RPAR,IPAR)

	  USE GLOBAL

	  DOUBLE PRECISION :: T, Y(13), YPRIME(13), YP(13), CJ, DELTA(13), RPAR
	  INTEGER :: IRES, IPAR

	  CALL HORBODE(T, Y, YP, gforce, gtorque)

      DO I = 1,13
            DELTA(I) = YPRIME(I) - YP(I)
      END DO

      RETURN

      END SUBROUTINE RES


!*****************************************************************************
!
! RES2:不接触
!
!*****************************************************************************
      SUBROUTINE RES2(T,Y,YPRIME,CJ,DELTA,IRES,RPAR,IPAR)

	  USE GLOBAL

	  DOUBLE PRECISION :: T, Y(13), YPRIME(13), YP(13), CJ, DELTA(13), RPAR
	  INTEGER :: IRES, IPAR

	  CALL HORBODE2(T, Y, YP, gforce, gtorque)

      DO I = 1,13
            DELTA(I) = YPRIME(I) - YP(I)
      END DO

      RETURN

      END SUBROUTINE RES2





