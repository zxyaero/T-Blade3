real*8 function angle(y_cp, x_cp, angle0, t)
implicit none
real*8, dimension(4), intent (in) :: y_cp, x_cp  
real*8, intent (in) :: t, angle0
!real*8, dimension(29) :: GQx, GQw
!real*8 bspline, d_bspline, S_param
!real*8 x, y, dxdt, dydt, S
!integer i

if ( t < 1e-16 ) then
	angle = angle0
	return
endif

angle = -1*(y_cp(1)*(x_cp(1)*(t**6/72 - t**5/12 + 5*t**4/24 - 5*t**3/18 + 5*t**2/24 - t/12) + x_cp(2)*(-t**6/24 +      &
        13*t**5/60 - 7*t**4/16 + 5*t**3/12 - t**2/6) + x_cp(3)*(t**6/24 - 11*t**5/60 + 7*t**4/24 - t**3/6 - t**2/24 +  &
        t/12) + x_cp(4)*(-t**6/72 + t**5/20 - t**4/16 + t**3/36)) + y_cp(2)*(x_cp(1)*(-t**6/24 + t**5/5 - 5*t**4/16 +  &
        t**3/18 + t**2/3 - t/3) + x_cp(2)*(t**6/8 - t**5/2 + t**4/2 + t**3/3 - 2*t**2/3) + x_cp(3)*(-t**6/8 + 2*t**5/5 & 
        - 3*t**4/16 - t**3/2 + t**2/3 + t/3) + x_cp(4)*(t**6/24 - t**5/10 + t**3/9)) + y_cp(3)*(x_cp(1)*(t**6/24 -     &
        3*t**5/20 + t**4/8 + t**3/18 - t**2/24 - t/12) + x_cp(2)*(-t**6/8 + 7*t**5/20 - t**4/16 - t**3/4 - t**2/6) +   &
        x_cp(3)*(t**6/8 - t**5/4 - t**4/8 + t**3/6 + 5*t**2/24 + t/12) + x_cp(4)*(-t**6/24 + t**5/20 + t**4/16 +       &
        t**3/36)) + y_cp(4)*(t**6*x_cp(4)/72 + x_cp(1)*(-t**6/72 + t**5/30 - t**4/48) + x_cp(2)*(t**6/24 - t**5/15) +  &
        x_cp(3)*(-t**6/24 + t**5/30 + t**4/48)) ) + angle0   

!   return

!GQx = (/-0.9966794422605956, -0.9825455052614139, -0.9572855957780887, -0.9211802329530591, -0.874637804920103, -0.8181854876152532, -0.752462851734477, -0.6782145376026867, -0.5962817971382289, -0.5075929551242282, -0.413152888174008, -0.3140316378676399, -0.2113522861660013, -0.1062782301326792, 0.0000000000000002, 0.106278230132679, 0.2113522861660009, 0.3140316378676405, 0.4131528881740089, 0.5075929551242276, 0.5962817971382278, 0.6782145376026861, 0.7524628517344769, 0.8181854876152522, 0.8746378049201026, 0.9211802329530594, 0.9572855957780867, 0.9825455052614134, 0.9966794422605948/)
!GQw = (/ 0.0085169038787468, 0.0197320850561252, 0.0307404922020909, 0.041402062518683, 0.0515948269024977, 0.0612030906570802, 0.0701179332550491, 0.0782383271357671, 0.0854722573661736, 0.0917377571392597, 0.0969638340944074, 0.1010912737599152, 0.1040733100777303, 0.1058761550973202, 0.1064793817183146, 0.1058761550973217, 0.1040733100777293, 0.1010912737599157, 0.0969638340944089, 0.0917377571392591, 0.085472257366172, 0.0782383271357633, 0.0701179332550512, 0.06120309065708, 0.0515948269024958, 0.0414020625186843, 0.0307404922020949, 0.0197320850561219, 0.0085169038787447/)

!GQx = 0.5*(GQx + 1)*t

!angle = 0
!do i = 1, 29 
!    x = bspline(x_cp, GQx(i))
!    y = bspline(y_cp, GQx(i))
!    dxdt = d_bspline(x_cp, GQx(i))
!    dydt = d_bspline(y_cp, GQx(i))
!    S = sqrt(dxdt**2 + dydt**2)
!    angle = angle - GQw(i)*y*dxdt*0.5*t
!enddo
!angle = angle + angle0 

