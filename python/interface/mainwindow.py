import sys
import model.dbtables as db
from interface.windows_style.authorizationstyle import UiAuthorizationWindow
from interface.windows_style.managerwindow import UiManagerWindow
from interface.windows_style.moreorderinfo import UiMoreOrderInfoManager
from interface.windows_style.workerwindow import UiWorkerWindow
from interface.windows_style.infowindow import UiMoreOrderInfoWorker
from interface.windows_style.modificationwindow import UiModificationWindow
from PyQt5 import QtWidgets, QtCore, QtGui


# Окно для отображения ошибок
class ErrorWindow(QtWidgets.QMessageBox):
    def __init__(self, message, title, parent=None):
        QtWidgets.QMessageBox.__init__(self, parent)
        self.setStyleSheet("background-color: rgb(0, 51, 102);\n"
                                 "color: rgb(255, 255, 255);")
        self.setIcon(QtWidgets.QMessageBox.Warning)
        self.setText(message)
        self.setWindowTitle(title)
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
        self.setFont(font)
        self.addButton(ok_button, QtWidgets.QMessageBox.ActionRole)


# Класс для основного окна
class MainWindow(QtWidgets.QMainWindow):
    def __init__(self, screen_width, screen_height, parent=None):
        QtWidgets.QWidget.__init__(self, parent)
        self.screen_width = screen_width
        self.screen_height = screen_height
        self.ui = UiAuthorizationWindow()
        self.ui.setupUi(self)
        self.ui.entrance_button.clicked.connect(self.next_window)
        self.error_window = ErrorWindow('Неверный логин/пароль!', 'Ошибка авторизации')

    # Переход к необходимому окну в зависимости от должности работника
    def next_window(self):
        employee_info = db.search_employee(self.ui.login_text.text(), self.ui.password_text.text())
        # Если такой записи нет в базе данных, появляется ошибка
        if employee_info is None:
            self.error_window.show()
        elif employee_info[0] == 1:
            self.ui = ManagerMainWindow(employee_info[1])
            self.ui.setupUi(self)
            self.move((self.screen_width - self.width()) / 2, (self.screen_height - self.height()) / 2 - 15)
            self.ui.reinit()
        elif employee_info[0] == 2:
            self.ui = WorkerMainWindow(employee_info[1])
            self.ui.setupUi(self)
            self.move((self.screen_width - self.width()) / 2, (self.screen_height - self.height()) / 2 - 15)
            self.ui.reinit()
        else:
            print("!")


