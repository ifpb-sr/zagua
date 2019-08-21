import os
from flask import Flask
from .db import *

# Factory para criar aplicação
# Ver: https://flask.palletsprojects.com/en/1.1.x/tutorial/factory/
def create_app(test_config=None):
    # create and configure the app
    app = Flask(__name__, instance_relative_config=True)
    app.config.from_mapping(
        SECRET_KEY='dev',
        #DATABASE=os.path.join(app.instance_path, 'zagua.sqlite'),
        # Configurando banco de dados.
        # Seguindo instruções em: https://flask-sqlalchemy.palletsprojects.com/en/2.x/quickstart/
        SQLALCHEMY_DATABASE_URI = 'sqlite:///instance/zagua.sqlite'
    )

    if test_config is None:
        # load the instance config, if it exists, when not testing
        app.config.from_pyfile('config.py', silent=True)
    else:
        # load the test config if passed in
        app.config.from_mapping(test_config)

    # ensure the instance folder exists
    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass

    # a simple page that says hello
    @app.route('/hello')
    def hello():
        return 'Hello, World!'

    return app
