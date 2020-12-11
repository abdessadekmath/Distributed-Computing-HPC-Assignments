module mod_nus8pw23

use ISO_C_BINDING

implicit none

contains

!........................................
function solve_1d_linearconv_pyccel(u, un, nt, nx, dt, dx, c) result( &
      Out_0001)

  implicit none

  integer(C_LONG_LONG) :: Out_0001
  real(C_DOUBLE), intent(inout), target :: u(0:)
  real(C_DOUBLE), intent(inout) :: un(0:)
  integer(C_LONG_LONG), value :: nt
  integer(C_LONG_LONG), value :: nx
  real(C_DOUBLE), value :: dt
  real(C_DOUBLE), value :: dx
  real(C_DOUBLE), value :: c
  integer(C_LONG_LONG) :: n
  integer(C_LONG_LONG) :: i

  do n = 0_C_LONG_LONG, nt-1_C_LONG_LONG, 1_C_LONG_LONG
    do i = 1_C_LONG_LONG, nx-1_C_LONG_LONG, 1_C_LONG_LONG
      u(i) = u(i) - c * dt / dx * (u(i) - u(i - 1_C_LONG_LONG))
    end do
    if (allocated(un)) then
      if (any(size(un) /= [size(u, 1)])) then
        deallocate(un)
        allocate(un(0:size(u, 1) - 1_C_LONG_LONG))
      end if
    else
      allocate(un(0:size(u, 1) - 1_C_LONG_LONG))
    end if
    un = u
  end do
  !fill the update of u
  Out_0001 = 0_C_LONG_LONG
  return

end function solve_1d_linearconv_pyccel
!........................................

end module mod_nus8pw23
