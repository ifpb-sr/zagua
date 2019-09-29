# zagua/models.py

from flask_sqlalchemy import SQLAlchemy
from zagua.database import Base

db = SQLAlchemy()

class Comerciante(Base):
    __tablename__ = 'comerciantes'
    email = db.Column(db.String(100), unique=True, primary_key=True)
    senha = db.Column(db.String(16))
    nome = db.Column(db.String(64))

    telefones = db.relationship('Telefone', backref='comerciantes')

    def __init__ (self, email, senha, nome):
        self.email = email
        self.senha = senha
        self.nome = nome
        #return f"novo comerciante: {self.nome}"

    def __repr__(self):
        return '<Comerciante: %r>' %self.nome

class Telefone(Base):
    __tablename__ = 'telefones'
    telefone = db.Column(db.String(11), unique=True, primary_key=True)

    comerciante = db.Column(db.String(100), db.ForeignKey('comerciantes.email'))

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
from zagua.models import Comerciante
u = Usuario(username='alefemoreira', senha='123')
c = Comerciante(email="alefe@123.com", senha="Senha@123", nome="Álefe")
db_session.add(u)
db_session.commit()
'''
