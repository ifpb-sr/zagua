# – FILE: features/comerciante/ponto_de_abastecimento.feature # language: pt
Funcionalidade: Cadastro de pontos de abastecimento

Para que meus consumidores possam saber o preço da água e aonde retirar água
Como um Comerciante
Eu quero poder ter pontos de abastecimentos cadastrados e acessíveis

Cenário de Fundo:
  Dado um comerciante chamando "Joerbson"
  E sua loja:
  |Nome    |Subdomínio|Telefone    |
  |Puro H2O|puroh2o   |8398888-8889|
  E com os seguintes pontos de abastecimentos:
  |Capacidade|Valor|Cidade         |Estado|Endereço                 |Ponto de Referência                   |
  |5000      |2.50 |Junco do Seridó|PB    |Rua Severino Coelho, 141 |Por trás da rua da Igreja Santo Onofre|
  |1000      |2.60 |Junco do Seridó|PB    |R. Miguel A Nóbrega, 65  |Na rua da panificadora Dantas         |
  |2000      |2.75 |Salgadinho     |PB    |R. Pedro Leite C.Melo, 64|Na rua da Farmácia do Lino            |

Regra: O valor refere-se a quantidade de 20 litros de água

Regra: Somente o comerciante da loja pode criar pontos de abastecimento

  Cenário: Comerciante apagando um ponto de abastecimento
    Dado estou logado como comerciante
    Quando eu criar o seguinte ponto de abastecimento:
    |Capacidade|Valor|Cidade    |Estado|Endereço                                             |Ponto de Referência        |
    |3000      |2.00 |Santa Rita|PB    |Rua Virgínio Velloso Borges, S/N, Alto dos Eucaliptos|Antigo Prédio do SESI/SENAI|
    E acessar os pontos de abastecimento da loja
    Então veremos as informações dos pontos de abastecimento

  Cenário: Outros usuários não tem permissão para apagar ponto de abastecimento
    Dado estou logado como um usuário novo
    Quando eu criar o seguinte ponto de abastecimento:
    |Capacidade|Valor|Cidade    |Estado|Endereço                                             |Ponto de Referência        |
    |3000      |2.00 |Santa Rita|PB    |Rua Virgínio Velloso Borges, S/N, Alto dos Eucaliptos|Antigo Prédio do SESI/SENAI|
    Então verá mensagem informando que não tem permissão para realizar esta operação

Regra: Somente o Comerciante pode editar as informações de um ponto de abastecimento

  Cenário: Comerciante editando um ponto de abastecimento de sua loja
    Dado estou logado como comerciante
    Quando editar um ponto de abastecimento da loja para os seguintes dados:
    |Capacidade|Valor|Cidade         |Estado|Endereço                  |Ponto de Referência      |
    |6000      |1.75 |Salgadinho     |PB    |R. Pedro Leite C.Melo, 640|Próxim à Farmácia do Lino|
    E acessar os pontos de abastecimento da loja
    Então estamos vendo as novas informações do ponto de abastecimento
    Mas não estamos vendo as antigas informações do ponto de abastecimento

  Cenário: Usuário não autorizado editando posto de abastecimento
    Dado estou logado como um usuário novo
    Quando editar um ponto de abastecimento da loja para os seguintes dados:
    |Capacidade|Valor|Cidade         |Estado|Endereço                  |Ponto de Referência      |
    |6000      |1.75 |Salgadinho     |PB    |R. Pedro Leite C.Melo, 640|Próxim à Farmácia do Lino|
    Então verá mensagem informando que não tem permissão para realizar esta operação

Regra: Somente o Comerciante pode apagar um ponto de abastecimento

  Cenário: Comerciante apagando um ponto de abastecimento
    Dado estou logado como comerciante
    Quando acessar os pontos de abastecimento da loja
    E excluir um ponto de abastecimento
    E acessar os pontos de abastecimento da loja
    Então não estamos mais vendo o ponto de abastecimento excluído

  Cenário: Usuário não autorizado não tem permissão para apagar posto de abastecimento
    Dado estou logado como um usuário novo
    Quando acessar os pontos de abastecimento da loja
    E excluir um ponto de abastecimento
    Então verá mensagem informando que não tem permissão para realizar esta operação

Regra: As informações sobre os pontos de abastecimento estão publicamente disponíveis

  Cenário: usuário não autenticado acesso informações da loja
    Quando acessar os pontos de abastecimento da loja
    Então veremos as informações dos pontos de abastecimento
    Mas não veremos os nomes e capacidades dos pontos