# Окно для менеджера
class ManagerMainWindow(UiManagerWindow):
    def __init__(self, manager_id):
        super().__init__()
        # Окно для отобрадения дополнительной информации о заказе
        self.order_info = OrderInfoManagerWindow()
        self.order_info.setWindowModality(QtCore.Qt.ApplicationModal)
        # Переменная для хранения пути к файлу дорабатываемого заказа
        self.refactor_filename = ''
        # Переменная для хранения пути к файлу нового заказа
        self.create_filename = ''
        self.manager_id = manager_id
        self.db_connection = db.ManagerConnection(manager_id)
        # Окно для отображения ошибки при попытке отобразить информацию без выбора заказа
        self.show_info_error_window = ErrorWindow('Выберите необходимый заказ!', 'Ошибка')

    def reinit(self):
        self.fill_table()
        self.fill_combobox(self.type_of_plastic_combobox, self.db_connection.get_plastic_types())
        self.fill_combobox(self.need_refactoring_order_combobox, self.db_connection.get_needed_modification_orders())
        self.fill_combobox(self.type_of_plastic_combobox_ref, self.db_connection.get_plastic_types())
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
        self.entering_number()

    # Выбор файла для нового или дорабатываемого заказа
    def select_file(self, ref):
        # Если выбирается файл для текущего заказа
        if not ref:
            if self.file_with_model_radio.isChecked():
                file_filter = '*.stl'
            else:
                file_filter = '*.png;;*.jpg'
            self.create_filename = QtWidgets.QFileDialog.getOpenFileName(self.select_file_button,
                                                                         'Select File', 'C:\\', file_filter)[0]
            if self.create_filename != '':
                self.selected_file_label.setText(self.create_filename.split('/')[-1])
        # Если выбирается файл для дорабатываемого заказа
        else:
            if self.file_with_model_radio_ref.isChecked():
                file_filter = '*.stl'
            else:
                file_filter = '*.png;;*.jpg'
            self.refactor_filename = QtWidgets.QFileDialog.getOpenFileName(self.select_file_button_ref,
                                                                           'Select File', 'C:\\', file_filter)[0]
            if self.refactor_filename != '':
                self.selected_file_label_ref.setText(self.refactor_filename.split('/')[-1])

    # Функция для заполнения combobox'ов
    def fill_combobox(self, combobox, values):
        combobox.clear()
        for value in values:
            item = QtGui.QStandardItem(str(value))
            item.setBackground(QtGui.QColor(255, 255, 255))
            combobox.model().appendRow(item)

    # Вывод цветов для текущего типа пластика для текущего или дорабатываемого заказа
    def set_colors_for_current_plastic(self, ref):
        # Для дорабатываемого заказа
        if ref:
            self.fill_combobox(self.color_of_plastic_combobox_ref,
                               self.db_connection.get_colors_of_plastic(self.type_of_plastic_combobox_ref.currentText()))
        # Для нового заказа
        else:
            self.fill_combobox(self.color_of_plastic_combobox,
                               self.db_connection.get_colors_of_plastic(self.type_of_plastic_combobox.currentText()))

    # Заполнение информации о дорабатываемом заказе
    def fill_refactor_order_info(self):
        if self.need_refactoring_order_combobox.currentText() != '':
            order_info = self.db_connection.get_needed_modification_order_info(int(self.need_refactoring_order_combobox.currentText()))
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

    # Заполение таблицы с информацией о заказах
    def fill_table(self):
        while self.orders_info_table.rowCount() > 0:
            self.orders_info_table.removeRow(0)
        orders = self.db_connection.get_orders_info()
        for order in orders:
            row_num = self.orders_info_table.rowCount()
            self.orders_info_table.insertRow(row_num)
            for index, item in enumerate(order):
                table_item = QtWidgets.QTableWidgetItem(str(item))
                table_item.setFlags(QtCore.Qt.ItemIsEnabled | QtCore.Qt.ItemIsSelectable)
                table_item.setTextAlignment(QtCore.Qt.AlignCenter)
                self.orders_info_table.setItem(row_num, index, table_item)

    # Отображение расширенной информации о заказе
    def show_more_info(self):
        if self.orders_info_table.currentItem() is not None:
            if self.orders_info_table.currentColumn() != 0:
                self.orders_info_table.setCurrentCell(self.orders_info_table.currentRow(), 0)

            order_number = self.orders_info_table.currentItem().text()
            self.orders_info_table.setCurrentCell(-1, -1)

            for index, item in enumerate(self.db_connection.get_more_order_info(order_number)):
                table_item = QtWidgets.QTableWidgetItem(str(item))
                table_item.setFlags(QtCore.Qt.ItemIsEnabled)
                self.order_info.ui.order_info_table.setItem(index, 0, table_item)

            self.order_info.show()
        else:
            self.show_info_error_window.show()

    # Добавление нового заказа в бд
    def add_new_order(self):
        self.db_connection.add_new_order([self.surname_text.text(), self.name_text.text(), self.patronymic_text.text(),
                                          self.phone_text.text(), self.email_text.text(), self.create_filename,
                                          self.type_of_plastic_combobox.currentText(),
                                          self.color_of_plastic_combobox.currentText(),
                                          self.additional_info_text.toPlainText(),
                                          self.short_description_text.toPlainText(),
                                          self.finale_price_label.text().split()[0],
                                          self.manager_id])

        # Очистка всех полей
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
        # Обновление комплитера для телефонов и таблицы с заказами
        self.entering_number()
        self.fill_table()

    # Обновление информации о заказа
    def update_order(self):
        self.db_connection.update_order_info([self.need_refactoring_order_combobox.currentText(),
                                              self.surname_text_ref.text(), self.name_text_ref.text(),
                                              self.patronymic_text_ref.text(), self.phone_text_ref.text(),
                                              self.email_text_ref.text(), self.refactor_filename,
                                              self.type_of_plastic_combobox_ref.currentText(),
                                              self.color_of_plastic_combobox_ref.currentText(),
                                              self.additional_info_text_ref.toPlainText(),
                                              self.short_description_text_ref.toPlainText(),
                                              self.finale_price_label_ref.text().split()[0]])

        # Очистка всех полей
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
        # Обновление таблицы с заказами
        self.fill_table()

    # Создание комплитера для телефонов
    def entering_number(self):
        phone_numbers = self.db_connection.get_phones()
        completer = QtWidgets.QCompleter(phone_numbers, self.phone_text)
        completer.activated.connect(self.load_client_info)
        self.phone_text.setCompleter(completer)

    # Загрузка информации о клиенте по номеру телефона
    def load_client_info(self):
        phone_number = self.phone_text.text()
        client_info = self.db_connection.get_client_info_by_phone(phone_number)
        self.surname_text.setText(client_info[0])
        self.name_text.setText(client_info[1])
        self.patronymic_text.setText(client_info[2])
        self.email_text.setText(client_info[3])


# Окно для отображения инормации о заказе
class OrderInfoManagerWindow(QtWidgets.QWidget):
    def __init__(self, parent=None):
        QtWidgets.QWidget.__init__(self, parent)
        self.ui = UiMoreOrderInfoManager()
        self.ui.setupUi(self)
        self.ui.close_button.clicked.connect(self.close)


