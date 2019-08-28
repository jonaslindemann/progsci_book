#!/usr/bin/env python

from numpy import *
from pylab import *

stateFilename = "./particle.state"

stateFile = open(stateFilename, 'r')
nParticles = int(stateFile.readline())

particleDict = {}

line = stateFile.readline()

j = 0

while line:
	j+=1
	print("Reading particle trace,", j)
	for i in range(nParticles):
		pos = [float(item) for item in line.strip().split()]
		if i in particleDict:
			particleDict[i].append(pos)
		else:
			particleDict[i] = []
			particleDict[i].append(pos)
		
		line = stateFile.readline()

	if line:
		nParticles = int(line.strip())
		line = stateFile.readline()
	
stateFile.close()

for i in range(nParticles):
	p = asarray(particleDict[i])
	plot(p[:,0],p[:,1])
	
show()