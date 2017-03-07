#!/usr/bin/env python

import numpy as np

from utils import *

if __name__ == "__main__":

    values = np.random.rand(200)
    
    print(meanvariance.__doc__)
    
    mean, variance = meanvariance(values)
    print(mean, variance)
    


    
