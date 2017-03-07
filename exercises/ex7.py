# -*- coding: utf-8 -*-

import sys

import numpy as np
import matplotlib.pyplot as plt

# ---- Ex1

plt.figure()
plt.plot([1,2,3,4])

# ---- Ex2
    
plt.figure()
plt.plot([1,2,3,4],[1,4,9,16])

# ---- Ex3

plt.figure()
plt.plot([1,2,3,4], [1,4,9,16], 'ro')
plt.axis([0, 6, 0, 20])
plt.savefig('secondfig.png')

# ---- Ex4

plt.figure()

x = np.arange(0.0, 2*np.pi, 0.1)
y = np.sin(x)

x1 = np.arange(0.0, 2*np.pi, 0.1)
y1 = np.cos(x1)

x2 = np.arange(0.0, 2*np.pi, 0.1)
y2 = np.sin(2*x2)

plt.plot(x, y, linewidth=2.0)  

line, = plt.plot(x, y, 'o')
line.set_antialiased(False) # turn off antialising

lines = plt.plot(x1, y1, x2, y2) 
plt.setp(lines, 'color', 'r', 'linewidth', 2.0)

# ---- Ex5

def f(t):
    s1 = np.cos(2*np.pi*t)
    e1 = np.exp(-t)
    return np.multiply(s1,e1)

t1 = np.arange(0.0, 5.0, 0.1)
t2 = np.arange(0.0, 5.0, 0.02)

plt.figure()
plt.subplot(211)
plt.plot(t1, f(t1), 'bo', t2, f(t2), 'k')

plt.subplot(212)
plt.plot(t2, np.cos(2*np.pi*t2), 'r--')

# ---- Ex6

plt.figure()
font = {'fontname'   : 'Courier',
        'color'      : 'r',
        'fontweight' : 'bold',
        'fontsize'   : 11}

plt.plot([1,2,3])
plt.title('A title', font, fontsize=12)
plt.text(0.5, 2.5, 'a line', font, color='k')
plt.xlabel('time (s)', font)
plt.ylabel('voltage (mV)', font)

# ---- Ex7

t = np.arange(0.0, 2.0, 0.01)
s = np.sin(2*np.pi*t)
plt.plot(t,s)
plt.title(r'$\alpha_i > \beta_i$', fontsize=20)
plt.text(1, -0.6, r'$\sum_{i=0}^\infty x_i$', fontsize=20)
plt.text(0.6, 0.6, r'$\cal{A}\rm{sin}(2 \omega t)$', 
     fontsize=20)
plt.xlabel('time (s)')
plt.ylabel('volts (mV)')
plt.savefig('mathtext_tut', dpi=50)

plt.show()




