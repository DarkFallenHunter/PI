# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'D:\Универ\Программная инженерия\Интерфейс\viewmodelwindow.ui'
#
# Created by: PyQt5 UI code generator 5.11.2
#
# WARNING! All changes made in this file will be lost!

from PyQt5 import QtCore, QtGui, QtWidgets


class UiViewModelWindow(object):
    def setupUi(self, view_model_window):
        view_model_window.setObjectName("view_model_window")
        view_model_window.resize(751, 561)
        view_model_window.setStyleSheet("background-color: rgb(0, 51, 102);")
        self.view_model_frame = QtWidgets.QFrame(view_model_window)
        self.view_model_frame.setGeometry(QtCore.QRect(19, 19, 721, 531))
        self.view_model_frame.setFrameShape(QtWidgets.QFrame.StyledPanel)
        self.view_model_frame.setFrameShadow(QtWidgets.QFrame.Raised)
        self.view_model_frame.setObjectName("view_model_frame")

        self.retranslateUi(view_model_window)
        QtCore.QMetaObject.connectSlotsByName(view_model_window)

    def retranslateUi(self, view_model_window):
        _translate = QtCore.QCoreApplication.translate
        view_model_window.setWindowTitle(_translate("view_model_window", "Form"))


if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    view_model_window = QtWidgets.QWidget()
    ui = UiViewModelWindow()
    ui.setupUi(view_model_window)
    view_model_window.show()
    sys.exit(app.exec_())

