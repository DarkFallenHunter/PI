# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'C:\Users\Hunte\Downloads\make_application.ui'
#
# Created by: PyQt5 UI code generator 5.11.3
#
# WARNING! All changes made in this file will be lost!

from PyQt5 import QtCore, QtGui, QtWidgets

class Ui_MakeApplication(object):
    def setupUi(self, MakeApplication):
        MakeApplication.setObjectName("MakeApplication")
        MakeApplication.resize(475, 356)
        MakeApplication.setStyleSheet("background-color: rgb(0, 51, 102);")
        self.type_material_label = QtWidgets.QLabel(MakeApplication)
        self.type_material_label.setGeometry(QtCore.QRect(102, 90, 121, 16))
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(12)
        font.setBold(True)
        font.setWeight(75)
        self.type_material_label.setFont(font)
        self.type_material_label.setStyleSheet("color: rgb(255, 255, 255);")
        self.type_material_label.setObjectName("type_material_label")
        self.cancel_button = QtWidgets.QPushButton(MakeApplication)
        self.cancel_button.setEnabled(True)
        self.cancel_button.setGeometry(QtCore.QRect(260, 290, 111, 41))
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
        self.color_material_label = QtWidgets.QLabel(MakeApplication)
        self.color_material_label.setGeometry(QtCore.QRect(92, 140, 131, 16))
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(12)
        font.setBold(True)
        font.setWeight(75)
        self.color_material_label.setFont(font)
        self.color_material_label.setStyleSheet("color: rgb(255, 255, 255);")
        self.color_material_label.setObjectName("color_material_label")
        self.diametr_combobox = QtWidgets.QComboBox(MakeApplication)
        self.diametr_combobox.setGeometry(QtCore.QRect(262, 188, 151, 24))
        font = QtGui.QFont()
        font.setPointSize(14)
        self.diametr_combobox.setFont(font)
        self.diametr_combobox.setStyleSheet("background:rgb(255, 255, 255)")
        self.diametr_combobox.setObjectName("diametr_combobox")
        self.supply_label = QtWidgets.QLabel(MakeApplication)
        self.supply_label.setGeometry(QtCore.QRect(145, 28, 191, 31))
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(16)
        font.setBold(True)
        font.setWeight(75)
        self.supply_label.setFont(font)
        self.supply_label.setStyleSheet("color: rgb(255, 255, 255);")
        self.supply_label.setObjectName("supply_label")
        self.color_combobox = QtWidgets.QComboBox(MakeApplication)
        self.color_combobox.setGeometry(QtCore.QRect(262, 138, 151, 24))
        font = QtGui.QFont()
        font.setPointSize(14)
        self.color_combobox.setFont(font)
        self.color_combobox.setStyleSheet("background:rgb(255, 255, 255)")
        self.color_combobox.setObjectName("color_combobox")
        self.type_combobox = QtWidgets.QComboBox(MakeApplication)
        self.type_combobox.setGeometry(QtCore.QRect(262, 88, 151, 24))
        font = QtGui.QFont()
        font.setPointSize(14)
        self.type_combobox.setFont(font)
        self.type_combobox.setStyleSheet("background:rgb(255, 255, 255)")
        self.type_combobox.setObjectName("type_combobox")
        self.add_button = QtWidgets.QPushButton(MakeApplication)
        self.add_button.setEnabled(True)
        self.add_button.setGeometry(QtCore.QRect(112, 290, 111, 41))
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
        self.amount_material_label = QtWidgets.QLabel(MakeApplication)
        self.amount_material_label.setGeometry(QtCore.QRect(36, 242, 191, 16))
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(12)
        font.setBold(True)
        font.setWeight(75)
        self.amount_material_label.setFont(font)
        self.amount_material_label.setStyleSheet("color: rgb(255, 255, 255);")
        self.amount_material_label.setObjectName("amount_material_label")
        self.numer_lineedit = QtWidgets.QLineEdit(MakeApplication)
        self.numer_lineedit.setGeometry(QtCore.QRect(262, 240, 151, 24))
        font = QtGui.QFont()
        font.setPointSize(14)
        self.numer_lineedit.setFont(font)
        self.numer_lineedit.setStyleSheet("background:rgb(255, 255, 255)")
        self.numer_lineedit.setObjectName("numer_lineedit")
        self.diametr_yarn_label = QtWidgets.QLabel(MakeApplication)
        self.diametr_yarn_label.setGeometry(QtCore.QRect(110, 192, 111, 16))
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(12)
        font.setBold(True)
        font.setWeight(75)
        self.diametr_yarn_label.setFont(font)
        self.diametr_yarn_label.setStyleSheet("color: rgb(255, 255, 255);")
        self.diametr_yarn_label.setObjectName("diametr_yarn_label")

        self.retranslateUi(MakeApplication)
        QtCore.QMetaObject.connectSlotsByName(MakeApplication)

    def retranslateUi(self, MakeApplication):
        _translate = QtCore.QCoreApplication.translate
        MakeApplication.setWindowTitle(_translate("MakeApplication", "Form"))
        self.type_material_label.setText(_translate("MakeApplication", "Тип материала"))
        self.cancel_button.setText(_translate("MakeApplication", "Отмена"))
        self.color_material_label.setText(_translate("MakeApplication", "Цвет материала"))
        self.supply_label.setText(_translate("MakeApplication", "Оформить заявку"))
        self.add_button.setText(_translate("MakeApplication", "Оформить"))
        self.amount_material_label.setText(_translate("MakeApplication", "Количество материала"))
        self.diametr_yarn_label.setText(_translate("MakeApplication", "Диаметр нити"))


if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    MakeApplication = QtWidgets.QWidget()
    ui = Ui_MakeApplication()
    ui.setupUi(MakeApplication)
    MakeApplication.show()
    sys.exit(app.exec_())

