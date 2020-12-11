@types('float[:]', 'int', 'int', 'float','float')
def solve_1d_nonlinearconv_pyccel(u, nt, nx, dt, dx):

    #fill the update of u
    
    for n in range(nt):
        for i in range(1,nx):
            u[i]=u[i]-dt/dx*u[i]*(u[i]-u[i-1])
    
    return 0
