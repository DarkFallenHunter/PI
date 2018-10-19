# -*- coding: utf-8 -*-
"""
Created on Wed May  2 00:34:36 2018

@author: Hunte
"""

import sys
import openpyxl
import pandas as pd
import pyodbc
from authorizationwindow import Ui_authorization_window

from PyQt5 import QtCore, QtGui, QtWidgets

class MyWin(QtWidgets.QMainWindow):
    def __init__(self, parent=None):
        QtWidgets.QWidget.__init__(self, parent)
        self.ui = Ui_authorization_window()
        self.ui.setupUi(self)

if __name__ == "__main__":
    app = QtWidgets.QApplication(sys.argv)
    myapp = MyWin()
    myapp.show()
    sys.exit(app.exec_())

