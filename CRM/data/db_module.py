# -*- coding: utf-8 -*-

import sqlalchemy as alc
import sqlalchemy.orm
import sqlalchemy.ext.declarative
import datetime
from sqlalchemy.event import listen
from datetime import date


Base = alc.ext.declarative.declarative_base()


class Model3D(Base):
    __tablename__ = "3d_model"
    model_id = alc.Column(alc.Integer, primary_key=True)
    model_file = alc.Column(alc.String)

    def __init__(self, model_id, model_file):
        self.model_file = model_file
        self.model_id = model_id

    def __repr__(self):
        res_str = str()
        for key, value in self.__dict__.items():
            if key[0] != '_':
                res_str += "{}: {} ".format(key, value)
        return '3D Model(' + res_str + ')'


class Access(Base):
    __tablename__ = "access"
    employee_id = alc.Column(alc.Integer, alc.ForeignKey('employee.employee_id'), primary_key=True)
    login = alc.Column(alc.String)
    password = alc.Column(alc.String)

    def __init__(self, employee_id, login, password):
        self.employee_id = employee_id
        self.login = login
        self.password = password

    def __repr__(self):
        res_str = str()
        for key, value in self.__dict__.items():
            if key[0] != '_':
                res_str += "{}: {} ".format(key, value)
        return 'Access(' + res_str + ')'


class Changes(Base):
    __tablename__ = "changes"
    order_number = alc.Column(alc.Integer, alc.ForeignKey('order.order_number'), primary_key=True)
    change_time = alc.Column(alc.DateTime, primary_key=True)
    change = alc.Column(alc.String)

    def __init__(self, order_number, change_time, change):
        self.order_number = order_number
        self.change_time = change_time
        self.change = change

    def __repr__(self):
        res_str = str()
        for key, value in self.__dict__.items():
            if key[0] != '_':
                res_str += "{}: {} ".format(key, value)
        return 'AmountOfMaterial(' + res_str + ')'


class Client(Base):
    __tablename__ = "client"
    client_id = alc.Column(alc.Integer, primary_key=True)
    surname = alc.Column(alc.String)
    name = alc.Column(alc.String)
    patronymic = alc.Column(alc.String)
    telephone_number = alc.Column(alc.String)
    email = alc.Column(alc.String)

    def __init__(self, client_id, surname, name, patronymic, telephone_number, email):
        self.client_id = client_id
        self.surname = surname
        self.name = name
        self.patronymic = patronymic
        self.telephone_number = telephone_number
        self.email = email

    def __repr__(self):
        res_str = str()
        for key, value in self.__dict__.items():
            if key[0] != '_':
                res_str += "{}: {} ".format(key, value)
        return 'Client(' + res_str + ')'


class Delivery(Base):
    __tablename__ = "delivery"
    supplier_id = alc.Column(alc.Integer, alc.ForeignKey('employee.employee_id'))
    contract_number = alc.Column(alc.Integer, primary_key=True)
    material_id = alc.Column(alc.Integer)
    amount = alc.Column(alc.Integer)
    status = alc.Column(alc.Integer, alc.ForeignKey('delivery_statuses.status_id'))
    start_delivery = alc.Column(alc.DateTime)
    end_delivery = alc.Column(alc.DateTime)
    path_to_document = alc.Column(alc.String)

    def __init__(self, supplier_id, contract_number, material_id, amount,
                 status, start_delivery, end_delivery, path_to_document):
        self.supplier_id = supplier_id
        self.contract_number = contract_number
        self.material_id = material_id
        self.amount = amount
        self.status = status
        self.start_delivery = start_delivery
        self.end_delivery = end_delivery
        self.path_to_document = path_to_document

    def __repr__(self):
        res_str = str()
        for key, value in self.__dict__.items():
            if key[0] != '_':
                res_str += "{}: {} ".format(key, value)
        return 'Delivery(' + res_str + ')'


class DeliveryStatuses(Base):
    __tablename__ = "delivery_statuses"
    status_id = alc.Column(alc.Integer, primary_key=True)
    status_name = alc.Column(alc.String)

    def __init__(self, status_id, status_name):
        self.status_id = status_id
        self.status_name = status_name

    def __repr__(self):
        res_str = str()
        for key, value in self.__dict__.items():
            if key[0] != '_':
                res_str += "{}: {} ".format(key, value)
        return 'DeliveryStatuses(' + res_str + ')'


