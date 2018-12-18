# -*- coding: utf-8 -*-
"""
Created on Wed May  2 00:34:36 2018

@author: Hunte
"""

from PyQt5 import QtCore, QtGui, QtWidgets
import sys


class UiLoadingWindow(object):
    def setupUi(self, loading_window):
        loading_window.setObjectName('loading_window')
        loading_window.resize(400, 200)
        self.centralwidget = QtWidgets.QWidget(loading_window)
        self.centralwidget.setObjectName("centralwidget")
        self.movie_screen = QtWidgets.QLabel(self.centralwidget)
        self.movie = QtGui.QMovie('..\\interface\\loading.gif', QtCore.QByteArray(), self.centralwidget)
        self.movie.setSpeed(100)
        self.movie_screen.setMovie(self.movie)
        self.movie.start()
        self.movie.setObjectName('movie')
        self.movie_screen.setGeometry(QtCore.QRect(150, 20, 100, 100))
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(12)
        font.setBold(True)
        font.setItalic(False)
        font.setUnderline(False)
        font.setWeight(75)
        font.setStrikeOut(False)
        self.movie_screen.setFont(font)
        self.movie_screen.setObjectName('movie_screen')

    def retranslateUi(self, loading_window):
        _translate = QtCore.QCoreApplication.translate
        loading_window.setWindowTitle(_translate('loading_window', 'Загрузка...'))
        self.loading_label.setText(_translate('movie_screen', 'Ожидание подсчета стоимости'))


if __name__ == '__main__':
    app = QtWidgets.QApplication(sys.argv)
    dialog_1 = QtWidgets.QWidget()
    ui = UiLoadingWindow()
    ui.setupUi(dialog_1)
    dialog_1.show()
    sys.exit(app.exec_())
