# – FILE: features/comerciante/loja.feature # language: pt
Funcionalidade: Solicitar entrega

Para que eu possa receber entrega de água
Como um Consumidor
Eu quero poder solicitar entrega de água a um representante

Fundo:
  Dado um consumidor cadastrado:
  |Nome     |Telefone   |Senha   |E-mail          |
  |Cássio   |83987654321|Senh@123|cassio@gmail.com|
  E com um locais de entrega cadastrado:
  |Nome    |Cidade         |Estado|Endereço                                       |Ponto de Referência               |
  |Casa    |Junco do Seridó|PB    |R. Lourival A de Medeiros Dantas, 113          |Por trás do supermercado esperança|
  |Trabalho|Junco do Seridó|PB    |R. Francisco Caetano de Oliveira - Santo Onofre|Depois da Praça Lourival Simões   |

Regra: Usuário pode editar seus locais de entrega

  Exemplo: usuário editando suas informações de endereço
    Dado usuário está logado
    Quando editar local de entrega chamado "Casa"
    |Nome|Cidade         |Estado|Endereço                 |Ponto de Referência          |
    |Casa|Junco do Seridó|PB    |R. Ver. Elías Coelho, 157|Próximo a Pizzaria Sabor Real|
    E visualizar seus locais de entrega
    Então as novas informações serão exibidas no local de entrega

Regra: Pode adicionar local de entrega
Regra: Pode remover local de entrega