class Employee(Base):
    __tablename__ = "employee"
    employee_id = alc.Column(alc.Integer, primary_key=True)
    surname = alc.Column(alc.String)
    name = alc.Column(alc.String)
    patronymic = alc.Column(alc.String)
    status = alc.Column(alc.Integer, alc.ForeignKey('occupation.occupation_id'))

    def __init__(self, employee_id, surname, name, patronymic, status):
        self.employee_id = employee_id
        self.surname = surname
        self.name = name
        self.patronymic = patronymic
        self.status = status

    def __repr__(self):
        res_str = str()
        for key, value in self.__dict__.items():
            if key[0] != '_':
                res_str += "{}: {} ".format(key, value)
        return 'Employee(' + res_str + ')'


class InformationAboutMaterial(Base):
    __tablename__ = "information_about_material"
    material_id = alc.Column(alc.Integer, primary_key=True)
    color = alc.Column(alc.String)
    type = alc.Column(alc.String)
    diameter_of_the_strand = alc.Column(alc.Integer)

    def __init__(self, material_id, color, type, diameter_of_the_strand):
        self.material_id = material_id
        self.color = color
        self.type = type
        self.diameter_of_the_strand = diameter_of_the_strand

    def __repr__(self):
        res_str = str()
        for key, value in self.__dict__.items():
            if key[0] != '_':
                res_str += "{}: {} ".format(key, value)
        return 'InformationAboutMaterial(' + res_str + ')'


class Material(Base):
    __tablename__ = "material"
    material_id = alc.Column(alc.Integer, primary_key=True)
    type = alc.Column(alc.String)
    color = alc.Column(alc.String)

    def __init__(self, material_id, type, color):
        self.material_id = material_id
        self.type = type
        self.color = color

    def __repr__(self):
        res_str = str()
        for key, value in self.__dict__.items():
            if key[0] != '_':
                res_str += "{}: {} ".format(key, value)
        return 'Material(' + res_str + ')'


class Occupation(Base):
    __tablename__ = 'occupation'
    occupation_id = alc.Column(alc.Integer, primary_key=True)
    occupation_name = alc.Column(alc.String)

    def __init__(self, occupation_id, occupation_name):
        self.occupation_id = occupation_id
        self.occupation_name = occupation_name

    def __repr__(self):
        res_str = str()
        for key, value in self.__dict__.items():
            if key[0] != '_':
                res_str += "{}: {} ".format(key, value)
        return 'Occupation(' + res_str + ')'


class Order(Base):
    __tablename__ = "order"
    status = alc.Column(alc.Integer, alc.ForeignKey('statuses.status_id'))
    order_number = alc.Column(alc.Integer, primary_key=True)
    price = alc.Column(alc.DECIMAL)
    client_id = alc.Column(alc.Integer, alc.ForeignKey('client.client_id'))
    model_id = alc.Column(alc.Integer, alc.ForeignKey('3d_model.model_id'))
    short_description = alc.Column(alc.String)
    date = alc.Column(alc.Date)
    material_id = alc.Column(alc.Integer, alc.ForeignKey('material.material_id'))

    def __init__(self, order_number, price, client_id, model_id,
                 short_description, date, status, material_id):
        self.status = status
        self.order_number = order_number
        self.price = price
        self.client_id = client_id
        self.model_id = model_id
        self.short_description = short_description
        self.date = date
        self.material_id = material_id

    def __repr__(self):
        res_str = str()
        for key, value in self.__dict__.items():
            if key[0] != '_':
                res_str += "{}: {} ".format(key, value)
        return 'Order(' + res_str + ')'


class OrderDateEnds(Base):
    __tablename__ = "order_date_ends"
    order_number = alc.Column(alc.Integer, alc.ForeignKey('order.order_number'), primary_key=True)
    end_date = alc.Column(alc.DateTime)

    def __init__(self, order_number, end_date):
        self.order_number = order_number
        self.end_date = end_date

    def __repr__(self):
        res_str = str()
        for key, value in self.__dict__.items():
            if key[0] != '_':
                res_str += "{}: {} ".format(key, value)
        return 'OrderDateEnds(' + res_str + ')'


class ExtraInformation(Base):
    __tablename__ = "extra_information"
    order_number = alc.Column(alc.Integer, alc.ForeignKey('order.order_number'), primary_key=True)
    info = alc.Column(alc.String)

    def __init__(self, order_number, info):
        self.order_number = order_number
        self.info = info

    def __repr__(self):
        res_str = str()
        for key, value in self.__dict__.items():
            if key[0] != '_':
                res_str += "{}: {} ".format(key, value)
        return 'ExtraInformation(' + res_str + ')'


class OrderEmployee(Base):
    __tablename__ = "order_employee"
    order_number = alc.Column(alc.Integer, alc.ForeignKey('order.order_number'), primary_key=True)
    employee_id = alc.Column(alc.Integer, alc.ForeignKey('employee.employee_id'), primary_key=True)

    def __init__(self, order_number, employee_id):
        self.order_number = order_number
        self.employee_id = employee_id

    def __repr__(self):
        res_str = str()
        for key, value in self.__dict__.items():
            if key[0] != '_':
                res_str += "{}: {} ".format(key, value)
        return 'OrderEmployee(' + res_str + ')'


