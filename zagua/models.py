# zagua/models.py

from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class Usuario(db.Model):
    __tablename__ = 'usuarios'
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(50), primary_key=True)
    senha = db.Column(db.String(64), unique = True)
    def __repr__(self):
        return '<id: %r, username: %r, senha: %r>' % self.id, self.username, self.senha
