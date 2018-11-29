# -*- coding: utf-8 -*-
"""
Created on Wed May  2 00:34:36 2018

@author: Hunte
"""

from PyQt5 import QtCore, QtGui, QtWidgets
import sys
import os


class CheckableComboBox(QtWidgets.QComboBox):
    def __init__(self):
        super(CheckableComboBox, self).__init__()
        self.view().pressed.connect(self.handleItemPressed)
        self.setModel(QtGui.QStandardItemModel(self))

    def handleItemPressed(self, index):
        item = self.model().itemFromIndex(index)
        if item.checkState() == QtCore.Qt.Checked:
            item.setCheckState(QtCore.Qt.Unchecked)
        else:
            item.setCheckState(QtCore.Qt.Checked)


class Dialog_01(QtWidgets.QMainWindow):
    def __init__(self):
        super(Dialog_01, self).__init__()
        self.list = QtWidgets.QListWidget(self)
        self.list.setGeometry(10, 10, 200, 60)
        self.list.setSelectionMode(QtWidgets.QAbstractItemView.ExtendedSelection)
        for i in range(5):
            item = QtWidgets.QListWidgetItem()
            font = QtGui.QFont()
            font.setFamily("Arial")
            font.setPointSize(11)
            font.setBold(True)
            font.setWeight(75)
            item.setFont(font)
            item.setText("Item " + str(i))
            self.list.addItem(item)
        self.list.itemSelectionChanged.connect(self.print_items)
        item = QtWidgets.QListWidgetItem()
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(11)
        font.setBold(True)
        font.setWeight(75)
        item.setFont(font)
        item.setText("Item 0")
        self.list.item(1).setSelected(True)
        self.list.item(2).setSelected(True)

    def print_items(self):
        print([item.text() for item in self.list.selectedItems()])
        print('///')

if __name__ == '__main__':
    app = QtWidgets.QApplication(sys.argv)
    dialog_1 = Dialog_01()
    dialog_1.show()
    dialog_1.resize(480,320)
    sys.exit(app.exec_())
