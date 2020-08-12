#!/usr/bin/env python

from Tkinter import *
from math import *
from numpy import *
from particle import *

import time


class Particle(object):
    canvas = None
    scaleX = 1000.0
    scaleY = 1000.0
    positions = None
    sizes = None

    def __init__(self, i):
        self._i = i
        self.id = Particle.canvas.create_oval(-4, -4, 4, 4, fill="white")
        self.update()

    def update(self):
        Particle.canvas.coords(self.id,
                               int(Particle.positions[self._i, 0]*Particle.scaleX -
                                   Particle.sizes[self._i]*Particle.scaleX),
                               int(Particle.positions[self._i, 1]*Particle.scaleY -
                                   Particle.sizes[self._i]*Particle.scaleX),
                               int(Particle.positions[self._i, 0]*Particle.scaleX +
                                   Particle.sizes[self._i]*Particle.scaleX),
                               int(Particle.positions[self._i, 1]*Particle.scaleY +
                                   Particle.sizes[self._i]*Particle.scaleX)
                               )


class Particles:
    def __init__(self, nParticles, positions, sizes):
        self._positions = positions
        self._sizes = sizes
        self._particles = []

        Particle.positions = self._positions
        Particle.sizes = self._sizes

        for i in range(nParticles):
            p = Particle(i)
            self._particles.append(p)

    def update(self):
        for p in self._particles:
            p.update()


class ParticleSimulation:
    def __init__(self, parent):
        random.seed()
        self._parent = parent
        self._canvas = Canvas(parent, width=1000, height=1000, bg="black")
        self._canvas.pack(expand=YES, fill=BOTH)

        parent.update()  # fix geometry

        self._parent.bind("<Configure>", self.onResize)

        nParticles = 100

        self._positions = zeros([nParticles, 2], 'd', order='F')
        self._sizes = zeros([nParticles], 'd', order='F')

        print("Initialise system...")

        particle_driver.init_system(nParticles)
        particle_driver.get_sizes(self._sizes)
        particle_driver.get_positions(self._positions)

        Particle.canvas = self._canvas

        self._particles = Particles(nParticles, self._positions, self._sizes)

    def onResize(self, event=None):
        pass
        #self._box.width = self._canvas.winfo_height()
        #self._box.height = self._canvas.winfo_height()

    def run(self):

        step = 0

        try:
            while 1:
                t0 = time.time()
                particle_driver.collision_check()
                particle_driver.boundary_check()
                particle_driver.update()
                particle_driver.get_positions(self._positions)
                self._particles.update()
                self._canvas.update_idletasks()
                self._parent.update()  # process events
                t1 = time.time()
                print(t1-t0)
        except TclError:
            pass  # to avoid errors when the window is closed


if __name__ == '__main__':

    root = Tk()
    particleSimulation = ParticleSimulation(root)
    particleSimulation.run()
