# EasyLinalg
Easylinalg é um projeto que tem como objtivo auxiliar no ensino de algebra lienar, proponto um modelo onde atrazer de uma forte tipagem é possivel associar um obejto de estudo a um tipo construnido. Esta abordagem visa auxiliar uma construção de exemplos. 
## Instalação

Ao utiliza o gerenciador de pacotes de julia, utilize o comando abaixo.
Julia> ] add https://github.com/brunohry/Easylinalg

Como segunda opção também é possivel rodar a instalação direto de um código Julia, utilizando as próximas duas linhas de código.

using Pkg

Pkg.add(url="https://github.com/brunohry/Easylinalg")

## Para desenvolver
Para desenvolver o parcote, utilize  o processo padrão documentato em: https://docs.julialang.org/en/v1/stdlib/Pkg/

Este processo padrão consiste em navegar para o diretório da Biblioteca através do seguinte comando:

Julia> cd("EasyLinal")

e então ativar o pacote:

Julia> ] activate .

após isso então é possivel importar a biblioteca utilizando: using EasyLinalg


## Para Build
Para realizar o build do projeto, utilize:

Julia> ] build


## Para testar
Para realizar os testes unitários do pacote utilize:

Julia> ] test


