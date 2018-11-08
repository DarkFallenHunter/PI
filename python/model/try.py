# -*- coding: utf-8 -*-
"""
Created on Wed May  2 00:34:36 2018

@author: Hunte
"""

import sys
from PyQt5 import QtGui, QtCore, QtWidgets


class Example(QtWidgets.QWidget):
    def __init__(self):
        QtWidgets.QWidget.__init__(self)
        self.setFixedWidth(200)
        self.setFixedHeight(50)
        telephone_list = ["+7-916-123-34-18", "+7-985-726-94-13"]
        self.combo = QtWidgets.QLineEdit(self)
        self.completer = QtWidgets.QCompleter(telephone_list, self.combo)
        self.completer.setCaseSensitivity(QtCore.Qt.CaseInsensitive)
        self.combo.setCompleter(self.completer)
        self.combo.setFixedWidth(200)

    def findText(self, s):
        index = self.combo.findText(s)
        if index > -1:
            self.combo.setCurrentIndex(index)


if __name__ == '__main__':
    app = QtWidgets.QApplication(sys.argv)
    ex = Example()
    ex.show()
    sys.exit(app.exec_())