end function


real*8 function camber(y_cp, x_cp, angle0, camber0, t)  
implicit none
real*8, dimension(4), intent (in) :: y_cp, x_cp
real*8, intent (in) :: t, angle0, camber0
!real*8, dimension(29) :: GQx, GQw
!real*8 bspline, d_bspline, dd_bsplinecurv, S_param, angle
!real*8 a, dxdt, dydt, S, x, y
!integer i

if ( t < 1e-16 ) then
	camber = camber0
	return
endif

camber = -1*(y_cp(1)*(x_cp(1)*(x_cp(1)*(-t**9/1296 + t**8/144 - t**7/36 + 7*t**6/108 - 7*t**5/72 + 7*t**4/72 - t**3/16 +          &
         t**2/48) + x_cp(2)*(t**9/432 - 11*t**8/576 + 23*t**7/336 - 5*t**6/36 + 25*t**5/144 - 13*t**4/96 + t**3/18) +             &
         x_cp(3)*(-t**9/432 + 5*t**8/288 - t**7/18 + 7*t**6/72 - 7*t**5/72 + 7*t**4/144 + t**3/144 - t**2/48) + x_cp(4) *         &
         (t**9/1296 - t**8/192 + 5*t**7/336 - 5*t**6/216 + t**5/48 - t**4/96)) + x_cp(2)*(x_cp(1)*(t**9/432 - 3*t**8/160 +        &  
         73*t**7/1120 - 181*t**6/1440 + 23*t**5/160 - 3*t**4/32 + t**3/36) + x_cp(2)*(-t**9/144 + 49*t**8/960 - 523*t**7/3360     & 
         + t**6/4 - 13*t**5/60 + t**4/12) + x_cp(3)*(t**9/144 - 11*t**8/240 + 409*t**7/3360 - 229*t**6/1440 + 43*t**5/480 +       &
         t**4/96 - t**3/36) + x_cp(4)*(-t**9/432 + 13*t**8/960 - t**7/32 + 5*t**6/144 - t**5/60)) + x_cp(3)*(x_cp(1) *            &
         (-t**9/432 + t**8/60 - t**7/20 + 7*t**6/90 - 7*t**5/120 + 5*t**3/144 - t**2/48) + x_cp(2)*(t**9/144 - 43*t**8/960 +      &
         193*t**7/1680 - 5*t**6/36 + 13*t**5/240 + 5*t**4/96 - t**3/18) + x_cp(3)*(-t**9/144 + 19*t**8/480 - 3*t**7/35 +          &
         3*t**6/40 + t**5/120 - t**4/16 + t**3/48 + t**2/48) + x_cp(4)*(t**9/432 - 11*t**8/960 + t**7/48 - t**6/72 - t**5/240     &
         + t**4/96)) + x_cp(4)*(x_cp(1)*(t**9/1296 - 7*t**8/1440 + 127*t**7/10080 - 73*t**6/4320 + 17*t**5/1440 - t**4/288) +     &
         x_cp(2)*(-t**9/432 + 37*t**8/2880 - 31*t**7/1120 + t**6/36 - t**5/90) + x_cp(3)*(t**9/432 - t**8/90 + 197*t**7/10080     &
         - 19*t**6/1440 - t**5/1440 + t**4/288) + x_cp(4)*(-t**9/1296 + t**8/320 - t**7/224 + t**6/432))) + y_cp(2)*(x_cp(1) *    &
         (x_cp(1)*(t**9/432 - 17*t**8/960 + 181*t**7/3360 - 317*t**6/4320 + 13*t**5/1440 + 17*t**4/144 - t**3/6 + t**2/12) +      &
         x_cp(2)*(-t**9/144 + 23*t**8/480 - 139*t**7/1120 + 17*t**6/144 + 7*t**5/90 - 7*t**4/24 + 2*t**3/9) + x_cp(3)*(t**9/144   & 
         - 41*t**8/960 + 311*t**7/3360 - 71*t**6/1440 - 173*t**5/1440 + 31*t**4/144 - t**3/18 - t**2/12) + x_cp(4)*(-t**9/432 +   &
         t**8/80 - 5*t**7/224 + t**6/216 + t**5/30 - t**4/24)) + x_cp(2)*(x_cp(1)*(-t**9/144 + 3*t**8/64 - 13*t**7/112 +          &
         7*t**6/72 + t**5/12 - 5*t**4/24 + t**3/9) + x_cp(2)*(t**9/48 - t**8/8 + t**7/4 - t**6/12 - t**5/3 + t**4/3) + x_cp(3) *  &
         (-t**9/48 + 7*t**8/64 - 19*t**7/112 - t**6/24 + 19*t**5/60 - t**4/8 - t**3/9) + x_cp(4)*(t**9/144 - t**8/32 + t**7/28 +  & 
         t**6/36 - t**5/15)) + x_cp(3)*(x_cp(1)*(t**9/144 - 13*t**8/320 + 89*t**7/1120 - 11*t**6/480 - 11*t**5/96 + 5*t**4/48 +   &
         t**3/18 - t**2/12) + x_cp(2)*(-t**9/48 + 17*t**8/160 - 173*t**7/1120 - t**6/16 + 3*t**5/10 - t**4/24 - 2*t**3/9) +       &
         x_cp(3)*(t**9/48 - 29*t**8/320 + 99*t**7/1120 + 61*t**6/480 - 7*t**5/32 - 5*t**4/48 + t**3/6 + t**2/12) + x_cp(4) *      &
         (-t**9/144 + t**8/40 - 3*t**7/224 - t**6/24 + t**5/30 + t**4/24)) + x_cp(4)*(x_cp(1)*(-t**9/432 + 11*t**8/960 -          &
         29*t**7/1680 - t**6/1080 + t**5/45 - t**4/72) + x_cp(2)*(t**9/144 - 7*t**8/240 + t**7/35 + t**6/36 - 2*t**5/45) +        &
         x_cp(3)*(-t**9/144 + 23*t**8/960 - 19*t**7/1680 - 13*t**6/360 + t**5/45 + t**4/72) + x_cp(4)*(t**9/432 - t**8/160 +      &
         t**6/108))) + y_cp(3)*(x_cp(1)*(x_cp(1)*(-t**9/432 + 7*t**8/480 - t**7/30 + 31*t**6/1080 + t**5/360 - t**4/144 -         &
         t**3/48 + t**2/48) + x_cp(2)*(t**9/144 - 37*t**8/960 + 39*t**7/560 - t**6/36 - 5*t**5/144 - t**4/96 + t**3/18) +         &
         x_cp(3)*(-t**9/144 + t**8/30 - 19*t**7/420 - t**6/180 + 13*t**5/360 + t**4/36 - 5*t**3/144 - t**2/48) + x_cp(4) *        &
         (t**9/432 - 3*t**8/320 + t**7/112 + t**6/216 - t**5/240 - t**4/96)) + x_cp(2)*(x_cp(1)*(t**9/144 - 3*t**8/80 +           &
         71*t**7/1120 - 3*t**6/160 - 13*t**5/480 - t**4/96 + t**3/36) + x_cp(2)*(-t**9/48 + 31*t**8/320 - 127*t**7/1120 -         &
         t**6/24 + t**5/20 + t**4/12) + x_cp(3)*(t**9/48 - 13*t**8/160 + 61*t**7/1120 + 13*t**6/160 - t**5/160 - 7*t**4/96 -      &
         t**3/36) + x_cp(4)*(-t**9/144 + 7*t**8/320 - t**7/224 - t**6/48 - t**5/60)) + x_cp(3)*(x_cp(1)*(-t**9/144 + t**8/32 -    &
         t**7/28 - t**6/72 + t**5/40 + t**4/48 - t**3/144 - t**2/48) + x_cp(2)*(t**9/48 - 5*t**8/64 + 5*t**7/112 + t**6/12 -      &
         t**5/240 - 7*t**4/96 - t**3/18) + x_cp(3)*(-t**9/48 + t**8/16 - t**6/12 - t**5/24 + t**4/24 + t**3/16 +                  &
         t**2/48) + x_cp(4)*(t**9/144 - t**8/64 - t**7/112 + t**6/72 + t**5/48 + t**4/96)) + x_cp(4)*(x_cp(1)*(t**9/432 -         &
         t**8/120 + 19*t**7/3360 + 17*t**6/4320 - t**5/1440 - t**4/288) + x_cp(2)*(-t**9/144 + 19*t**8/960 - t**7/1120 - t**6/72  & 
         - t**5/90) + x_cp(3)*(t**9/144 - 7*t**8/480 - 31*t**7/3360 + 11*t**6/1440 + 17*t**5/1440 + t**4/288) + x_cp(4) *         &
         (-t**9/432 + t**8/320 + t**7/224 + t**6/432))) + y_cp(4)*(x_cp(1)*(x_cp(1)*(t**9/1296 - 11*t**8/2880 + 73*t**7/10080 -   &
         t**6/160 + t**5/480) + x_cp(2)*(-t**9/432 + 7*t**8/720 - 47*t**7/3360 + t**6/144) + x_cp(3)*(t**9/432 - 23*t**8/2880 +   &
         83*t**7/10080 - t**6/1440 - t**5/480) + x_cp(4)*(-t**9/1296 + t**8/480 - t**7/672)) + x_cp(2)*(x_cp(1)*(-t**9/432 +      &
         3*t**8/320 - t**7/80 + t**6/180) + x_cp(2)*(t**9/144 - 11*t**8/480 + 2*t**7/105) + x_cp(3)*(-t**9/144 + 17*t**8/960 -    &
         11*t**7/1680 - t**6/180) + x_cp(4)*(t**9/432 - t**8/240)) + x_cp(3)*(x_cp(1)*(t**9/432 - 7*t**8/960 + t**7/160 +         &
         t**6/1440 - t**5/480) + x_cp(2)*(-t**9/144 + t**8/60 - 17*t**7/3360 - t**6/144) + x_cp(3)*(t**9/144 - 11*t**8/960 -      &
         3*t**7/1120 + t**6/160 + t**5/480) + x_cp(4)*(-t**9/432 + t**8/480 + t**7/672)) + x_cp(4)*(t**9*x_cp(4)/1296 + x_cp(1) * &
         (-t**9/1296 + t**8/576 - t**7/1008) + x_cp(2)*(t**9/432 - t**8/288) + x_cp(3)*(-t**9/432 + t**8/576 + t**7/1008))) ) +   &
         angle0*(x_cp(1)*(-t**3/6 + t**2/2 - t/2) + x_cp(2)*(t**3/2 - t**2) + x_cp(3)*(-t**3/2 + t**2/2 + t/2) + x_cp(4) *        &
         (t**3/6) ) + camber0

