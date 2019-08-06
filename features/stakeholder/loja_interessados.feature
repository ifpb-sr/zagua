# – FILE: features/stakeholder/loja_interessados.feature # language: pt
Funcionalidade: Saber quem tem interesse em abrir uma loja

Para que eu possa vender o equipamento do zágua
Como um Stakeholder do zágua
Eu quero saber quem tem interesse em adquirir o equipamento

Regra: Cadastramos todos que tem interesse em adquirir os equipamentos

  Exemplo: Possível cliente deseja criar loja virtual
    Dado um possível cliente que deseja criar uma loja
    Quando preencher e enviar formulário para abertura de loja:
    |Nome   |Telefone     |E-mail           |Cidade       |Estado|
    |Lohana |8399999-9999 |lohana@gmail.com |Serra Talhada|PE    |
    Então verá uma mensagem informando que ainda estamos em fase de testes
