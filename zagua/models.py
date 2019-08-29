# zagua/models.py

from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class Usuario(db.Model):
    __tablename__ = 'usuarios'
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(50), primary_key=True, index=True)
    senha = db.Column(db.String(64), unique = True)

    def __repr__(self):
        return '<Usuario %r>' self.username

class Loja(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(60), unique=True, index=True)

    def __repr__(self):
        return 'Loja %r' self.name