!       return

!GQx = (/-0.9966794422605956, -0.9825455052614139, -0.9572855957780887, -0.9211802329530591, -0.874637804920103, -0.8181854876152532, -0.752462851734477, -0.6782145376026867, -0.5962817971382289, -0.5075929551242282, -0.413152888174008, -0.3140316378676399, -0.2113522861660013, -0.1062782301326792, 0.0000000000000002, 0.106278230132679, 0.2113522861660009, 0.3140316378676405, 0.4131528881740089, 0.5075929551242276, 0.5962817971382278, 0.6782145376026861, 0.7524628517344769, 0.8181854876152522, 0.8746378049201026, 0.9211802329530594, 0.9572855957780867, 0.9825455052614134, 0.9966794422605948/)
!GQw = (/ 0.0085169038787468, 0.0197320850561252, 0.0307404922020909, 0.041402062518683, 0.0515948269024977, 0.0612030906570802, 0.0701179332550491, 0.0782383271357671, 0.0854722573661736, 0.0917377571392597, 0.0969638340944074, 0.1010912737599152, 0.1040733100777303, 0.1058761550973202, 0.1064793817183146, 0.1058761550973217, 0.1040733100777293, 0.1010912737599157, 0.0969638340944089, 0.0917377571392591, 0.085472257366172, 0.0782383271357633, 0.0701179332550512, 0.06120309065708, 0.0515948269024958, 0.0414020625186843, 0.0307404922020949, 0.0197320850561219, 0.0085169038787447/)

