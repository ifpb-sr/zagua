# – FILE: features/comerciante/loja.feature # language: pt
Funcionalidade: Cadastro de usuário

Para que eu possa acessar o sistema
Como um Consumidor
Eu quero poder me registrar no sistema

Fundo:
  Dado um usuário cadastrado:
  |Nome     |Telefone   |Senha   |E-mail            |
  |Ana Maria|83987654321|Senh@123|anamaria@gmail.com|
  E com as informações de endereço preenchidas:
  |Cidade         |Estado|Endereço                             |Ponto de Referência               |
  |Junco do Seridó|PB    |R. Lourival A de Medeiros Dantas, 113|Por trás do supermercado esperança|

Regra: O nome, telefone e senha são obrigatórios no cadastro

  Exemplo: falha de cadastro de usuário devido a ausêncida de Nome
  Quando tentar cadastrar um usuário com os seguintes dados:
  |Senha   |E-mail           |Telefone   |
  |Senh@123|alberto@gmail.com|83999991234|
  Então veremos uma mensagem informando que "Nome" deve ser preenchido

  Exemplo: falha de cadastro de usuário devido a ausêncida de Telefone
  Quando tentar cadastrar um usuário com os seguintes dados:
  |Nome   |Senha   |E-mail           |
  |Alberto|Senh@123|alberto@gmail.com|
  Então veremos uma mensagem informando que "Telefone" deve ser preenchido

  Exemplo: falha de cadastro de usuário devido a ausêncida de Senha
  Quando tentar cadastrar um usuário com os seguintes dados:
  |Nome   |Senha   |E-mail           |
  |Alberto|Senh@123|alberto@gmail.com|
  Então veremos uma mensagem informando que "Senha" deve ser preenchido

Regra: O login pode ser feito através do e-mail ou telefone (de formas diferentes)

  Esquema do Cenário: fazendo login
    Quando tentar logar com <login> e <senha>
    Então consegue logar com sucesso

  Exemplos:
  |login             |senha   |
  |anamaria@gmail.com|Senh@123|
  |83987654321       |Senh@123|
  |(83)987654321     |Senh@123|
  |(83)9876-54321    |Senh@123|

Regra: Não pode haver dois usuários com o mesmo e-mail ou telefone

Esquema do Cenário: fazendo login
  Quando tentar logar com <Nome>,<Email>,<Telefone> e <Senha>
  Então verá erro indicando que <Campo> já está cadastrado a outro usuário

  Exemplos:
  |Nome   |Senha   |Email             |Telefone   |Campo   |
  |Alberto|Senh@123|anamaria@gmail.com|83912345678|E-mail  |
  |Alberta|Senh@123|alberta@gmail.com |83999991234|Telefone|

Regra: Usuário logado pode editar suas informações

Exemplo: usuário editando suas informações de perfil
  Dado usuária está logada
  Quando atualizar suas informações de perfil:
  |Nome  |Telefone     |E-mail             |
  |Ana   |(83)999990000|anamaria2@gmail.com|
  E visualizar sua página de perfil
  Então as normas informações serão exibidas

Exemplo: usuário editando suas informações de endereço
  Dado usuária está logada
  Quando atualizar suas informações de endereço:
  |Cidade         |Estado|Endereço                 |Ponto de Referência          |
  |Junco do Seridó|PB    |R. Ver. Elías Coelho, 157|Próximo a Pizzaria Sabor Real|
  E visualizar sua página de perfil
  Então as normas informações serão exibidas

#Exemplo: perfil não pode ser editado por outro usuário