class OrderModification(Base):
    __tablename__ = "order_modification"
    order_number = alc.Column(alc.Integer, alc.ForeignKey('order.order_number'), primary_key=True)
    mark = alc.Column(alc.String)

    def __init__(self, order_number, mark):
        self.order_number = order_number
        self.mark = mark

    def __repr__(self):
        res_str = str()
        for key, value in self.__dict__.items():
            if key[0] != '_':
                res_str += "{}: {} ".format(key, value)
        return 'OrderModification(' + res_str + ')'


class Provider(Base):
    __tablename__ = "provider"
    company_name = alc.Column(alc.String)
    product = alc.Column(alc.String)
    provider_id = alc.Column(alc.Integer, primary_key=True)

    def __init__(self, company_name, product, provider_id):
        self.company_name = company_name
        self.product = product
        self.provider_id = provider_id

    def __repr__(self):
        res_str = str()
        for key, value in self.__dict__.items():
            if key[0] != '_':
                res_str += "{}: {} ".format(key, value)
        return 'Provider(' + res_str + ')'


class ProviderDeliver(Base):
    __tablename__ = "provider_deliver"
    provider_id = alc.Column(alc.Integer, alc.ForeignKey('provider.provider_id'), primary_key=True)
    contract_number = alc.Column(alc.Integer, alc.ForeignKey('delivery.contract_number'), primary_key=True)

    def __init__(self, provider_id, contract_number):
        self.provider_id = provider_id
        self.contract_number = contract_number

    def __repr__(self):
        res_str = str()
        for key, value in self.__dict__.items():
            if key[0] != '_':
                res_str += "{}: {} ".format(key, value)
        return 'ProviderDeliver(' + res_str + ')'


class RejectedByEmployeeOrder(Base):
    __tablename__ = 'rejected_by_employee_order'
    order_number = alc.Column(alc.Integer, alc.ForeignKey('order.order_number'), primary_key=True)
    employee_id = alc.Column(alc.Integer, primary_key=True)

    def __init__(self, order_number, employee_id):
        self.order_number = order_number
        self.employee_id = employee_id

    def __repr__(self):
        res_str = str()
        for key, value in self.__dict__.items():
            if key[0] != '_':
                res_str += "{}: {} ".format(key, value)
        return 'RejectOrder(' + res_str + ')'


class Request(Base):
    __tablename__ = "request"
    request_number = alc.Column(alc.Integer, primary_key=True)
    start_date = alc.Column(alc.Date)
    end_date = alc.Column(alc.Date)
    order_number = alc.Column(alc.Integer)
    material_id = alc.Column(alc.Integer, alc.ForeignKey('information_about_material.material_id'))
    amount_of_material = alc.Column(alc.Integer)
    status = alc.Column(alc.Integer, alc.ForeignKey('request_statuses.status_id'))

    def __init__(self, request_number, start_date, end_date, order_number, material_id, amount_of_material, status):
        self.request_number = request_number
        self.start_date = start_date
        self.end_date = end_date
        self.order_number = order_number
        self.material_id = material_id
        self.amount_of_material = amount_of_material
        self.status = status

    def __repr__(self):
        res_str = str()
        for key, value in self.__dict__.items():
            if key[0] != '_':
                res_str += "{}: {} ".format(key, value)
        return 'Request(' + res_str + ')'


class RequestStatuses(Base):
    __tablename__ = "request_statuses"
    status_id = alc.Column(alc.Integer, primary_key=True)
    status_name = alc.Column(alc.String)

    def __init__(self, status_id, status_name):
        self.status_id = status_id
        self.status_name = status_name

    def __repr__(self):
        res_str = str()
        for key, value in self.__dict__.items():
            if key[0] != '_':
                res_str += "{}: {} ".format(key, value)
        return 'DeliveryStatuses(' + res_str + ')'


class RequestEmployee(Base):
    __tablename__ = "request_employee"
    employee_id = alc.Column(alc.Integer, alc.ForeignKey('employee.employee_id'), primary_key=True)
    request_number = alc.Column(alc.Integer, alc.ForeignKey('request.request_number'), primary_key=True)

    def __init__(self, employee_id, request_number):
        self.employee_id = employee_id
        self.request_number = request_number

    def __repr__(self):
        res_str = str()
        for key, value in self.__dict__.items():
            if key[0] != '_':
                res_str += "{}: {} ".format(key, value)
        return 'RequestEmployee(' + res_str + ')'


