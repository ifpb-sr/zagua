# – FILE: features/comerciante/loja.feature # language: pt
Funcionalidade: Acesso rápido

Para que eu possa ter acesso rápido às ações que realizo
Como um Consumidor
Eu quero poder ter as principais ações acessíveis após o login

Cenário de Fundo:
  Dado um comerciante chamando "Joerbson"
  E sua loja:
  |Nome    |Subdomínio|Telefone    |
  |Puro H2O|puroh2o   |8398888-8889|
  E uma consumidora cadastrada:
  |Nome     |Telefone   |Senha   |E-mail            |
  |Ana Maria|83987654321|Senh@123|anamaria@gmail.com|

Regra: Favoritando loja
