!........................................
function solve_2d_burger_pyccel(n0_u, n1_u, u, n0_v, n1_v, v, nt, dt, dx &
      , dy, nu) bind(c) result(Out_0001)

  use mod_23mnucpj, only: mod_solve_2d_burger_pyccel => &
      solve_2d_burger_pyccel
  use ISO_C_BINDING
  implicit none

  integer(C_INT), value :: n0_u
  integer(C_INT), value :: n1_u
  real(C_DOUBLE), intent(inout) :: u(0:n1_u-1,0:n0_u-1)
  integer(C_INT), value :: n0_v
  integer(C_INT), value :: n1_v
  real(C_DOUBLE), intent(inout) :: v(0:n1_v-1,0:n0_v-1)
  integer(C_LONG_LONG), value :: nt
  real(C_DOUBLE), value :: dt
  real(C_DOUBLE), value :: dx
  real(C_DOUBLE), value :: dy
  real(C_DOUBLE), value :: nu
  integer(C_LONG_LONG) :: Out_0001


  Out_0001 = mod_solve_2d_burger_pyccel(u, v, nt, dt, dx, dy, nu)

end function solve_2d_burger_pyccel
!........................................
