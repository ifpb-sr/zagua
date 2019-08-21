from flask import Flask, Blueprint, render_template
from zagua import db
from . import bp

@bp.route('/olamundo1')
def hello1():
    return "<h1>Olá mundo</h1>"

@bp.route('/novo')
def novo_usuario():
    return render_template('users/novo.html')
