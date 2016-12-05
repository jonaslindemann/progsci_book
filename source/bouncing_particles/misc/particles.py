from Tkinter import *
from math import *
import random, time

class Vector(object):
    def __init__(self, vx = 0.0, vy = 0.0):
        self._v = [vx, vy]
                
    def __str__(self):
        return "(%g, %g)" % (self._v[0], self._v[1])
        
    def __eq__(self, v):
        return (self._v[0] == v._v[0]) and (self._v[1] == v._v[1])
        
    def __setitem__(self, i, v):
        self._v[i] = v
        
    def __getitem__(self, i):
        return self._v[i]
                
    def __add__(self, v):
        vv = Vector(self._v[0], self._v[1])
        if isinstance(v, Vector):
            vv._v[0] += v._v[0]
            vv._v[1] += v._v[1]
        else:
            vv._v[0] += v    
            vv._v[1] += v    
        
        return vv
        
    def __sub__(self, v):
        vv = Vector(self._v[0], self._v[1])
        if isinstance(v, Vector):
            vv._v[0] -= v._v[0]
            vv._v[1] -= v._v[1]
        else:
            vv._v[0] -= v    
            vv._v[1] -= v    
        
        return vv
    
    def __mul__(self, v):
        """self * v"""
        vv = Vector(self._v[0], self._v[1])
        if isinstance(v, Vector):
            A = self._v[0]*v._v[0] + self._v[1]*v._v[1]
            return A
        else:
            vv._v[0] = self._v[0]*v
            vv._v[1] = self._v[1]*v
            return vv
    
    def __rmul__(self, v):
        """v * self"""
        vv = Vector(self._v[0], self._v[1])
        if isinstance(v, Vector):
            A = self._v[0]*v._v[0] + self._v[1]*v._v[1]
            return A
        else:
            vv._v[0] = self._v[0]*v
            vv._v[1] = self._v[1]*v
            return vv
        
    def length(self):
        return sqrt(pow(self._v[0],2)+pow(self._v[1],2))
        
    def getX(self):
        return self._v[0]
        
    def getY(self):
        return self._v[1]
        
    def setX(self, v):
        self._v[0] = v
    
    def setY(self, v):
        self._v[1] = v
        
    x = property(getX, setX)
    y = property(getY, setY)
    
class Particle(object):
    canvas = None
    scaleX = 500.0
    scaleY = 500.0
    def __init__(self, v0 = 0.1, r = 0.01):
        x = random.random()
        y = random.random()
        alfa = random.random() * 2 * pi

        self.s = Vector(x, y)
        self.v = Vector(v0*cos(alfa), v0*sin(alfa))
        self.r = r
        
        self.id = Particle.canvas.create_oval(-4, -4, 4, 4, fill="white")
        self.updateOval()
        
    def updateOval(self):
        Particle.canvas.coords(self.id,
                               int(self.s.x*Particle.scaleX-self.r*Particle.scaleX),
                               int(self.s.y*Particle.scaleY-self.r*Particle.scaleX),
                               int(self.s.x*Particle.scaleX+self.r*Particle.scaleX),
                               int(self.s.y*Particle.scaleY+self.r*Particle.scaleX)
                               )
        
    def __str__(self):
        return "s = " + str(self.s) + ", v = " + str(self.v) + ", r = " + str(self.r)
        
    def move(self, dt):
        self.s += self.v*dt
        self.updateOval()
        
    def isCloseToWall(self):
        if (self.s.x<self.r) and (self.v.x<0):
            return True
        if (self.s.x>1-self.r) and (self.v.x>0):
            return True
        if (self.s.y<self.r) and (self.v.y<0):
            return True
        if (self.s.y>1-self.r) and (self.v.y>0):
            return True
        return False
    
    def bounceWall(self):
        if (self.s.x<self.r) and (self.v.x<0):
            self.v.x = -self.v.x
        if (self.s.x>1-self.r) and (self.v.x>0):
            self.v.x = -self.v.x
        if (self.s.y<self.r) and (self.v.y<0):
            self.v.y = -self.v.y
        if (self.s.y>1-self.r) and (self.v.y>0):
            self.v.y = -self.v.y
            
    def collide(self, p):
        normal = p.s - self.s
        vdiff = p.v -self.v
        if (normal.length()<p.r+self.r) and (normal * vdiff < 0):
            k = vdiff*normal/(normal*normal)
            self.v = self.v + normal*k
            p.v = p.v - normal*k
        
class Box(object):
    def __init__(self, n=1000, canvas=None):
        self._canvas = canvas
        Particle.canvas = canvas
        self.n = n
        
        self._width = 500
        self._height = 500
        
        self.particles = []
        for i in xrange(n):
            self.particles.append(Particle(r=0.01))
            
    def printParticles(self):
        for p in self.particles:
            print p
            
    def update(self):
        for p in self.particles:
            if p.isCloseToWall():
                p.bounceWall()
                
        for i in xrange(self.n):
            for j in xrange(i+1,self.n):
                self.particles[i].collide(self.particles[j])
        
        for p in self.particles:
            p.move(0.01/3/0.1)
            
        #self.printParticles()
        
    def setWidth(self, width):
        Particle.scaleX = self._width
        self._width = width
        
    def setHeight(self, height):
        Particle.scaleY = self._height
        self._height = height
        
    def getWidth(self):
        return self._width
    
    def getHeight(self):
        return self._height
            
    width = property(getWidth, setWidth)
    height = property(getHeight, setHeight)
    
class ParticleSimulation:
    def __init__(self, parent):
        random.seed()
        self._parent = parent
        
        self._canvas = Canvas(parent, width=500, height=500, bg="black")
        self._canvas.pack(expand=YES, fill=BOTH)
        
        self._box = Box(1000, self._canvas)
        parent.update() # fix geometry

        self._parent.bind("<Configure>", self.onResize)
        
    def onResize(self, event=None):
        self._box.width = self._canvas.winfo_height()
        self._box.height = self._canvas.winfo_height()
        
    def run(self):
        try:
            while 1:
            	t0 = time.time()
                self._box.update()
                self._canvas.update_idletasks()
                self._parent.update() # process events
                t1 = time.time()
                print 1/(t1-t0)
        except TclError:
            pass # to avoid errors when the window is closed
        
    
if __name__ == '__main__':
        
    root = Tk()
    particleSimulation = ParticleSimulation(root)
    particleSimulation.run()
        
