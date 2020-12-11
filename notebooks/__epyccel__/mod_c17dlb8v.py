@types('float[:,:]', 'int','float','float','float', 'float')
def solve_2d_linearconv_pyccel(u, nt, dt, dx, dy, c):
   
    row, col = u.shape

    #fill the update of u and v
    for n in range(nt): 
        
        for j in range(1, row):
            for i in range(1, col):
                u[j, i] = (u[j, i] - (c * dt / dx * (u[j, i] - u[j, i - 1])) -(c * dt / dy * (u[j, i] - u[j - 1, i])))                      
                u[0, :] = 1
                u[-1, :] = 1
                u[:, 0] = 1
                u[:, -1] = 1
               
    return 0