!GQx = 0.5*(GQx + 1)*t

!camber = 0
!do i = 1, 29 
!    x = bspline(x_cp, GQx(i))
!    y = bspline(y_cp, GQx(i))
!    dxdt = d_bspline(x_cp, GQx(i))
!    dydt = d_bspline(y_cp, GQx(i))
!    S = sqrt(dxdt**2 + dydt**2)
!    a = angle(y_cp, x_cp, angle0, GQx(i) )
!    camber = camber + GQw(i)*a*dxdt*0.5*t
!enddo
!camber = camber + camber0 

end function


subroutine camline(casename, isdev, xcp, ycp, ncp, u, np, ainl, aext, chrdx, wing_flag, &
	sang, chrd, init_angles, init_cams, u_end, splinedata)

!!		Added by Karthik Balasubramanian
! 			This subroutine constructs a curve (camber line) using second derivative, 
!			angle specifications and rotates the curve by appropriate stagger/twist.
	
implicit none
real, parameter :: dtor = 4.*atan(1.)/180.
integer, parameter :: splinedata_col = 6

!!		Inputs to this subroutine
!			casename	String,		name of case.
!			isdev		Logical, 	flag to print output for debugging.
!			xcp			Real array, x-axis control point values.
!			ycp			Real array, y-axis control point values.
!			ncp			Integer, 	number of control points.
!			u			Real array, x-axis values of the resultant curve.
!			np			Integer,	number of points on the resultant curve.
!			ainl		Real,		inlet angle of staggered curve if wing_flag = 0
!									used to calculate total camber ( = aext-ainl) if wing_flag = 0.
!									treated as twist (stagger) angle if wing_flag = 1.
!			aext		Real,		exit angle of staggered curve if wing_flag = 0.
!									used to calculate total camber ( = aext-ainl) if wing_flag = 0.
!									is equal to the total camber if wing_flag = 1.
!			chrdx		Real,		projection of the curve length on x-axis (Axial chord length).
!									used to calculate total chord length.
!			wing_flag	Integer,	if wing_flag = 0, total camber = aext-ainl.
!									if wing_flag = 1, total camber = aext, ainl is the twist angle.

