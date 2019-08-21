from flask import Flask, Blueprint, render_template

bp = Blueprint('users', __name__,
                    template_folder='templates')

from . import views
