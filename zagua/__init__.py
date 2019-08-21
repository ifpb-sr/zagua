import os
from flask import Flask

# Configuração baseado em:
# https://flask.palletsprojects.com/en/1.1.x/tutorial/factory/
def create_app(test_config=None):
    # create and configure the app
    # Existem outras alternativas para configuração:
    # https://flask.palletsprojects.com/en/1.1.x/config/
    app = Flask(__name__, instance_relative_config=True)
    app.config.from_mapping(
        SECRET_KEY='dev',
        SQLALCHEMY_DATABASE_URI =\
            'sqlite:///' + os.path.join(app.instance_path, 'data.sqlite'),
        SQLALCHEMY_TRACK_MODIFICATIONS=False
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

    # Configurando o banco:
    # https://stackoverflow.com/questions/41004540/using-sqlalchemy-models-in-and-out-of-flask
    from .models import db
    db.init_app(app)

    # https://flask.palletsprojects.com/en/1.1.x/patterns/packages/#working-with-blueprints
    from .users import bp as user_bp

    app.register_blueprint(user_bp, url_prefix='/users')

    return app
