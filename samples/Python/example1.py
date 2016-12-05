# -*- coding: cp1252 -*-

from OpenGL.GL import *
from OpenGL.GLU import *
from OpenGL.GLUT import *

import sys, time 
from math import sin,cos,sqrt,pi

windowSize = [0,0]

def onDraw():

    # Rensa sk�rmen
    
    glClear(GL_COLOR_BUFFER_BIT)

    # Spara aktuell transformations matris 

    glPushMatrix()

    # Skapa en translationsmatris och multiplicera denna
    # med aktuell transformations matris I * T

    glTranslatef(windowSize[0]/2, windowSize[1]/2, 0)
    #glRotatef(30.0, 0.0, 0.0, 1.0)

    # Skapa en GL_QUADS primitiv
    
    # S�tt linjebredden
    
    glLineWidth(2.0)
    
    glBegin(GL_LINES)
    glColor3f(1.0, 0.0, 0.0)
    glVertex2i(-1000,0);
    glVertex2i(1000,0);
    glVertex2i(0,-1000);
    glVertex2i(0, 1000);
    glEnd()
    
    glPushMatrix()
    glTranslatef(40.0, 40.0, 0.0)
    glRotatef(30.0, 0.0, 0.0, 1.0)
    
    glBegin(GL_QUADS)
    glColor3f(1.0, 1.0, 1.0)
    glVertex2i(-20, -20)
    glVertex2i( 20, -20)
    glVertex2i( 20,  20)
    glVertex2i(-20,  20)
    glEnd()
    glPopMatrix()

    glPushMatrix()
    glTranslatef(-40.0, -40.0, 0.0)
    glRotatef(-30.0, 0.0, 0.0, 1.0)
    
    glBegin(GL_QUADS)
    glColor3f(1.0, 1.0, 1.0)
    glVertex2i(-20, -20)
    glVertex2i( 20, -20)
    glVertex2i( 20,  20)
    glVertex2i(-20,  20)
    glEnd()
    glPopMatrix()

    glPopMatrix()

    # V�xla synlig sk�rmbuffert

    glutSwapBuffers()
    

def onKeyboard(key, x, y):

    if ord(key) == 27: # Escape
        sys.exit(0)

    glutPostRedisplay()


def onReshape(width, height):
    global windowSize
    
    windowSize = [width, height]

    # Definiera vyn i sk�rmkoordinater
    
    glViewport(0, 0, width, height)

    # Definierat projektionsmatris

    glMatrixMode(GL_PROJECTION)
    glLoadIdentity()

    # Skapa en projektion som mappar koordinater
    # direkt mot sk�rmkoordinater.
    
    gluOrtho2D(0,width, 0, height)

    # Initiera modelview matrisen till enhetsmatrisen

    glMatrixMode(GL_MODELVIEW)
    glLoadIdentity()

if __name__ == '__main__':

    # Initialisera GLUT
    
    glutInit(sys.argv)

    # Definiera uppritningsl�ge f�r sk�rmbuffert
    
    glutInitDisplayMode( GLUT_RGBA | GLUT_DOUBLE  )

    # Skapa ett OpenGL f�nster

    glutInitWindowPosition(0, 0)
    glutInitWindowSize(300, 300)
    glutCreateWindow("2D Graphics with OpenGL")

    # Tilldela h�ndelserutiner
    
    glutDisplayFunc(onDraw)
    glutReshapeFunc(onReshape)
    glutKeyboardFunc(onKeyboard)

    # G� in i programmets h�ndelseloop

    glutMainLoop()
    
