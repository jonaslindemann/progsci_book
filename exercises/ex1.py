#!/usr/bin/env python

import sys, math

if __name__ == '__main__':

    if len(sys.argv)==1:
        print("Too few arguments.")
        sys.exit(-1)
        
    args = sys.argv[1:]
    
    values = [float(x) for x in args]
        
    for value in values:
        print("sin(%g)=%g" % (value, math.sin(value)))
