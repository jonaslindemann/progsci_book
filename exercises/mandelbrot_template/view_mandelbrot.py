#!/usr/bin/env python

# From http://www.fortran90.org/src/rosetta.html

from numpy import loadtxt
import matplotlib.pyplot as plt

fractal = loadtxt("build/fractal.dat")
x_min, x_max, y_min, y_max = loadtxt("build/coord.dat")

plt.imshow(fractal, cmap=plt.cm.hot,
    extent=(x_min, x_max, y_min, y_max))
plt.title('Mandelbrot Set')
plt.xlabel('Re(z)')
plt.ylabel('Im(z)')
plt.savefig("mandelbrot.png")
plt.show()
           
