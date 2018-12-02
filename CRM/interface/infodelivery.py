# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'D:\Универ\Программная инженерия\Интерфейс\infodelivery.ui'
#
# Created by: PyQt5 UI code generator 5.11.2
#
# WARNING! All changes made in this file will be lost!

from PyQt5 import QtCore, QtGui, QtWidgets

class UiInfoDelivery(object):
    def setupUi(self, info_delivery):
        info_delivery.setObjectName("info_delivery")
        info_delivery.resize(400, 298)
        info_delivery.setStyleSheet("background-color: rgb(0, 51, 102);")
        self.info_label = QtWidgets.QLabel(info_delivery)
        self.info_label.setGeometry(QtCore.QRect(60, 20, 271, 31))
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(16)
        font.setBold(True)
        font.setWeight(75)
        self.info_label.setFont(font)
        self.info_label.setStyleSheet("color: rgb(255, 255, 255);")
        self.info_label.setObjectName("info_label")
        self.info_table = QtWidgets.QTableWidget(info_delivery)
        self.info_table.setGeometry(QtCore.QRect(20, 70, 361, 152))
        self.info_table.setMaximumSize(QtCore.QSize(16777215, 16777215))
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(11)
        self.info_table.setFont(font)
        self.info_table.setStyleSheet("background-color: rgb(255, 255, 255);")
        self.info_table.setDragEnabled(False)
        self.info_table.setAlternatingRowColors(False)
        self.info_table.setShowGrid(True)
        self.info_table.setRowCount(5)
        self.info_table.setColumnCount(1)
        self.info_table.setObjectName("info_table")
        item = QtWidgets.QTableWidgetItem()
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(11)
        item.setFont(font)
        self.info_table.setVerticalHeaderItem(0, item)
        item = QtWidgets.QTableWidgetItem()
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(11)
        item.setFont(font)
        self.info_table.setVerticalHeaderItem(1, item)
        item = QtWidgets.QTableWidgetItem()
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(11)
        item.setFont(font)
        self.info_table.setVerticalHeaderItem(2, item)
        item = QtWidgets.QTableWidgetItem()
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(11)
        item.setFont(font)
        self.info_table.setVerticalHeaderItem(3, item)
        item = QtWidgets.QTableWidgetItem()
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(11)
        item.setFont(font)
        self.info_table.setVerticalHeaderItem(4, item)
        self.info_table.horizontalHeader().setVisible(False)
        self.info_table.horizontalHeader().setHighlightSections(True)
        self.info_table.verticalHeader().setVisible(True)
        self.close_button = QtWidgets.QPushButton(info_delivery)
        self.close_button.setEnabled(True)
        self.close_button.setGeometry(QtCore.QRect(150, 240, 111, 41))
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
        self.close_button.setObjectName("close_button")

        self.retranslateUi(info_delivery)
        QtCore.QMetaObject.connectSlotsByName(info_delivery)

    def retranslateUi(self, InfoDelivery):
        _translate = QtCore.QCoreApplication.translate
        InfoDelivery.setWindowTitle(_translate("info_delivery", "Form"))
        self.info_label.setText(_translate("info_delivery", "Информация о поставке"))
        item = self.info_table.verticalHeaderItem(0)
        item.setText(_translate("info_delivery", "Номер договора"))
        item = self.info_table.verticalHeaderItem(1)
        item.setText(_translate("info_delivery", "Поставщик"))
        item = self.info_table.verticalHeaderItem(2)
        item.setText(_translate("info_delivery", "Договор"))
        item = self.info_table.verticalHeaderItem(3)
        item.setText(_translate("info_delivery", "Материал"))
        item = self.info_table.verticalHeaderItem(4)
        item.setText(_translate("info_delivery", "Стасус"))
        self.close_button.setText(_translate("info_delivery", "Закрыть"))


if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    info_delivery = QtWidgets.QWidget()
    ui = UiInfoDelivery()
    ui.setupUi(info_delivery)
    info_delivery.show()
    sys.exit(app.exec_())

