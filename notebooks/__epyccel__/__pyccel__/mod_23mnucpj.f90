module mod_23mnucpj

use ISO_C_BINDING

implicit none

contains

!........................................
function solve_2d_burger_pyccel(u, v, nt, dt, dx, dy, nu) result( &
      Out_0001)

  implicit none

  integer(C_LONG_LONG) :: Out_0001
  real(C_DOUBLE), intent(inout) :: u(0:,0:)
  real(C_DOUBLE), intent(inout) :: v(0:,0:)
  integer(C_LONG_LONG), value :: nt
  real(C_DOUBLE), value :: dt
  real(C_DOUBLE), value :: dx
  real(C_DOUBLE), value :: dy
  real(C_DOUBLE), value :: nu
  integer(C_LONG_LONG) :: row
  integer(C_LONG_LONG) :: col
  integer(C_LONG_LONG) :: n
  integer(C_LONG_LONG) :: j
  integer(C_LONG_LONG) :: i

  !##Assign initial conditions
  !#set hat function I.C. : u(.5<=x<=1 && .5<=y<=1 ) is 2
  u(Int(0.5_C_DOUBLE / dx, 8):Int(1_C_LONG_LONG / dx + 1_C_LONG_LONG, 8 &
      ) - 1_C_LONG_LONG, Int(0.5_C_DOUBLE / dy, 8):Int(1_C_LONG_LONG / &
      dy + 1_C_LONG_LONG, 8) - 1_C_LONG_LONG) = 2_C_LONG_LONG
  !#set hat function I.C. : u(.5<=x<=1 && .5<=y<=1 ) is 2
  v(Int(0.5_C_DOUBLE / dx, 8):Int(1_C_LONG_LONG / dx + 1_C_LONG_LONG, 8 &
      ) - 1_C_LONG_LONG, Int(0.5_C_DOUBLE / dy, 8):Int(1_C_LONG_LONG / &
      dy + 1_C_LONG_LONG, 8) - 1_C_LONG_LONG) = 2_C_LONG_LONG
  row = size(u, 2)
  col = size(u, 1)
  !fill the update of u and v
  do n = 0_C_LONG_LONG, nt-1_C_LONG_LONG, 1_C_LONG_LONG
    do j = 2_C_LONG_LONG, row-1_C_LONG_LONG, 1_C_LONG_LONG
      do i = 2_C_LONG_LONG, col-1_C_LONG_LONG, 1_C_LONG_LONG
        u(i - 1_C_LONG_LONG, j - 1_C_LONG_LONG) = u(j - 1_C_LONG_LONG, i &
      - 1_C_LONG_LONG) - dt / dx * u(i - 1_C_LONG_LONG, j - &
      1_C_LONG_LONG) * (u(i - 1_C_LONG_LONG, j - 1_C_LONG_LONG) - u(i - &
      2_C_LONG_LONG, j - 1_C_LONG_LONG)) - dt / dy * v(i - &
      1_C_LONG_LONG, j - 1_C_LONG_LONG) * (u(i - 1_C_LONG_LONG, j - &
      1_C_LONG_LONG) - u(i - 1_C_LONG_LONG, j - 2_C_LONG_LONG)) + nu * &
      dt / dx ** 2_C_LONG_LONG * (u(i, j - 1_C_LONG_LONG) - &
      2_C_LONG_LONG * u(i - 1_C_LONG_LONG, j - 1_C_LONG_LONG) + u(i - &
      2_C_LONG_LONG, j - 1_C_LONG_LONG)) + nu * dt / dy ** &
      2_C_LONG_LONG * (u(i - 1_C_LONG_LONG, j) - 2_C_LONG_LONG * u(i - &
      1_C_LONG_LONG, j - 1_C_LONG_LONG) + u(i - 1_C_LONG_LONG, j - &
      2_C_LONG_LONG))
        v(i - 1_C_LONG_LONG, j - 1_C_LONG_LONG) = v(i - 1_C_LONG_LONG, j &
      - 1_C_LONG_LONG) - dt / dx * u(i - 1_C_LONG_LONG, j - &
      1_C_LONG_LONG) * (v(i - 1_C_LONG_LONG, j - 1_C_LONG_LONG) - v(i - &
      2_C_LONG_LONG, j - 1_C_LONG_LONG)) - dt / dy * v(i - &
      1_C_LONG_LONG, j - 1_C_LONG_LONG) * (v(i - 1_C_LONG_LONG, j - &
      1_C_LONG_LONG) - v(i - 1_C_LONG_LONG, j - 2_C_LONG_LONG)) + nu * &
      dt / dx ** 2_C_LONG_LONG * (v(i, j - 1_C_LONG_LONG) - &
      2_C_LONG_LONG * v(i - 1_C_LONG_LONG, j - 1_C_LONG_LONG) + v(i - &
      2_C_LONG_LONG, j - 1_C_LONG_LONG)) + nu * dt / dy ** &
      2_C_LONG_LONG * (v(i - 1_C_LONG_LONG, j) - 2_C_LONG_LONG * v(i - &
      1_C_LONG_LONG, j - 1_C_LONG_LONG) + v(i - 1_C_LONG_LONG, j - &
      2_C_LONG_LONG))
      end do
    end do
    u(:, 0_C_LONG_LONG) = 1_C_LONG_LONG
    u(:, size(u, 1) - 1_C_LONG_LONG) = 1_C_LONG_LONG
    u(0_C_LONG_LONG, :) = 1_C_LONG_LONG
    u(size(u, 2) - 1_C_LONG_LONG, :) = 1_C_LONG_LONG
    v(:, 0_C_LONG_LONG) = 1_C_LONG_LONG
    v(:, size(v, 1) - 1_C_LONG_LONG) = 1_C_LONG_LONG
    v(0_C_LONG_LONG, :) = 1_C_LONG_LONG
    v(size(v, 2) - 1_C_LONG_LONG, :) = 1_C_LONG_LONG
  end do
  Out_0001 = 0_C_LONG_LONG
  return

end function solve_2d_burger_pyccel
!........................................

end module mod_23mnucpj
