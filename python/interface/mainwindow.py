import sys
import model.dbtables as db
from interface.windows_style.authorizationstyle import UiAuthorizationWindow
from interface.windows_style.managerwindow import UiManagerWindow
from interface.windows_style.moreorderinfo import UiMoreOrderInfo
from interface.windows_style.workerwindow import UiWorkerWindow
from PyQt5 import QtWidgets, QtCore, QtGui


class MainWindow(QtWidgets.QMainWindow):
    def __init__(self, screen_width, screen_height, parent=None):
        QtWidgets.QWidget.__init__(self, parent)
        self.screen_width = screen_width
        self.screen_height = screen_height
        self.ui = UiAuthorizationWindow()
        self.ui.setupUi(self)
        self.ui.entrance_button.clicked.connect(self.next_window)
        self.error_window()

    def error_window(self):
        self.error = QtWidgets.QMessageBox()
        self.error.setStyleSheet("background-color: rgb(0, 51, 102);\n"
                                 "color: rgb(255, 255, 255);")
        self.error.setIcon(QtWidgets.QMessageBox.Warning)
        self.error.setText("Неверный логин/пароль!")
        self.error.setWindowTitle("Ошибка авторизации")
        ok_button = QtWidgets.QPushButton('Ok')
        ok_button.setFixedWidth(100)
        ok_button.setFixedHeight(30)
        ok_button.setStyleSheet(
            "background-color: qlineargradient(spread:pad, x1:0, y1:0, x2:1, y2:0, stop:0 rgba(255, 255, 255, 255), stop:1 rgba(171,171,171,1));\n"
            "border-color: rgb(102, 102, 102);\n"
            "border: 2px solid rgb(102, 102, 102);\n"
            "border-radius: 6px;\n"
            "color: rgb(0, 0, 0)")
        font = QtGui.QFont()
        font.setFamily('Arial')
        font.setPointSize(11)
        font.setBold(True)
        font.setWeight(75)
        ok_button.setFont(font)
        self.error.setFont(font)
        self.error.addButton(ok_button, QtWidgets.QMessageBox.ActionRole)

    def next_window(self):
        employee_info = db.search_employee(self.ui.login_text.text(), self.ui.password_text.text())
        if employee_info is None:
            self.error.show()
        elif employee_info[0] == 'Менеджер':
            self.ui = ManagerMainWindow(employee_info[1])
            self.ui.setupUi(self)
            self.move((self.screen_width - self.width()) / 2, (self.screen_height - self.height()) / 2 - 15)
            self.ui.reinit()
        elif employee_info[0] == 'Работник':
            self.ui = WorkerMainWindow(employee_info[1])
            self.ui.setupUi(self)
            self.move((self.screen_width - self.width()) / 2, (self.screen_height - self.height()) / 2 - 15)
            self.ui.reinit()
        else:
            print("!")


