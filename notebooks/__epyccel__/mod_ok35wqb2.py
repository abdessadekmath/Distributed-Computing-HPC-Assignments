@types('float[:]', 'int', 'int', 'float', 'float', 'float')
def solve_1d_burger_pyccel(u, un, nt, nx, dt, dx, nu):
    
    #fill the update of u
    
    for n in range(nt):
        for i in range(1,nx-1):
            u[i]=u[i]-dt/dx*u[i]*(u[i]-u[i-1])+nu*dt/dx**2*(u[i+1]-2*u[i]+u[i-1])
            
    return 0
