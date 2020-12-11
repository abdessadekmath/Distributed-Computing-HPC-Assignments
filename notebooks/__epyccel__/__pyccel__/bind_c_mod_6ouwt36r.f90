!........................................
function solve_2d_poisson_pyccel(n0_p, n1_p, p, n0_pd, n1_pd, pd, n0_b, &
      n1_b, b, nx, ny, nt, dx, dy) bind(c) result(Out_0001)

  use mod_6ouwt36r, only: mod_solve_2d_poisson_pyccel => &
      solve_2d_poisson_pyccel
  use ISO_C_BINDING
  implicit none

  integer(C_INT), value :: n0_p
  integer(C_INT), value :: n1_p
  real(C_DOUBLE), intent(inout) :: p(0:n1_p-1,0:n0_p-1)
  integer(C_INT), value :: n0_pd
  integer(C_INT), value :: n1_pd
  real(C_DOUBLE), intent(inout) :: pd(0:n1_pd-1,0:n0_pd-1)
  integer(C_INT), value :: n0_b
  integer(C_INT), value :: n1_b
  real(C_DOUBLE), intent(inout) :: b(0:n1_b-1,0:n0_b-1)
  integer(C_LONG_LONG), value :: nx
  integer(C_LONG_LONG), value :: ny
  integer(C_LONG_LONG), value :: nt
  real(C_DOUBLE), value :: dx
  real(C_DOUBLE), value :: dy
  integer(C_LONG_LONG) :: Out_0001


  Out_0001 = mod_solve_2d_poisson_pyccel(p, pd, b, nx, ny, nt, dx, dy)

end function solve_2d_poisson_pyccel
!........................................
