# – FILE: features/comerciante/loja.feature # language: pt
Funcionalidade: Concessão de crédito

Para vender para consumidores que não possuem conta bancária
Como um Comerciante
Eu quero poder vender créditos presencialmente

Cenário de Fundo:
  Dado um comerciante chamando "Joerbson"
  E sua loja:
  |Nome    |Subdomínio|Telefone    |
  |Puro H2O|puroh2o   |8398888-8889|
  E loja aceitando pagamento presencialmente:
  |Informações|
  |Mercadinho Santa Luz (8:00h às 16:00h). Não aceitamos cheques.|
  E uma consumidora cadastrada:
  |Nome     |Telefone   |Senha   |E-mail            |
  |Ana Maria|83987654321|Senh@123|anamaria@gmail.com|
  E com 3 reais de crédito na loja

Regra: Consumidor pode acessar as informações de compra de crédito

  Exemplo: Consumidor acessando página de informações de compra de crédito
  Dado consumidora está logada
  Quando escolher opções de comprar crédito da loja
  Então verá que aceita pagamento presencialmente e as informações cadastradas


Regra: O comerciante concede crédito na loja ao consumidor

Esquema do Cenário: concendendo crédito presencial à consumidor
  Dado o comerciante está logado
  Quando concede crédito presencial de <valor> para <consumidor>
  Então verifica que o crédito do consumidor foi para credito_final
  E posso enviar mensagem WhatsApp informando ao consumidor o ocorrido

  Exemplos:
  |consumidor |valor|credito_final|
  |Ana Maria  |25   |28           |
  |83987654321|50   |53           |
