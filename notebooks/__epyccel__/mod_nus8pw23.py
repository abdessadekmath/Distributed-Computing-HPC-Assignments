@types('float[:]', 'float[:]', 'int', 'int', 'float','float', 'float')
def solve_1d_linearconv_pyccel(u, un, nt, nx, dt, dx, c):
    
    for n in range(nt):
        for i in range(1,nx):
            u[i]=u[i]-c*dt/dx*(u[i]-u[i-1])
        un=u

    #fill the update of u
   
    return 0
