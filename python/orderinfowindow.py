import sys
from interface.orderinfo import Ui_order_info

from PyQt5 import QtCore, QtGui, QtWidgets


class OrderInfoWindow(QtWidgets.QMainWindow):
    def __init__(self, parent=None):
        QtWidgets.QWidget.__init__(self, parent)
        self.ui = Ui_order_info()
        self.ui.setupUi(self)


if __name__ == "__main__":
    app = QtWidgets.QApplication(sys.argv)
    myapp = OrderInfoWindow()
    myapp.show()
    sys.exit(app.exec_())
