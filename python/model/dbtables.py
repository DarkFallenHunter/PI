import sqlalchemy as alc
import sqlalchemy.orm
import sqlalchemy.ext.declarative
from datetime import date


engine = alc.create_engine("mysql+pymysql://root:Hunter_0197@localhost/crmpi", echo=False)
Session = alc.orm.sessionmaker(engine)
session = Session()
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


class AmountOfMaterial(Base):
    __tablename__ = "amount_of_material"
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
    supplier_id = alc.Column(alc.Integer, alc.ForeignKey('employee.employee_id'), primary_key=True)
    contract_number = alc.Column(alc.Integer)

    def __init__(self, supplier_id, contract_number):
        self.supplier_id = supplier_id
        self.contract_number = contract_number

    def __repr__(self):
        res_str = str()
        for key, value in self.__dict__.items():
            if key[0] != '_':
                res_str += "{}: {} ".format(key, value)
        return 'Delivery(' + res_str + ')'


class Employee(Base):
    __tablename__ = "employee"
    employee_id = alc.Column(alc.Integer, primary_key=True)
    surname = alc.Column(alc.String)
    name = alc.Column(alc.String)
    patronymic = alc.Column(alc.String)
    status = alc.Column(alc.String)

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


class Order(Base):
    __tablename__ = "order"
    status = alc.Column(alc.String)
    order_number = alc.Column(alc.Integer, primary_key=True)
    price = alc.Column(alc.DECIMAL)
    client_id = alc.Column(alc.Integer, alc.ForeignKey('client.client_id'))
    model_id = alc.Column(alc.Integer, alc.ForeignKey('3d_model.model_id'))
    short_description = alc.Column(alc.String)
    date = alc.Column(alc.Date)

    def __init__(self, order_number, price, client_id, model_id, short_description, date, status):
        self.status = status
        self.order_number = order_number
        self.price = price
        self.client_id = client_id
        self.model_id = model_id
        self.short_description = short_description
        self.date = date

    def __repr__(self):
        res_str = str()
        for key, value in self.__dict__.items():
            if key[0] != '_':
                res_str += "{}: {} ".format(key, value)
        return 'Order(' + res_str + ')'


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


class OrderMaterial(Base):
    __tablename__ = "order_material"
    order_number = alc.Column(alc.Integer, alc.ForeignKey('order.order_number'), primary_key=True)
    material_id = alc.Column(alc.Integer, alc.ForeignKey('material.material_id'), primary_key=True)

    def __init__(self, order_number, material_id):
        self.order_number = order_number
        self.material_id = material_id

    def __repr__(self):
        res_str = str()
        for key, value in self.__dict__.items():
            if key[0] != '_':
                res_str += "{}: {} ".format(key, value)
        return 'OrderMaterial(' + res_str + ')'


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


class Request(Base):
    __tablename__ = "request"
    request_number = alc.Column(alc.Integer, primary_key=True)

    def __init__(self, request_number):
        self.request_number = request_number

    def __repr__(self):
        res_str = str()
        for key, value in self.__dict__.items():
            if key[0] != '_':
                res_str += "{}: {} ".format(key, value)
        return 'Request(' + res_str + ')'


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


class RequestMaterial(Base):
    __tablename__ = "request_material"
    material_id = alc.Column(alc.Integer, alc.ForeignKey('amount_of_material.material_id'), primary_key=True)
    request_number = alc.Column(alc.Integer, alc.ForeignKey('request.request_number'), primary_key=True)

    def __init__(self, material_id, request_number):
        self.material_id = material_id
        self.request_number = request_number

    def __repr__(self):
        res_str = str()
        for key, value in self.__dict__.items():
            if key[0] != '_':
                res_str += "{}: {} ".format(key, value)
        return 'RequestMaterial(' + res_str + ')'


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


Base.metadata.create_all(engine)


def search_employee(login, passwd):
    for record in session.query(Access, Employee).filter_by(login=login, password=passwd).join(Employee):
        return [record.Employee.status, record.Employee.employee_id]


