# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'D:\Универ\Программная инженерия\Интерфейс\workerwindow.ui'
#
# Created by: PyQt5 UI code generator 5.11.2
#
# WARNING! All changes made in this file will be lost!

from PyQt5 import QtCore, QtGui, QtWidgets


class UiWorkerWindow(object):
    def setupUi(self, worker_window):
        worker_window.setObjectName("worker_window")
        worker_window.resize(1302, 641)
        worker_window.setMinimumSize(QtCore.QSize(1302, 641))
        worker_window.setMaximumSize(QtCore.QSize(1302, 641))
        worker_window.setStyleSheet("background-color: rgb(0, 51, 102);")
        self.centralwidget = QtWidgets.QWidget(worker_window)
        self.centralwidget.setObjectName("centralwidget")
        self.worker_label = QtWidgets.QLabel(self.centralwidget)
        self.worker_label.setGeometry(QtCore.QRect(590, 10, 121, 31))
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(18)
        font.setBold(True)
        font.setWeight(75)
        self.worker_label.setFont(font)
        self.worker_label.setStyleSheet("color: rgb(255, 255, 255);")
        self.worker_label.setObjectName("worker_label")
        self.current_orders_button = QtWidgets.QPushButton(self.centralwidget)
        self.current_orders_button.setEnabled(True)
        self.current_orders_button.setGeometry(QtCore.QRect(420, 50, 201, 33))
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(12)
        font.setBold(True)
        font.setWeight(75)
        self.current_orders_button.setFont(font)
        self.current_orders_button.setStyleSheet(
            "background-color: qlineargradient(spread:pad, x1:0, y1:0, x2:1, y2:0, stop:0 rgba(255, 255, 255, 255), stop:1 rgba(171,171,171,1));\n"
            "border-color: rgb(102, 102, 102);\n"
            "border: 2px solid rgb(102, 102, 102);\n"
            "border-radius: 6px;\n"
            "")
        self.current_orders_button.setObjectName("current_orders_button")
        self.new_orders_button = QtWidgets.QPushButton(self.centralwidget)
        self.new_orders_button.setEnabled(True)
        self.new_orders_button.setGeometry(QtCore.QRect(690, 50, 201, 33))
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(12)
        font.setBold(True)
        font.setWeight(75)
        self.new_orders_button.setFont(font)
        self.new_orders_button.setStyleSheet(
            "background-color: qlineargradient(spread:pad, x1:0, y1:0, x2:1, y2:0, stop:0 rgba(255, 255, 255, 255), stop:1 rgba(171,171,171,1));\n"
            "border-color: rgb(102, 102, 102);\n"
            "border: 2px solid rgb(102, 102, 102);\n"
            "border-radius: 6px;\n"
            "")
        self.new_orders_button.setObjectName("new_orders_button")
        self.new_orders_group = QtWidgets.QFrame(self.centralwidget)
        self.new_orders_group.setGeometry(QtCore.QRect(0, 90, 1301, 531))
        self.new_orders_group.setFrameShape(QtWidgets.QFrame.StyledPanel)
        self.new_orders_group.setFrameShadow(QtWidgets.QFrame.Raised)
        self.new_orders_group.setObjectName("new_orders_group")
        self.new_orders_group.hide()
        self.take_order_button = QtWidgets.QPushButton(self.new_orders_group)
        self.take_order_button.setEnabled(True)
        self.take_order_button.setGeometry(QtCore.QRect(340, 460, 191, 41))
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(12)
        font.setBold(True)
        font.setWeight(75)
        self.take_order_button.setFont(font)
        self.take_order_button.setStyleSheet(
            "background-color: qlineargradient(spread:pad, x1:0, y1:0, x2:1, y2:0, stop:0 rgba(255, 255, 255, 255), stop:1 rgba(171,171,171,1));\n"
            "border-color: rgb(102, 102, 102);\n"
            "border: 2px solid rgb(102, 102, 102);\n"
            "border-radius: 6px;\n"
            "")
        self.take_order_button.setObjectName("take_order_button")
        self.refuse_order_button = QtWidgets.QPushButton(self.new_orders_group)
        self.refuse_order_button.setEnabled(True)
        self.refuse_order_button.setGeometry(QtCore.QRect(770, 460, 191, 41))
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(12)
        font.setBold(True)
        font.setWeight(75)
        self.refuse_order_button.setFont(font)
        self.refuse_order_button.setStyleSheet(
            "background-color: qlineargradient(spread:pad, x1:0, y1:0, x2:1, y2:0, stop:0 rgba(255, 255, 255, 255), stop:1 rgba(171,171,171,1));\n"
            "border-color: rgb(102, 102, 102);\n"
            "border: 2px solid rgb(102, 102, 102);\n"
            "border-radius: 6px;\n"
            "")
        self.refuse_order_button.setObjectName("refuse_order_button")
        self.new_orders_info_table = QtWidgets.QTableWidget(self.new_orders_group)
        self.new_orders_info_table.setGeometry(QtCore.QRect(30, 50, 1241, 391))
        self.new_orders_info_table.setMaximumSize(QtCore.QSize(16777215, 16777215))
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(11)
        self.new_orders_info_table.setFont(font)
        self.new_orders_info_table.setStyleSheet("background-color: rgb(255, 255, 255);")
        self.new_orders_info_table.setDragEnabled(False)
        self.new_orders_info_table.setAlternatingRowColors(False)
        self.new_orders_info_table.setShowGrid(True)
        self.new_orders_info_table.setColumnCount(4)
        self.new_orders_info_table.setObjectName("new_orders_info_table")
        item = QtWidgets.QTableWidgetItem()
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(11)
        item.setFont(font)
        self.new_orders_info_table.setHorizontalHeaderItem(0, item)
        self.new_orders_info_table.setColumnWidth(0, 140)
        item = QtWidgets.QTableWidgetItem()
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(11)
        item.setFont(font)
        self.new_orders_info_table.setHorizontalHeaderItem(1, item)
        self.new_orders_info_table.setColumnWidth(1, 569)
        item = QtWidgets.QTableWidgetItem()
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(11)
        item.setFont(font)
        self.new_orders_info_table.setHorizontalHeaderItem(2, item)
        self.new_orders_info_table.setColumnWidth(2, 320)
        item = QtWidgets.QTableWidgetItem()
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(11)
        item.setFont(font)
        self.new_orders_info_table.setHorizontalHeaderItem(3, item)
        self.new_orders_info_table.setColumnWidth(3, 210)
        item = QtWidgets.QTableWidgetItem()
        self.new_orders_info_table.setItem(0, 0, item)
        self.new_orders_info_table.verticalHeader().setVisible(False)
        self.new_orders_label = QtWidgets.QLabel(self.new_orders_group)
        self.new_orders_label.setGeometry(QtCore.QRect(560, 10, 181, 31))
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(16)
        font.setBold(True)
        font.setItalic(False)
        font.setUnderline(False)
        font.setWeight(75)
        font.setStrikeOut(False)
        self.new_orders_label.setFont(font)
        self.new_orders_label.setStyleSheet("color: rgb(255, 255, 255);")
        self.new_orders_label.setObjectName("new_orders_label")
        self.orders_info_group = QtWidgets.QFrame(self.centralwidget)
        self.orders_info_group.setGeometry(QtCore.QRect(300, 90, 701, 531))
        self.orders_info_group.setFrameShape(QtWidgets.QFrame.StyledPanel)
        self.orders_info_group.setFrameShadow(QtWidgets.QFrame.Raised)
        self.orders_info_group.setObjectName("orders_info_group")
        self.ask_material_button = QtWidgets.QPushButton(self.orders_info_group)
        self.ask_material_button.setEnabled(True)
        self.ask_material_button.setGeometry(QtCore.QRect(20, 460, 191, 41))
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(12)
        font.setBold(True)
        font.setWeight(75)
        self.ask_material_button.setFont(font)
        self.ask_material_button.setStyleSheet(
            "background-color: qlineargradient(spread:pad, x1:0, y1:0, x2:1, y2:0, stop:0 rgba(255, 255, 255, 255), stop:1 rgba(171,171,171,1));\n"
            "border-color: rgb(102, 102, 102);\n"
            "border: 2px solid rgb(102, 102, 102);\n"
            "border-radius: 6px;\n"
            "")
        self.ask_material_button.setObjectName("ask_material_button")
        self.more_info_order_button = QtWidgets.QPushButton(self.orders_info_group)
        self.more_info_order_button.setEnabled(True)
        self.more_info_order_button.setGeometry(QtCore.QRect(490, 460, 191, 41))
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(12)
        font.setBold(True)
        font.setWeight(75)
        self.more_info_order_button.setFont(font)
        self.more_info_order_button.setStyleSheet(
            "background-color: qlineargradient(spread:pad, x1:0, y1:0, x2:1, y2:0, stop:0 rgba(255, 255, 255, 255), stop:1 rgba(171,171,171,1));\n"
            "border-color: rgb(102, 102, 102);\n"
            "border: 2px solid rgb(102, 102, 102);\n"
            "border-radius: 6px;\n"
            "")
        self.more_info_order_button.setObjectName("more_info_order_button")
        self.orders_info_table = QtWidgets.QTableWidget(self.orders_info_group)
        self.orders_info_table.setGeometry(QtCore.QRect(20, 50, 661, 391))
        self.orders_info_table.setMaximumSize(QtCore.QSize(16777215, 16777215))
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(11)
        self.orders_info_table.setFont(font)
        self.orders_info_table.setStyleSheet("background-color: rgb(255, 255, 255);")
        self.orders_info_table.setDragEnabled(False)
        self.orders_info_table.setAlternatingRowColors(False)
        self.orders_info_table.setShowGrid(True)
        self.orders_info_table.setColumnCount(3)
        self.orders_info_table.setObjectName("orders_info_table")
        item = QtWidgets.QTableWidgetItem()
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(11)
        item.setFont(font)
        self.orders_info_table.setHorizontalHeaderItem(0, item)
        self.orders_info_table.setColumnWidth(0, 159)
        item = QtWidgets.QTableWidgetItem()
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(11)
        item.setFont(font)
        self.orders_info_table.setHorizontalHeaderItem(1, item)
        self.orders_info_table.setColumnWidth(1, 200)
        item = QtWidgets.QTableWidgetItem()
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(11)
        item.setFont(font)
        self.orders_info_table.setHorizontalHeaderItem(2, item)
        self.orders_info_table.setColumnWidth(2, 300)
        item = QtWidgets.QTableWidgetItem()
        self.orders_info_table.setItem(0, 0, item)
        self.orders_info_table.horizontalHeader().setVisible(True)
        self.orders_info_table.verticalHeader().setVisible(False)
        self.current_orders_label = QtWidgets.QLabel(self.orders_info_group)
        self.current_orders_label.setGeometry(QtCore.QRect(250, 10, 201, 31))
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(16)
        font.setBold(True)
        font.setItalic(False)
        font.setUnderline(False)
        font.setWeight(75)
        font.setStrikeOut(False)
        self.current_orders_label.setFont(font)
        self.current_orders_label.setStyleSheet("color: rgb(255, 255, 255);")
        self.current_orders_label.setObjectName("current_orders_label")
        self.complete_order_button = QtWidgets.QPushButton(self.orders_info_group)
        self.complete_order_button.setEnabled(True)
        self.complete_order_button.setGeometry(QtCore.QRect(255, 460, 191, 41))
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(12)
        font.setBold(True)
        font.setWeight(75)
        self.complete_order_button.setFont(font)
        self.complete_order_button.setStyleSheet(
            "background-color: qlineargradient(spread:pad, x1:0, y1:0, x2:1, y2:0, stop:0 rgba(255, 255, 255, 255), stop:1 rgba(171,171,171,1));\n"
            "border-color: rgb(102, 102, 102);\n"
            "border: 2px solid rgb(102, 102, 102);\n"
            "border-radius: 6px;\n"
            "")
        self.complete_order_button.setObjectName("complite_order_button")
        self.orders_info_group.raise_()
        self.worker_label.raise_()
        self.current_orders_button.raise_()
        self.new_orders_button.raise_()
        self.new_orders_group.raise_()
        worker_window.setCentralWidget(self.centralwidget)
        self.statusbar = QtWidgets.QStatusBar(worker_window)
        self.statusbar.setObjectName("statusbar")
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(12)
        font.setBold(True)
        font.setItalic(False)
        font.setUnderline(False)
        font.setWeight(75)
        font.setStrikeOut(False)
        self.statusbar.setFont(font)
        self.statusbar.setStyleSheet("color: rgb(255, 255, 255)")
        worker_window.setStatusBar(self.statusbar)

        self.current_orders_button.clicked.connect(self.show_current_orders)
        self.new_orders_button.clicked.connect(self.show_new_orders)

        self.retranslateUi(worker_window)
        QtCore.QMetaObject.connectSlotsByName(worker_window)

    def retranslateUi(self, worker_window):
        _translate = QtCore.QCoreApplication.translate
        worker_window.setWindowTitle(_translate("worker_window", "MainWindow"))
        self.worker_label.setText(_translate("worker_window", "Работник"))
        self.current_orders_button.setText(_translate("worker_window", "Текущие заказы"))
        self.new_orders_button.setText(_translate("worker_window", "Новые заказы"))
        self.take_order_button.setText(_translate("worker_window", "Взять заказ"))
        self.refuse_order_button.setText(_translate("worker_window", "Отказаться от заказа"))
        item = self.new_orders_info_table.horizontalHeaderItem(0)
        item.setText(_translate("worker_window", "Номер заказа"))
        item = self.new_orders_info_table.horizontalHeaderItem(1)
        item.setText(_translate("worker_window", "Описание заказа"))
        item = self.new_orders_info_table.horizontalHeaderItem(2)
        item.setText(_translate("worker_window", "Модель"))
        item = self.new_orders_info_table.horizontalHeaderItem(3)
        item.setText(_translate("worker_window", "Материал"))
        __sortingEnabled = self.new_orders_info_table.isSortingEnabled()
        self.new_orders_info_table.setSortingEnabled(False)
        self.new_orders_info_table.setSortingEnabled(__sortingEnabled)
        self.new_orders_label.setText(_translate("worker_window", "НОВЫЕ ЗАКАЗЫ"))
        self.ask_material_button.setText(_translate("worker_window", "Запросить материалы"))
        self.complete_order_button.setText(_translate("worker_window", "Завершить заказ"))
        self.more_info_order_button.setText(_translate("worker_window", "Информация о заказе"))
        item = self.orders_info_table.horizontalHeaderItem(0)
        item.setText(_translate("worker_window", "Номер заказа"))
        item = self.orders_info_table.horizontalHeaderItem(1)
        item.setText(_translate("worker_window", "Дата поставки материалов"))
        item = self.orders_info_table.horizontalHeaderItem(2)
        item.setText(_translate("worker_window", "Статус"))
        __sortingEnabled = self.orders_info_table.isSortingEnabled()
        self.orders_info_table.setSortingEnabled(False)
        self.orders_info_table.setSortingEnabled(__sortingEnabled)
        self.current_orders_label.setText(_translate("worker_window", "ТЕКУЩИЕ ЗАКАЗЫ"))

    def show_current_orders(self):
        self.orders_info_group.show()
        self.new_orders_group.hide()

    def show_new_orders(self):
        self.orders_info_group.hide()
        self.new_orders_group.show()


if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    worker_window = QtWidgets.QMainWindow()
    ui = UiWorkerWindow()
    ui.setupUi(worker_window)
    worker_window.show()
    sys.exit(app.exec_())

