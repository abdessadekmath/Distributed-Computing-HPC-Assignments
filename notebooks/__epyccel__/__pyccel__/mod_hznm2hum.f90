module mod_hznm2hum

use ISO_C_BINDING

implicit none

contains

!........................................
function solve_2d_nonlinearconv_pyccel(u, un, v, vn, nt, nx, ny, dt, dx, &
      dy, c) result(Out_0001)

  implicit none

  integer(C_LONG_LONG) :: Out_0001
  real(C_DOUBLE), intent(inout), target :: u(0:,0:)
  real(C_DOUBLE), intent(inout) :: un(0:,0:)
  real(C_DOUBLE), intent(inout), target :: v(0:,0:)
  real(C_DOUBLE), intent(inout) :: vn(0:,0:)
  integer(C_LONG_LONG), value :: nt
  integer(C_LONG_LONG), value :: nx
  integer(C_LONG_LONG), value :: ny
  real(C_DOUBLE), value :: dt
  real(C_DOUBLE), value :: dx
  real(C_DOUBLE), value :: dy
  real(C_DOUBLE), value :: c
  integer(C_LONG_LONG) :: row
  integer(C_LONG_LONG) :: col
  integer(C_LONG_LONG) :: n
  integer(C_LONG_LONG) :: i
  integer(C_LONG_LONG) :: j

  !##Assign initial conditions
  !#set hat function I.C. : u(.5<=x<=1 && .5<=y<=1 ) is 2
  u(Int(0.5_C_DOUBLE / dx, 8):Int(1_C_LONG_LONG / dx + 1_C_LONG_LONG, 8 &
      ) - 1_C_LONG_LONG, Int(0.5_C_DOUBLE / dy, 8):Int(1_C_LONG_LONG / &
      dy + 1_C_LONG_LONG, 8) - 1_C_LONG_LONG) = 2_C_LONG_LONG
  !#set hat function I.C. : v(.5<=x<=1 && .5<=y<=1 ) is 2
  v(Int(0.5_C_DOUBLE / dx, 8):Int(1_C_LONG_LONG / dx + 1_C_LONG_LONG, 8 &
      ) - 1_C_LONG_LONG, Int(0.5_C_DOUBLE / dy, 8):Int(1_C_LONG_LONG / &
      dy + 1_C_LONG_LONG, 8) - 1_C_LONG_LONG) = 2_C_LONG_LONG
  row = size(u, 2)
  col = size(u, 1)
  !fill the update of u and v
  do n = 1_C_LONG_LONG, row-1_C_LONG_LONG, 1_C_LONG_LONG
    do i = 1_C_LONG_LONG, col-1_C_LONG_LONG, 1_C_LONG_LONG
      do j = 0_C_LONG_LONG, ny-1_C_LONG_LONG, 1_C_LONG_LONG
        u(j, i) = u(j, i) - c * (dt / dx * u(j, i) * (u(j, i) - u(j, i - &
      1_C_LONG_LONG)) + dt / dy * v(j, i) * (u(j, i) - u(j - &
      1_C_LONG_LONG, i)))
        v(j, i) = v(j, i) - c * (dt / dx * u(j, i) * (v(j, i) - v(j, i - &
      1_C_LONG_LONG)) + dt / dy * v(j, i) * (v(j, i) - v(j - &
      1_C_LONG_LONG, i)))
      end do
    end do
    if (allocated(un)) then
      if (any(size(un) /= [size(u, 1), size(u, 2)])) then
        deallocate(un)
        allocate(un(0:size(u, 1) - 1_C_LONG_LONG, 0:size(u, 2) - &
      1_C_LONG_LONG))
      end if
    else
      allocate(un(0:size(u, 1) - 1_C_LONG_LONG, 0:size(u, 2) - &
      1_C_LONG_LONG))
    end if
    un = u
    if (allocated(vn)) then
      if (any(size(vn) /= [size(v, 1), size(v, 2)])) then
        deallocate(vn)
        allocate(vn(0:size(v, 1) - 1_C_LONG_LONG, 0:size(v, 2) - &
      1_C_LONG_LONG))
      end if
    else
      allocate(vn(0:size(v, 1) - 1_C_LONG_LONG, 0:size(v, 2) - &
      1_C_LONG_LONG))
    end if
    vn = v
  end do
  Out_0001 = 0_C_LONG_LONG
  return

end function solve_2d_nonlinearconv_pyccel
!........................................

end module mod_hznm2hum
