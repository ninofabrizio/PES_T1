# Livro Diário
## Autor: Nino Fabrizio Tiriticco Lizardo



Data: 06/04/2017

Escolhi como projeto para este trabalho um módulo de um outro projeto feito na linguagem Java por mim e outro envolvido sobre lógica em inteligência artificial. O módulo em questão carrega a lógica por trás de uma versão do algortimo A Star (https://en.wikipedia.org/wiki/A*_search_algorithm).

Comecei criando o repositório contendo o projeto no Github, onde se encontrarão todos os arquivos referentes ao seu funcionamento e a informações referentes sobre o mesmo. Ao mesmo tempo ele serve como gerenciador de versões do meu código, ligado ao rastro na regra de "Identificação" do engenheiro de software.

Pensei como modelo inicial, criar uma estrutura semelhante ao que conhecemos na informática como uma matriz para representar o mapa onde o algoritmo irá agir e mostrar visualmente essa matriz. No caso, criei uma função para cada uma dessas partes.

Depois de terminar as funções e verificar que estivessem funcionando como o esperado, ainda implementei uma função para colocar obstáculos no mapa de forma aleatória. Tive dificuldade em fazer com que as posições randômicas fossem de fato randômicas, após pesquisar um pouco descobri o uso de seed como solução. Esse algoritmo ainda é custoso e não me garante que caminhos fiquem totalmente excluídos dos outros. Aparentemente as chances disso acontecer são poucas dependendo de quantos muros crio aleatoriamente e do tamanho do mapa, mas preciso tratar esse problema. Pretendo verificar isso depois do projeto todo fazer seu papél principal.

Criei um arquivo chamado "TODO.txt" incluindo o que é desejado e necessário para a versão final do projeto.

Usei o arquivo "README.md" como forma de apresentação do projeto e do mínimo de informações necessárias sobre o projeto.

-----------------------------------------

Data: 07/04/2017

Comecei a implementar parte da lógica no meu módulo modelo A Star. Fiz uma função para a parte da lógica heurística e outra para determinar os vizinhos de uma posição do mapa.

Incluí variáveis que preciso como referência para a lógica do A Star e tornei elas o equivalente a variáveis globais para me facilitar a implementação e pequenos testes.

Como boa parte das verificações que faço são em base de uma dupla de informações que equivalem a uma posição, penso em utilizar para esses casos nas funções auxiliares listas contendo um espaço para cada uma dessas informações.

Futuramente precisarei mais informações dentro das posições, penso que o uso de chaves com seus valores dentro da própria matriz resolve isso. Quando implementar a parte que lida com a lógica propriamente do AStar verei se funciona mesmo na prática.

Complementei o arquivo "README.md" com a lógica do meu projeto.

Criei este arquivo como forma mais completa de um Livro Diário e deixei para documentar no código principal do meu projeto descrições simples das tarefas realizadas referentes ao código.

-----------------------------------------

Data: 08/04/2017

Comecei a passar algumas das dunções auxiliares necessárias para o A Star, tendo em mente a regra do "Intervalo Mágico" para quantidade de módulos do meu programa.

Como o código original é feito em Java, as estruturas nele são baseadas em objetos. Optei por lidar com tabelas contendo tuplas de informações no meu código em Lua para o que seriam os objetos principais do programa.

Constatei que uma das funções do meu código em Java não será necessária nesta versão, visto que eu farei uso de um caso mais simplificado de mapa para o A Star.

Virifiquei com testes simples os coteúdos das tabelas que criei para ter certeza que funcionam como devem, visto que em algumas destas tabelas precisarei adicionar e retirar tuplas manualmente. A indexação será um fator importante durante a execução do meu programa.

Fiz uma versão inicial do algoritmo contendo a lógica por trás do A Star, mas estou obtendo erros referentes às tabelas que estou usando. Ainda não achei a origem do erro. Deixei pra terminar no dia seguinte.

-----------------------------------------

Data: 09/04/2017

Retomei a correção na função "AStar". Dentre os erros que achei, há a navegação errada em minhas tabelas. Diversos erros menores foram encontrados nas outras funções.

Erros de condição nos if's em "getNeighbors" foram corrigidos. Aproveitei para simplificar um pouco mais o modo como incluir valores na tabela que é retornada.

Incluí testes para verificar se as tabelas que percorro em "insertInTable" e "removeFromTable" estão vazias, visto que isso é possível durante a execução.

Excluí a função auxiliar "tableLength", visto que existe um comando em Lua que já me informa isso.

Ainda existe um problema durante minha execução em que fico preso a um loop infinito. Verificando por pequenos testes, descubri que minha tabela "open" em "AStar" não remove os valores que peço como devido. Isso me leva a crer que a origem seja em "removeFromTable". Amanhã irei revisar a função.

Não cheguei a colocar minhas atualizações referentes ao projeto no Github por falta de internet. Amanhã farei isso após corrigir os problemas.

-----------------------------------------

Data: 10/04/2017

Verificando os índices numéricos que servem como chaves na tabela "open", vi que a numeração dos índices não é refeita quando um dos índices é retirado. Isso me impossibilita navegar a tabela de forma devida, o que resulta nos dados que quero retirar não serem retirados.

Incluí um bloco de código responsável por refazer a numeração da tabela quando remover um dado em "removeFromTable", isso serviu de correção para o problema do loop infinito.

Fiz algumas pequenas correções na etapa final para construir a tabela carregando o caminho entre o ponto inicial e o ponto final no mapa.

Montei o bloco de código carregado da execução principal do código, mostrando no final o número de passos dados no mapa e o caminho em questão.

Decidi deixar de lado a implementação para ler um mapa através de um arquivo, visto que o programa já estava começando a ficar grande e estava ficando sem tempo para a etapa final do trabalho, que é verificar que estja seguindo as regras do engenheiro de software.

Seguindo a regra de "não inventar nomes", me certifiquei que todas as variáveis e funções que uso no programa tenham nomes que deixem claro para que servem.

Complementei a documentação do meu código para ampliar a parte do diário, explicando um pouco mais a fundo como o código funciona em execução.

Percebi que o triângulo do conhecimento se aplica no meu projeto. A parte do Conhecimento do Engenheiro de Software é a própria aplicação das regras. O Conhecimento de Aplicação é a própria lógica do que meu programa faz, ele está explicado no arquivo "README.md". O Conhecimento de Máquina é a linguagem Lua, principal ferramenta para criar o código. Para esse último precisei conhecer mais a fundo a linguagem através de documentação e fóruns na internet, principalmente para poder corrigir erros.