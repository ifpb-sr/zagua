import click
from flask import current_app, g
from flask.cli import with_appcontext
from flask_sqlalchemy import SQLAlchemy

def get_db():
    if 'db' not in g:
        g.db = SQLAlchemy(current_app)
    return g.db

def init_db():
    db = get_db()
    db.drop_all()
    db.create_all()

@click.command('zera-db')
@with_appcontext
def init_db_command():
    """Clear the existing data and create new tables."""
    init_db()
    click.echo('Inicializando banco de dados.')
