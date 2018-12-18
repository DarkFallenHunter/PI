# -*- coding: utf-8 -*-

import sys
import hashlib
from data import db_module as db
from interface.authorization_window import UiAuthorizationWindow
from interface.manager_window import UiManagerWindow
from interface.more_order_info_manager import UiMoreOrderInfoManager
from interface.worker_window import UiWorkerWindow
from interface.more_order_info_worker import UiMoreOrderInfoWorker
from interface.modification_window import UiModificationWindow
from interface.view_model_window import UiViewModelWindow
from interface.make_application import UiMakeApplication
from interface.snabzenecwindow import UiSnabzenecWindow
from interface.choosedate import UiChooseDate
from interface.add_supply import UiAddSupply
from interface.infodelivery import UiInfoDelivery
from PyQt5 import QtWidgets, QtCore, QtGui
from data.pySlice import calc_length_stl_material


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
        hash_var = hashlib.md5()
        hash_var.update(self.ui.password_text.text().encode('utf-8'))
        pass_hex = hash_var.hexdigest()
        employee_info = db.search_employee(self.ui.login_text.text(), pass_hex)
        # Если такой записи нет в базе данных, появляется ошибка
        try:
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
            elif employee_info[0] == 3:
                self.ui = SupplierMainWindow(employee_info[1])
                self.ui.setupUi(self)
                self.move((self.screen_width - self.width()) / 2, (self.screen_height - self.height()) / 2 - 15)
                self.ui.reinit()
            else:
                print("!")
        except Exception as e:
            print(e)


