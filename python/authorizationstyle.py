# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'D:\Универ\Программная инженерия\Интерфейс\authorizationwindow.ui'
#
# Created by: PyQt5 UI code generator 5.11.2
#
# WARNING! All changes made in this file will be lost!

from PyQt5 import QtCore, QtGui, QtWidgets


class UiAuthorizationWindow(object):
    def setupUi(self, authorization_window):
        authorization_window.setObjectName("authorization_window")
        authorization_window.resize(481, 271)
        authorization_window.setMinimumHeight(271)
        authorization_window.setMinimumWidth(481)
        authorization_window.setMaximumHeight(271)
        authorization_window.setMaximumWidth(481)
        authorization_window.setAutoFillBackground(False)
        authorization_window.setStyleSheet("background-color: rgb(0, 51, 102);")
        self.centralwidget = QtWidgets.QWidget(authorization_window)
        self.centralwidget.setObjectName("centralwidget")
        self.login_text = QtWidgets.QLineEdit(self.centralwidget)
        self.login_text.setGeometry(QtCore.QRect(170, 100, 221, 24))
        font = QtGui.QFont()
        font.setFamily("Dubai")
        font.setPointSize(14)
        self.login_text.setFont(font)
        self.login_text.setAutoFillBackground(False)
        self.login_text.setStyleSheet("background-color: rgb(255, 255, 255);")
        self.login_text.setText("")
        self.login_text.setObjectName("login_text")
        self.label = QtWidgets.QLabel(self.centralwidget)
        self.label.setGeometry(QtCore.QRect(90, 100, 61, 16))
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(15)
        font.setBold(True)
        font.setWeight(75)
        self.label.setFont(font)
        self.label.setStyleSheet("color: rgb(255, 255, 255);")
        self.label.setObjectName("label")
        self.label_2 = QtWidgets.QLabel(self.centralwidget)
        self.label_2.setGeometry(QtCore.QRect(73, 140, 81, 21))
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(15)
        font.setBold(True)
        font.setWeight(75)
        self.label_2.setFont(font)
        self.label_2.setStyleSheet("color: rgb(255, 255, 255);")
        self.label_2.setObjectName("label_2")
        self.password_text = QtWidgets.QLineEdit(self.centralwidget)
        self.password_text.setGeometry(QtCore.QRect(170, 140, 221, 24))
        font = QtGui.QFont()
        font.setFamily("Dubai")
        font.setPointSize(14)
        self.password_text.setFont(font)
        self.password_text.setAutoFillBackground(False)
        self.password_text.setStyleSheet("background-color: rgb(255, 255, 255);")
        self.password_text.setText("")
        self.password_text.setObjectName("password_text")
        self.label_3 = QtWidgets.QLabel(self.centralwidget)
        self.label_3.setGeometry(QtCore.QRect(50, 40, 381, 31))
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(20)
        font.setBold(True)
        font.setWeight(75)
        self.label_3.setFont(font)
        self.label_3.setStyleSheet("color: rgb(255, 255, 255);")
        self.label_3.setObjectName("label_3")
        self.entrance_button = QtWidgets.QPushButton(self.centralwidget)
        self.entrance_button.setEnabled(True)
        self.entrance_button.setGeometry(QtCore.QRect(175, 190, 131, 41))
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(14)
        font.setBold(True)
        font.setWeight(75)
        self.entrance_button.setFont(font)
        self.entrance_button.setStyleSheet("background-color: qlineargradient(spread:pad, x1:0, y1:0, x2:1, y2:0, stop:0 rgba(255, 255, 255, 255), stop:1 rgba(125,125,125,1));\n"
"border-color: rgb(102, 102, 102);\n"
"border: 2px solid rgb(102, 102, 102);\n"
"border-radius: 6px;\n"
"")
        self.entrance_button.setObjectName("entrance_button")
        authorization_window.setCentralWidget(self.centralwidget)
        self.retranslateUi(authorization_window)
        QtCore.QMetaObject.connectSlotsByName(authorization_window)

    def retranslateUi(self, authorization_window):
        _translate = QtCore.QCoreApplication.translate
        authorization_window.setWindowTitle(_translate("authorization_window", "MainWindow"))
        self.label.setText(_translate("authorization_window", "Логин"))
        self.label_2.setText(_translate("authorization_window", "Пароль"))
        self.label_3.setText(_translate("authorization_window", "Авторизируйтесь в системе"))
        self.entrance_button.setText(_translate("authorization_window", "Войти"))


if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    authorization_window = QtWidgets.QMainWindow()
    ui = UiAuthorizationWindow()
    ui.setupUi(authorization_window)
    authorization_window.show()
    sys.exit(app.exec_())

