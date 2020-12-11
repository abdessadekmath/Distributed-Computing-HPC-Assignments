!........................................
function solve_2d_linearconv_pyccel(n0_u, n1_u, u, nt, dt, dx, dy, c) &
      bind(c) result(Out_0001)

  use mod_c17dlb8v, only: mod_solve_2d_linearconv_pyccel => &
      solve_2d_linearconv_pyccel
  use ISO_C_BINDING
  implicit none

  integer(C_INT), value :: n0_u
  integer(C_INT), value :: n1_u
  real(C_DOUBLE), intent(inout) :: u(0:n1_u-1,0:n0_u-1)
  integer(C_LONG_LONG), value :: nt
  real(C_DOUBLE), value :: dt
  real(C_DOUBLE), value :: dx
  real(C_DOUBLE), value :: dy
  real(C_DOUBLE), value :: c
  integer(C_LONG_LONG) :: Out_0001


  Out_0001 = mod_solve_2d_linearconv_pyccel(u, nt, dt, dx, dy, c)

end function solve_2d_linearconv_pyccel
!........................................
