# – FILE: features/comerciante/loja.feature # language: pt
Funcionalidade: Registro de loja

Para que eu possa vender água facilmente
Como um Comerciante
Eu quero ter uma loja virtual para venda de água

Como estamos em fase de testes, as lojas serão criadas unicamente
através da equipe de suporte, alterando o banco de dados diretamente.

Cenário de Fundo:
  Dado um comerciante chamando "Joerbson"
  E sua loja:
  |Nome    |Subdomínio|Telefone    |
  |Puro H2O|puroh2o   |8398888-8889|

Regra: Atualmente as lojas serão criadas pela equipe de Suporte

Regra: A loja fica acessível publicamente através do subdomain

  Exemplo: Usuário não logado acessando loja
    Quando acessar a página da loja através do seu subdomínio
    Então os dados públicos da loja estarão acessíveis

Regra: Somente o dono da loja pode atualizar sua loja

Exemplo: Dono de loja atualizando dados da loja
  Dado o dono da loja está logado
  Quando editar a loja:
  |Nome       |Subdomínio|Telefone    |
  |Dois irmãos|2irmaos   |8398888-8889|
  E acessar a página pública da loja
  Então as informações atualizadas da loja estão sendo exibidas

Exemplo: Usuário sem permissão tentanto editar loja
  Dado um usuário logado
  Quando tentar atualizar os dados da loja
  Então verá mensagem indicando que não tem permissão para editar esta loja
