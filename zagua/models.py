# zagua/models.py

from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class User(db.Model):
    __tablename__ = 'users'
    id = db.Column(db.Integer, primary_key=True)
    email = db.Column(db.String(128), unique=True, index=True)
    senha = db.Column(db.String(64))
    telefone = db.Column(db.String(32))
    nome = db.Column(db.String(128))

    def __repr__(self):
        return '<User %r>' % self.email