class Statuses(Base):
    __tablename__ = "statuses"
    status_id = alc.Column(alc.Integer, primary_key=True)
    status_name = alc.Column(alc.String)

    def __init__(self, status_id, status_name):
        self.status_id = status_id
        self.status_name = status_name

    def __repr__(self):
        res_str = str()
        for key, value in self.__dict__.items():
            if key[0] != '_':
                res_str += "{}: {} ".format(key, value)
        return 'Status(' + res_str + ')'


class StoreMaterial(Base):
    __tablename__ = "store_material"
    material_id = alc.Column(alc.Integer, alc.ForeignKey('information_about_material.material_id'), primary_key=True)
    amount = alc.Column(alc.Integer)

    def __init__(self, material_id, amount):
        self.material_id = material_id
        self.amount = amount

    def __repr__(self):
        res_str = str()
        for key, value in self.__dict__.items():
            if key[0] != '_':
                res_str += "{}: {} ".format(key, value)
        return 'StoreMaterial(' + res_str + ')'


# Поиск работника по его логину и паролю
def search_employee(login, passwd):
    engine = alc.create_engine("mysql+pymysql://root:root@localhost/crmpi", echo=False)
    Session = alc.orm.sessionmaker(engine)
    session = Session()
    try:
        Base.metadata.create_all(engine)
        for record in session.query(Access, Employee).filter_by(login=login, password=passwd).join(Employee):
            return [record.Employee.status, record.Employee.employee_id]
    finally:
        session.close()


