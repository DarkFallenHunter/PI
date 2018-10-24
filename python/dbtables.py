import sqlalchemy as alc
import sqlalchemy.orm
import sqlalchemy.ext.declarative


engine = alc.create_engine("mysql+pymysql://user:pass@localhost/crmpi", echo=False, encoding='uft8')
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
    employee_id = alc.Column(alc.Integer, primary_key=True)
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
    order_number = alc.Column(alc.Integer, primary_key=True)
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
    model_id = alc.Column(alc.Integer, alc.ForeignKey('model.model_id'))
    short_description = alc.Column(alc.String)

    def __init__(self, status, order_number, price, client_id, model_id, short_description):
        self.status = status
        self.order_number = order_number
        self.price = price
        self.client_id = client_id
        self.model_id = model_id
        self.short_description = short_description

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
        self.material_id = mark

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
