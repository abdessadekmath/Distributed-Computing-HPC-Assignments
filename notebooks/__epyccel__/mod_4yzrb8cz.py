@types('float[:]', 'int', 'int', 'float','float', 'float')
def solve_1d_linearconv_pyccel(u, nt, nx, dt, dx, c):
    

    #fill the update of u
    for n in range(nt):
        for i in range(1,nx):
            u[i]=u[i]-c*dt/dx*(u[i]-u[i-1])
            
    return 0
