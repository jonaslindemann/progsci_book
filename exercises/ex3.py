#!/usr/bin/env python

import numpy as np

def meanAndVariance(values):
    
    n = len(values)
    mean = np.sum(values)/n
    variance = (1/(n-1))*np.sum(values**2 - mean)

    return mean, variance

if __name__ == "__main__":

    values = np.random.rand(200)
    
    mean, variance = meanAndVariance(values)
    print(mean, variance)
    


    
