# Livro Diário
## Autor: Nino Fabrizio Tiriticco Lizardo



Data: 06/04/2017

Escolhi como projeto para este trabalho um módulo de um outro projeto feito na linguagem Java por mim e outro envolvido sobre lógica em inteligência artificial. O módulo em questão carrega a lógica por trás de uma versão do algortimo A Star (https://en.wikipedia.org/wiki/A*_search_algorithm).

Comecei criando o repositório contendo o projeto no Github, onde se encontrarão todos os arquivos referentes ao seu funcionamento e a informações referentes sobre o mesmo.

Pensei como modelo inicial, criar uma estrutura semelhante ao que conhecemos na informática como uma matriz para representar o mapa onde o algoritmo irá agir e mostrar visualmente essa matriz. No caso, criei uma função para cada uma dessas partes.

Depois de terminar as funções e verificar que estivessem funcionando como o esperado, ainda implementei uma função para colocar obstáculos no mapa de forma aleatória. Tive dificuldade em fazer com que as posições randômicas fossem de fato randômicas, após pesquisar um pouco descobri o uso de seed como solução. Esse algoritmo ainda é custoso e não me garante que caminhos fiquem totalmente excluídos dos outros. Aparentemente as chances disso acontecer são poucas dependendo de quantos muros crio aleatoriamente e do tamanho do mapa, mas preciso tratar esse problema. Pretendo verificar isso depois do projeto todo fazer seu papél principal.

Criei um arquivo chamado "TODO.txt" incluindo o que é desejado e necessário para a versão final do projeto.

Usei o arquivo "REDME.md" como forma de apresentação do projeto e do mínimo de informações necessárias sobre o projeto.

-----------------------------------------

Data: 07/04/2017

Comecei a implementar parte da lógica no meu módulo modelo A Star. Fiz uma função para a parte da lógica heurística e outra para determinar os vizinhos de uma posição do mapa.

Incluí variáveis que preciso como referência para a lógica do A Star e tornei elas o equivalente a variáveis globais para me facilitar a implementação e pequenos testes.

Como boa parte das verificações que faço são em base de uma dupla de informações que equivalem a uma posição, penso em utilizar para esses casos nas funções auxiliares listas contendo um espaço para cada uma dessas informações.

Futuramente precisarei mais informações dentro das posições, penso que o uso de chaves com seus valores dentro da própria matriz resolve isso. Quando implementar a parte que lida com a lógica propriamente do AStar verei se funciona mesmo na prática.

Complementei o arquivo "README.md" com a lógica do meu projeto.

Criei este arquivo como forma mais completa de um Livro Diário e deixei para documentar no código principal do meu projeto descrições simples das tarefas realizadas referentes ao código.