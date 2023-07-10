# EasyLinalg
EasyLinalg é um projeto cujo objetivo é auxiliar no ensino de álgebra linear, propondo um modelo onde é possível associar um objeto de estudo a um tipo construído na linguagem. Esta abordagem visa auxiliar construções de exemplos. 
## Instalação

Ao utiliza o gerenciador de pacotes de Julia, utilize o comando abaixo.

`Julia> ] add https://github.com/MachineTeachingEdu/Easylinalg`

Como segunda opção também é possível rodar a instalação direto de um código Julia, utilizando as próximas duas linhas de código:

`using Pkg`

`Pkg.add(url="https://github.com/MachineTeachingEdu/Easylinalg")`

## Para desenvolver
Para desenvolver o pacote, utilize  o processo padrão documentado em: https://docs.julialang.org/en/v1/stdlib/Pkg/

Este processo padrão consiste em navegar para o diretório da biblioteca através do seguinte comando:

`Julia> cd("EasyLinalg")`

Para então ativar o pacote:

`Julia> ] activate .`

Após esses comandos é possível importar a biblioteca utilizando: using EasyLinalg


## Para fazer o Build
Para realizar o build do projeto, utilize:

`Julia> ] build`


## Para testar
Para realizar os testes unitários do pacote utilize:

`Julia> ] test`


