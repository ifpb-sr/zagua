from zagua import app

@app.route('/user')
def usuario():
    return "<h1>aqui vai ta o codigo html</h1>"

@app.route('/loja')
def loja():
    return "<h1>aqui vai ta o codigo html</h1>"

@app.route('/novo')
def novo_usuario():
    return render_template('users/novo.html')
