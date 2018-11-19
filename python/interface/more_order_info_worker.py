# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'D:\Универ\Программная инженерия\Интерфейс\infowindow.ui'
#
# Created by: PyQt5 UI code generator 5.11.2
#
# WARNING! All changes made in this file will be lost!

from PyQt5 import QtCore, QtGui, QtWidgets


class UiMoreOrderInfoWorker(object):
    def setupUi(self, more_order_info):
        more_order_info.setObjectName("more_order_info")
        more_order_info.resize(711, 381)
        more_order_info.setMinimumSize(QtCore.QSize(711, 381))
        more_order_info.setMaximumSize(QtCore.QSize(711, 381))
        more_order_info.setStyleSheet("background-color: rgb(0, 51, 102);")
        self.order_info_table = QtWidgets.QTableWidget(more_order_info)
        self.order_info_table.setGeometry(QtCore.QRect(40, 70, 631, 191))
        self.order_info_table.setMaximumSize(QtCore.QSize(16777215, 16777215))
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(11)
        self.order_info_table.setFont(font)
        self.order_info_table.setStyleSheet("background-color: rgb(255, 255, 255);")
        self.order_info_table.setDragEnabled(False)
        self.order_info_table.setAlternatingRowColors(False)
        self.order_info_table.setShowGrid(True)
        self.order_info_table.setRowCount(5)
        self.order_info_table.setColumnCount(1)
        self.order_info_table.setObjectName("orders_info_table")
        item = QtWidgets.QTableWidgetItem()
        font = QtGui.QFont()
        font.setPointSize(11)
        item.setFont(font)
        self.order_info_table.setVerticalHeaderItem(0, item)
        item = QtWidgets.QTableWidgetItem()
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(11)
        item.setFont(font)
        self.order_info_table.setVerticalHeaderItem(1, item)
        item = QtWidgets.QTableWidgetItem()
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(11)
        item.setFont(font)
        self.order_info_table.setVerticalHeaderItem(2, item)
        item = QtWidgets.QTableWidgetItem()
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(11)
        item.setFont(font)
        self.order_info_table.setVerticalHeaderItem(3, item)
        self.order_info_table.setRowHeight(3, 44)
        item = QtWidgets.QTableWidgetItem()
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(11)
        item.setFont(font)
        self.order_info_table.setVerticalHeaderItem(4, item)
        self.order_info_table.setRowHeight(4, 55)
        item = QtWidgets.QTableWidgetItem()
        self.order_info_table.setHorizontalHeaderItem(0, item)
        self.order_info_table.setColumnWidth(0, 491)
        self.order_info_table.horizontalHeader().setVisible(False)
        self.give_order_button = QtWidgets.QPushButton(more_order_info)
        self.give_order_button.setEnabled(True)
        self.give_order_button.setGeometry(QtCore.QRect(80, 280, 231, 33))
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
        self.info_order_label = QtWidgets.QLabel(more_order_info)
        self.info_order_label.setGeometry(QtCore.QRect(230, 20, 251, 31))
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(18)
        font.setBold(False)
        font.setWeight(50)
        self.info_order_label.setFont(font)
        self.info_order_label.setStyleSheet("color: rgb(255, 255, 255);")
        self.info_order_label.setObjectName("info_order_label")
        self.return_order_button = QtWidgets.QPushButton(more_order_info)
        self.return_order_button.setEnabled(True)
        self.return_order_button.setGeometry(QtCore.QRect(390, 280, 241, 33))
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
        self.close_button = QtWidgets.QPushButton(more_order_info)
        self.close_button.setEnabled(True)
        self.close_button.setGeometry(QtCore.QRect(260, 330, 191, 41))
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(12)
        font.setBold(True)
        font.setWeight(75)
        self.close_button.setFont(font)
        self.close_button.setStyleSheet("background-color: qlineargradient(spread:pad, x1:0, y1:0, x2:1, y2:0, stop:0 rgba(255, 255, 255, 255), stop:1 rgba(171,171,171,1));\n"
"border-color: rgb(102, 102, 102);\n"
"border: 2px solid rgb(102, 102, 102);\n"
"border-radius: 6px;\n"
"")
        self.close_button.setObjectName("cancel_button")

        self.retranslateUi(more_order_info)
        QtCore.QMetaObject.connectSlotsByName(more_order_info)

    def retranslateUi(self, more_order_info):
        _translate = QtCore.QCoreApplication.translate
        more_order_info.setWindowTitle(_translate("more_order_info", "Form"))
        item = self.order_info_table.verticalHeaderItem(0)
        item.setText(_translate("more_order_info", "Номер заказа"))
        item = self.order_info_table.verticalHeaderItem(1)
        item.setText(_translate("more_order_info", "Материал"))
        item = self.order_info_table.verticalHeaderItem(2)
        item.setText(_translate("more_order_info", "Модель"))
        item = self.order_info_table.verticalHeaderItem(3)
        item.setText(_translate("more_order_info", "Краткое описание"))
        item = self.order_info_table.verticalHeaderItem(4)
        item.setText(_translate("more_order_info", "Доп. информация"))
        self.give_order_button.setText(_translate("more_order_info", "Передать заказ"))
        self.info_order_label.setText(_translate("more_order_info", "Информация о заказе"))
        self.return_order_button.setText(_translate("more_order_info", "Вернуть на доработку"))
        self.close_button.setText(_translate("more_order_info", "Закрыть"))


if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    more_order_info = QtWidgets.QWidget()
    ui = UiMoreOrderInfoWorker()
    ui.setupUi(more_order_info)
    more_order_info.show()
    sys.exit(app.exec_())

