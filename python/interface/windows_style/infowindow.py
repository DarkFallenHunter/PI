# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'D:\Универ\Программная инженерия\Интерфейс\infowindow.ui'
#
# Created by: PyQt5 UI code generator 5.11.2
#
# WARNING! All changes made in this file will be lost!

from PyQt5 import QtCore, QtGui, QtWidgets

class Ui_Form(object):
    def setupUi(self, Form):
        Form.setObjectName("Form")
        Form.resize(342, 307)
        Form.setStyleSheet("background-color: rgb(0, 51, 102);")
        self.orders_info_table = QtWidgets.QTableWidget(Form)
        self.orders_info_table.setGeometry(QtCore.QRect(40, 80, 261, 92))
        self.orders_info_table.setMaximumSize(QtCore.QSize(16777215, 16777215))
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(11)
        self.orders_info_table.setFont(font)
        self.orders_info_table.setStyleSheet("background-color: rgb(255, 255, 255);")
        self.orders_info_table.setDragEnabled(False)
        self.orders_info_table.setAlternatingRowColors(False)
        self.orders_info_table.setShowGrid(True)
        self.orders_info_table.setRowCount(3)
        self.orders_info_table.setColumnCount(1)
        self.orders_info_table.setObjectName("orders_info_table")
        item = QtWidgets.QTableWidgetItem()
        font = QtGui.QFont()
        font.setPointSize(11)
        item.setFont(font)
        self.orders_info_table.setVerticalHeaderItem(0, item)
        item = QtWidgets.QTableWidgetItem()
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(11)
        item.setFont(font)
        self.orders_info_table.setVerticalHeaderItem(1, item)
        self.orders_info_table.setColumnWidth(0, 146)
        item = QtWidgets.QTableWidgetItem()
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(11)
        item.setFont(font)
        self.orders_info_table.setVerticalHeaderItem(2, item)
        item = QtWidgets.QTableWidgetItem()
        self.orders_info_table.setHorizontalHeaderItem(0, item)
        self.orders_info_table.horizontalHeader().setVisible(False)
        self.give_order_button = QtWidgets.QPushButton(Form)
        self.give_order_button.setEnabled(True)
        self.give_order_button.setGeometry(QtCore.QRect(90, 200, 170, 33))
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(12)
        font.setBold(True)
        font.setWeight(75)
        self.give_order_button.setFont(font)
        self.give_order_button.setStyleSheet("background-color: qlineargradient(spread:pad, x1:0, y1:0, x2:1, y2:0, stop:0 rgba(255, 255, 255, 255), stop:1 rgba(171,171,171,1));\n"
"border-color: rgb(102, 102, 102);\n"
"border: 2px solid rgb(102, 102, 102);\n"
"border-radius: 6px;\n"
"")
        self.give_order_button.setObjectName("give_order_button")
        self.info_order_label = QtWidgets.QLabel(Form)
        self.info_order_label.setGeometry(QtCore.QRect(50, 30, 251, 31))
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(18)
        font.setBold(False)
        font.setWeight(50)
        self.info_order_label.setFont(font)
        self.info_order_label.setStyleSheet("color: rgb(255, 255, 255);")
        self.info_order_label.setObjectName("info_order_label")
        self.return_order_button = QtWidgets.QPushButton(Form)
        self.return_order_button.setEnabled(True)
        self.return_order_button.setGeometry(QtCore.QRect(80, 250, 191, 33))
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(12)
        font.setBold(True)
        font.setWeight(75)
        self.return_order_button.setFont(font)
        self.return_order_button.setStyleSheet("background-color: qlineargradient(spread:pad, x1:0, y1:0, x2:1, y2:0, stop:0 rgba(255, 255, 255, 255), stop:1 rgba(171,171,171,1));\n"
"border-color: rgb(102, 102, 102);\n"
"border: 2px solid rgb(102, 102, 102);\n"
"border-radius: 6px;\n"
"")
        self.return_order_button.setObjectName("return_order_button")

        self.retranslateUi(Form)
        QtCore.QMetaObject.connectSlotsByName(Form)

    def retranslateUi(self, Form):
        _translate = QtCore.QCoreApplication.translate
        Form.setWindowTitle(_translate("Form", "Form"))
        item = self.orders_info_table.verticalHeaderItem(0)
        item.setText(_translate("Form", "Номер заказа"))
        item = self.orders_info_table.verticalHeaderItem(1)
        item.setText(_translate("Form", "Материал"))
        item = self.orders_info_table.verticalHeaderItem(2)
        item.setText(_translate("Form", "Модель"))
        self.give_order_button.setText(_translate("Form", "Передать заказ"))
        self.info_order_label.setText(_translate("Form", "Информация о заказе"))
        self.return_order_button.setText(_translate("Form", "Вернуть на доработку"))


if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    Form = QtWidgets.QWidget()
    ui = Ui_Form()
    ui.setupUi(Form)
    Form.show()
    sys.exit(app.exec_())

