# – FILE: features/comerciante/loja.feature # language: pt
Funcionalidade: Concessão de crédito

Para não dividir meus rendimentos com operadoras de cartão de crédito
Como um Comerciante
Eu quero vender os créditos através de transferência bancária e concedê-los para meus clientes

Cenário de Fundo:
  Dado um comerciante chamando "Joerbson"
  E sua loja:
  |Nome    |Subdomínio|Telefone    |E-mail           |
  |Puro H2O|puroh2o   |8398888-8889|puroh2o@gmail.com|
  E aceitando pagamento bancário para as seguintes contas:
  |Banco |Favorecido|Informações                                      |
  |Caixa |Puro H2O  |Agência: 4408, Conta: 00280006077-1, Operação: 13|
  |Brasil|Joerbson S|Agência: 1344, CC: 1119076-0, CPF: 774.416.550-05|
  E uma consumidora cadastrada:
  |Nome     |Telefone   |Senha   |E-mail            |
  |Ana Maria|83987654321|Senh@123|anamaria@gmail.com|
  E com os seguintes pagamentos bancários de crédito nessa loja:
  |Banco |Valor |Horário do Pagamento|Status                   |Mensagem do Comerciante  |
  |Caixa | 50.00|2019/8/3 11:45      |Não Conferido            |                         |
  |Caixa |100.00|2019/8/2 09:13      |Conferido e creditado    |                         |
  |Brasil| 50.00|2019/8/1 08:20      |Conferido e não creditado|Não encontrei o pagamento|

Regra: O cadastro das informações bancárias são realizadas pelo suporte

Regra: Consumidor pode acessar as informações bancárias do comerciante
  Exemplo: Consumidor acessando página das informações bancárias
  Dado consumidora está logada
  Quando escolher opções de comprar crédito da loja
  Então verá as informações das contas bancárias cadastradas na loja

Regra: Consumidor cadastra pagamento de crédito bancário

  Exemplo: Consumidor cadastrando pagamento
    Dado consumidora está logada
    Quando cadastra pagamento bancário referente a compra de crédito:
    |Banco |Valor |Horário do Pagamento|
    |Brasil| 70.00|2019/8/4 15:15      |
    Então verá o pagamento bancário cadastrado com status "Não conferido"
    E poderá notificar os detalhes do pagamento através do WhatsApp da loja

Regra: Consumidor consulta pagamentos cadastrados

  Exemplo: Consumidor consultando os pagamentos bancários realizados
    Dado consumidora está logada
    Quando consultar os pagamentos bancários cadastrados
    Então verá os pagamentos e suas respectivas informações

Regra: Comerciante confere os pagamentos cadastrados

  Exemplo: Comerciante conferiu pagamento e concedeu o crédito
    Dado comerciante está logado
    Quando consultar os pagamentos bancários cadastrados
    E conceder crédito referente ao último pagamento não conferido cadastrado pela consumidora
    Então veremos que o status do pagamento do crédito mudou para "Conferido e creditado"
    E o crédito da consumidora aumentou de acordo com o crédito comprado

  Exemplo: Comerciante conferiu pagamento e não concedeu o crédito
    Dado comerciante está logado
    Quando consultar os pagamentos bancários cadastrados
    E informar que não concedeu o crédito com uma mensagem "Não encontrei pagamento"
    Então veremos que o status do pagamento do crédito mudou para "Conferido e não creditado"
    E o crédito da consumidora permaneceu o mesmo