# Класс для взаимодействия с бд для менеджера
class ManagerConnection:
    def __init__(self, manager_id):
        self.engine = alc.create_engine("mysql+pymysql://root:root@localhost/crmpi", echo=False)
        self.Session = alc.orm.sessionmaker(self.engine)
        Base.metadata.create_all(self.engine)
        self.session = self.Session()
        self.manager_id = manager_id

    # Получение информации обо всех заказах менеджера
    def get_orders_info(self):
        session = self.Session()
        try:
            orders = []
            for record in session.query(Order, Statuses).filter(~Order.status.in_((7, 8))).join(Statuses).\
                    join(OrderEmployee).filter_by(employee_id=self.manager_id):
                orders.append([record.Order.order_number, record.Order.date,
                               record.Order.short_description, record.Statuses.status_name])
            return orders
        finally:
            session.close()

    # Получение расширенной информации о заказе
    def get_more_order_info(self, order_number):
        session = self.Session()
        try:
            record = session.query(Order, Client, Material, Model3D).\
                filter_by(order_number=order_number).join(Client).join(Material).join(Model3D).first()
            return [record.Order.order_number, record.Client.surname, record.Client.name, record.Client.patronymic,
                    record.Client.telephone_number, record.Client.email, record.Material.type + ' '
                    + record.Material.color, record.Model3D.model_file]
        finally:
            session.close()

    # Получение заказов, требующих доработки
    def get_needed_modification_orders(self):
        session = self.Session()
        try:
            orders = []
            for record in session.query(OrderModification, Order, OrderEmployee).join(Order).join(OrderEmployee).\
                    filter_by(employee_id=self.manager_id):
                orders.append(str(record.OrderModification.order_number))
            return orders
        finally:
            session.close()

    def get_needed_modification_order_info(self, order_number):
        session = self.Session()
        try:
            if session.query(ExtraInformation).filter_by(order_number=order_number).first() is not None:
                return session.query(OrderModification.mark, Client.surname, Client.name,
                                     Client.patronymic, Client.telephone_number, Client.email,
                                     Model3D.model_file, Material.type, Material.color,
                                     ExtraInformation.info, Order.short_description, Order.price).\
                    filter_by(order_number=order_number).join(Order).join(Model3D).join(Client).\
                    join(ExtraInformation).join(Material).first()
            else:
                record = session.query(OrderModification.mark, Client.surname, Client.name,
                                       Client.patronymic, Client.telephone_number, Client.email,
                                       Model3D.model_file, Material.type, Material.color,
                                       Order.short_description, Order.price).\
                    filter_by(order_number=order_number).join(Order).join(Model3D).join(Client).\
                    join(Material).first()
                return (record.mark, record.surname, record.name, record.patronymic, record.telephone_number,
                        record.email, record.model_file, record.type, record.color, '', record.short_description,
                        record.price)
        finally:
            session.close()

    # Получение всех типов пластика
    def get_plastic_types(self):
        session = self.Session()
        try:
            types = []
            for record in session.query(Material.type).distinct(Material.type).\
                    group_by(Material.type):
                types.append(record.type)
            return types
        finally:
            session.close()

    # Получение всех цветов для выбранного типа пластика
    def get_colors_of_plastic(self, plastic_type):
        session = self.Session()
        try:
            colors = []
            for record in session.query(Material).filter_by(type=plastic_type):
                colors.append(record.color)
            return colors
        finally:
            session.close()

    # Назначение заказа работнику
    def send_order_to_worker(self, order_number):
        session = self.Session()
        try:
            workers = session.query(Employee.employee_id).filter(Employee.status == 2).all()

            # Получение количества заказов для каждого из рабоников
            workers_orders = session.query(
                OrderEmployee.employee_id,
                alc.func.count(OrderEmployee.order_number).label('order_count')
            ).join(Employee).filter(Employee.status == 2).group_by(OrderEmployee.employee_id).all()

            workers_with_orders = [item[0] for item in workers_orders]

            for worker in workers:
                if worker.employee_id not in workers_with_orders:
                    workers_orders.append((worker.employee_id, 0))

            # Поиск работника с наименьшим количеством заказов
            optimal_worker = workers_orders[0]
            for i in range(1, len(workers_orders)):
                if optimal_worker[1] > workers_orders[i][1]:
                    optimal_worker = workers_orders[i]

            session.add(OrderEmployee(order_number, optimal_worker[0]))
            session.commit()
        finally:
            session.close()

    # Добавление нового заказа в базу данных
    def add_new_order(self, values):
        session = self.Session()
        try:
            # Поиск клиента в бд по телефону
            clients = session.query(Client.client_id, Client.telephone_number).all()
            client_id = clients[-1].client_id + 1
            for client in clients:
                if client.telephone_number == values[3]:
                    client_id = client.client_id

            # Если клиент не был найден, добавляется новый клиент
            if client_id == clients[-1].client_id + 1:
                session.add(Client(client_id, values[0], values[1], values[2], values[3], values[4]))
                session.commit()

            # Поиск модели в бд
            models = session.query(Model3D).all()
            model_id = models[-1].model_id + 1
            for model in models:
                if model.model_file == values[5]:
                    model_id = model.model_id

            # Если модель не найдена, добавляется новая модель
            if model_id == models[-1].model_id + 1:
                session.add(Model3D(model_id, values[5]))
                session.commit()

            # Определение id материала для заказа
            material_id = session.query(Material.material_id).filter(Material.type == values[6],
                                                                     Material.color == values[7]
                                                                     ).first()[0]
            # Определение номера заказа
            order_number = session.query(alc.func.max(Order.order_number)).first()[0] + 1
            session.add(Order(order_number, values[10], client_id, model_id,
                              values[9], date.today(), date.today(), material_id))
            session.commit()

            # print(*session.query(Order).all(), sep='\n')

            session.add(OrderEmployee(order_number, values[11]))
            session.commit()

            # Если есть дополнительная информация, она добавляется в бд
            if values[8] != '':
                session.add(ExtraInformation(order_number, values[8]))
                session.commit()

            self.send_order_to_worker(order_number)
        finally:
            session.close()

    # Обновление информации о заказе
    def update_order_info(self, values):
        session = self.Session()
        try:

            ########################################################################################################

            rec = session.query(Client.surname, Client.name, Client.patronymic, Client.telephone_number,
                                Client.email, Model3D.model_file, Material.type, Material.color, ExtraInformation.info,
                                Order.short_description, Order.price).join(Order).filter_by(order_number=int(values[0])).\
                                join(ExtraInformation).join(Material).join(Model3D).first()

            fields_names = ["Фамилия", "Имя", "Отчество", "Телефонный номер", "Электронная почта", "Файл модели", "Тип",
                            "Цвет", "Дополнителная информация", "Краткая информация", "Цена"]

            tabl = ''

            for i in range(len(rec)):
                if str(rec[i]) != str(values[i+1]):
                    tabl = tabl + fields_names[i] + ': ' + str(rec[i]) + ' -> ' + str(values[i+1]) + '\n'

            print(tabl)
            session.add(Changes(values[0], datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"), tabl))

            ########################################################################################################

            order = session.query(Order).filter_by(order_number=int(values[0])).one()

            session.query(Client).filter_by(client_id=order.client_id).update({Client.surname: values[1],
                                                                               Client.name: values[2],
                                                                               Client.patronymic: values[3],
                                                                               Client.telephone_number: values[4],
                                                                               Client.email: values[5]})
            session.query(Model3D).filter_by(model_id=order.model_id).update({Model3D.model_file: values[6]})
            session.query(Order).filter_by(order_number=order.order_number).\
                update({Order.short_description: values[10], Order.price: values[11]})

            session.query(Material).filter_by(material_id=order.material_id).update({Material.type: values[7],
                                                                                     Material.color: values[8]})

            extra_info = session.query(ExtraInformation.info).filter_by(order_number=order.order_number).first()
            if values[9] != '' and not extra_info:
                session.add(ExtraInformation(int(values[0]), values[9]))
            elif values[9] == '' and extra_info:
                session.delete(extra_info)
            else:
                session.query(ExtraInformation).filter_by(order_number=order.order_number).\
                    update({ExtraInformation.info: values[9]})

            session.delete(session.query(OrderModification).filter_by(order_number=order.order_number).first())

            order.status = 2

            session.commit()
        except Exception as e:
            print(e)
        finally:
            session.close()

    # Получение списка телефонов всех клиентов
    def get_phones(self):
        session = self.Session()
        try:
            numbers = []
            for record in session.query(Client):
                numbers.append(record.telephone_number)
            return numbers
        finally:
            session.close()

    # Получение информации о клиенте по его телефону
    def get_client_info_by_phone(self, phone_number):
        session = self.Session()
        try:
            for record in session.query(Client).filter_by(telephone_number=phone_number):
                return [record.surname, record.name, record.patronymic, record.email]
        finally:
            session.close()

    # Отмена заказа
    def cancel_order(self, order_number):
        session = self.Session()
        try:
            session.query(Order).filter_by(order_number=order_number).update({Order.status: 8})

            material_request = session.query(Request).filter_by(order_number=order_number).first()

            if material_request is not None:
                session.query(StoreMaterial).filter_by(material_id=material_request.material_id).\
                    update({StoreMaterial.amount: (StoreMaterial.amount + material_request.amount)})

                session.delete(material_request)

            session.commit()

        finally:
            session.close()

    # Завершение заказа
    def complete_order(self, order_number):
        session = self.Session()
        try:
            session.query(Order).filter_by(order_number=order_number).update({Order.status: 7})
            session.commit()
        finally:
            session.close()


# Класс для взаимодействия с бд для работника
class WorkerConnection:
    def __init__(self, worker_id):
        self.engine = alc.create_engine("mysql+pymysql://root:root@localhost/crmpi", echo=False)
        self.Session = alc.orm.sessionmaker(self.engine)
        Base.metadata.create_all(self.engine)
        self.session = self.Session()
        self.worker_id = worker_id

    # Получение информации о текущих заказах работника
    def get_orders_info(self):
        session = self.Session()
        try:
            orders = []
            for record in session.query(Order, Statuses).join(Statuses).filter(Order.status.in_((2, 3, 5))).\
                    join(OrderEmployee).filter_by(employee_id=self.worker_id):
                orders.append([record.Order.order_number, 0, record.Statuses.status_name])
            requests_dates = dict()
            # Получение информации о датах поступления материалов
            for record in session.query(Request):
                if record.start_date == record.end_date and record.status == 1:
                    requests_dates[record.order_number] = 'Заявка отправлена'
                else:
                    requests_dates[record.order_number] = record.end_date
            # Заполнение информации о датах поступления материалов
            for order in orders:
                if order[0] in requests_dates.keys():
                    order[1] = requests_dates[order[0]]
                else:
                    order[1] = 'Заявка не отправлена'
            return orders
        finally:
            session.close()

    # Получение расширенной информации о заказе
    def get_more_order_info(self, order_number):
        session = self.Session()
        try:
            # Если есть расширенная информация о заказе, она добавляется в список
            if len(session.query(ExtraInformation).filter_by(order_number=order_number).all()) != 0:
                record = session.query(Order, Material, Model3D, ExtraInformation).\
                         filter_by(order_number=order_number).join(Material).join(ExtraInformation).first()
                return [record.Order.order_number, record.Material.type + ' ' + record.Material.color,
                        record.Model3D.model_file, record.Order.short_description, record.ExtraInformation.info]

            record = session.query(Order, Material, Model3D).\
                filter_by(order_number=order_number).join(Material).first()
            return [record.Order.order_number, record.Material.type + ' ' + record.Material.color,
                    record.Model3D.model_file, record.Order.short_description]
        finally:
            session.close()

    # Получение информации о новых заказах работника
    def get_new_orders(self):
        session = self.Session()
        try:
            new_orders = []
            for record in session.query(Order, Model3D, Material).filter_by(status=1).join(OrderEmployee).\
                    filter_by(employee_id=self.worker_id).join(Statuses).join(Model3D).join(Material):
                new_orders.append([record.Order.order_number, record.Order.short_description, record.Model3D.model_file,
                                   record.Material.type + ' ' + record.Material.color])
            return new_orders
        finally:
            session.close()

    # Приём работником заказа
    def take_order(self, order_number):
        session = self.Session()
        try:
            session.query(Order).filter_by(order_number=order_number).update({'status': 2})
            session.commit()
        finally:
            session.close()

    # Отправка заказа на доработку
    def send_order_to_modify(self, order_number, mark):
        session = self.Session()
        try:
            session.query(Order).filter_by(order_number=order_number).update({'status': 4})
            session.add(OrderModification(order_number, mark))
            session.commit()
        finally:
            session.close()

    # Завершение заказа
    def complete_order(self, order_number):
        session = self.Session()
        try:
            session.query(Order).filter_by(order_number=order_number).update({'status': 6})
            session.commit()
        finally:
            session.close()

    # Передача заказа другому работнику
    def send_order_to_another(self, order_number):
        session = self.Session()
        try:
            session.add(RejectedByEmployeeOrder(order_number, self.worker_id))

            rejected_workers = [item.employee_id for item in
                                session.query(RejectedByEmployeeOrder).filter_by(order_number=order_number)]

            workers_orders = session.query(
                OrderEmployee.employee_id,
                alc.func.count(OrderEmployee.order_number).label('order_count')
            ).join(Employee).filter(Employee.status == 2, ~Employee.employee_id.in_(rejected_workers)).\
                group_by(OrderEmployee.employee_id).all()

            workers = session.query(Employee.employee_id).\
                filter(Employee.status == 2, ~Employee.employee_id.in_(rejected_workers)).all()

            if len(workers) == 0:
                session.rollback()
                return -1

            workers_with_orders = [item[0] for item in workers_orders]

            for worker in workers:
                if worker.employee_id not in workers_with_orders:
                    workers_orders.append((worker.employee_id, 0))

            # Поиск работника с наименьшим количеством заказов
            optimal_worker = workers_orders[0]
            for i in range(1, len(workers_orders)):
                if optimal_worker[1] > workers_orders[i][1]:
                    optimal_worker = workers_orders[i]

            session.delete(session.query(OrderEmployee).filter(OrderEmployee.order_number == order_number,
                                                               OrderEmployee.employee_id == self.worker_id).first())
            session.add(OrderEmployee(order_number, optimal_worker[0]))
            session.commit()
        finally:
            session.close()

    def get_order_material(self, order_number):
        session = self.Session()
        try:
            material_info = [item for item in session.query(Material.type, Material.color).join(Order).\
                             filter(Order.order_number == order_number).first()]

            material_info.append([item[0] for item in session.query(InformationAboutMaterial.diameter_of_the_strand).\
                                  filter(InformationAboutMaterial.type == material_info[0],
                                         InformationAboutMaterial.color == material_info[1]).all()])

            return material_info
        finally:
            session.close()


    def send_request(self, info):
        session = self.Session()
        try:
            material_id = session.query(InformationAboutMaterial.material_id).\
                filter(InformationAboutMaterial.type == info[0],
                       InformationAboutMaterial.color == info[1],
                       InformationAboutMaterial.diameter_of_the_strand == info[2]
                       ).first()[0]

            request_number = session.query(alc.func.max(Request.request_number)).first()[0] + 1
            request = Request(request_number, datetime.date.today(), datetime.date.today(),
                              info[4], material_id, info[3], 1)
            print(request)
            session.add(Request(request_number, datetime.date.today(), datetime.date.today(),
                                info[4], material_id, info[3], 1))

            session.commit()
        finally:
            session.close()


# Класс для взаимодействия с бд для снабженца
class SupplierConnection:
    def __init__(self, supplier_id):
        self.engine = alc.create_engine("mysql+pymysql://root:root@localhost/crmpi", echo=False)
        self.Session = alc.orm.sessionmaker(self.engine)
        Base.metadata.create_all(self.engine)
        self.supplier_id = supplier_id

    # Получить информацию с склада
    def get_store_info(self):
        session = self.Session()
        try:
            material = []
            for record in session.query(InformationAboutMaterial, StoreMaterial).join(StoreMaterial):
                material.append([record.InformationAboutMaterial.material_id, record.InformationAboutMaterial.color,
                                 record.InformationAboutMaterial.diameter_of_the_strand,
                                 record.InformationAboutMaterial.type, record.StoreMaterial.amount])
            return material
        except Exception as x:
            print(x)
        finally:
            session.close()

    # Получить информацию о заявках
    def get_application_info(self):
        session = self.Session()
        try:
            request = []
            for record in session.query(Request, InformationAboutMaterial, RequestStatuses)\
                    .join(InformationAboutMaterial).join(RequestStatuses):
                request.append([record.Request.request_number, str(record.InformationAboutMaterial.type) + ' ' +
                                str(record.InformationAboutMaterial.color) + ' '
                                + str(record.InformationAboutMaterial.diameter_of_the_strand)
                                + ' мм', record.Request.amount_of_material, record.Request.start_date,
                                record.Request.end_date, record.RequestStatuses.status_name])
            return request
        except Exception as x:
            print(x)
        finally:
            session.close()

    # Получить информацию о поставках
    def get_supply_info(self):
        session = self.Session()
        try:
            delivery = []
            for record in session.query(Delivery, DeliveryStatuses).join(DeliveryStatuses):
                delivery.append([record.Delivery.contract_number, record.DeliveryStatuses.status_name])
            return delivery
        finally:
            session.close()

    # Изменить статус у заявки
    def update_status_request(self, number, status):
        session = self.Session()
        try:
            session.query(Request).filter_by(request_number=number).update({Request.status: status})
            session.commit()
        except Exception as x:
            print(x)
        finally:
            session.close()

    # Изменить статус у поставки
    def update_status_delivery(self, number):
        session = self.Session()
        try:
            session.query(Delivery).filter_by(contract_number=number).update({Delivery.status: '3'})
            session.commit()
        except Exception as x:
            print(x)
        finally:
            session.close()

    # Отмена поставки
    def cancel_delivery(self, number):
        session = self.Session()
        try:
            session.query(Delivery).filter_by(contract_number=number).delete()
            session.commit()
        except Exception as x:
            print(x)
        finally:
            session.close()

    # Получить дополнительную информацию о поставке
    def get_more_supply_info(self, delivery_number):
        session = self.Session()
        try:
            delivery = []
            for record in session.query(Delivery, DeliveryStatuses, Provider).\
                    filter_by(contract_number=delivery_number).\
                    join(DeliveryStatuses).join(ProviderDeliver).join(Provider):
                delivery.append([record.Delivery.contract_number, record.Provider.company_name, record.Delivery.path_to_document,
                                 record.Delivery.material_id, record.DeliveryStatuses.status_name])
            delivery_diction = {}
            for record in session.query(InformationAboutMaterial):
                delivery_diction[record.material_id] = str(record.type) + ' ' + str(record.color) + ' ' + str(
                    record.diameter_of_the_strand) + ' мм'
            for records in delivery:
                records[3] = delivery_diction[records[3]]
            return delivery[0]
        except Exception as x:
            print(x)
        finally:
            session.close()

    # Получить дату окончание заявки
    def get_end_data_application_info(self, number):
        session = self.Session()
        try:
            record = session.query(Request).filter_by(request_number=number).first()
            return record.end_date
        finally:
            session.close()

    # Изменить дату окончание заявки
    def update_end_date_bd(self, text, end_date):
        session = self.Session()
        try:
            end_date = date(*map(int, end_date.split('-')))
            session.query(Request).filter_by(request_number=text).update({Request.end_date: end_date})
            session.commit()
        finally:
            session.close()

    # Получить информацию со склада
    def get_info_add_supply(self):
        session = self.Session()
        try:
            info = []
            for record in session.query(InformationAboutMaterial):
                info.append([record.type, record.color, record.diameter_of_the_strand])
            return info
        finally:
            session.close()

    def add_new_application(self, text):
        session = self.Session()
        try:
            mat_id = session.query(InformationAboutMaterial).filter_by(type = text[4], color = text[5],
                                                              diameter_of_the_strand = text[6]).first()
            session.add(Delivery(text[0], text[1], mat_id.material_id, text[2], 1, date.today(), date.today(), text[3]))
            xyu = session.query(Provider).filter_by(product = mat_id.type).first()

            session.add(ProviderDeliver(xyu.provider_id, text[1]))
            session.commit()
        except Exception as x:
            print(x)
        finally:
            session.close()

    def get_comboboxes_info(self, type):
        session = self.Session()
        try:
            info = []
            for record in session.query(InformationAboutMaterial).filter_by(type = type):
                info.append([record.color, record.diameter_of_the_strand])
            return info
        finally:
            session.close()



engine = alc.create_engine("mysql+pymysql://root:root@localhost/crmpi", echo=False)
Session = alc.orm.sessionmaker(engine)
session = Session()

# worker_con = WorkerConnection(2)
# worker_con.get_order_material(1)

# def show_workers(*args):
#     print(args)

# manager_con = ManagerConnection(1)
# manager_con.send_order_to_worker(1)

try:
    info = []
    for record in session.query(InformationAboutMaterial):
        info.append([record.type, record.color, record.diameter_of_the_strand])
    print(info)
    multitude_type = []
    multitude_color = []
    multitude_diameter = []
    for i in range(len(info)):
        multitude_type.append(info[i][0])
        multitude_color.append(info[i][1])
        multitude_diameter.append(info[i][2])
    multitude_type = set(multitude_type)
    multitude_color = set(multitude_color)
    multitude_diameter = set(multitude_diameter)
    print(multitude_type, multitude_color, multitude_diameter)
finally:
    session.close()

