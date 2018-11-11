# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'D:\Универ\Программная инженерия\Интерфейс\modificationwindow.ui'
#
# Created by: PyQt5 UI code generator 5.11.2
#
# WARNING! All changes made in this file will be lost!

from PyQt5 import QtCore, QtGui, QtWidgets


class UiModificationWindow(object):
    def setupUi(self, modification_window):
        modification_window.setObjectName("modification_window")
        modification_window.resize(401, 361)
        modification_window.setStyleSheet("background-color: rgb(0, 51, 102);")
        self.modification_text = QtWidgets.QTextEdit(modification_window)
        self.modification_text.setGeometry(QtCore.QRect(20, 60, 361, 231))
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(11)
        self.modification_text.setFont(font)
        self.modification_text.setStyleSheet("background-color: rgb(255,255,255);")
        self.modification_text.setObjectName("modification_text")
        self.modification_label = QtWidgets.QLabel(modification_window)
        self.modification_label.setGeometry(QtCore.QRect(0, 20, 401, 21))
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(16)
        font.setBold(False)
        font.setWeight(50)
        self.modification_label.setFont(font)
        self.modification_label.setLayoutDirection(QtCore.Qt.LeftToRight)
        self.modification_label.setStyleSheet("color: rgb(255, 255, 255);")
        self.modification_label.setAlignment(QtCore.Qt.AlignCenter)
        self.modification_label.setObjectName("modification_label")
        self.send_modification_button = QtWidgets.QPushButton(modification_window)
        self.send_modification_button.setEnabled(True)
        self.send_modification_button.setGeometry(QtCore.QRect(30, 310, 161, 33))
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(12)
        font.setBold(True)
        font.setWeight(75)
        self.send_modification_button.setFont(font)
        self.send_modification_button.setStyleSheet("background-color: qlineargradient(spread:pad, x1:0, y1:0, x2:1, y2:0, stop:0 rgba(255, 255, 255, 255), stop:1 rgba(171,171,171,1));\n"
"border-color: rgb(102, 102, 102);\n"
"border: 2px solid rgb(102, 102, 102);\n"
"border-radius: 6px;\n"
"")
        self.send_modification_button.setObjectName("send_modification_button")
        self.cancel_button = QtWidgets.QPushButton(modification_window)
        self.cancel_button.setEnabled(True)
        self.cancel_button.setGeometry(QtCore.QRect(210, 310, 161, 33))
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(12)
        font.setBold(True)
        font.setWeight(75)
        self.cancel_button.setFont(font)
        self.cancel_button.setStyleSheet("background-color: qlineargradient(spread:pad, x1:0, y1:0, x2:1, y2:0, stop:0 rgba(255, 255, 255, 255), stop:1 rgba(171,171,171,1));\n"
"border-color: rgb(102, 102, 102);\n"
"border: 2px solid rgb(102, 102, 102);\n"
"border-radius: 6px;\n"
"")
        self.cancel_button.setObjectName("cancel_button")

        self.retranslateUi(modification_window)
        QtCore.QMetaObject.connectSlotsByName(modification_window)

    def retranslateUi(self, modification_window):
        _translate = QtCore.QCoreApplication.translate
        modification_window.setWindowTitle(_translate("modification_window", "Form"))
        self.modification_label.setText(_translate("modification_window", "Введите описание доработки"))
        self.send_modification_button.setText(_translate("modification_window", "Отправить"))
        self.cancel_button.setText(_translate("modification_window", "Отмена"))


if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    modification_window = QtWidgets.QWidget()
    ui = UiModificationWindow()
    ui.setupUi(modification_window)
    modification_window.show()
    sys.exit(app.exec_())

