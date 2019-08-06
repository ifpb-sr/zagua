# – FILE: features/comerciante/ponto_abastecimento.feature # language: pt
# Para que eu possa vender água facilmente
# Como um Comerciante
# Eu quero criar uma loja virtual para venda de água

Funcionalidade: Solicitação de criação de loja virtual
Dado um usuário cadastrado que deseja criar uma loja
Quando enviar formulário para abertura de loja:
|Nome da loja           |Sub domínio |Telefone    |
|Santa água dois irmãos |2irmaos     |8399999-9999|
Então receberá uma mensagem informando que será contactado em breve
