from zagua import app

@app.route('/users/novo')
def usuario_novo():
    return render_template('users/novo.html')

@app.route('/users/listar')
def loja():
    return "<h1>aqui vai ta o codigo para listar</h1>"

@app.route('/users/atualizar')
def novo_usuario():
    return "<h1>aqui vai ta o codigo para atualizar</h1>"

@app.route('/users/apagar')
def novo_usuario():
    return "<h1>aqui vai ta o codigo para apagar</h1>"
