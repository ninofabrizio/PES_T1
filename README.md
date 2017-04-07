# Trabalho 1 - Princípios de Engenharia de Software

Autor: Nino Fabrizio Tiriticco Lizardo

Uma implementação do algoritmo de busca AStar em Lua, utilizando as regras seguidas pelo Engenheiro de Software.

Feito em Lua 5.1.4

------------------------------

Lógica:

Dado um ponto de partida, o algoritmo determina o caminho mais direto até um ponto de chegada, mostrando esse caminho em uma visualização gráfica simples e informando quantos passos foram dados.

O mapa é definido pelos seguintes símbolos:
- "S" representa o ponto de partida
- "X" representa o ponto de chegada
- "W" representa um obstáculo que o algoritmo considera inacessível (como um muro)
- "." representa um ponto acessível para o algoritmo
- "v" representa um ponto onde o algoritmo já circulou

------------------------------

Para executar:

- Abrir janela do CMD (Windows) ou Terminal (Linux)
- Posicionar a linha de comando no endereço onde se encontra o projeto na máquina
- Digitar "lua AStar.lua"

ou

- Executar o terminal de Lua digitando "Lua"
- Digitar "dofile('AStar.lua')"

------------------------------

Referência:

https://github.com/ninofabrizio/Logica/blob/master/src/project/AStar.java