# Окно для менеджера
class ManagerMainWindow(UiManagerWindow):
    def __init__(self, manager_id):
        super().__init__()
        # Окно для отобрадения дополнительной информации о заказе
        self.order_info = OrderInfoManagerWindow()
        # self.order_info.setWindowModality(QtCore.Qt.ApplicationModal)
        # Переменная для хранения пути к файлу дорабатываемого заказа
        self.refactor_filename = ''
        # Переменная для хранения пути к файлу нового заказа
        self.create_filename = ''
        self.manager_id = manager_id
        self.db_connection = db.ManagerConnection(manager_id)
        # Окно для отображения ошибки при попытке отобразить информацию без выбора заказа
        self.show_info_error_window = ErrorWindow('Выберите необходимый заказ!', 'Ошибка')
        self.filling_table_timer = QtCore.QTimer()
        self.fill_modification_orders_combobox_timer = QtCore.QTimer()

    def reinit(self):
        self.create_order_button.clicked.connect(self.show_create_order)
        self.refactor_order_button.clicked.connect(self.show_refactor_order)
        self.show_orders_info_button.clicked.connect(self.show_orders_info)
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
        self.need_refactoring_order_combobox.currentIndexChanged.connect(self.fill_refactor_order_info)
        self.type_of_plastic_combobox_ref.currentIndexChanged.\
            connect(lambda: self.set_colors_for_current_plastic(True))
        self.select_file_button.clicked.connect(lambda: self.select_file(False))
        self.select_file_button_ref.clicked.connect(lambda: self.select_file(True))
        self.add_order_button.clicked.connect(self.add_new_order)
        self.refactor_order_button_ref.clicked.connect(self.update_order)
        self.entering_number()
        self.delete_order_button.clicked.connect(self.cancel_order)
        self.filling_table_timer.timeout.connect(self.fill_table)
        self.filling_table_timer.start(15000)
        self.fill_modification_orders_combobox_timer.timeout.connect(
            lambda: self.fill_combobox(self.need_refactoring_order_combobox,
                                       self.db_connection.get_needed_modification_orders()))
        self.fill_modification_orders_combobox_timer.start(60000)

    def show_create_order(self):
        if not self.manager_refactor_order_group.isHidden():
            self.clear_all_fields(True)

        self.manager_create_order_group.show()
        self.manager_refactor_order_group.hide()
        self.manager_show_orders_info_group.hide()

    def show_refactor_order(self):
        if not self.manager_create_order_group.isHidden():
            self.clear_all_fields(False)

        if self.manager_refactor_order_group.isHidden():
            self.manager_refactor_order_group.show()
            self.manager_show_orders_info_group.hide()
            self.manager_create_order_group.hide()

    def show_orders_info(self):
        if not self.manager_refactor_order_group.isHidden():
            self.clear_all_fields(True)

        if not self.manager_create_order_group.isHidden():
            self.clear_all_fields(False)

        self.manager_create_order_group.hide()
        self.manager_refactor_order_group.hide()
        self.manager_show_orders_info_group.show()

    # Выбор файла для нового или дорабатываемого заказа
    def select_file(self, ref):
        # Если выбирается файл для текущего заказа
        if not ref:
            if self.file_with_model_radio.isChecked():
                file_filter = '*.stl'
            else:
                file_filter = '*.png;;*.jpg'
            self.create_filename = QtWidgets.QFileDialog.getOpenFileName(self.select_file_button,
                                                                         'Select File', 'C:\\', file_filter
                                                                         )[0].split('/')[-1]
            if self.create_filename != '':
                self.selected_file_label.setText(self.create_filename)
                if self.create_filename.split('.')[-1] == 'stl':
                    self.create_filename = '..\\..\\3d\\' + self.create_filename
                    if self.type_of_plastic_combobox.currentText() != '':
                        self.finale_price_label.setText(str(calc_length_stl_material(self.create_filename)) + ' рублей')

        # Если выбирается файл для дорабатываемого заказа
        else:
            if self.file_with_model_radio_ref.isChecked():
                file_filter = '*.stl'
            else:
                file_filter = '*.png;;*.jpg'
            self.refactor_filename = QtWidgets.QFileDialog.getOpenFileName(self.select_file_button_ref,
                                                                           'Select File', 'C:\\', file_filter
                                                                           )[0].split('/')[-1]
            if self.refactor_filename != '':
                self.selected_file_label_ref.setText(self.refactor_filename)
                if self.refactor_filename.split('.')[-1] == 'stl':
                    self.refactor_filename = '..\\..\\3d\\' + self.refactor_filename
                    if self.type_of_plastic_combobox_ref.currentText() != '':
                        self.finale_price_label_ref.setText(
                            str(calc_length_stl_material(self.refactor_filename)) + ' рублей'
                        )

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
            widget_list = self.color_of_plastic_combobox_ref
            list_of_colors = self.db_connection.get_colors_of_plastic(self.type_of_plastic_combobox_ref.currentText())
        # Для нового заказа
        else:
            widget_list = self.color_of_plastic_combobox
            list_of_colors = self.db_connection.get_colors_of_plastic(self.type_of_plastic_combobox.currentText())

        widget_list.clear()
        self.fill_combobox(widget_list, list_of_colors)

    def clear_all_fields(self, ref):
        if not ref:
            self.surname_text.clear()
            self.name_text.clear()
            self.patronymic_text.clear()
            self.phone_text.clear()
            self.email_text.clear()
            self.create_filename = ''
            self.selected_file_label.setText('Файл не выбран')
            self.type_of_plastic_combobox.setCurrentIndex(-1)
            self.color_of_plastic_combobox.clear()
            self.additional_info_text.clear()
            self.short_description_text.clear()
            self.finale_price_label.setText('0 рублей')
        else:
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
            self.color_of_plastic_combobox_ref.clear()
            self.additional_info_text_ref.clear()
            self.short_description_text_ref.clear()
            self.finale_price_label_ref.setText('0 рублей')

    # Заполнение информации о дорабатываемом заказе
    def fill_refactor_order_info(self):
        if self.need_refactoring_order_combobox.currentText() != '':
            order_info = self.db_connection.get_needed_modification_order_info(
                int(self.need_refactoring_order_combobox.currentText())
            )
            self.note_of_refactoring_text.setText(order_info[0])
            self.surname_text_ref.setText(order_info[1])
            self.name_text_ref.setText(order_info[2])
            self.patronymic_text_ref.setText(order_info[3])
            self.phone_text_ref.setText(order_info[4])
            self.email_text_ref.setText(order_info[5])
            if order_info[6].split('.')[-1] != 'stl':
                self.sketch_of_model_radio_ref.setChecked(True)
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
        self.clear_all_fields(False)
        # Обновление комплитера для телефонов и таблицы с заказами
        self.entering_number()
        # self.fill_table()

    # Обновление информации о заказа
    def update_order(self):
        # print([self.need_refactoring_order_combobox.currentText(),
        #       self.surname_text_ref.text(), self.name_text_ref.text(),
        #       self.patronymic_text_ref.text(), self.phone_text_ref.text(),
        #       self.email_text_ref.text(), self.refactor_filename,
        #       self.type_of_plastic_combobox_ref.currentText(),
        #       self.color_of_plastic_combobox_ref.currentText(),
        #       self.additional_info_text_ref.toPlainText(),
        #       self.short_description_text_ref.toPlainText(),
        #       self.finale_price_label_ref.text().split()[0]])
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
        self.clear_all_fields(True)
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

    def cancel_order(self):
        if self.orders_info_table.currentItem() is not None:
            if self.orders_info_table.currentColumn() != 0:
                self.orders_info_table.setCurrentCell(self.orders_info_table.currentRow(), 0)

            order_number = self.orders_info_table.currentItem().text()
            self.orders_info_table.setCurrentCell(-1, -1)

            self.db_connection.cancel_order(int(order_number))
            self.fill_table()
        else:
            self.show_info_error_window.show()

    def complete_order(self):
        if self.orders_info_table.currentItem() is not None:
            if self.orders_info_table.currentColumn() != 0:
                self.orders_info_table.setCurrentCell(self.orders_info_table.currentRow(), 0)

            order_number = self.orders_info_table.currentItem().text()
            self.orders_info_table.setCurrentCell(-1, -1)

            self.db_connection.complete_order(int(order_number))
            self.fill_table()
        else:
            self.show_info_error_window.show()