integer, intent (in) :: np, ncp, wing_flag
real, intent (in) :: xcp(ncp), ycp(ncp), u(np), ainl, aext, chrdx
character (len = 32), intent (in) :: casename
logical, intent (in) :: isdev

!!		Outputs from this subroutine
!			sang		Real,			Stagger/Twist angle
!			chrd		Real,			Actual chord length after stagger/twist.
!			init_angles	Real array,		Curve angles at segment ends.
!			init_cams	Real array,		Curve angles at segment ends.
!			u_end		Real array,		x-axis values at segment ends.
!			splinedata	Real 2D array,	Contains 6 rows and np columns:
!										1st row - x-axis values of curve.
!										2nd row - y-axis values of curve.
!										3rd row - dy/dx values of curve.
!										4th row - d2y/dx2 values of curve.
!										5th and 6th are dummy rows.
!		NOTE: 5th and 6th rows of splinedata can be discarded if used
!		as a subroutine outside TBlade3

real, intent (out) :: chrd, sang, u_end(ncp-2), &
	init_angles(ncp-2), init_cams(ncp-2), &
	splinedata(splinedata_col, np)
	
!!		Functions used by this subroutine
real :: bspline_t_newton, camber, angle, bspline

!!		Other local variables
integer :: i, j
real :: scalefactor, P, knew, det, k1, k2, &
	curv(np), cam(np), cam_u(np), tot_cam, &
	d1v_end(ncp-2), v_end(ncp-2), xcp_seg(4), ycp_seg(4), &
	t, angle0, camber0, intg_d2v_end(ncp-2), &
	intg_d1v_end(ncp-2)
print*, 'xcp', xcp
print*, 'ycp', ycp
!!
! write (*, '(A)'), 'Executing subroutine camline in bsplinecam.f90'
if (wing_flag .eq. 0) then
	tot_cam = aext-ainl
elseif (wing_flag .eq. 1) then
	tot_cam = aext
endif

intg_d2v_end = 0.
intg_d1v_end = 0.
u_end = 0.
t = 1.
init_angles = 0.
init_cams = 0.
splinedata = 0.
if (tot_cam .eq. 0.) then
	sang = ainl
	chrd = chrdx/abs(cos(sang))
	return
endif

do j = 1, ncp-3
	xcp_seg = xcp(j:j+3)
	ycp_seg = ycp(j:j+3)
	if (j .eq. ncp-3) then
		u_end(j+1) = 1.
	else
		u_end(j+1) = bspline(xcp_seg, t)
	endif
	angle0 = intg_d2v_end(j)
	camber0 = intg_d1v_end(j)
	intg_d2v_end(j+1) = angle(ycp_seg, xcp_seg, angle0, t)
	intg_d1v_end(j+1) = camber(ycp_seg, xcp_seg, angle0, camber0, t)
