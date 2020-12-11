module mod_6ouwt36r

use ISO_C_BINDING

implicit none

contains

!........................................
function solve_2d_poisson_pyccel(p, pd, b, nx, ny, nt, dx, dy) result( &
      Out_0001)

  implicit none

  integer(C_LONG_LONG) :: Out_0001
  real(C_DOUBLE), intent(inout) :: p(0:,0:)
  real(C_DOUBLE), intent(inout) :: pd(0:,0:)
  real(C_DOUBLE), intent(inout) :: b(0:,0:)
  integer(C_LONG_LONG), value :: nx
  integer(C_LONG_LONG), value :: ny
  integer(C_LONG_LONG), value :: nt
  real(C_DOUBLE), value :: dx
  real(C_DOUBLE), value :: dy
  integer(C_LONG_LONG) :: row
  integer(C_LONG_LONG) :: col
  integer(C_LONG_LONG) :: it
  integer(C_LONG_LONG) :: i
  integer(C_LONG_LONG) :: j

  row = size(p, 2)
  col = size(p, 1)
  !Source
  b(Int(Real(nx, 8) / Real(4_C_LONG_LONG, 8), 8), Int(Real(ny, 8) / Real &
      (4_C_LONG_LONG, 8), 8)) = 100_C_LONG_LONG
  b(Int(Real(3_C_LONG_LONG * nx, 8) / Real(4_C_LONG_LONG, 8), 8), Int( &
      Real(3_C_LONG_LONG * ny, 8) / Real(4_C_LONG_LONG, 8), 8)) = &
      -100_C_LONG_LONG
  do it = 0_C_LONG_LONG, nt-1_C_LONG_LONG, 1_C_LONG_LONG
    do i = 0_C_LONG_LONG, nx-1_C_LONG_LONG, 1_C_LONG_LONG
      pd(:, i) = p(:, i)
    end do
    do j = 2_C_LONG_LONG, row-1_C_LONG_LONG, 1_C_LONG_LONG
      do i = 2_C_LONG_LONG, col-1_C_LONG_LONG, 1_C_LONG_LONG
        p(i - 1_C_LONG_LONG, j - 1_C_LONG_LONG) = ((pd(i, j - &
      1_C_LONG_LONG) + pd(i - 2_C_LONG_LONG, j - 1_C_LONG_LONG)) * dy &
      ** 2_C_LONG_LONG + (pd(i - 1_C_LONG_LONG, j) + pd(i - &
      1_C_LONG_LONG, j - 2_C_LONG_LONG)) * dx ** 2_C_LONG_LONG - b(i - &
      1_C_LONG_LONG, j - 1_C_LONG_LONG) * dx ** 2_C_LONG_LONG * dy ** &
      2_C_LONG_LONG) / (2_C_LONG_LONG * (dx ** 2_C_LONG_LONG + dy ** &
      2_C_LONG_LONG))
      end do
    end do
    p(:, 0_C_LONG_LONG) = 0_C_LONG_LONG
    p(:, ny - 1_C_LONG_LONG) = 0_C_LONG_LONG
    p(0_C_LONG_LONG, :) = 0_C_LONG_LONG
    p(nx - 1_C_LONG_LONG, :) = 0_C_LONG_LONG
  end do
  Out_0001 = 0_C_LONG_LONG
  return

end function solve_2d_poisson_pyccel
!........................................

end module mod_6ouwt36r