# Окно для отображения инормации о заказе
class OrderInfoManagerWindow(QtWidgets.QWidget):
    def __init__(self, parent=None):
        QtWidgets.QWidget.__init__(self, parent)
        self.ui = UiMoreOrderInfoManager()
        self.ui.setupUi(self)
        self.ui.close_button.clicked.connect(self.close)
        self.ui.show_model_button.clicked.connect(self.show_model)

    def show_model(self):
        self.model_window = UiViewModelWindow(self.ui.order_info_table.item(7, 0).text())


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
        # Окно для отправки заявки на материалы
        self.ask_material_window = AskMaterialWindow()
        self.modification_window.setWindowModality(QtCore.Qt.ApplicationModal)
        # Окно для отображения ошибки при попытке отобразить информацию без выбора заказа
        self.select_order_error_window = ErrorWindow('Выберите необходимый заказ!', 'Ошибка')
        # Окно для отображения ошибки при незаполненном поле причины отправки заказа на доработку
        self.refuse_order_error_window = ErrorWindow('Напишите причину отправки заказа на доработку!', 'Ошибка заполнения')
        # Окно для отображения ошибки при невозможности отказа от заказа
        self.resend_order_error_window = ErrorWindow('Вы не может отказаться от этого заказа!', 'Ошибка')
        self.db_connection = db.WorkerConnection(self.worker_id)
        self.fill_orders_table_timer = QtCore.QTimer()
        self.fill_new_orders_table_timer = QtCore.QTimer()

    def reinit(self):
        self.fill_table(self.db_connection.get_orders_info(), self.orders_info_table)
        self.fill_table(self.db_connection.get_new_orders(), self.new_orders_info_table)
        self.more_info_order_button.clicked.connect(lambda: self.select_order(self.orders_info_table,
                                                                              self.show_more_info))
        self.complete_order_button.clicked.connect(lambda: self.select_order(self.orders_info_table,
                                                                             self.complete_order))
        self.take_order_button.clicked.connect(self.take_new_order)
        self.order_info_window.ui.return_order_button.clicked.connect(self.modification_window.show)
        self.modification_window.ui.send_modification_button.clicked.connect(self.send_order_to_modification)
        self.order_info_window.ui.give_order_button.clicked.connect(self.give_order_to_another)
        self.refuse_order_button.clicked.connect(self.give_order_to_another)
        self.ask_material_button.clicked.connect(lambda: self.select_order(self.orders_info_table,
                                                                           self.ask_material))
        self.ask_material_window.ui.add_button.clicked.connect(self.send_material_request)
        self.fill_orders_table_timer.timeout.connect(
            lambda: self.fill_table(self.db_connection.get_orders_info(), self.orders_info_table)
        )
        self.fill_orders_table_timer.start(15000)
        self.fill_new_orders_table_timer.timeout.connect(
            lambda: self.fill_table(self.db_connection.get_new_orders(), self.new_orders_info_table)
        )
        self.fill_new_orders_table_timer.start(15000)

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

    def select_order(self, table, processing_function):
        if table.currentItem() is not None:
            if table.currentColumn() != 0:
                table.setCurrentCell(table.currentRow(), 0)

            order_number = table.currentItem().text()
            table.setCurrentCell(-1, -1)

            processing_function(order_number)

        else:
            self.select_order_error_window.show()

    # Отображение информации о заказе
    def show_more_info(self, order_number):
        for index, item in enumerate(self.db_connection.get_more_order_info(order_number)):
            table_item = QtWidgets.QTableWidgetItem(str(item))
            table_item.setFlags(QtCore.Qt.ItemIsEnabled)
            self.order_info_window.ui.order_info_table.setItem(index, 0, table_item)

        self.order_info_window.show()

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
    def complete_order(self, order_number):
        self.db_connection.complete_order(order_number)
        self.fill_table(self.db_connection.get_orders_info(), self.orders_info_table)

    def give_order_to_another(self):
        result = self.db_connection.send_order_to_another(self.order_info_window.ui.order_info_table.item(0, 0).text())
        if result == -1:
            self.resend_order_error_window.show()
        else:
            self.order_info_window.close()
            self.fill_table(self.db_connection.get_orders_info(), self.orders_info_table)

    def ask_material(self, order_number):
        material_info = self.db_connection.get_order_material(order_number)

        self.ask_material_window.ui.type_text.setText(material_info[0])
        self.ask_material_window.ui.color_text.setText(material_info[1])
        self.ask_material_window.ui.diametr_combobox.clear()
        for diameter in material_info[2]:
            item = QtGui.QStandardItem(str(diameter))
            item.setBackground(QtGui.QColor(255, 255, 255))
            self.ask_material_window.ui.diametr_combobox.model().appendRow(item)

        self.ask_material_window.order_number = order_number
        self.ask_material_window.show()

    def send_material_request(self):
        self.db_connection.send_request([self.ask_material_window.ui.type_text.text(),
                                         self.ask_material_window.ui.color_text.text(),
                                         self.ask_material_window.ui.diametr_combobox.currentText(),
                                         self.ask_material_window.ui.numer_lineedit.text(),
                                         self.ask_material_window.order_number])
        self.fill_table(self.db_connection.get_orders_info(), self.orders_info_table)
        self.ask_material_window.close()


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


