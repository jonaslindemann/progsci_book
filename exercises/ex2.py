#!/usr/bin/env python

import sys

if __name__ == "__main__":

    inputFile = open("input.dat", "r")
    
    table = []
    
    for line in inputFile:
        values = [float(v) for v in line.strip().split()]
        table.append(values)
        
    inputFile.close()
    
    outputFile = open("output.dat", "w")
    
    for values in table:
        f = values[0] + values[1]
        outputFile.write("%g\n" % f)
    
    outputFile.close()
        
