!........................................
function solve_1d_diff_pyccel(n0_u, u, nt, nx, dt, dx, nu) bind(c) &
      result(Out_0001)

  use mod_py966uf9, only: mod_solve_1d_diff_pyccel => &
      solve_1d_diff_pyccel
  use ISO_C_BINDING
  implicit none

  integer(C_INT), value :: n0_u
  real(C_DOUBLE), intent(inout) :: u(0:n0_u-1)
  integer(C_LONG_LONG), value :: nt
  integer(C_LONG_LONG), value :: nx
  real(C_DOUBLE), value :: dt
  real(C_DOUBLE), value :: dx
  real(C_DOUBLE), value :: nu
  integer(C_LONG_LONG) :: Out_0001


  Out_0001 = mod_solve_1d_diff_pyccel(u, nt, nx, dt, dx, nu)

end function solve_1d_diff_pyccel
!........................................