# Окно дял запроса материалов
class AskMaterialWindow(QtWidgets.QWidget):
    def __init__(self, parent=None):
        QtWidgets.QWidget.__init__(self, parent)
        self.ui = UiMakeApplication()
        self.ui.setupUi(self)
        self.ui.cancel_button.clicked.connect(self.close)
        self.order_number = 0


# Окно для снабженца
class SupplierMainWindow(UiSnabzenecWindow):
    def __init__(self, supplier_id):
        super().__init__()
        self.supplier_id = supplier_id
        # Окно для сообщения о дате поставки
        self.choose_date_window = ChooseDateWindow()
        self.choose_date_window.setWindowModality(QtCore.Qt.ApplicationModal)
        # Окно для добавления новой поставки
        self.add_supply_window = AddSupplyWindow()
        self.add_supply_window.setWindowModality(QtCore.Qt.ApplicationModal)
        # Окно для просмотра информации о поставке
        self.info_delivery_window = InfoDeliveryWindow()
        self.info_delivery_window.setWindowModality(QtCore.Qt.ApplicationModal)
        self.db_connection = db.SupplierConnection(self.supplier_id)
        self.fill_info_table_timer = QtCore.QTimer()
        self.fill_application_table_timer = QtCore.QTimer()
        self.fill_supply_info_table_timer = QtCore.QTimer()

    def reinit(self):
        self.fill_table(self.db_connection.get_store_info(), self.info_table)
        self.fill_table(self.db_connection.get_application_info(), self.application_info_table)
        self.fill_table(self.db_connection.get_supply_info(), self.supply_info_table)
        self.add_supply_button.clicked.connect(self.show_new_supply)
        self.information_delivery_button.clicked.connect(self.show_information_delivery)
        self.date_button.clicked.connect(self.show_date)
        self.send_material_button.clicked.connect(self.send_material)
        self.cancel_supply_button.clicked.connect(self.cancel_supply)
        self.confirm_delivery_button.clicked.connect(self.confirm_delivery)
        self.choose_date_window.ui.confirm_button.clicked.connect(self.update_end_date)
        self.fill_info_table_timer.timeout.connect(
            lambda: self.fill_table(self.db_connection.get_store_info(), self.info_table)
        )
        self.fill_info_table_timer.start(15000)
        self.fill_application_table_timer.timeout.connect(
            lambda: self.fill_table(self.db_connection.get_application_info(), self.application_info_table)
        )
        self.fill_application_table_timer.start(15000)


    # Функция для закполнения таблиц
    def fill_table(self, records, table):
        while table.rowCount() > 0:
            table.removeRow(0)
        for record in records:
            row_index = table.rowCount()
            table.insertRow(row_index)
            for column_index, item in enumerate(record):
                table_item = QtWidgets.QTableWidgetItem(str(item))
                table_item.setFlags(QtCore.Qt.ItemIsEnabled | QtCore.Qt.ItemIsSelectable)
                table_item.setTextAlignment(QtCore.Qt.AlignCenter)
                table.setItem(row_index, column_index, table_item)

    # Отображение окна для добавления заказа
    def show_new_supply(self):
        ...

    # Отображение дополнительной информации о поставке
    def show_information_delivery(self):
        if self.supply_info_table.currentItem() is not None:
            if self.supply_info_table.currentColumn() != 0:
                self.supply_info_table.setCurrentCell(self.supply_info_table.currentRow(), 0)

            delivery_number = self.supply_info_table.currentItem().text()
            self.supply_info_table.setCurrentCell(-1, -1)

            for index, item in enumerate(self.db_connection.get_more_supply_info(delivery_number)):
                table_item = QtWidgets.QTableWidgetItem(str(item))
                table_item.setFlags(QtCore.Qt.ItemIsEnabled)
                self.info_delivery_window.ui.info_table.setItem(index, 0, table_item)

            self.info_delivery_window.show()
        else:
            ...#self.select_order_error_window.show()

    # Отображение окна для добавления даты доставке
    def show_date(self):
        if self.application_info_table.currentItem() is not None:
            if self.application_info_table.currentColumn() != 0:
                self.application_info_table.setCurrentCell(self.application_info_table.currentRow(), 0)

            number = self.application_info_table.currentItem().text()
            self.application_info_table.setCurrentCell(-1, -1)
            self.choose_date_window.request_number = number
            self.choose_date_window.ui.end_date_text.setText(str(self.db_connection.get_end_data_application_info(number)))

            self.choose_date_window.show()
        else:
            ...#self.select_order_error_window.show()

    # Обновление даты поставки
    def update_end_date(self):
        if self.choose_date_window.ui.end_date_text.text() != '':
            self.db_connection.update_end_date_bd(self.choose_date_window.request_number, str(self.choose_date_window.ui.end_date_text.text()))
            self.fill_table(self.db_connection.get_application_info(), self.application_info_table)
            self.choose_date_window.close()

    # Отправить материалы
    def send_material(self):
        ...

    # Отмена поставки
    def cancel_supply(self):
        ...

    # Подтвердить доставку материалов
    def confirm_delivery(self):
        ...


