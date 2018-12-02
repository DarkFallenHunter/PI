# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'D:\Универ\Программная инженерия\Интерфейс\choosefile.ui'
#
# Created by: PyQt5 UI code generator 5.11.2
#
# WARNING! All changes made in this file will be lost!

from PyQt5 import QtCore, QtGui, QtWidgets

class UiChooseFile(object):
    def setupUi(self, choose_file):
        choose_file.setObjectName("choose_file")
        choose_file.resize(360, 181)
        choose_file.setStyleSheet("background-color: rgb(0, 51, 102);")
        self.choose_file_button = QtWidgets.QPushButton(choose_file)
        self.choose_file_button.setEnabled(True)
        self.choose_file_button.setGeometry(QtCore.QRect(40, 70, 131, 28))
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(9)
        font.setBold(True)
        font.setWeight(75)
        self.choose_file_button.setFont(font)
        self.choose_file_button.setStyleSheet("background-color: qlineargradient(spread:pad, x1:0, y1:0, x2:1, y2:0, stop:0 rgba(255, 255, 255, 255), stop:1 rgba(171,171,171,1));\n"
"border-color: rgb(102, 102, 102);\n"
"border: 2px solid rgb(102, 102, 102);\n"
"border-radius: 6px;\n"
"")
        self.choose_file_button.setObjectName("choose_file_button")
        self.no_choose_file_lable = QtWidgets.QLabel(choose_file)
        self.no_choose_file_lable.setGeometry(QtCore.QRect(190, 75, 131, 20))
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(11)
        font.setBold(True)
        font.setWeight(75)
        self.no_choose_file_lable.setFont(font)
        self.no_choose_file_lable.setStyleSheet("color: rgb(255, 255, 255);")
        self.no_choose_file_lable.setObjectName("no_choose_file_lable")
        self.add_button = QtWidgets.QPushButton(choose_file)
        self.add_button.setEnabled(True)
        self.add_button.setGeometry(QtCore.QRect(50, 120, 111, 41))
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(12)
        font.setBold(True)
        font.setWeight(75)
        self.add_button.setFont(font)
        self.add_button.setStyleSheet("background-color: qlineargradient(spread:pad, x1:0, y1:0, x2:1, y2:0, stop:0 rgba(255, 255, 255, 255), stop:1 rgba(171,171,171,1));\n"
"border-color: rgb(102, 102, 102);\n"
"border: 2px solid rgb(102, 102, 102);\n"
"border-radius: 6px;\n"
"")
        self.add_button.setObjectName("add_button")
        self.cancel_button = QtWidgets.QPushButton(choose_file)
        self.cancel_button.setEnabled(True)
        self.cancel_button.setGeometry(QtCore.QRect(190, 120, 111, 41))
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
        self.choose_file_label = QtWidgets.QLabel(choose_file)
        self.choose_file_label.setGeometry(QtCore.QRect(100, 20, 151, 31))
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(16)
        font.setBold(True)
        font.setWeight(75)
        self.choose_file_label.setFont(font)
        self.choose_file_label.setStyleSheet("color: rgb(255, 255, 255);")
        self.choose_file_label.setObjectName("choose_file_label")

        self.retranslateUi(choose_file)
        QtCore.QMetaObject.connectSlotsByName(choose_file)

    def retranslateUi(self, ChooseFile):
        _translate = QtCore.QCoreApplication.translate
        ChooseFile.setWindowTitle(_translate("choose_file", "Form"))
        self.choose_file_button.setText(_translate("choose_file", "Выбрать файл"))
        self.no_choose_file_lable.setText(_translate("choose_file", "Файл не выбран"))
        self.add_button.setText(_translate("choose_file", "Добавить"))
        self.cancel_button.setText(_translate("choose_file", "Отмена"))
        self.choose_file_label.setText(_translate("choose_file", "Выбор файла"))


if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    choose_file = QtWidgets.QWidget()
    ui = UiChooseFile()
    ui.setupUi(choose_file)
    choose_file.show()
    sys.exit(app.exec_())

