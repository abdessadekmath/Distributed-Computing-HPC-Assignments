@types('float[:,:]', 'float[:,:]','float[:,:]','float[:,:]', 'int', 'int', 'int','float','float','float', 'float')
def solve_2d_nonlinearconv_pyccel(u, un, v, vn, nt, nx, ny, dt, dx, dy, c):

    ###Assign initial conditions
    ##set hat function I.C. : u(.5<=x<=1 && .5<=y<=1 ) is 2
    u[int(.5 / dy):int(1 / dy + 1), int(.5 / dx):int(1 / dx + 1)] = 2
    ##set hat function I.C. : v(.5<=x<=1 && .5<=y<=1 ) is 2
    v[int(.5 / dy):int(1 / dy + 1), int(.5 / dx):int(1 / dx + 1)] = 2
    row, col = u.shape
    
    #fill the update of u and v
    for n in range(1,row):
        for i in range(1,col):
            for j in range(ny):
                u[i,j]=u[i,j]-c*(dt/dx*u[i,j]*(u[i,j]-u[i-1,j])+dt/dy*v[i,j]*(u[i,j]-u[i,j-1]))
                v[i,j]=v[i,j]-c*(dt/dx*u[i,j]*(v[i,j]-v[i-1,j])+dt/dy*v[i,j]*(v[i,j]-v[i,j-1]))
        un=u
        vn=v   
        
    
        
    return 0
