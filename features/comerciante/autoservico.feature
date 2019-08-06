# – FILE: features/comerciante/autoservico.feature # language: pt
Funcionalidade: Autoserviço nos pontos de abastecimento

Para que meus consumidores possam se servirem de água sem minha intervenção
Como um Comerciante
Eu quero consumidores possam se servir de água sozinhos

Cenário de Fundo:
  Dado um comerciante chamando "Joerbson"
  E sua loja:
  |Nome    |Subdomínio|Telefone    |
  |Puro H2O|puroh2o   |8398888-8889|
  E com os seguintes pontos de abastecimentos:
  |Capacidade|Valor|Cidade         |Estado|Endereço                 |Ponto de Referência                   |
  |5000      |2.0  |Junco do Seridó|PB    |Rua Severino Coelho, 141 |Por trás da rua da Igreja Santo Onofre|
  E um usuário cadastrado:
  |Nome     |Telefone   |Senha   |E-mail            |
  |Ana Maria|83987654321|Senh@123|anamaria@gmail.com|
  E com 5 reais de crédito na loja

Regra: Os créditos do consumidor são consumidos de acordo com a quatidade utilizada

  @equipamento_libera
  Esquema do Cenário: retirando quantidade de crédito suficiente
  Dado consumidor está logado
  Quando solicitar liberar <volume> litros de água no <Posto de Abastecimento>
  Então sinal para liberação da água é enviado
  E estamos aguardando a liberação da água
  Quando notificação da liberação da água for recebida
  E consumidor acessar os seus créditos
  Então verá que seus créditos passou a ser <credito_final>

  Exemplos:
  |Volume|Posto de Abastecimento|credito_final|
  |20    |Junco do Seridó       |3.0          |
  |50    |Junco do Seridó       |0.0          |

Regra: Crédito só é atualizado após recebimento da notificação de liberação

  Esquema do Cenário: solicitando liberação com crédito insuficiente
  Dado consumidor está logado
  Quando solicitar liberar <volume> litros de água no <Posto de Abastecimento>
  Então sinal para liberação da água é enviado
  E estamos aguardando a liberação da água
  Quando notificação da liberação da água não for recebida
  E consumidor acessar os seus créditos
  Então verá que seus créditos serão <credito_final>

  Exemplos:
  |Volume|Posto de Abastecimento|credito_final|
  |60    |Junco do Seridó       |5.0          |
  |100   |Junco do Seridó       |5.0          |

Regra: Com crédito insuficiente não pode solicitar liberação

  Esquema do Cenário: solicitando liberação com crédito insuficiente
    Dado consumidor está logado
    Quando solicitar liberar <volume> litros de água no <Posto de Abastecimento>
    Então verá mensagem indicando que precisa comprar mais crédito
    E verá que seus créditos são <credito_final>

    Exemplos:
    |Volume|Posto de Abastecimento|credito_final|
    |60    |Junco do Seridó       |5.0          |
    |100   |Junco do Seridó       |5.0          |
