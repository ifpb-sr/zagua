from flask import Flask, Blueprint, render_template
from zagua import db
from . import bp

@bp.route('/user')
def usuario():
    return "<h1>aqui vai ta o codigo html</h1>"

@bp.route('/loja')
def loja():
    return "<h1>aqui vai ta o codigo html</h1>"


@bp.route('/novo')
def novo_usuario():
    return render_template('users/novo.html')
