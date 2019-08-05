# – FILE: features/comerciante/loja.feature # language: pt
Funcionalidade: Registro de loja

Para que eu possa vender água facilmente
Como um Comerciante
Eu quero ter uma loja virtual para venda de água

Como estamos em fase de testes, as lojas serão criadas unicamente
através da equipe de suporte, alterando o banco de dados diretamente.

No entanto, queremos registrar as pessoas que estão interessadas
em adquirir o equipamento através do preenchimento de formulário.

Todos os dados da loja são públicos.

Cenário de Fundo:
  Dado um comerciante chamando "Joerbson"
  E sua loja:
  |Nome       |Subdomínio|Telefone    |
  |Dois irmãos|2irmaos   |8398888-8889|

Regra: A loja fica acessível publicamente através do subdomain

  Cenário: Usuário não logando acessando loja
    Quando acessar a página da loja através do seu subdomínio
    Então os dados públicos da loja estarão acessíveis

Regra: Lojas não são criadas, mas recebemos solicitações de criação

  Exemplo: Possível cliente deseja criar loja virtual
    Dado um possível cliente que deseja criar uma loja
    Quando preencher e enviar formulário para abertura de loja:
    |Nome   |Telefone     |E-mail           |
    |Lohana |8399999-9999 |lohana@gmail.com |
    Então verá uma mensagem informando que ainda estamos em fase de testes

Regra: Somente o dono da loja pode atualizar sua loja

Exemplo: Dono de loja atualizando dados da loja
  Dado o dono da loja está logado
  Quando editar a loja:
  |Nome       |Subdomínio|Telefone    |
  |Três irmãos|3irmaos   |8398888-8889|
  E acessar a página pública da loja
  Então as informações atualizadas da loja estão sendo exibidas

Exemplo: Usuário sem permissão tentanto editar loja
  Dado um usuário logado
  Quando tentar atualizar os dados da loja
  Então verá mensagem indicando que não tem permissão para editar esta loja
