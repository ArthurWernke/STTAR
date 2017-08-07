____________________________________________________________________
INICIALIZA��O:

- C�digo Fonte
Clique duas vezes no atalho com nome de �STTAR_inicio� e depois execute o c�digo no MATLAB (clicando em RUN ou com o atalho F5). 
Caso o atalho n�o funcione siga o seguinte passo a passo:
1.	Abra o DVD no qual possu� o pacote STTAR;
2.	Abra a pasta �STTAR�;
3.	Abra a pasta �GUI�;
4.	Abra a pasta �C�digo�;
5.	Abra o arquivo �STTAR_inicio.m�;
6.	Ap�s aberto no MATLAB o c�digo execute-o (clicando em RUN ou com o atalho F5). Pronto.

____________________________________________________________________
REQUISITOS

Requisitos m�nimos:

- Windows 7 de 64bits
- MATLAB R2008 ou posterior (para execu��o do c�digo fonte via MATLAB)

Requisitos recomendados:

- Windows 10.0 ou posterior de 64bits
- MATLAB R2014 ou posterior (para execu��o do c�digo fonte via matlab)
- RunTime do MATLAB vers�o 8.5 ou posterior (para execu��o via .exe)
- 4 GB ou mais de mem�ria RAM
- Processador Intel Core i3 4005U 1.70GHz ou superior

____________________________________________________________________
DISPON�VEL NAS DEMOS

DEMO v1 (data de lan�amento: 20 de Maio de 2017 �s 14:29):

- Pesquisa com qualquer entrada � tabela de g�s idela ar;
- Verifica��o da integridade das tabelas;
- Erros: para entrada com caracteres inv�lidos, entrada fora dos limites da tabela, entrada fora dos limites f�sicos, entrada fora dos limites te�ricos v�lidos e flu�do n�o escolhido;
- Questionamento se deseja encerrar a tela
- Centraliza��o na tela baseado nas dimens�es da tela.


DEMO v2 (data de lan�amento: 25 de Maio de 2017 �s 16:00):

- Mesmos itens da DEMO v1 com ajustes;
- Menus Exibir e Ajuda
- Ferramentas Salvar e Abrir
- Execut�vel e Instalador com op��o de baixar o RunTime e Instalador com RunTime
- Possibilidade da entrada de uma tabela diferente (consulte manual para mais informa��es)


DEMO v3 (data de lan�amento: 04 de Junho de 2017 �s 20:00):

- Mesmos itens da DEMO v2 e retirada do execut�vel e instaladores
- Adicional de aviso de constru��o para execu��o na Command Window e como fun��o
- Retirada das pastas Command Window e Function
- Icone trocado para a logomarca na barra de t�tulo das janelas principais
- Ferramenta de Ajuda na convers�o de unidade (com ferramenta de calculadora, mas na atual vers�o est� desativada)
- Exibi��o do gr�fico did�tico indicando o local que se encontra (mistura, l�quido comprimido, vapor super aquecido, l�quido saturado e vapor saturado)
- Pesquisa com entrada de temperatura e press�o completa (interpola��o entre linhas e entre tabelas) para o R134a
- Pesquisa com entrada de temperatura e t�tulo completa para R134a 

DEMO v4 (data de lan�amento: 03 de Julho de 2017 �s 04:15):

- Mesmos itens da DEMO v3 com ajustes 
- Consulta completa ao flu�do R134a
- Consulta completa ao flu�do �gua
- Retirada da Janela de escolha da primeira entrada
- Adicional do menu pop up para escolha da primeira temperatura
- Altera��o do nome da janela de c�lculo de "STTAR_temp" para "STTAR"
- Bot�o para salvar os dados no hist�rico
- Adicional do menu de hist�rico, podendo deletar e exibir o hist�rico de propriedades de entrada e sa�da para todos os flu�dos
- Logo no t�tulo do programa, logo na barra de t�tulo
- Plano de fundo alterado
- Encarte, capa e skin no DVD
- Logo na pasta compactada, no iniciador principal do programa, no instalador do programa
- Execut�vel e instalador (com RunTime)

____________________________________________________________________
OBSERVA��ES, DEBUG, MELHORIAS E LIMITA��ES ACHANDAS NAS DEMOS

DEMO v1

- Caso o us�rio n�o escolha um fluido, n�o marcando um ou n�o clicando em escolher 
(e combina��es desses atos) o programa n�o retorna um erro informando que o flu�do n�o 
foi escolhido.


DEMO v2

- Sistema N�O roda em windows de 32 bits.
- Execut�vel roda em PC com RunTime (testado na vers�o R2015a do MATLAB)
- Instalador com RunTime faz funcionar em computadores sem MATLAB


DEMO v3

- Caso seja marcado um fluido, mas n�o clicasse em escolher o programa n�o abre a janela falando das op��es de segunda entrada
- Caso a entrada de temperatura seja superior aos limites da tabela o programa n�o retorna erro
- Bug em t = 30 e pres = 700
- Bug na interpola��o do das tabelas de ar (entalpia em diante)
- Bug completo nas tabelas n�o padr�o
- N�o mostra as unidades de medida depois de escolher um flu�do n�o padr�o
- Algumas vezes faz considera��es erradas para escolha da propriedade
-