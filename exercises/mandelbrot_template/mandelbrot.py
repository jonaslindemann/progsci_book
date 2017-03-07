#!/usr/bin/env python

# ---- Modify this section to the location of your python .so-module.

import sys
sys.path.append("build") 

import numpy as np
import matplotlib.pyplot as plt

# ---- Import fortran extension module

from mandelmod import *

if __name__ == "__main__":

    # ---- Create an array, dfractal, to pass to the Fortran code [1000x1000] using
    # ---- Fortran ordering
   
    dfractal = np.zeros((1000,1000), order = 'F')
    
    print(mandelmod.mandelbrot_sim.__doc__)
    
    mandelmod.mandelbrot_sim(100,dfractal)
    
    print(dfractal[0,0])
    
    # ---- Call your Mandelbrot function here
    
    # x_min, .... = ....
    
    # ---- Plot the result using matplotlib
    
    plt.imshow(dfractal, cmap=plt.cm.hot, extent=(x_min, x_max, y_min, y_max))
    plt.title('Mandelbrot Set')
    plt.xlabel('Re(z)')
    plt.ylabel('Im(z)')
    plt.savefig("mandelbrot.png")
    plt.show()
    
    

    


    
