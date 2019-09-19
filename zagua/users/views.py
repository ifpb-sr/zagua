from flask import Flask, Blueprint, render_template
from zagua import db
from . import bp

@bp.route('/user')
def usuario():
    return "<h1>aqui vai ta o codigo html</h1>"

@bp.route('/loja')
def loja():
    return "<h1>aqui vai ta o codigo html</h1>"

@bp.route('/criar')
def novo_usuario():
    return render_template('users/novo.html')

@bp.route('/listar')
def listar():
    return "<h1>lista todos os usuarios cadastrados</h1>"

@bp.route('/atualizar')
def atualizar():
    return "<h1>atualiza informações de um usuário cadastrado</h1>"

@bp.route('/apagar')
def apagar():
    return "<h1>apaga um usuário existente</h1>"
