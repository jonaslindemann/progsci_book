# -*- coding: utf-8 -*-

import sys

from PyQt5.QtWidgets import *
from PyQt5.QtGui import QPixmap
from PyQt5 import uic

import sys
sys.path.append("mandelbrot/build") 

import numpy as np
import matplotlib.pyplot as plt
from mandelmod import *

class MainWindow:
    """Main window class for the Mandelbrot application"""

    def __init__(self, app):
        """Class constructor"""

        # ---- Assign our application instance as a member variable
        
        self.app = app
                
        # ---- Load and show our user interface
        
        self.ui = uic.loadUi('mainwindow.ui')
        
        # ---- Connect user interface to controls
        
        self.ui.actionFileExit.triggered.connect(self.onFileExit)
        self.ui.runButton.clicked.connect(self.onRunButtonClicked)
        
        self.ui.show()
        self.ui.raise_()
        
    def onFileExit(self, event):
        self.ui.close()
        
    def onRunButtonClicked(self, event):
    
        # ---- Get values from user interface
    
        iterations = self.ui.iterationSlider.value()
        density = self.ui.densitySlider.value()
        
        # ---- Ask for filename
    
        filename, _ = QFileDialog.getSaveFileName(
            self.ui, 'Save file', '', 'PNG files (*.png)')        
            
        if filename=="":
            return
            
        # ---- Create dfractal array
    
        dfractal = np.zeros((density,density), order = 'F')
        
        # ---- Run simulation
        
        x_min, x_max, y_min, y_max = mandelmod.mandelbrot_sim(iterations, dfractal)
        
        # ---- Plot results
        
        plt.imshow(dfractal, cmap=plt.cm.hot, extent=(x_min, x_max, y_min, y_max))
        plt.title('Mandelbrot Set')
        plt.xlabel('Re(z)')
        plt.ylabel('Im(z)')
        plt.savefig(filename)
        
        # ---- Load image in pixmap of label
        
        pixmap = QPixmap(filename)        
        
        self.ui.imageLabel.setPixmap(pixmap)
        
                                     

if __name__ == '__main__':

    app = QApplication(sys.argv)

    window = MainWindow(app)
    
    sys.exit(app.exec_())
