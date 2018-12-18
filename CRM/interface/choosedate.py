# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'D:\Универ\Программная инженерия\Интерфейс\choosedate.ui'
#
# Created by: PyQt5 UI code generator 5.11.2
#
# WARNING! All changes made in this file will be lost!

from PyQt5 import QtCore, QtGui, QtWidgets

class UiChooseDate(object):
    def setupUi(self, choose_date):
        choose_date.setObjectName("choose_date")
        choose_date.resize(324, 170)
        choose_date.setStyleSheet("background-color: rgb(0, 51, 102);")
        self.date_label = QtWidgets.QLabel(choose_date)
        self.date_label.setGeometry(QtCore.QRect(90, 20, 141, 31))
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(16)
        font.setBold(True)
        font.setWeight(75)
        self.date_label.setFont(font)
        self.date_label.setStyleSheet("color: rgb(255, 255, 255);")
        self.date_label.setObjectName("date_label")
        self.cancel_button = QtWidgets.QPushButton(choose_date)
        self.cancel_button.setEnabled(True)
        self.cancel_button.setGeometry(QtCore.QRect(180, 110, 111, 41))
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
        self.confirm_button = QtWidgets.QPushButton(choose_date)
        self.confirm_button.setEnabled(True)
        self.confirm_button.setGeometry(QtCore.QRect(40, 110, 111, 41))
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(12)
        font.setBold(True)
        font.setWeight(75)
        self.confirm_button.setFont(font)
        self.confirm_button.setStyleSheet("background-color: qlineargradient(spread:pad, x1:0, y1:0, x2:1, y2:0, stop:0 rgba(255, 255, 255, 255), stop:1 rgba(171,171,171,1));\n"
"border-color: rgb(102, 102, 102);\n"
"border: 2px solid rgb(102, 102, 102);\n"
"border-radius: 6px;\n"
"")
        self.confirm_button.setObjectName("confirm_button")
        self.end_date_text = QtWidgets.QLineEdit(choose_date)
        self.end_date_text.setGeometry(QtCore.QRect(60, 70, 211, 24))
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(12)
        self.end_date_text.setFont(font)
        self.end_date_text.setStyleSheet("background-color: rgb(255, 255, 255);")
        self.end_date_text.setObjectName("end_date_text")

        self.retranslateUi(choose_date)
        QtCore.QMetaObject.connectSlotsByName(choose_date)

    def retranslateUi(self, ChooseDate):
        _translate = QtCore.QCoreApplication.translate
        ChooseDate.setWindowTitle(_translate("choose_date", "Form"))
        self.date_label.setText(_translate("choose_date", "Введите дату"))
        self.cancel_button.setText(_translate("choose_date", "Отмена"))
        self.confirm_button.setText(_translate("choose_date", "Подтвердить"))


if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    choose_date = QtWidgets.QWidget()
    ui = UiChooseDate()
    ui.setupUi(choose_date)
    choose_date.show()
    sys.exit(app.exec_())

