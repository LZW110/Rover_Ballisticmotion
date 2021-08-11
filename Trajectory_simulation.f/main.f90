
  !    program Console1
 
      implicit none



!	   external :: func_add_c
 

!	  call func_add_c()

	  INTERFACE
     SUBROUTINE freemem (A)
      !DEC$ ATTRIBUTES C, ALIAS:'_pcm_freemem' :: freemem
      integer A
     END SUBROUTINE freemem
    END INTERFACE


	  INTERFACE
     SUBROUTINE calcont (id,Jr,r_EF,WINI, v_EF, force, torque, outval,err)
      !DEC$ ATTRIBUTES C, ALIAS:'_pcm_calcont' :: calcont
      integer id,err
	  real(8) Jr(3,3),r_EF(3), v_EF(3), WINI(3),force(3), torque(3), outval(25)
     END SUBROUTINE calcont
    END INTERFACE

	INTERFACE
	SUBROUTINE defcont (dcnt,rr)
 !    SUBROUTINE defcont (  ask , oade,oadf,inde,indf,fe,ff,pare,parf,enmx,mode,modf,rate,ratf,depe,depf,dmod,dcmp,dexp,tmod,tdpt,roce,rvel,dcnt,rr,nname,nfncse,nfncsf)
      !DEC$ ATTRIBUTES C, ALIAS:'_defcont' :: defcont
     ! integer ask, oade,oadf,inde,indf,dmod,tmod,dcnt,rr,nname,nfncse,nfncsf
	   integer dcnt,rr
!	  real(8) fe,ff,pare,parf,enmx,mode,modf,rate,ratf,depe,depf,dcmp,dexp,tdpt,roce,rvel
     END SUBROUTINE defcont
    END INTERFACE

	 ! INTEGER :: A 
   !   INTEGER :: B 
    !  INTEGER :: C 

 !     A=1

!	  B=3
!	  C=2
      integer A,B,C, VVA,VB,VC
!	                   integer ::  nname=5 
  !               integer ::  nfncse=200
 !                integer  :: nfncsf=200 
	  
	  POINTER (p, VVA)
	  POINTER (q, VB)
      POINTER (r, VC) ! VAR is the pointer-based
!      POINTER (s, Vd)                 ! variable, p is the int.
    


     
	real(8) :: Jr(3,3) = (/0.0358D0, 0.0D0, 0.0D0, 0.0D0, 0.0358D0, 0.0D0, 0.0D0, 0.0D0, 0.0358D0/)  !	×ª¶¯¹ßÁ¿¾ØÕó
	real(8) :: r_EF(3)=(/0.02656D0,    -0.05717D0,     0.02962D0/)	 
	real(8) :: v_EF(3)=(/0.20830D+00, 0.1060510D+00, -0.06760308D+00/)	   
	real(8) :: WINI(3)=(/2.0D0,1.0D0,3.0D0/)
	    real(8) :: force(3), torque(3), outval(25)
!	  A=3
   !   B=2
    !  C=0



      p = LOC(A)
	  q=LOC(B)
	  r = LOC(C)
!	  s= LOC(d)
 !    print *,A
     
!	   print *,A
!	  call add(q,r,s)
      call defcont(q,r)
	  print *,b
      print *,c
	  call calcont(q,Jr,r_EF,WINI, v_EF, force, torque, outval,r)
	  print *,outval
	  print *,force
	  print *,v_EF
      CALL freemem(p)
	  !	  B=B+1
	   print *,outval
      print *,force
	  print *,v_EF
	  print *,c
!      print *,a
	  print *,b
 
      end
