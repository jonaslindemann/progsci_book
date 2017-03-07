#!/usr/bin/env python

import sys
sys.path.append("mandelbrot/build") 

import numpy as np
import matplotlib.pyplot as plt
from mandelmod import *

if __name__ == "__main__":

    print(mandelmod.mandelbrot_sim.__doc__)
    
    dfractal = np.zeros((1000,1000), order = 'F')
    
    x_min, x_max, y_min, y_max = mandelmod.mandelbrot_sim(100, dfractal)
    
    plt.imshow(dfractal, cmap=plt.cm.hot, extent=(x_min, x_max, y_min, y_max))
    plt.title('Mandelbrot Set')
    plt.xlabel('Re(z)')
    plt.ylabel('Im(z)')
    plt.savefig("mandelbrot.png")
    plt.show()
    
    

    


    
