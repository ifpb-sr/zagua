# – FILE: features/comerciante/loja.feature # language: pt
Funcionalidade: Cadastro de pontos de abastecimento

Para que meus consumidores possam se servirem de água sem minha intervenção
Como um Comerciante
Eu quero poder ter pontos de abastecimentos cadastrados e acessíveis

Cenário de Fundo:
  Dado um comerciante chamando "Joerbson"
  E sua loja:
  |Nome    |Subdomínio|Telefone    |
  |Puro H2O|puroh2o   |8398888-8889|
  E com os seguintes pontos de abastecimentos:
  |Nome      |Capacidade|Valor|Cidade         |Estado|Endereço                 |Ponto de Referência                   |
  |Casa      |5000      |3    |Junco do Seridó|PB    |Rua Severino Coelho, 141 |Por trás da rua da Igreja Santo Onofre|
  |Centro    |1000      |3    |Junco do Seridó|PB    |R. Miguel A Nóbrega, 65  |Na rua da panificadora Dantas         |
  |Salgadinho|2000      |3.20 |Salgadinho     |PB    |R. Pedro Leite C.Melo, 64|Na rua da Farmácia do Lino            |

Regra: Atualmente os pontos de abastecimento serão criados pelo Suporte

Regra: As informações sobre os pontos de abastecimento estão publicamente disponíveis
  Quando acessar os pontos de abastecimento da loja
  Então veremos as informações dos pontos de abastecimento
