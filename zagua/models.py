# zagua/models.py

from flask_sqlalchemy import SQLAlchemy
from zagua.database import Base

db = SQLAlchemy()

class Comerciante(Base):
    __tablename__ = 'comerciantes'
    email = db.Column(db.String(100), unique=True, primary_key=True)
    senha = db.Column(db.String(16))
    nome = db.Column(db.String(64))
    #extend_existing=True

    telefones = db.relationship('TelefoneComerciante', backref='comerciantes')

    def __init__ (self, email, senha, nome):
        self.email = email
        self.senha = senha
        self.nome = nome
        #return f"novo comerciante: {self.nome}"

    def __repr__(self):
        return '<Comerciante: %r>' %self.nome

class TelefoneComerciante(Base):
    __tablename__ = 'telefonesCormerciantes'
    telefone = db.Column(db.String(11), unique=True, primary_key=True)

    comerciante = db.Column(db.String(100), db.ForeignKey('comerciantes.email'))

    def __init__(self, telefone, comerciante):
        self.telefone = telefone
        self.comerciante = comerciante

    def __repr__(self):
        return 'Telefone: %r do comerciante %r' % (self.telefone, self.comerciante)

class Loja(Base):
    __tablename__ = 'lojas'
    id = db.Column(db.Integer, primary_key=True)
    nome = db.Column(db.String(60), unique=True, index=True)
    subdominio = db.Column(db.String(100), unique=True)
    dono_email = db.Column(db.String(100), db.ForeignKey('comerciantes.email'))

    telefones = db.relationship('TelefoneLoja', backref='lojas') ################
    pontosDeAbastecimentos = db.relationship('PontoAbastecimento', backref='lojas')############

    def __init__(self, nome, subdominio, dono_email):
        self.nome = nome
        self.subdominio = subdominio
        self.dono_email = dono_email

    def __repr__(self):
        return 'Loja %r id: %s' % (self.nome, self.id)

class TelefoneLoja(Base):
    __tablename__ = 'telefonesLoja'
    telefone = db.Column(db.String(11), unique=True, primary_key=True)

    loja_id = db.Column(db.Integer, db.ForeignKey('lojas.id'))

    def __init__(self, telefone, loja_id):
        self.telefone = telefone
        self.loja_id = loja_id

    def __repr__(self):
        return 'Telefone: %r da loja %s' % (self.telefone, self.loja_id)

class PontoAbastecimento(Base):
    """Entidade Ponto de Abastecimento:
        relacionamento: 1,n com loja
        capacidade,valor
        endereço: atributo composto
            pontoReferencia,cidade,estado,bairro,numero,logradouro
        PK: id
    """
    __tablename__ = 'pontoAbastecimento'
    id = db.Column(db.Integer, primary_key=True)
    capacidade = db.Column(db.Integer)
    valor = db.Column(db.Float)

    pontoReferencia = db.Column(db.String(100), index=True)
    cidade = db.Column(db.String(100), index=True)
    estado = db.Column(db.String(100), index=True)
    bairro = db.Column(db.String(100), index=True)
    numero = db.Column(db.String(100), index=True)
    logradouro = db.Column(db.String(100), index=True)

    loja_id = db.Column(db.Integer, db.ForeignKey('lojas.id'))

    '''def __init__(self, arg):
        self.id = id
        self.capacidade = capacidade
        self.valor = valor

        self.pontoReferencia = pontoReferencia
        self.cidade = cidade
        self.estado = estado
        self.bairro = bairro
        self.numero = numero
        self.logradouro = logradouro'''

    def __repr__(self):
        return 'id do Ponto de Abastecimento %s' % (self.id)

class Cliente(Base):
    __tablename__ = 'clientes'
    email = db.Column(db.String(100), unique=True, primary_key=True)
    senha = db.Column(db.String(16))
    nome = db.Column(db.String(64))

    telefones = db.relationship('TelefoneCliente', backref='clientes')

    def __init__ (self, email, senha, nome):
        self.email = email
        self.senha = senha
        self.nome = nome

    def __repr__(self):
        return '<Cliente: %r>' %self.nome

class TelefoneCliente(Base):
    __tablename__ = 'telefonesClientes'
    telefone = db.Column(db.String(11), unique=True, primary_key=True)

    cliente = db.Column(db.String(100), db.ForeignKey('clientes.email'))

    def __init__(self, telefone, cliente):
        self.telefone = telefone
        self.cliente = cliente

    def __repr__(self):
        return 'Telefone: %r do cliente %r' % (self.telefone, self.cliente)

'''
from zagua.database import init_db
init_db()
from zagua.database import db_session
from zagua.models import TelefoneLoja
from zagua.models import Loja
from zagua.models import Comerciante
u = Usuario(username='alefemoreira', senha='123')
c = Comerciante(nome="alefe@123.com", senha="Senha@123", nome="Álefe")
l = Loja(dono_email="alefe@123.com", nome="alefe", subdominio="123")
tl = TelefoneLoja(telefone="986197062", loja_id=1)
db_session.add(u)
db_session.commit()
'''
