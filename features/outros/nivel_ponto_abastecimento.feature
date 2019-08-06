# – FILE: features/comerciante/loja.feature # language: pt
Funcionalidade: Nível e abastecimento dos pontos de abastecimento

Para que meus consumidores possam se servirem de água sem minha intervenção
Como um Comerciante
Eu quero meus consumidores se autoservindo em meus pontos de abastecimento

Cenário de Fundo:
  Dado um comerciante chamando "Joerbson"
  E sua loja:
  |Nome    |Subdomínio|Telefone    |
  |Puro H2O|puroh2o   |8398888-8889|
  E com os seguintes pontos de abastecimentos:
  |Capacidade|Valor|Cidade         |Estado|Endereço                |
  |5000      |2.50 |Junco do Seridó|PB    |Rua Severino Coelho, 141|

Regra: O valor refere-se a quantidade de 20 litros de água
Regra: Atualmente os pontos de abastecimento serão criados pelo Suporte

Regra: As informações sobre os pontos de abastecimento estão publicamente disponíveis
  Quando acessar os pontos de abastecimento da loja
  Então veremos as informações dos pontos de abastecimento
  Mas não veremos os nomes e capacidades dos pontos
