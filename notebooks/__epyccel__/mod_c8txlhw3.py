@types('float[:]', 'int', 'float', 'float','float', 'float')
def solve_2d_diff_pyccel(u, nt, dt, dx, dy, nu):
    row, col = u.shape
    
    ##Assign initial conditions
    #set hat function I.C. : u(.5<=x<=1 && .5<=y<=1 ) is 2
    u[int(.5 / dy):int(1 / dy + 1),int(.5 / dx):int(1 / dx + 1)] = 2
    
    
    #fill the update of u and v
    for n in range(nt): 
        for j in range(row):
            for i in range(2, col):
                u[j-1, i-1] = (u[j-1, i-1] + nu * dt / dx**2 * (u[j-1, i] - 2 * u[j-1, i-1] + u[j-1,i-2]) + 
                             nu * dt / dy**2 * (u[j, i-1] - 2 * u[j-1, i-1] + u[j-2,i-1]))
                                      
        u[0, :] = 1
        u[-1, :] = 1
        u[:, 0] = 1
        u[:, -1] = 1
        
    return 0
