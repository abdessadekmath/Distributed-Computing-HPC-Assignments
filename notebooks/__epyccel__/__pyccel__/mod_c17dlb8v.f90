module mod_c17dlb8v

use ISO_C_BINDING

implicit none

contains

!........................................
function solve_2d_linearconv_pyccel(u, nt, dt, dx, dy, c) result( &
      Out_0001)

  implicit none

  integer(C_LONG_LONG) :: Out_0001
  real(C_DOUBLE), intent(inout) :: u(0:,0:)
  integer(C_LONG_LONG), value :: nt
  real(C_DOUBLE), value :: dt
  real(C_DOUBLE), value :: dx
  real(C_DOUBLE), value :: dy
  real(C_DOUBLE), value :: c
  integer(C_LONG_LONG) :: row
  integer(C_LONG_LONG) :: col
  integer(C_LONG_LONG) :: n
  integer(C_LONG_LONG) :: j
  integer(C_LONG_LONG) :: i

  row = size(u, 2)
  col = size(u, 1)
  !fill the update of u and v
  do n = 0_C_LONG_LONG, nt-1_C_LONG_LONG, 1_C_LONG_LONG
    do j = 1_C_LONG_LONG, row-1_C_LONG_LONG, 1_C_LONG_LONG
      do i = 1_C_LONG_LONG, col-1_C_LONG_LONG, 1_C_LONG_LONG
        u(i, j) = u(i, j) - c * dt / dx * (u(i, j) - u(i - 1_C_LONG_LONG &
      , j)) - c * dt / dy * (u(i, j) - u(i, j - 1_C_LONG_LONG))
        u(:, 0_C_LONG_LONG) = 1_C_LONG_LONG
        u(:, size(u, 1) - 1_C_LONG_LONG) = 1_C_LONG_LONG
        u(0_C_LONG_LONG, :) = 1_C_LONG_LONG
        u(size(u, 2) - 1_C_LONG_LONG, :) = 1_C_LONG_LONG
      end do
    end do
  end do
  Out_0001 = 0_C_LONG_LONG
  return

end function solve_2d_linearconv_pyccel
!........................................

end module mod_c17dlb8v
