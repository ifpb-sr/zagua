# zagua


# Visão geral das pessoas envolvidas

- [Comerciante](#Comerciante)
- [Revendedor](#Revendedor)
- [Consumidor](#Consumidor)
- [Fornecedor](#Fornecedor)

## Comerciante

O Comerciante irá vender água diretamente aos Consumidores ou através de Revendedores.

Algumas atividades:

- [Manter loja on-line venda da água](features/comerciante/loja.feature)
- [Criar Pontos de Abastecimento de água](features/comerciante/ponto_de_abastecimento.feature)
- Vende crédito [presencialmente](features/comerciante/credito_venda_trasacao_presencial.feature) ou [por transação bancária](features/comerciante/credito_venda_trasacao_bancaria.feature)
- Manter o abastecimento de água
- Manter infraestrutura para vender água
- Fazer marketing do negócio
- Verificar viabilidade/rentabilidade do negócio

## Revendedor

O Revendedor vende e entrega água para seus clientes.

Algumas atividades:

- ~~Gerencia os pedidos de compras de sua lista de Consumidores~~
- ~~Compra água on-line através da loja do Comerciante~~
- ~~Consulta os locais dos Pontos de Abastecimento~~
- ~~Retira água nos Pontos de Abastecimento e realiza as entregas~~
- ~~Consulta os Fornecedores~~
- ~~Verificar rentabilidade do seu trabalho.~~

## Consumidor

São os indivíduos que compram água para suas residências ou estabelecimentos.

Algumas atividades:

- ~~Consulta os Revendedores~~
- ~~Solicita pedidos aos Revendedores~~
- ~~Compra água on-line através da loja do Comerciante~~
- [Consulta os locais dos Pontos de Abastecimento](features/comerciante/ponto_de_abastecimento.feature)
- [Retira água diretamente nos Pontos de Abastecimento](features/comerciante/autoservico.feature)
- [Compra crédito através de transferência bancária](features/comerciante/credito_venda_trasacao_bancaria.feature)
- [Compra crédito presencialmente](features/comerciante/credito_venda_trasacao_presencial.feature)

## Fornecedor

Os Fornecedores são os indivíduos que fornecem água aos Comerciantes, possuem caminhão para transportar a água.

Algumas atividades:

- ~~Cadastram-se no site, informando sua área de atuação~~.

## Suporte

O Suporte é a equipe que fornece suporte ao Comerciante. Para agilizar a experimentação da solução alguns requisitos são implementados pelo suporte, quem realizam as alterações no Banco de Dados diretamente.


# Como executar a aplicação

```
git clone https://github.com/ifpb-sr/zagua
cd zagua
pip install pipenv --user
pipenv shell
pipenv install
cp .env.exemplo .env
source .env
flask run -p 8080
```