enddo
! intg_d2v_end(ncp-2) is total integral of second derivative of v upto u = 1
! intg_d1v_end(ncp-2) is total integral of first derivative of v upto u = 1
! P is a grouping of terms in the scaling factor equation
P = (intg_d2v_end(ncp-2)*intg_d1v_end(ncp-2))-(intg_d1v_end(ncp-2)**2)
write (*, '(A, F20.15)') 'Total camber is: ', tot_cam/dtor
! det is the determinant of quadratic equation in k (scaling factor)
det = (intg_d2v_end(ncp-2)**2)+(4*P*(tan(tot_cam)**2))
write (*, '(A, F20.15)') 'Determinant is: ', det
if (det.lt.0.) then 
	write (*, '(A)') 'All possible scaling factors for curvature control points are complex. Aborting'
	call exit
endif
! Calculating both possible roots to solve for k
k1 = (-intg_d2v_end(ncp-2) + sqrt(det))/(2*P*tan(tot_cam))
k2 = (-intg_d2v_end(ncp-2) - sqrt(det))/(2*P*tan(tot_cam))
! Choosing appropriate root
write (*, '(A, 2F25.15)') 'Possible values of scaling factor are: ', k1, k2
knew = min(k1, k2)
d1v_end = knew*(intg_d2v_end-intg_d1v_end(ncp-2))
if (abs((atan(d1v_end(ncp-2))-atan(d1v_end(1)) - tot_cam)/tot_cam) .gt. 1E-7) then
	knew = max(k1, k2)
	d1v_end = knew*(intg_d2v_end-intg_d1v_end(ncp-2))
endif
v_end = knew*(intg_d1v_end-(u_end*intg_d1v_end(ncp-2)))
write (*, '(A, F20.15)') 'Camber line second derivative scaling factor: ', knew
write (*, '(A, F20.15, /, A, F20.15)') 'Inlet u-v metal angle in deg: ', atan(d1v_end(1))/dtor, &
'Exit u-v metal angle in deg: ', atan(d1v_end(ncp-2))/dtor

init_angles = knew*(intg_d2v_end-intg_d1v_end(ncp-2))
init_cams = knew*(intg_d1v_end-(u_end*intg_d1v_end(ncp-2)))

! Loop to construct the splinedata 2D array
do i = 1, np
	do j = 1, (ncp-3)
		if (u(i) .eq. u_end(j)) then
			ycp_seg = ycp(j:j+3)
			t = 0.
			curv(i) = knew*bspline(ycp_seg, t)
			cam_u(i) = d1v_end(j)
			cam(i) = v_end(j)
			exit
		elseif (u(i) .eq. 1.) then
			ycp_seg = ycp(ncp-3:ncp)
			t = 1.
			curv(i) = knew*bspline(ycp_seg, t)
			cam_u(i) = d1v_end(ncp-2)
			cam(i) = v_end(ncp-2)
			exit
		elseif ((u(i) .gt. u_end(j)) .and. (u(i) .lt. u_end(j+1))) then
			xcp_seg = xcp(j:j+3)
			ycp_seg = ycp(j:j+3)
			angle0 = intg_d2v_end(j)
			camber0 = intg_d1v_end(j)
			t = bspline_t_newton(xcp_seg, u(i))
			curv(i) = knew*bspline(ycp_seg, t)
			cam_u(i) = knew*(angle(ycp_seg, xcp_seg, angle0, t)-intg_d1v_end(ncp-2))
			cam(i) = knew*(camber(ycp_seg, xcp_seg, angle0, camber0, t)-(u(i)*intg_d1v_end(ncp-2)))
			exit
		end if
	enddo
	splinedata(1, i) = u(i)
	splinedata(2, i) = cam(i)
	splinedata(3, i) = cam_u(i)
	splinedata(4, i) = curv(i) 
enddo

! Stagger/Twist calculation
if (wing_flag .eq. 0) then
	sang = (ainl-atan(cam_u(1)))
	write (*, '(A, F20.15)') 'Stagger angle in deg: ', sang/dtor
elseif (wing_flag .eq. 1) then
	sang = ainl
	write (*, '(A, F20.15)') 'Twist angle in deg: ', sang/dtor
endif
! Calculation of actual chord after stagger/twist
chrd = chrdx/abs(cos(sang))

end subroutine camline
