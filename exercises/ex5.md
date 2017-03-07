# Exercise 5 - Wrapping an existing Fortran code

We will be reimplementing the Mandelbrot-code found at http://www.fortran90.org/src/rosetta.html#examples. A working code with a CMakeLists.txt file is provided. The CMakeLists.txt also contains a target for building a library of the source code files that the mandelbrot application requires for running. Use this library when building the python module with f2py.

Implement the mandelbrot wrapper in a module. An skeleton module is provided, mandelmod.f90, containing hints on how to complete the implementation. When the wrapper module is implemented, uncomment the section in the CMakeLists.txt file with the f2py target. If everything builds you should have a .so-file in your build directory. 

Implement a python main program that will call the mandelbrot code. A skeleton code is provided, mandelbrot.py.

# Exercise 6 - User interface for our Mandelbrot code

Implement a simple user interface for our Mandelbrot code. The user interface should:

 1. Show a window with widgets for iteration and density.
 2. Implement a button which asks for a filename, executes the calculation and displays the image in the window.

Images can be displayed in the user interface using a label widget. The follwing code shows how this can be done in PyQt5:

Modify your import section of your code:

    # -*- coding: utf-8 -*-
    
    import sys
    
    from PyQt5.QtWidgets import *
    from PyQt5.QtGui import QPixmap # --- Required for QPixmap
    from PyQt5 import uic
    
Load the image using the following code:

    # ---- Load image in pixmap of label

    pixmap = QPixmap(filename)
    self.ui.imageLabel.setPixmap(pixmap)
    
imageLabel is the QLabel widget defined in the .ui-file.

