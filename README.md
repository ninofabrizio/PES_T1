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
- "v" representa um ponto onde o algoritmo circulou

------------------------------

Para executar:

- Abrir janela do CMD (Windows) ou Terminal (Linux)
- Posicionar a linha de comando no endereço onde se encontra o projeto na máquina
- Digitar "lua AStar.lua"

ou

- Executar o terminal de Lua digitando "Lua"
- Digitar "dofile('AStar.lua')"

------------------------------

Como modificar:

O mapa do programa só é customizável através das seguintes variáveis no código:

- **height**: Se encontra no bloco de execução principal no final do código. Carrega o valor numérico (inteiro) da dimensão vertical do mapa.
- **width**: Se encontra no bloco de execução principal no final do código. Carrega o valor numérico (inteiro) da dimensão horizontal do mapa.
- **maxWallNum**: Se encontra na função "generateRandomWalls". Carrega o valor numérico (inteiro) da quantidade total de obstáculos que a função tentará colocar no mapa. Vale ressaltar que quanto maior o número, mais demorada será a criação do mapa.
- **startPoint**: Se encontra no bloco de execução principal no final do código. Representa uma tabela contendo dois valores numéricos (inteiros) representando as coordenadas do ponto inicial no mapa. Para mudar a posição, tem que mudar os valores atribuidos a **startPoint[1][1]** e **startPoint[1][2]**
- **finishPoint**: Se encontra no bloco de execução principal no final do código. Representa uma tabela contendo dois valores numéricos (inteiros) representando as coordenadas do ponto final no mapa. Para mudar a posição, tem que mudar os valores atribuidos a **finishPoint[1][1]** e **finishPoint[1][2]**

------------------------------

Referência:

https://github.com/ninofabrizio/Logica/blob/master/src/project/AStar.java