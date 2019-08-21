from flask import Flask, Blueprint

bp = Blueprint('users', __name__,
                    template_folder='templates')

@bp.route('/olamundo1')
def hello1():
    return "<h1>Olá mundo</h1>"