def get_orders_info(employee_id):
    orders = []
    for record in session.query(Order, OrderEmployee).join(OrderEmployee).filter_by(employee_id=employee_id):
        orders.append([record.Order.order_number, record.Order.date, record.Order.short_description, record.Order.status])
    return orders


def get_more_order_info(order_number):
    for record in session.query(Order, Client, OrderMaterial, Material).filter_by(order_number=order_number).\
            join(Client).join(OrderMaterial).join(Material):
        return [record.Order.order_number, record.Client.surname, record.Client.name, record.Client.patronymic,
                record.Client.telephone_number, record.Client.email, record.Material.type + ' ' + record.Material.color]


def get_needed_modification_orders(employee_id):
    orders = []
    for record in session.query(OrderModification, Order, OrderEmployee).join(Order).join(OrderEmployee).\
            filter_by(employee_id=employee_id):
        orders.append(str(record.OrderModification.order_number))
    return orders


def get_needed_modification_order_info(order_number):
    for record in session.query(OrderModification, Order, Client, Model3D, OrderMaterial, Material, ExtraInformation).\
            filter_by(order_number=order_number).join(Order).join(Model3D).join(Client).join(ExtraInformation).\
            join(OrderMaterial).join(Material):
        return [record.OrderModification.mark, record.Client.surname, record.Client.name, record.Client.patronymic,
                record.Client.telephone_number, record.Client.email, record.Model3D.model_file, record.Material.type,
                record.Material.color, record.ExtraInformation.info, record.Order.short_description, record.Order.price]


def get_plastic_types():
    types = []
    for record in session.query(InformationAboutMaterial).distinct(InformationAboutMaterial.type).\
            group_by(InformationAboutMaterial.type):
        types.append(record.type)
    return types


def get_colors_of_plastic(plastic_type):
    colors = []
    for record in session.query(InformationAboutMaterial).filter_by(type=plastic_type):
        colors.append(record.color)
    return colors


def add_new_order(values):
    clients = session.query(Client.client_id, Client.telephone_number).all()
    client_id = clients[-1].client_id + 1
    for client in clients:
        if client.telephone_number == values[3]:
            client_id = client.client_id

    if client_id == clients[-1].client_id + 1:
        session.add(Client(client_id, values[0], values[1], values[2], values[3], values[4]))

    models = session.query(Model3D).all()
    model_id = models[-1].model_id + 1
    for model in models:
        if model.model_file == values[5]:
            model_id = model.model_id

    if model_id == models[-1].model_id + 1:
        session.add(Model3D(model_id, values[5]))

    order_number = session.query(alc.func.max(Order.order_number)).one()[0] + 1
    session.add(Order(order_number, values[10], client_id, model_id, values[9], date.today(), 'В обработке'))

    material_id = session.query(alc.func.max(Material.material_id)).one()[0]
    session.add(Material(material_id, values[6], values[7]))

    session.add(OrderMaterial(order_number, material_id))

    session.add(OrderEmployee(order_number, values[11]))
    session.commit()

    if values[8] != '':
        session.add(ExtraInformation(order_number, values[8]))
        session.commit()


def update_order_info(values):
    order = session.query(Order).filter_by(order_number=int(values[0])).one()

    session.query(Model3D).filter_by(model_id=order.model_id).update({Model3D.model_file: values[6]})
    session.query(Order).filter_by(order_number=order.order_number).\
        update({Order.short_description: values[10], Order.price: values[11]})

    material_id = session.query(Material.material_id).join(OrderMaterial).\
        filter_by(order_number=order.order_number).first()[0]

    session.query(Material).filter_by(material_id=material_id).\
        update({Material.type: values[7], Material.color: values[8]})

    if values[9] == '' and session.query(ExtraInformation.info).filter_by(order_number=order.order_number).one()[0] != '':
        session.delete(session.query(ExtraInformation).filter_by(order_number=order.order_number).one())
    else:
        session.query(ExtraInformation).filter_by(order_number=order.order_number).\
            update({ExtraInformation.info: values[9]})

    session.delete(session.query(OrderModification).filter_by(order_number=order.order_number).first())

    session.commit()
