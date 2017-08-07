____________________________________________________________________
INICIALIZAÇÃO:

- Código Fonte
Clique duas vezes no atalho com nome de “STTAR_inicio” e depois execute o código no MATLAB (clicando em RUN ou com o atalho F5). 
Caso o atalho não funcione siga o seguinte passo a passo:
1.	Abra o DVD no qual possuí o pacote STTAR;
2.	Abra a pasta “STTAR”;
3.	Abra a pasta “GUI”;
4.	Abra a pasta “Código”;
5.	Abra o arquivo “STTAR_inicio.m”;
6.	Após aberto no MATLAB o código execute-o (clicando em RUN ou com o atalho F5). Pronto.

____________________________________________________________________
REQUISITOS

Requisitos mínimos:

- Windows 7 de 64bits
- MATLAB R2008 ou posterior (para execução do código fonte via MATLAB)

Requisitos recomendados:

- Windows 10.0 ou posterior de 64bits
- MATLAB R2014 ou posterior (para execução do código fonte via matlab)
- RunTime do MATLAB versão 8.5 ou posterior (para execução via .exe)
- 4 GB ou mais de memória RAM
- Processador Intel Core i3 4005U 1.70GHz ou superior

____________________________________________________________________
DISPONÍVEL NAS DEMOS

DEMO v1 (data de lançamento: 20 de Maio de 2017 ás 14:29):

- Pesquisa com qualquer entrada à tabela de gás idela ar;
- Verificação da integridade das tabelas;
- Erros: para entrada com caracteres inválidos, entrada fora dos limites da tabela, entrada fora dos limites físicos, entrada fora dos limites teóricos válidos e fluído não escolhido;
- Questionamento se deseja encerrar a tela
- Centralização na tela baseado nas dimensões da tela.


DEMO v2 (data de lançamento: 25 de Maio de 2017 ás 16:00):

- Mesmos itens da DEMO v1 com ajustes;
- Menus Exibir e Ajuda
- Ferramentas Salvar e Abrir
- Executável e Instalador com opção de baixar o RunTime e Instalador com RunTime
- Possibilidade da entrada de uma tabela diferente (consulte manual para mais informações)


DEMO v3 (data de lançamento: 04 de Junho de 2017 ás 20:00):

- Mesmos itens da DEMO v2 e retirada do executável e instaladores
- Adicional de aviso de construção para execução na Command Window e como função
- Retirada das pastas Command Window e Function
- Icone trocado para a logomarca na barra de título das janelas principais
- Ferramenta de Ajuda na conversão de unidade (com ferramenta de calculadora, mas na atual versão está desativada)
- Exibição do gráfico didático indicando o local que se encontra (mistura, líquido comprimido, vapor super aquecido, líquido saturado e vapor saturado)
- Pesquisa com entrada de temperatura e pressão completa (interpolação entre linhas e entre tabelas) para o R134a
- Pesquisa com entrada de temperatura e título completa para R134a 

DEMO v4 (data de lançamento: 03 de Julho de 2017 ás 04:15):

- Mesmos itens da DEMO v3 com ajustes 
- Consulta completa ao fluído R134a
- Consulta completa ao fluído Água
- Retirada da Janela de escolha da primeira entrada
- Adicional do menu pop up para escolha da primeira temperatura
- Alteração do nome da janela de cálculo de "STTAR_temp" para "STTAR"
- Botão para salvar os dados no histórico
- Adicional do menu de histórico, podendo deletar e exibir o histórico de propriedades de entrada e saída para todos os fluídos
- Logo no título do programa, logo na barra de título
- Plano de fundo alterado
- Encarte, capa e skin no DVD
- Logo na pasta compactada, no iniciador principal do programa, no instalador do programa
- Executável e instalador (com RunTime)

____________________________________________________________________
OBSERVAÇÕES, DEBUG, MELHORIAS E LIMITAÇÕES ACHANDAS NAS DEMOS

DEMO v1

- Caso o usário não escolha um fluido, não marcando um ou não clicando em escolher 
(e combinações desses atos) o programa não retorna um erro informando que o fluído não 
foi escolhido.


DEMO v2

- Sistema NÃO roda em windows de 32 bits.
- Executável roda em PC com RunTime (testado na versão R2015a do MATLAB)
- Instalador com RunTime faz funcionar em computadores sem MATLAB


DEMO v3

- Caso seja marcado um fluido, mas não clicasse em escolher o programa não abre a janela falando das opções de segunda entrada
- Caso a entrada de temperatura seja superior aos limites da tabela o programa não retorna erro
- Bug em t = 30 e pres = 700
- Bug na interpolação do das tabelas de ar (entalpia em diante)
- Bug completo nas tabelas não padrão
- Não mostra as unidades de medida depois de escolher um fluído não padrão
- Algumas vezes faz considerações erradas para escolha da propriedade
-