!........................................
function solve_2d_nonlinearconv_pyccel(n0_u, n1_u, u, n0_un, n1_un, un, &
      n0_v, n1_v, v, n0_vn, n1_vn, vn, nt, nx, ny, dt, dx, dy, c) bind( &
      c) result(Out_0001)

  use mod_ds9pyjwf, only: mod_solve_2d_nonlinearconv_pyccel => &
      solve_2d_nonlinearconv_pyccel
  use ISO_C_BINDING
  implicit none

  integer(C_INT), value :: n0_u
  integer(C_INT), value :: n1_u
  real(C_DOUBLE), intent(inout) :: u(0:n1_u-1,0:n0_u-1)
  integer(C_INT), value :: n0_un
  integer(C_INT), value :: n1_un
  real(C_DOUBLE), intent(inout) :: un(0:n1_un-1,0:n0_un-1)
  integer(C_INT), value :: n0_v
  integer(C_INT), value :: n1_v
  real(C_DOUBLE), intent(inout) :: v(0:n1_v-1,0:n0_v-1)
  integer(C_INT), value :: n0_vn
  integer(C_INT), value :: n1_vn
  real(C_DOUBLE), intent(in) :: vn(0:n1_vn-1,0:n0_vn-1)
  integer(C_LONG_LONG), value :: nt
  integer(C_LONG_LONG), value :: nx
  integer(C_LONG_LONG), value :: ny
  real(C_DOUBLE), value :: dt
  real(C_DOUBLE), value :: dx
  real(C_DOUBLE), value :: dy
  real(C_DOUBLE), value :: c
  integer(C_LONG_LONG) :: Out_0001


  Out_0001 = mod_solve_2d_nonlinearconv_pyccel(u, un, v, vn, nt, nx, ny, &
      dt, dx, dy, c)

end function solve_2d_nonlinearconv_pyccel
!........................................
