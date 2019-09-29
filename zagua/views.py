from zagua import app
from flask import Flask, render_template

@app.route('/users/create')
def novo():
    return render_template('usuarios/novo.html')

@app.route('/users/read')
def listar():
    return "<h1>aqui vai ta o codigo para listar</h1>"

@app.route('/users/update')
def atualizar():
    return "<h1>aqui vai ta o codigo para atualizar</h1>"

@app.route('/users/delete')
def apagar():
    return "<h1>aqui vai ta o codigo para apagar</h1>"

@app.route('/users/login')
def login():
    return render_template("/login/login.html")

@app.route('/users/cadastrouser')
def cadastrouser():
    return render_template("/usuarios/cadastrouser.html")