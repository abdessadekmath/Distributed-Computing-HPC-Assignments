@types('float[:,:]', 'float[:,:]', 'int', 'float', 'float', 'float', 'float')
def solve_2d_burger_pyccel(u, v, nt, dt, dx, dy, nu):
    
    
    ###Assign initial conditions
    ##set hat function I.C. : u(.5<=x<=1 && .5<=y<=1 ) is 2
    u[int(.5 / dy):int(1 / dy + 1),int(.5 / dx):int(1 / dx + 1)] = 2 
    ##set hat function I.C. : u(.5<=x<=1 && .5<=y<=1 ) is 2
    v[int(.5 / dy):int(1 / dy + 1),int(.5 / dx):int(1 / dx + 1)] = 2
    row, col = u.shape
    
    #fill the update of u and v
    for n in range(nt ): 
  
        for j in range(2, row):
            for i in range(2, col):
            
                u[j-1, i-1] = (u[i-1, j-1] -
                                 dt / dx * u[j-1, i-1] * 
                                 (u[j-1, i-1] - u[j-1, i-2]) - 
                                 dt / dy * v[j-1, i-1] * 
                                 (u[j-1, i-1] - u[j-2, i-1]) + 
                                 nu * dt / dx**2 * 
                                 (u[j-1, i] - 2 * u[j-1, i-1] + u[j-1, i-2]) + 
                                 nu * dt / dy**2 * 
                                 (u[j, i-1] - 2 * u[j-1, i-1] + u[j-2, i-1]))
                
                v[j-1, i-1] = (v[j-1, i-1] - 
                                 dt / dx * u[j-1, i-1] *
                                 (v[j-1, i-1] - v[j-1, i-2]) -
                                 dt / dy * v[j-1, i-1] * 
                                (v[j-1, i-1] - v[j-2, i-1]) + 
                                 nu * dt / dx**2 * 
                                 (v[j-1, i] - 2 * v[j-1, i-1] + v[j-1, i-2]) +
                                 nu * dt / dy**2 *
                                 (v[j, i-1] - 2 * v[j-1, i-1] + v[j-2, i-1]))
        
        u[0, :] = 1
        u[-1, :] = 1
        u[:, 0] = 1
        u[:, -1] = 1
        
        v[0, :] = 1
        v[-1, :] = 1
        v[:, 0] = 1
        v[:, -1] = 1
        
        
    return 0