# Окно для сообщения о дате поставки
class ChooseDateWindow(QtWidgets.QWidget):
    def __init__(self, parent=None):
        QtWidgets.QWidget.__init__(self, parent)
        self.ui = UiChooseDate()
        self.ui.setupUi(self)
        self.ui.cancel_button.clicked.connect(self.close)
        self.request_number = str()


# Окно для просмотра информации о поставке
class InfoDeliveryWindow(QtWidgets.QWidget):
    def __init__(self, parent=None):
        QtWidgets.QWidget.__init__(self, parent)
        self.ui = UiInfoDelivery()
        self.ui.setupUi(self)
        self.ui.close_button.clicked.connect(self.close)


# Окно для добавления новой поставки
class AddSupplyWindow(QtWidgets.QWidget):
    def __init__(self, parent=None):
        QtWidgets.QWidget.__init__(self, parent)
        self.ui = UiAddSupply()
        self.ui.setupUi(self)
        self.ui.cancel_button.clicked.connect(self.close)


if __name__ == "__main__":
    app = QtWidgets.QApplication(sys.argv)
    screen_geometry = QtWidgets.QDesktopWidget().availableGeometry()
    authorization_win = MainWindow(screen_geometry.width(), screen_geometry.height())
    authorization_win.show()
    sys.exit(app.exec_())
