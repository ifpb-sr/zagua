from zagua import app

@app.route('/users/novo')
def novo():
    return render_template('users/novo.html')

@app.route('/users/listar')
def listar():
    return "<h1>aqui vai ta o codigo para listar</h1>"

@app.route('/users/atualizar')
def atualizar():
    return "<h1>aqui vai ta o codigo para atualizar</h1>"

@app.route('/users/apagar')
def apagar():
    return "<h1>aqui vai ta o codigo para apagar</h1>"
