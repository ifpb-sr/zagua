# zagua/models.py

from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class Usuario(db.Model):
    __tablename__ = 'usuarios'
    id = db.Column(db.Integer, primary_key=True)
    senha = db.Column(db.String(64))
    def __repr__(self):
        return '<User %r>' % self.email