class ManagerMainWindow(UiManagerWindow):
    def __init__(self, manager_id):
        super().__init__()
        self.order_info = OrderInfoWindow()
        self.manager_id = manager_id
        self.refactor_filename = ''
        self.create_filename = ''

    def reinit(self):
        self.fill_table()
        self.fill_combobox(self.type_of_plastic_combobox, db.get_plastic_types())
        self.fill_combobox(self.need_refactoring_order_combobox, db.get_needed_modification_orders(self.manager_id))
        self.fill_combobox(self.type_of_plastic_combobox_ref, db.get_plastic_types())
        self.type_of_plastic_combobox.setCurrentIndex(-1)
        self.need_refactoring_order_combobox.setCurrentIndex(-1)
        self.type_of_plastic_combobox_ref.setCurrentIndex(-1)
        self.show_more_info_button.clicked.connect(self.show_more_info)
        self.type_of_plastic_combobox.currentIndexChanged.\
            connect(lambda: self.set_colors_for_current_plastic(False))
        self.color_of_plastic_combobox.setCurrentIndex(-1)
        self.need_refactoring_order_combobox.currentIndexChanged.connect(self.fill_refactor_order_info)
        self.type_of_plastic_combobox_ref.currentIndexChanged.\
            connect(lambda: self.set_colors_for_current_plastic(True))
        self.select_file_button.clicked.connect(lambda: self.select_file(False))
        self.select_file_button_ref.clicked.connect(lambda: self.select_file(True))
        self.add_order_button.clicked.connect(self.add_new_order)
        self.refactor_order_button_ref.clicked.connect(self.update_order)

    def select_file(self, ref):
        if not ref:
            if self.file_with_model_radio.isChecked():
                file_filter = '*.stl'
            else:
                file_filter = '*.png'
            self.create_filename = QtWidgets.QFileDialog.getOpenFileName(self.select_file_button,
                                                                         'Select File', 'C:\\', file_filter)[0]
            if self.create_filename != '':
                self.selected_file_label.setText(self.create_filename.split('/')[-1])
        else:
            if self.file_with_model_radio_ref.isChecked():
                file_filter = '*.stl'
            else:
                file_filter = '*.png'
            self.refactor_filename = QtWidgets.QFileDialog.getOpenFileName(self.select_file_button_ref,
                                                                           'Select File', 'C:\\', file_filter)[0]
            if self.refactor_filename != '':
                self.selected_file_label_ref.setText(self.refactor_filename.split('/')[-1])

    def fill_combobox(self, combobox, values):
        combobox.clear()
        for value in values:
            item = QtGui.QStandardItem(str(value))
            item.setBackground(QtGui.QColor(255, 255, 255))
            combobox.model().appendRow(item)

    def set_colors_for_current_plastic(self, ref):
        if ref:
            self.fill_combobox(self.color_of_plastic_combobox_ref,
                               db.get_colors_of_plastic(self.type_of_plastic_combobox_ref.currentText()))
        else:
            self.fill_combobox(self.color_of_plastic_combobox,
                               db.get_colors_of_plastic(self.type_of_plastic_combobox.currentText()))

    def fill_refactor_order_info(self):
        if self.need_refactoring_order_combobox.currentText() != '':
            order_info = db.get_needed_modification_order_info(int(self.need_refactoring_order_combobox.currentText()))
            self.note_of_refactoring_text.setText(order_info[0])
            self.surname_text_ref.setText(order_info[1])
            self.name_text_ref.setText(order_info[2])
            self.patronymic_text_ref.setText(order_info[3])
            self.phone_text_ref.setText(order_info[4])
            self.email_text_ref.setText(order_info[5])
            self.selected_file_label_ref.setText(order_info[6])
            self.refactor_filename = order_info[6]
            self.type_of_plastic_combobox_ref.setCurrentText(order_info[7])
            self.set_colors_for_current_plastic(True)
            self.color_of_plastic_combobox_ref.setCurrentText(order_info[8])
            self.additional_info_text_ref.setText(order_info[9])
            self.short_description_text_ref.setText(order_info[10])
            self.finale_price_label_ref.setText(str(order_info[11]) + ' рублей')

    def fill_table(self):
        orders = db.get_orders_info(self.manager_id)
        for order in orders:
            row_num = self.orders_info_table.rowCount()
            self.orders_info_table.insertRow(row_num)
            for index in range(len(order)):
                item = QtWidgets.QTableWidgetItem(str(order[index]))
                item.setFlags(QtCore.Qt.ItemIsEnabled | QtCore.Qt.ItemIsSelectable)
                self.orders_info_table.setItem(row_num, index, item)

    def show_more_info(self):
        if self.orders_info_table.currentItem() is not None:
            if self.orders_info_table.currentColumn() != 0:
                self.orders_info_table.setCurrentCell(self.orders_info_table.currentRow(), 0)

            order_number = self.orders_info_table.currentItem().text()

            for item in enumerate(db.get_more_order_info(order_number)):
                table_item = QtWidgets.QTableWidgetItem(str(item[1]))
                table_item.setFlags(QtCore.Qt.ItemIsEnabled)
                self.order_info.ui.order_info_table.setItem(item[0], 0, table_item)

            self.order_info.show()

    def add_new_order(self):
        db.add_new_order([self.surname_text.text(), self.name_text.text(), self.patronymic_text.text(),
                          self.phone_text.text(), self.email_text.text(), self.create_filename,
                          self.type_of_plastic_combobox.currentText(), self.color_of_plastic_combobox.currentText(),
                          self.additional_info_text.toPlainText(), self.short_description_text.toPlainText(),
                          self.finale_price_label.text().split()[0]])

        self.surname_text.clear()
        self.name_text.clear()
        self.patronymic_text.clear()
        self.phone_text.clear()
        self.email_text.clear()
        self.create_filename = ''
        self.selected_file_label.setText('Файл не выбран')
        self.type_of_plastic_combobox.setCurrentIndex(-1)
        self.color_of_plastic_combobox.setCurrentIndex(-1)
        self.additional_info_text.clear()
        self.short_description_text.clear()
        self.finale_price_label.setText('0 рублей')

    def update_order(self):
        db.update_order_info([self.need_refactoring_order_combobox.currentText(), self.surname_text_ref.text(),
                              self.name_text_ref.text(), self.patronymic_text_ref.text(), self.phone_text_ref.text(),
                              self.email_text_ref.text(), self.refactor_filename,
                              self.type_of_plastic_combobox_ref.currentText(),
                              self.color_of_plastic_combobox_ref.currentText(),
                              self.additional_info_text_ref.toPlainText(),
                              self.short_description_text_ref.toPlainText(),
                              self.finale_price_label_ref.text().split()[0]])

        self.need_refactoring_order_combobox.removeItem(self.need_refactoring_order_combobox.currentIndex())
        self.note_of_refactoring_text.clear()
        self.need_refactoring_order_combobox.setCurrentIndex(-1)
        self.surname_text_ref.clear()
        self.name_text_ref.clear()
        self.patronymic_text_ref.clear()
        self.phone_text_ref.clear()
        self.email_text_ref.clear()
        self.refactor_filename = ''
        self.selected_file_label_ref.setText('Файл не выбран')
        self.type_of_plastic_combobox_ref.setCurrentIndex(-1)
        self.color_of_plastic_combobox_ref.setCurrentIndex(-1)
        self.additional_info_text_ref.clear()
        self.short_description_text_ref.clear()
        self.finale_price_label_ref.setText('0 рублей')


class OrderInfoWindow(QtWidgets.QWidget):
    def __init__(self, parent=None):
        QtWidgets.QWidget.__init__(self, parent)
        self.ui = UiMoreOrderInfo()
        self.ui.setupUi(self)
        self.setWindowFlags(self.windowFlags() & ~QtCore.Qt.WindowCloseButtonHint)
        self.ui.close_button.clicked.connect(self.hide)


class WorkerMainWindow(UiWorkerWindow):
    def __init__(self, worker_id):
        super().__init__()
        self.worker_id = worker_id

    def reinit(self):
        print(self.worker_id)


if __name__ == "__main__":
    app = QtWidgets.QApplication(sys.argv)
    screen_geometry = QtWidgets.QDesktopWidget().availableGeometry()
    authorization_win = MainWindow(screen_geometry.width(), screen_geometry.height())
    authorization_win.show()
    sys.exit(app.exec_())
