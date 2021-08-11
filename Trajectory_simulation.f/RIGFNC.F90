!****************************************************************************
!
!  SUBROUTINE B2N: 将四元数转换为姿态旋转矩阵（探测器本体系至小天体本体系）
!
!****************************************************************************

    SUBROUTINE B2N(Q, Cbn)

	IMPLICIT NONE

	DOUBLE PRECISION :: Q(4), Cbn(3,3)

	Cbn(1,1) = Q(1)**2 + Q(2)**2 - Q(3)**2 - Q(4)**2;
    Cbn(1,2) = 2*Q(2)*Q(3) - 2*Q(1)*Q(4);
    Cbn(1,3) = 2*Q(1)*Q(3) + 2*Q(2)*Q(4);
    Cbn(2,1) = 2*Q(1)*Q(4) + 2*Q(2)*Q(3);
    Cbn(2,2) = Q(1)**2 - Q(2)**2 + Q(3)**2 - Q(4)**2;
    Cbn(2,3) = 2*Q(3)*Q(4) - 2*Q(1)*Q(2);
    Cbn(3,1) = 2*Q(2)*Q(4) - 2*Q(1)*Q(3);
    Cbn(3,2) = 2*Q(1)*Q(2) + 2*Q(3)*Q(4);
    Cbn(3,3) = Q(1)**2 - Q(2)**2 - Q(3)**2 + Q(4)**2;

!	Cbn(1,1) = Q(1)**2 - Q(2)**2 - Q(3)**2 + Q(4)**2;
 !   Cbn(1,2) = 2*Q(2)*Q(1) + 2*Q(3)*Q(4);
  !  Cbn(1,3) = 2*Q(1)*Q(3) - 2*Q(2)*Q(4);
   ! Cbn(2,1) = 2*Q(1)*Q(2) - 2*Q(4)*Q(3);
    !Cbn(2,2) = -Q(1)**2 + Q(2)**2 - Q(3)**2 + Q(4)**2;
!    Cbn(2,3) = 2*Q(3)*Q(2) + 2*Q(1)*Q(4);
 !   Cbn(3,1) = 2*Q(2)*q(4) + 2*Q(1)*Q(3);
  !  Cbn(3,2) = 2*Q(3)*Q(2) - 2*Q(1)*Q(4);
   ! Cbn(3,3) = -Q(1)**2 - Q(2)**2 + Q(3)**2 + Q(4)**2;

	RETURN

	END SUBROUTINE B2N



!****************************************************************************
!
!  SUBROUTINE Q2W: 将姿态旋转矩阵转换为四元数（探测器本体系至小天体本体系）
!
!****************************************************************************

    SUBROUTINE Q2W(cbn,Q)

	USE GLOBAL

	IMPLICIT NONE

	DOUBLE PRECISION :: Q(4), cbn(3,3) ,cnb(3,3),  q1, q2, q3, q4
	DOUBLE PRECISION :: yaw, pitch, roll, yaw_main, roll_main

	cnb=TRANSPOSE(cbn)
WRITE(*,*)  -cnb(1,3)-1.0D0
	pitch=asin(-cnb(1,3))
WRITE(*,*)  PITCH
	roll_main = atan(cnb(2,3)/cnb(3,3))
    yaw_main = atan(cnb(1,2)/cnb(1,1))
    
    if (abs(cnb(1,1)) > 1e-9) then
        if (cnb(1,1) > 0) then
            yaw = yaw_main
        else
            if (yaw_main > 0) then 
                yaw = yaw_main - pi
            else
                yaw = yaw_main + pi
            end if
        end  if
    end if
    
    if (abs(cnb(3,3)) > 1e-9) then
        if (cnb(3,3) > 0) then
            roll = roll_main
        else
            if (roll_main > 0) then
                roll = roll_main - pi
            else
                roll = roll_main + pi
            end if
        end if
    end if

	roll=mod(roll,2*pi)
	yaw=mod(yaw,2*pi)
	pitch=mod(pitch,2*pi)

	q1 = cos(pitch/2)*cos(roll/2)*cos(yaw/2) + sin(pitch/2)*sin(roll/2)*sin(yaw/2);
    q2 = cos(pitch/2)*cos(yaw/2)*sin(roll/2) - cos(roll/2)*sin(pitch/2)*sin(yaw/2);
    q3 = cos(roll/2)*cos(yaw/2)*sin(pitch/2) + cos(pitch/2)*sin(roll/2)*sin(yaw/2);
    q4 = cos(pitch/2)*cos(roll/2)*sin(yaw/2) - cos(yaw/2)*sin(pitch/2)*sin(roll/2);

	Q(1)=q1
	Q(2)=q2
	Q(3)=q3
	Q(4)=q4

	Q=Q/SQRT(DOT_PRODUCT(Q,Q))

	RETURN

	END SUBROUTINE Q2W



