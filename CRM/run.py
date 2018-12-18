# -*- coding: utf-8 -*-

import sys
from data.main import MainWindow
from PyQt5 import QtWidgets

if __name__ == "__main__":
    app = QtWidgets.QApplication(sys.argv)
    screen_geometry = QtWidgets.QDesktopWidget().availableGeometry()
    authorization_win = MainWindow(screen_geometry.width(), screen_geometry.height())
    authorization_win.show()
    sys.exit(app.exec_())