from flask import Flask, Blueprint, render_template

bp = Blueprint('users', __name__,
                    template_folder='templates')

@bp.route('/olamundo1')
def hello1():
    return "<h1>Olá mundo</h1>"

@bp.route('/novo')
def novo_usuario():
    return render_template('users/novo.html')
