# zagua/models.py

from flask_sqlalchemy import SQLAlchemy
from zagua.database import Base

db = SQLAlchemy()

class Usuario(Base):
    __tablename__ = 'usuarios'
    id = db.Column(db.Integer, primary_key=True)
    #username = db.Column(db.String(50), primary_key=True, index=True)
    username = db.Column(db.String(50), unique=True)
    email = db.Column (db.String(100), unique=True)
    senha = db.Column(db.String(16))
    cidade = db.Column(db.String(100))
    estado = db.Column(db.String(100))
    endereço = db.Column(db.String(150))
    pontoReferencia = db.Column(db.String(100))
    
    telefones = db.relationship('telefones', backref='usuarios')

    def __init__ (self, username, senha, telefone, email, cidade="", estado="", endereco="", pontoReferencia=""):
        self.username = username
        self.senha = senha
        self.telefone = telefone
        self.email = email
        self.cidade = cidade
        self.estado = estado
        self.endereco = endereco
        self.pontoReferencia = pontoReferencia

    def __repr__(self):
        return '<Usuario %r>' %self.username
        
class Telefone(Base):
    __tablename__ = 'telefones'
    telefone = db.Column(db.String(11), unique=True, primary_key=True)

    usuario = db.Column(db.Integer, db.ForeignKey('usuarios.id'))

class Loja(db.Model):
    __tablename__ = 'lojas'
    id = db.Column(db.Integer, primary_key=True)
    nome = db.Column(db.String(60), unique=True, index=True)
    dono_id = db.Column(db.Integer, db.ForeignKey('Usuario.id'))


    def __repr__(self):
        return 'Loja %r' %self.name

'''
from zagua.database import init_db
init_db()
from zagua.database import db_session
from zagua.models import Usuario
u = Usuario(username='alefemoreira', senha='123')
db_session.add(u)
db_session.commit()
'''
