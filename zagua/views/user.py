from zagua import app

@app.route('/user/novo')
def usuario_novo():
    return render_template('users/novo.html')

@app.route('/user/listar')
def loja():
    return "<h1>aqui vai ta o codigo para listar</h1>"

@app.route('/user/atualizar')
def novo_usuario():
    return "<h1>aqui vai ta o codigo para atualizar</h1>"

@app.route('/user/apagar')
def novo_usuario():
    return "<h1>aqui vai ta o codigo para apagar</h1>"
