# Testes no estilo bdd

Esse diretório contém os testes automatizados da ferramenta.

Consulte [a documentação do behave](https://behave.readthedocs.io/en/latest/gherkin.html) para entender como escrever os cenários.

- It is good practise to have a scenario test only one behaviour or desired outcome.

# Execução dos testes

```
behave --lang pt
```

## Palavras do Gherkin v6 Grammar

Palavras do [Gherkin v6](https://cucumber.io/docs/gherkin/reference/):

```
$ behave --lang-help pt
Translations for Portuguese / português
            When: * , Quando
            Rule: Regra
Scenario Outline: Esquema do Cenário, Esquema do Cenario, Delineação do Cenário, Delineacao do Cenario
           Given: * , Dado , Dada , Dados , Dadas
             But: * , Mas
         Feature: Funcionalidade, Característica, Caracteristica
      Background: Contexto, Cenário de Fundo, Cenario de Fundo, Fundo
            Then: * , Então , Entao
        Scenario: Exemplo, Cenário, Cenario
        Examples: Exemplos, Cenários, Cenarios
             And: * , E
```

- [example-mapping-webinar/](https://cucumber.io/blog/example-mapping-webinar/)
https://cucumber.io/blog/example-mapping-webinar/

# BDD

> In Order To… <receive benefit>
> As A… <role>
> I Want… <goal/desire>

```
Para que ... <benefício recebido>
Como um(a) ... <papel>
Eu quero ... <objetivo/desejo>
```


# Hypothesis-Driven Development

> We believe <this capability>
>
> What functionality we will develop to test our hypothesis? By defining a ‘test’ capability of the product or service that we are attempting to build, we identify the functionality and hypothesis we want to test.

> Will result in <this outcome>
>
> What is the expected outcome of our experiment? What is the specific result we expect to achieve by building the ‘test’ capability?
>
> We will have confidence to proceed when <we see a measurable signal>


## Referências

- [https://barryoreilly.com/how-to-implement-hypothesis-driven-development/](https://barryoreilly.com/how-to-implement-hypothesis-driven-development/)