# Окно для работника
class WorkerMainWindow(UiWorkerWindow):
    def __init__(self, worker_id):
        super().__init__()
        self.worker_id = worker_id
        # Окно для отображения информации о заказе
        self.order_info_window = OrderInfoWorkerWindow()
        self.order_info_window.setWindowModality(QtCore.Qt.ApplicationModal)
        # Окно для отправки заказа на модификацию
        self.modification_window = ModificationWindow()
        self.modification_window.setWindowModality(QtCore.Qt.ApplicationModal)
        # Окно для отображения ошибки при попытке отобразить информацию без выбора заказа
        self.select_order_error_window = ErrorWindow('Выберите необходимый заказ!', 'Ошибка')
        # Окно для отображения ошибки при незаполненном поле причины отправки заказа на доработку
        self.refuse_order_error_window = ErrorWindow('Напишите причину отправки заказа на доработку!', 'Ошибка заполнения')
        self.db_connection = db.WorkerConnection(self.worker_id)

    def reinit(self):
        self.fill_table(self.db_connection.get_orders_info(), self.orders_info_table)
        self.fill_table(self.db_connection.get_new_orders(), self.new_orders_info_table)
        self.more_info_order_button.clicked.connect(self.show_more_info)
        self.take_order_button.clicked.connect(self.take_new_order)
        self.order_info_window.ui.return_order_button.clicked.connect(self.modification_window.show)
        self.modification_window.ui.send_modification_button(self.send_order_to_modification)

    # Функция для закполнения таблиц
    def fill_table(self, orders, table):
        while table.rowCount() > 0:
            table.removeRow(0)
        for order in orders:
            row_index = table.rowCount()
            table.insertRow(row_index)
            for column_index, item in enumerate(order):
                table_item = QtWidgets.QTableWidgetItem(str(item))
                table_item.setFlags(QtCore.Qt.ItemIsEnabled | QtCore.Qt.ItemIsSelectable)
                table_item.setTextAlignment(QtCore.Qt.AlignCenter)
                table.setItem(row_index, column_index, table_item)

    # Отображение информации о заказе
    def show_more_info(self):
        if self.orders_info_table.currentItem() is not None:
            if self.orders_info_table.currentColumn() != 0:
                self.orders_info_table.setCurrentCell(self.orders_info_table.currentRow(), 0)

            order_number = self.orders_info_table.currentItem().text()
            self.orders_info_table.setCurrentCell(-1, -1)

            for index, item in enumerate(self.db_connection.get_more_order_info(order_number)):
                table_item = QtWidgets.QTableWidgetItem(str(item))
                table_item.setFlags(QtCore.Qt.ItemIsEnabled)
                self.order_info_window.ui.order_info_table.setItem(index, 0, table_item)

            self.order_info_window.show()
        else:
            self.select_order_error_window.show()

    # Приём выбранного заказа
    def take_new_order(self):
        if self.new_orders_info_table.currentItem() is not None:
            if self.new_orders_info_table.currentColumn() != 0:
                self.new_orders_info_table.setCurrentCell(self.new_orders_info_table.currentRow(), 0)

            self.db_connection.take_order(self.new_orders_info_table.currentItem().text())
            self.fill_table(self.db_connection.get_orders_info(), self.orders_info_table)
            self.fill_table(self.db_connection.get_new_orders(), self.new_orders_info_table)
        else:
            self.select_order_error_window.show()

    # Отправка заказа на доработку
    def send_order_to_modification(self):
        text_of_mark = self.modification_window.ui.modification_text.toPlainText()
        order_number = self.order_info_window.ui.order_info_table.item(0, 0).text()
        if text_of_mark != '':
            self.db_connection.send_order_to_modify(order_number, text_of_mark)
            self.modification_window.close()
            self.order_info_window.close()
            self.fill_table(self.db_connection.get_orders_info(), self.orders_info_table)
        else:
            self.refuse_order_error_window.show()

    # Завершение выбранного заказа
    def complete_order(self):
        if self.orders_info_table.currentItem() is not None:
            if self.orders_info_table.currentColumn() != 0:
                self.orders_info_table.setCurrentCell(self.orders_info_table.currentRow(), 0)

            order_number = self.orders_info_table.currentItem().text()
            self.orders_info_table.setCurrentCell(-1, -1)

            self.db_connection.complete_order(order_number)
            self.fill_table(self.db_connection.get_orders_info(), self.orders_info_table)
        else:
            self.select_order_error_window.show()


# Окно для отображения информации о заказе
class OrderInfoWorkerWindow(QtWidgets.QWidget):
    def __init__(self, parent=None):
        QtWidgets.QWidget.__init__(self, parent)
        self.ui = UiMoreOrderInfoWorker()
        self.ui.setupUi(self)
        self.ui.close_button.clicked.connect(self.close)


# Окно для отправки заказа на доработку
class ModificationWindow(QtWidgets.QWidget):
    def __init__(self, parent=None):
        QtWidgets.QWidget.__init__(self, parent)
        self.ui = UiModificationWindow()
        self.ui.setupUi(self)
        self.ui.cancel_button.clicked.connect(self.close)


if __name__ == "__main__":
    app = QtWidgets.QApplication(sys.argv)
    screen_geometry = QtWidgets.QDesktopWidget().availableGeometry()
    authorization_win = MainWindow(screen_geometry.width(), screen_geometry.height())
    authorization_win.show()
    sys.exit(app.exec_())
