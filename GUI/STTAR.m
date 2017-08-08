%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dados do Programa principal 
%     Nome: STTAR
%     Vers�o: 2.4
% 
% Dados do MATLAB:
%     Vers�o utilizada: R2015a
% 
% Dados da fun��o
%     Nome: STTAR.m
%     Vers�o: 2.3.2    
%     Objetivo: Ap�s escolhido a entrada principal temperatura o c�digo re-
%               cebe novas entradas, entrada do flu�do de trabalho e retor-
%               na os dados da tabela.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function varargout = STTAR(varargin)
% Last Modified by GUIDE v2.5 28-Jun-2017 12:39:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @STTAR_OpeningFcn, ...
                   'gui_OutputFcn',  @STTAR_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

function STTAR_OpeningFcn(hObject, eventdata, handles, varargin)
% Choose default command line output for STTAR
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% Centralizar na tela
%Pixels
set( handles.STTAR, ...
    'Units', 'pixels' );

%Tamanho da tela
screenSize = get(0, 'ScreenSize');

%Calculo do centro da tela
position = get( handles.STTAR, ...
    'Position' );
position(1) = (screenSize(3)-position(3))/2;
position(2) = (screenSize(4)-position(4))/2;

%Centralizando a janela
set( handles.STTAR, ...
    'Position', position );

% Trocar icone em cima da tela
javaFrame = get(hObject, 'JavaFrame');
javaFrame.setFigureIcon(javax.swing.ImageIcon('STTAR_Logo.jpg'));
clc;

%Perguntar ao fechar janela
set(handles.STTAR,'CloseRequestFcn',@closeGUI); %Para pergunta ao fechar

function varargout = STTAR_OutputFcn(hObject, eventdata, handles) 
% Get default command line output from handles structure
varargout{1} = handles.output;

% _________________________________________________________________________

% ------------------------------- Entradas --------------------------------
% Entrada do valor da primeira propriedade
function entrada_1_Callback(hObject, eventdata, handles)
% Globaliza��o
global prop_1

% Leitura
pre_prop1 = get(handles.entrada_1,'String');

% Convers�o para n�mero
prop_1 = str2double(pre_prop1);

% Entrada do valor da segundo propriedade
function entrada_2_Callback(hObject, eventdata, handles)
% Globaliza��o
global prop_2

% Leitura
pre_prop_2 = get(handles.entrada_2,'String');

% Convers�o para n�mero
prop_2 = str2double(pre_prop_2);

% Escolha da primeira propriedade
function Primeira_propriedade_Callback(hObject, eventdata, handles)
% Chamada global e globaliza��o
global primeira_entrada
global fluido

% Leitura
primeira_entrada = get(handles.Primeira_propriedade,'Value');

% Confere se foi escolhido algum flu�do antes
if (strcmp(fluido,'R134a') == 0 && strcmp(fluido,'�gua') == 0 && strcmp(fluido,'Ar') == 0) && (primeira_entrada == 1)
    warndlg('Est� op��o � v�lida com os flu�dos R134a, �gua e ar, mas nenhum flu�do foi selecionado. Selecione um flu�do para continuar.','Aviso!');
end
if (strcmp(fluido,'R134a') == 0 && strcmp(fluido,'�gua') == 0 && strcmp(fluido,'Ar') == 0) && (primeira_entrada == 2)
    warndlg('Est� op��o s� � v�lida com os flu�dos R134a e �gua, mas nenhum flu�do foi selecionado. Selecione um flu�do para continuar.','Aviso!');
end

% Avalia a segunda propriedade par ajustar o menu da segunda propriedade
if primeira_entrada == 1
    set(handles.Segunda_propriedade,'String',{'Press�o (kPa):';'Volume espec�fico (m�/kg):';'Energia Interna (kJ/kg):';'Entalpia (kJ/kg):';'Entropia (kJ/kg � K):';'T�tulo:'},'Value',1) %Ajusta as op��es do menu popup
    set(handles.ar,'Enable','on');
elseif primeira_entrada == 2
    set(handles.Segunda_propriedade,'String',{'Temperatura (�C):';'Volume espec�fico (m�/kg):';'Energia Interna (kJ/kg):';'Entalpia (kJ/kg):';'Entropia (kJ/kg � K):';'T�tulo:'},'Value',1) %Ajusta as op��es do menu popup
    set(handles.ar,'Enable','off');
end

% Escolha da segunda propriedade
function Segunda_propriedade_Callback(hObject, eventdata, handles)
% Chamada global e globaliza��o
global segunda_entrada
global primeira_entrada
global fluido

% Leitura
segunda_entrada = get(handles.Segunda_propriedade,'Value');

% Confere se foi escolhido algum flu�do antes
if (strcmp(fluido,'R134a') == 0 && strcmp(fluido,'�gua') == 0 && strcmp(fluido,'Ar') == 0) && (segunda_entrada == 7 || segunda_entrada == 8)
    warndlg('Est� op��o s� � v�lida com o flu�do ar, mas nenhum flu�do foi selecionado. Selecione um flu�do para continuar.','Aviso!');
    return;
end
if (strcmp(fluido,'R134a') == 0 && strcmp(fluido,'�gua') == 0 && strcmp(fluido,'Ar') == 0) && (segunda_entrada == 1 || segunda_entrada == 2 || segunda_entrada == 6)
    warndlg('Est� op��o s� � v�lida com os flu�dos R134a e �gua, mas nenhum flu�do foi selecionado. Selecione um flu�do para continuar.','Aviso!');
    return;
end
if (strcmp(fluido,'R134a') == 0 && strcmp(fluido,'�gua') == 0 && strcmp(fluido,'Ar') == 0) && (segunda_entrada == 3 || segunda_entrada == 4 || segunda_entrada == 5)
    warndlg('Est� op��o � v�lida com os flu�dos R134a, �gua e ar, mas nenhum flu�do foi selecionado. Selecione um flu�do para continuar.','Aviso!');
    return;
end

% -------------------------- Escolha do flu�do ----------------------------
% Escolha do flu�do de trabalho como R134a
function R134a_Callback(hObject, eventdata, handles)
%Bloqueio para n�o marcar mais de uma op��o
set(handles.R134a,'Value',1);
set(handles.agua,'Value',0);
set(handles.ar,'Value',0);
set(handles.fluido_nao_padrao,'Value',0);

% Globaliza��o
global fluido
global fluido_confimacao

% Afirma que foi clicado em um fluido
fluido_confimacao = 1;

% Leitura da escolha
fluido = get(handles.R134a,'String');

% Escolha do flu�do de trabalho como �gua
function agua_Callback(hObject, eventdata, handles)
%Bloqueio para n�o marcar mais de uma op��o
set(handles.R134a,'Value',0);
set(handles.agua,'Value',1);
set(handles.ar,'Value',0);
set(handles.fluido_nao_padrao,'Value',0);

% Globaliza��o
global fluido
global fluido_confimacao

% Afirma que foi clicado em um fluido
fluido_confimacao = 1;

% Leitura da escolha
fluido = get(handles.agua,'String');

% Escolha do flu�do de trabalho como ar
function ar_Callback(hObject, eventdata, handles)
%Bloqueio para n�o marcar mais de uma op��o
set(handles.R134a,'Value',0);
set(handles.agua,'Value',0);
set(handles.ar,'Value',1);
set(handles.fluido_nao_padrao,'Value',0);

% Globaliza��o
global fluido
global fluido_confimacao

% Afirma que foi clicado em um fluido
fluido_confimacao = 1;

% Leitura da escolha
fluido = get(handles.ar,'String');

% Fluido n�o padr�o
function fluido_nao_padrao_Callback(hObject, eventdata, handles)
%Bloqueio para n�o marcar mais de uma op��o
set(handles.R134a,'Value',0);
set(handles.agua,'Value',0);
set(handles.ar,'Value',0);
set(handles.fluido_nao_padrao,'Value',1);

% Bot�o da escolha do flu�do
function escolher_fluido_Callback(hObject, eventdata, handles)
% Chamada Global e globaliza��o
global fluido
global primeira_entrada
global segunda_entrada
global tabela_satT
global tabela_vapor
global tabela_satP
global tabela_liqComp
global tabela_ar
global fluido_confimacao
global novo_fluido

% Afirma que foi clicado em um fluido
fluido_confimacao = 0;

novo_fluido = 1;

% Ativa salvamento e exibi��o
set(handles.salvar_tabela_toda,'Enable','off')
set(handles.exibir,'Enable','off')
set(handles.fluido_nao_padrao,'Visible','off'); %Deixa visivel o bot�o

% Reposicionamento das respostas
set(handles.volu,'Position',[39.2 5.385 26.2 1.692]) %Movimenta a resposta do volume
set(handles.ener,'Position',[34 1.154 26.2 2]) %Movimenta a resposta do energia
set(handles.pres,'Position',[24 8.231 26.2 2.538]) %Movimenta a resposta do press�o
set(handles.entr,'Position',[99.4 8.231 18.4 2.615]) %Movimenta a resposta do entropia
set(handles.temp,'Position',[27 12.231 26.2 2.538]) %Movimenta a resposta do temperatura
set(handles.enta,'Position',[94.6 12.231 18.2 2.538]) %Movimenta a resposta do entalpia
set(handles.fluido_atual,'Position',[40 28 24.8 3.923]) %Movimenta a resposta do fluido


% Confere se foi escolhido algum flu�do
if strcmp(fluido,'R134a') == 0 && strcmp(fluido,'�gua') == 0 && strcmp(fluido,'Ar') == 0
    errordlg('Erro err0203. Nenhum flu�do selecionado.','ERRO');
    return;
end

% Escolha de qual tabela abrir
if strcmp(fluido,'R134a') == 1 %Caso escolha seja R134a
    % Zera resultados anteriores
    set(handles.temp,'String',' ');
    set(handles.pres,'String',' ');
    set(handles.volu,'String',' ');
    set(handles.ener,'String',' ');
    set(handles.enta,'String',' ');
    set(handles.entr,'String',' ');
    set(handles.titu,'String',' ');
    set(handles.esta,'String',' ');
    set(handles.entrada_1,'String','Digite aqui');
    set(handles.entrada_2,'String','Digite aqui');
    
    % Abrir tabela
    [tabela_satT , tabela_satP, tabela_vapor , nada1] = AbrirTabela(fluido);
    
    % Ajustes gr�ficos
    set(handles.fluido_atual,'String','(Atual: R134a)'); %Seleciona o flu�do atual como R134a
    set(handles.grafico,'Enable','off') %Ativa o bot�o gr�fico
    set(handles.Primeira_propriedade,'Visible','on') %Deixa invis�vel o texto da temperatura
    set(handles.entrada_1,'Visible','on') %Deixa invis�vel a entrada de temperatura
    set(handles.Segunda_propriedade,'Position',[99.8 27.385 45.4 3.077]) %Movimenta as op��es da entrada secund�ria
    set(handles.entrada_2,'Position',[145.4 28.615 24.8 1.692]) %Movimenta a entrada secund�ria
    set(handles.volu,'Position',[39.2 5.385 26.2 1.692]) %Movimenta a resposta do volume
    if primeira_entrada == 1
        set(handles.Segunda_propriedade,'String',{'Press�o (kPa):';'Volume espec�fico (m�/kg):';'Energia Interna (kJ/kg):';'Entalpia (kJ/kg):';'Entropia (kJ/kg � K):';'T�tulo:'},'Value',1) %Ajusta as op��es do menu popup
    elseif primeira_entrada == 2
        set(handles.Segunda_propriedade,'String',{'Temperatura (�C):';'Volume espec�fico (m�/kg):';'Energia Interna (kJ/kg):';'Entalpia (kJ/kg):';'Entropia (kJ/kg � K):';'T�tulo:'},'Value',1) %Ajusta as op��es do menu popup
    else
        set(handles.Segunda_propriedade,'String',{'Press�o (kPa):';'Volume espec�fico (m�/kg):';'Energia Interna (kJ/kg):';'Entalpia (kJ/kg):';'Entropia (kJ/kg � K):';'T�tulo:'},'Value',1) %Ajusta as op��es do menu popup
    end
    
    % Ajustes da sa�da
    set(handles.temp_saida,'String','Temperatura (�C):');
    set(handles.pres_saida,'String','Press�o (kPa):');
    set(handles.volu_saida,'String','Volume Espec�fico (m�/kg):');
    set(handles.ener_saida,'String','Energia Interna (kJ/kg):');
    set(handles.enta_saida,'String','Entalpia (kJ/kg):');
    set(handles.entr_saida,'String','Entropia (kJ/kg � K):');
    set(handles.titu_saida,'String','T�tulo:');
    set(handles.esta_saida,'String','Estado:');
end

if strcmp(fluido,'�gua') == 1 %Caso escolha seja �gua
    % Zera resultados anteriores
    set(handles.temp,'String',' ');
    set(handles.pres,'String',' ');
    set(handles.volu,'String',' ');
    set(handles.ener,'String',' ');
    set(handles.enta,'String',' ');
    set(handles.entr,'String',' ');
    set(handles.titu,'String',' ');
    set(handles.esta,'String',' ');
    set(handles.entrada_1,'String','Digite aqui');
    set(handles.entrada_2,'String','Digite aqui');
    
    % Abrir tabela
    [tabela_satT , tabela_satP , tabela_vapor , tabela_liqComp] = AbrirTabela(fluido);
    
    % Ajustes gr�ficos
    set(handles.fluido_atual,'String','(Atual: �gua)'); %Seleciona o flu�do atual como �gua
    set(handles.grafico,'Enable','off') %Ativa o bot�o gr�fico
    set(handles.Primeira_propriedade,'Visible','on') %Deixa invis�vel o texto da temperatura
    set(handles.entrada_1,'Visible','on') %Deixa invis�vel a entrada de temperatura
    set(handles.Segunda_propriedade,'Position',[99.8 27.385 45.4 3.077]) %Movimenta as op��es da entrada secund�ria
    set(handles.entrada_2,'Position',[145.4 28.615 24.8 1.692]) %Movimenta a entrada secund�ria
    set(handles.volu,'Position',[39.2 5.385 26.2 1.692]) %Movimenta a resposta do volume
    if primeira_entrada == 1
        set(handles.Segunda_propriedade,'String',{'Press�o (kPa):';'Volume espec�fico (m�/kg):';'Energia Interna (kJ/kg):';'Entalpia (kJ/kg):';'Entropia (kJ/kg � K):';'T�tulo:'},'Value',1) %Ajusta as op��es do menu popup
    elseif primeira_entrada == 2
        set(handles.Segunda_propriedade,'String',{'Temperatura (�C):';'Volume espec�fico (m�/kg):';'Energia Interna (kJ/kg):';'Entalpia (kJ/kg):';'Entropia (kJ/kg � K):';'T�tulo:'},'Value',1) %Ajusta as op��es do menu popup
    else
        set(handles.Segunda_propriedade,'String',{'Press�o (kPa):';'Volume espec�fico (m�/kg):';'Energia Interna (kJ/kg):';'Entalpia (kJ/kg):';'Entropia (kJ/kg � K):';'T�tulo:'},'Value',1) %Ajusta as op��es do menu popup
    end
    
    % Ajustes da sa�da
    set(handles.temp_saida,'String','Temperatura (�C):');
    set(handles.pres_saida,'String','Press�o (kPa):');
    set(handles.volu_saida,'String','Volume Espec�fico (m�/kg):');
    set(handles.ener_saida,'String','Energia Interna (kJ/kg):');
    set(handles.enta_saida,'String','Entalpia (kJ/kg):');
    set(handles.entr_saida,'String','Entropia (kJ/kg � K):');
    set(handles.titu_saida,'String','T�tulo:');
    set(handles.esta_saida,'String','Estado:');
end

if strcmp(fluido,'Ar') == 1 %Caso escolha seja ar
    % Zera os resultados anteriores
    set(handles.temp,'String',' ');
    set(handles.pres,'String',' ');
    set(handles.volu,'String',' ');
    set(handles.ener,'String',' ');
    set(handles.enta,'String',' ');
    set(handles.entr,'String',' ');
    set(handles.titu,'String',' ');
    set(handles.esta,'String',' ');
    set(handles.entrada_1,'String','Digite aqui');
    set(handles.entrada_2,'String','Digite aqui');
    
    % Abrir tabela
    [tabela_ar , nada2 , nada3 , nada4] = AbrirTabela(fluido);
    
    % Ajustes gr�ficos
    set(handles.fluido_atual,'String','(Atual: Ar)'); %Seleciona o flu�do atual como ar
    set(handles.grafico,'Enable','off') %Desativa o bot�o gr�fico
    set(handles.Primeira_propriedade,'Visible','off') %Deixa invis�vel o texto da temperatura
    set(handles.entrada_1,'Visible','off') %Deixa invis�vel a entrada de temperatura
    set(handles.Segunda_propriedade,'Position',[104.4 30.462 40.2 3.077]) %Movimenta as op��es da entrada secund�ria
    set(handles.entrada_2,'Position',[145 31.615 24.8 1.692]) %Movimenta a entrada secund�ria
    set(handles.volu,'Position',[25.4 5.385 26.2 1.692]) %Movimenta a resposta do volume
    set(handles.Segunda_propriedade,'String',{'Temperatura (K):';'Entalpia (kJ/kg):';'Press�o Relativa:';'Energia Interna (kJ/kg):';'Volume Relativo:';'Entropia (kJ/kg � K):'},'Value',1) %Ajusta as op��es do menu popup
        
    % Ajustes da sa�da
    set(handles.temp_saida,'String','Temperatura (K):');
    set(handles.pres_saida,'String','Entalpia (kJ/kg):');
    set(handles.volu_saida,'String','Press�o Relativa:');
    set(handles.ener_saida,'String','Energia Interna (kJ/kg):');
    set(handles.enta_saida,'String','Volume Relativo:');
    set(handles.entr_saida,'String','Entropia (kJ/kg � K):');
    set(handles.titu_saida,'String',' ');
    set(handles.esta_saida,'String',' ');
    
    % Define as entradas
    segunda_entrada = 1;
    primeira_entrada = 1;
    
end

% -------------------------------- Bot�es ---------------------------------
% Calculos
function calculo_Callback(hObject, eventdata, handles)
% Chamada global e globaliza��o
global prop_1
global prop_2
global segunda_entrada
global primeira_entrada
global fluido
global tabela_satT
global tabela_satP
global tabela_vapor
global tabela_liqComp
global tabela_ar
global fluido_confimacao
global esta
global novo_fluido
global Hdados_entrada
global Hdados_saida

% Zera resultados anteriores
set(handles.temp,'String',' ');
set(handles.pres,'String',' ');
set(handles.volu,'String',' ');
set(handles.ener,'String',' ');
set(handles.enta,'String',' ');
set(handles.entr,'String',' ');
set(handles.titu,'String',' ');
set(handles.esta,'String',' ');

% Vari�veis para c�lculo
x = 1;
y = 1;

% Escolha da pr� defini��o da entrada
if isempty(segunda_entrada) || isempty(primeira_entrada)
%     segunda_entrada = 1;
%     primeira_entrada = 1;
    errordlg('Erro err0812. Bug na escolha das propriedades. Escolha novamente as propriedades desejadas','ERRO');
    return;
end

% Confere se foi escolhido algum flu�do
if (strcmp(fluido,'R134a') == 0 && strcmp(fluido,'�gua') == 0 && strcmp(fluido,'Ar') == 0) || fluido_confimacao == 1
    errordlg('Erro err0203. Nenhum flu�do selecionado.','ERRO');
    return;
end

% Avalia a primeira entrada
if primeira_entrada == 1 %Entrada principal como temperatura
    temp = prop_1;
    
    % R134a
    if strcmp(fluido,'R134a') == 1

        % Conferir v�lidade das entradas
        if isnan(temp) || isnan(prop_2)
            errordlg('Erro err0202. As entradas apresentam caracteres inv�lidos.','ERRO');
            return;
        end

        % Tamanho das tabelas
        tamanho_sat = size(tabela_satT);
        tamanho_vapor = size(tabela_vapor);
        tamanho_liq = size(tabela_liqComp);

        % Avalia a segunda entrada
        switch segunda_entrada
            case 1 %Entrada como Press�o
                pres = prop_2;
                % Valida��o dos limites f�sicos das entradas
                if pres <= 0 || temp <= -273.15
                    errordlg('Erro err0205. Entradas fora dos limites f�sicos v�lidos.','ERRO');
                    return;
                end

                % Valida��o da entrada dentro dos limites da tabela
                if temp < tabela_satT(1,1) || temp > tabela_vapor(tamanho_vapor(1),2)
                    errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                    return;
                end

                % Avalia o estado baseado na temperatura (entre saturado e vapor)
                if temp > tabela_satT(tamanho_sat(1),1) % Estado de Vapor
                    % Confere o limite de press�o
                    if pres > tabela_vapor(tamanho_vapor(1),1) || pres < tabela_vapor(1,1)
                        errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                        return;
                    end

                    % Defini��o do Estado e t�tulo
                    esta = 'Vapor Super Aquecido'; %Estado
                    titu = '--';

                    % Procurador na tabela
                    while tabela_vapor(x,y) < pres
                        x = x + 1;
                        y  = 1;
                    end                

                    % Avalia a press�o
                    if pres == tabela_vapor(x,1)
                        % variaveis necess�rias
                        I = 1;
                        i = x;

                        % Confere o limite da faixa de press�o igual
                        while tabela_vapor(i,1) == tabela_vapor(x,1)
                            i = i + 1;

                            % Evitar ultrapassar o limite da tabela
                            if i > tamanho_vapor(1)
                               break; 
                            end 
                        end  

                        % Avalia a temperatura na ultima coordenada de press�o igual
                        if tabela_vapor(i-1,2) < temp
                            errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                            return;
                        end    

                        % Nova coluna para procura
                        y = 2;

                        % Procura temperatura
                        while tabela_vapor(x,y) < temp
                            x = x + 1;
                            y = 2;
                        end

                        % Interpola��o para caso n�o ache os valores
                        if tabela_vapor(x,y) > temp
                            tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,y);
                        end

                        % Ajuste a coluna de press�o
                        tabela_vapor(x,1) = pres;
                        tabela_vapor(x,2) = temp;

                        % Propriedades
                        volu = tabela_vapor(x,3);
                        ener = tabela_vapor(x,4);
                        enta = tabela_vapor(x,5);
                        entr = tabela_vapor(x,6);

                    elseif pres < tabela_vapor(x,1)
                        % variaveis necess�rias
                        I = 1;
                        i = x;

                        % Confere o limite da faixa de press�o igual
                        while tabela_vapor(i,1) == tabela_vapor(x,1)
                            for k = 1 : 1 : tamanho_vapor(2)
                                tabela_interpolMax(I,k) = tabela_vapor(i,k);
                            end
                            I = I + 1;
                            i = i + 1;

                            % Eveitar ultrapassar o limite da tabela
                            if i > tamanho_vapor(1)
                               break; 
                            end 
                        end  

                        % Zera os contadores para pr�xima matriz
                        i = x-1;
                        I = 1;

                        % Delimita os valores iniciais e finais das temperaturas para interpolar para press�o menor 
                        while tabela_vapor(i,1) == tabela_vapor(x-1,1)
                            for k = 1 : 1 : tamanho_vapor(2)
                                tabela_interpolMin(I,k) = tabela_vapor(i,k);
                            end
                            I = I + 1;
                            i = i - 1;

                            % Eveitar ultrapassar o limite da tabela
                            if i <= 0
                               break; 
                            end 
                        end

                        % Desinverte matriz
                        tabela_interpolMin = InverteMatriz(tabela_interpolMin);

                        % Interpola entre uma tabela e outra
                        tabela_vapor = InterpolacaoEntreTabelaCompletaVapor(tabela_vapor,tabela_interpolMax,tabela_interpolMin,pres,x);                  

                        % Define a coluna para pesquisa
                        y = 2;

                        % Procura pelo valor de temperatura
                        while tabela_vapor(x,y) < temp
                            x = x + 1;
                            y = 2;
                        end

                        % Interpola��o para caso n�o ache os valores
                        if tabela_vapor(x,y) > temp
                            tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,y);
                        end

                        % Ajuste a coluna de press�o
                        tabela_vapor(x,1) = pres;
                        tabela_vapor(x,2) = temp;

                        % Printa os resultados as propriedades
                        volu = tabela_vapor(x,3);
                        ener = tabela_vapor(x,4);
                        enta = tabela_vapor(x,5);
                        entr = tabela_vapor(x,6);               

                    else
                        errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                        return;
                    end          

                else %Estado de Satura��o
                    % Procurador na tabela
                    while tabela_satT(x,y) < temp
                        x = x + 1;
                        y  = 1;
                    end

                    % Interpola��o para caso n�o ache os valores
                    if tabela_satT(x,1) > temp
                        tabela_satT = InterpolacaoCompleta(tabela_satT,temp,x);
                    end

                    % Avalia a press�o achada
                    if pres < tabela_satT(x,2) %Caso vapor super aquecido
                        % Avalia os limites de press�o na tabela
                        if tabela_vapor(1,1) > pres
                            errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                            return;
                        end  

                        % Variaveis para procura
                        x = 1;
                        y = 1;

                        % Procurador na tabela
                        while tabela_vapor(x,y) < pres
                            x = x + 1;
                            y  = 1;
                        end                
                            
                        % Defini o estado
                        esta = 'Vapor Super Aquecido'; %Estado
                        
                        % Avalia a press�o
                        if pres == tabela_vapor(x,1)
                            % Variavel de pesquisa
                            p = x;

                            % Confere o limite da faixa de press�o igual
                            while tabela_vapor(p,1) == pres
                                p = p + 1;

                                % Evitar ultrapassar o limite da tabela
                                if p > tamanho_vapor(1)
                                   break; 
                                end 
                            end  

                            % Avalia a temperatura na ultima coordenada de press�o igual
                            if tabela_vapor(p-1,2) < temp
                                errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                                return;
                            end    

                            % Nova coluna para procura
                            y = 2;

                            % Procura temperatura
                            while tabela_vapor(x,y) < temp
                                x = x + 1;
                                y = 2;
                            end

                            % Interpola��o para caso n�o ache os valores
                            if tabela_vapor(x,y) > temp
                                tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,y);
                            end
                            
                            % Define o t�tulo
                            if tabela_vapor(x-1,1) ~= tabela_vapor(x,1)                         
                                titu = 1;                     
                            else
                                titu = '--';                     
                            end
                            
                            % Ajuste a coluna de press�o
                            tabela_vapor(x,1) = pres;
                            tabela_vapor(x,2) = temp;

                            % Propriedades
                            volu = tabela_vapor(x,3);
                            ener = tabela_vapor(x,4);
                            enta = tabela_vapor(x,5);
                            entr = tabela_vapor(x,6);

                        elseif pres < tabela_vapor(x,1)
                            % variaveis necess�rias
                            I = 1;
                            i = x;

                            % Confere o limite da faixa de press�o igual
                            while tabela_vapor(i,1) == tabela_vapor(x,1)
                                for k = 1 : 1 : tamanho_vapor(2)
                                    tabela_interpolMax(I,k) = tabela_vapor(i,k);
                                end
                                I = I + 1;
                                i = i + 1;

                                % Eveitar ultrapassar o limite da tabela
                                if i > tamanho_vapor(1)
                                   break; 
                                end 
                            end  

                            % Zera os contadores para pr�xima matriz
                            i = x-1;
                            I = 1;

                            % Delimita os valores iniciais e finais das temperaturas para interpolar para press�o menor 
                            while tabela_vapor(i,1) == tabela_vapor(x-1,1)
                                for k = 1 : 1 : tamanho_vapor(2)
                                    tabela_interpolMin(I,k) = tabela_vapor(i,k);
                                end
                                I = I + 1;
                                i = i - 1;

                                % Eveitar ultrapassar o limite da tabela
                                if i <= 0
                                   break; 
                                end 
                            end

                            % Desinverte matriz
                            tabela_interpolMin = InverteMatriz(tabela_interpolMin);

                            % Interpola entre uma tabela e outra
                            tabela_vapor = InterpolacaoEntreTabelaCompletaVapor(tabela_vapor,tabela_interpolMax,tabela_interpolMin,pres,x);                  

                            % Define a coluna para pesquisa
                            y = 2;

                            % Procura pelo valor de temperatura
                            while tabela_vapor(x,y) < temp
                                x = x + 1;
                                y = 2;
                            end

                            % Interpola��o para caso n�o ache os valores
                            if tabela_vapor(x,y) > temp
                                tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,y);
                            end

                            if (tabela_vapor(x-1,1) ~= tabela_vapor(x,1)) && x > 1                     
                                titu = 1;                     
                            else
                                titu = '--';                     
                            end
                            
                            % Ajuste a coluna de press�o
                            tabela_vapor(x,1) = pres;
                            tabela_vapor(x,2) = temp;

                            % Printa os resultados as propriedades
                            volu = tabela_vapor(x,3);
                            ener = tabela_vapor(x,4);
                            enta = tabela_vapor(x,5);
                            entr = tabela_vapor(x,6);               

                        else
                            errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                            return;
                        end                           

                    elseif pres > tabela_satT(x,2) %Caso l�quido comprimido
                        esta = 'L�quido Comprimido'; %Estado
                        titu = 0;

                        % Corre��o da entalpia
                        entalpia = tabela_satT(x,8) + (tabela_satT(x,3) * (pres - tabela_satT(x,2))); 

                        % Propriedades
                        volu = tabela_satT(x,3);
                        ener = tabela_satT(x,5);
                        enta = entalpia;
                        entr = tabela_satT(x,11);

                    else %Caso mistura
                        esta = 'Mistura'; %Estado
                        propri = menu('Escolha uma propriedade:','Titulo','Volume Espec�fico (m�/kg)','Energia Interna (kJ/kg)','Entalpia (kJ/kg)','Entropia (kJ/kg � K)');

                        % Verifica cancelamento
                        if propri == 0
                            return;
                        end
                        
                        % Nova entrada
                        [volu , ener , enta , entr , titu] = NovaPropriedade(tabela_satT,x,y,propri);
                    end
                end

            case 2 %Entrada como Volume Espec�fico
                volu = prop_2;
                % Valida��o dos limites f�sicos das entradas
                if volu <= 0 || temp <= -273.15
                    errordlg('Erro err0205. Entradas fora dos limites f�sicos v�lidos.','ERRO');
                    return;
                end

                % Avalia o estado baseado na temperatura (entre saturado e vapor)
                if temp > tabela_satT(tamanho_sat(1),1) % Estado de Vapor
                    % Confere o limite da tabela
                    if volu > 0.31121 || temp > 180
                        errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                        return;
                    end

                    % Defini��o do Estado e t�tulo
                    esta = 'Vapor Super Aquecido'; %Estado
                    titu = '--';

                    % Define a coluna para procura
                    y = 3;

                    % Procurador na tabela
                    for x = 1 : 1 : tamanho_vapor(1)
                        if tabela_vapor(x,2) >= temp && tabela_vapor(x,y) <= volu
                           break 
                        end
                    end

                    % Avalia a temperatura achada
                    if temp == tabela_vapor(x,2)
                        % Avalia o valor da energia interna
                        if tabela_vapor(x,y) == volu
                            % Printa os resultados as propriedades
                            pres = tabela_vapor(x,1);
    %                         volu = tabela_vapor(x,3);
                            ener = tabela_vapor(x,4);
                            enta = tabela_vapor(x,5);
                            entr = tabela_vapor(x,6);

                        elseif tabela_vapor(x,y) < volu
                            tabela_vapor = TabelaVaporInterpolada3Propri(tabela_vapor,tamanho_vapor,volu,x,y);       

                            % Define a coluna para pesquisa
                            y = 2;

                            % Procura pelo valor de temperatura
                            while tabela_vapor(x,y) < temp
                                x = x + 1;
                                y = 2;
                            end

                            % Interpola��o para caso n�o ache os valores
                            if tabela_vapor(x,y) > temp
                                tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,y);
                            end

                            % Printa os resultados as propriedades
                            pres = tabela_vapor(x,1);
    %                         volu = tabela_vapor(x,3);
                            ener = tabela_vapor(x,4);
                            enta = tabela_vapor(x,5);
                            entr = tabela_vapor(x,6);   
                        end

                    elseif temp > tabela_vapor(x,2)
                        % Interpola��o para caso n�o ache os valores
                        if tabela_vapor(x,2) > temp
                            tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,2);
                        end

                         % Coluna para printar
                         y = 3;

                        % Avalia o valor da energia interna
                        if tabela_vapor(x,y) == volu
                            % Printa os resultados as propriedades
                            pres = tabela_vapor(x,1);
    %                         volu = tabela_vapor(x,3);
                            ener = tabela_vapor(x,4);
                            enta = tabela_vapor(x,5);
                            entr = tabela_vapor(x,6);

                        elseif tabela_vapor(x,y) < volu
                            % Define a nova tabela de pres para o vapor
                            tabela_vapor = TabelaVaporInterpolada3Propri(tabela_vapor,tamanho_vapor,volu,x,y);                  

                            % Define a coluna para pesquisa
                            y = 2;

                            % Procura pelo valor de temperatura
                            while tabela_vapor(x,y) < temp
                                x = x + 1;
                                y = 2;
                            end

                            % Interpola��o para caso n�o ache os valores
                            if tabela_vapor(x,y) > temp
                                tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,y);
                            end

                            % Printa os resultados as propriedades
                            pres = tabela_vapor(x,1);
    %                         volu = tabela_vapor(x,3);
                            ener = tabela_vapor(x,4);
                            enta = tabela_vapor(x,5);
                            entr = tabela_vapor(x,6);   
                        end                                                                                    
                    else
                        errordlg('Erro err0206. Entradas fora dos limites v�lidos.','ERRO');
                        return;
                    end          

                else %Estado de Satura��o
                    % Define a coluna para procura
                    y = 1;
                    x = 1;

                    % Procurador na tabela
                    while tabela_satT(x,y) < temp
                        x = x + 1;
                        y  = 1;
                    end

                    % Interpola��o para caso n�o ache os valores
                    if tabela_satT(x,1) > temp
                        tabela_satT = InterpolacaoCompleta(tabela_satT,temp,x);
                    end

                    % Avalia a segunda propriedade
                    if volu > tabela_satT(x,4) %Caso vapor super aquecido
                        % Confere o limite da tabela
                        if volu > 0.31121 || temp > 180
                            errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                            return;
                        end

                        % Procura na nova coluna 
                        y = 3;

                        % Procurador na tabela
                        for x = 1 : 1 : tamanho_vapor(1)
                            if tabela_vapor(x,2) >= temp && tabela_vapor(x,y) <= volu
                               break 
                            end
                        end

                        % Defini o estado e o t�tulo
                        esta = 'Vapor Super Aquecido'; %Estado
                        if tabela_vapor(x-1,1) ~= tabela_vapor(x,1)                         
                            titu = 1;                     
                        else
                            titu = '--';                     
                        end
                        
                        % Avalia a temperatura achada
                        if temp == tabela_vapor(x,2)
                            % Avalia o valor da energia interna
                            if tabela_vapor(x,y) == volu
                                % Printa os resultados as propriedades
                                pres = tabela_vapor(x,1);
    %                             volu = tabela_vapor(x,3);
                                ener = tabela_vapor(x,4);
                                enta = tabela_vapor(x,5);
                                entr = tabela_vapor(x,6);

                            elseif tabela_vapor(x,y) < volu
                                % Define a nova tabela de pres para o vapor
                                tabela_vapor = TabelaVaporInterpolada3Propri(tabela_vapor,tamanho_vapor,volu,x,y);                  

                                % Define a coluna para pesquisa
                                y = 2;

                                % Procura pelo valor de temperatura
                                while tabela_vapor(x,y) < temp
                                    x = x + 1;
                                    y = 2;
                                end

                                % Interpola��o para caso n�o ache os valores
                                if tabela_vapor(x,y) > temp
                                    tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,y);
                                end

                                % Printa os resultados as propriedades
                                pres = tabela_vapor(x,1);
    %                             volu = tabela_vapor(x,3);
                                ener = tabela_vapor(x,4);
                                enta = tabela_vapor(x,5);
                                entr = tabela_vapor(x,6);   
                            end

                        elseif temp > tabela_vapor(x,2)
                            % Interpola��o para caso n�o ache os valores
                            if tabela_vapor(x,2) > temp
                                tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,2);
                            end

                            % Coluna para printar
                            y = 3;

                            % Avalia o valor da energia interna
                            if tabela_vapor(x,y) == volu
                                % Printa os resultados as propriedades
                                pres = tabela_vapor(x,1);
    %                             volu = tabela_vapor(x,3);
                                ener = tabela_vapor(x,4);
                                enta = tabela_vapor(x,5);
                                entr = tabela_vapor(x,6);

                            elseif tabela_vapor(x,y) < volu
                                 % Define a nova tabela de pres para o vapor
                                tabela_vapor = TabelaVaporInterpolada3Propri(tabela_vapor,tamanho_vapor,volu,x,y);                  

                                % Define a coluna para pesquisa
                                y = 2;

                                % Procura pelo valor de temperatura
                                while tabela_vapor(x,y) < temp
                                    x = x + 1;
                                    y = 2;
                                end

                                % Interpola��o para caso n�o ache os valores
                                if tabela_vapor(x,y) > temp
                                    tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,y);
                                end

                                % Printa os resultados as propriedades
                                pres = tabela_vapor(x,1);
    %                             volu = tabela_vapor(x,3);
                                ener = tabela_vapor(x,4);
                                enta = tabela_vapor(x,5);
                                entr = tabela_vapor(x,6);   
                            end  
                        end

                    elseif volu == tabela_satT(x,4) %Caso Vapor saturado
                        % Printa os resultados as propriedades
                        pres = tabela_satT(x,2);
    %                     volu = tabela_satT(x,4);
                        ener = tabela_satT(x,7);
                        enta = tabela_satT(x,10);
                        entr = tabela_satT(x,13);
                        titu = 1;
                        esta = 'Vapor Saturado';

                    elseif volu <= tabela_satT(x,3) %Caso l�quido comprimido
                        esta = 'L�quido Comprimido'; %Estado
                        titu = 0;

                        % Questiona se quer corrigir a entalpia com uma nova entrada de press�o
                        escolha = questdlg('Deseja entrar com uma nova press�o para corrigir a entalpia?','ENCERRAR','SIM','N�O','SIM');

                        if strcmp(escolha,'SIM') == 1
                            % Nova entrada de press�o
                            c = inputdlg('Digite um valor para Press�o (kPa): ','Necess�rio Press�o.',[1 45]);     

                            % Verifica cancelamento
                            if size(c) == 0
                                return
                            end

                            % Conversosr para n�mero
                            pressao = str2double(c);

                            % Contra entrada em letra
                            if isnan(pressao)
                                warndlg('Erro err0302. As entradas apresentam caracteres inv�lidos.','Erro');
                                return
                            end

                            % Validador f�sico do interbalo
                            if  pressao <= 0
                                errordlg('Erro err0305. Entradas fora dos limites f�sicos v�lidos.','Erro');
                                return
                            end

                            % Corre��o da entalpia
                            entalpia = tabela_satT(x,8) + (tabela_satT(x,3) * (pressao - tabela_satT(x,2))); 

                            % Atribui a press�o
                            pres = pressao;

                        else 
                            entalpia = tabela_satT(x,8);
                            pres = tabela_satT(x,2);

                        end                   

                        % Propriedades
    %                     pres = tabela_satT(x,2);
                        volu = tabela_satT(x,3);
    %                     ener = tabela_satT(x,5);
                        enta = entalpia;
                        entr = tabela_satT(x,11);                     

                    else %Caso mistura
                        esta = 'Mistura'; %Estado

                        % Calculo do t�tulo e das propriedades com t�tulo
                        titu = (volu-tabela_satT(x,3)) / (tabela_satT(x,4) - tabela_satT(x,3));
                        pres = tabela_satT(x,2);
    %                     volu = CalculoComTitulo(titu,tabela_satT(x,3),tabela_satT(x,4));
                        ener = CalculoComTitulo(titu,tabela_satT(x,5),tabela_satT(x,7));
                        enta = CalculoComTitulo(titu,tabela_satT(x,8),tabela_satT(x,10));
                        entr = CalculoComTitulo(titu,tabela_satT(x,11),tabela_satT(x,13));

                    end
                end           

            case 3 %Entrada como Energia Interna
                ener = prop_2;
                % Valida��o dos limites f�sicos das entradas
                if ener <= 0 || temp <= -273.15
                    errordlg('Erro err0205. Entradas fora dos limites f�sicos v�lidos.','ERRO');
                    return;
                end

                % Avalia o estado baseado na temperatura (entre saturado e vapor)
                if temp > tabela_satT(tamanho_sat(1),1) % Estado de Vapor
                    % Confere o limite da tabela
                    if ener > 386.99 || temp > 180
                        errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                        return;
                    end

                    % Defini��o do Estado e t�tulo
                    esta = 'Vapor Super Aquecido'; %Estado
                    titu = '--';

                    % Define a coluna para procura
                    y = 4;

                    % Procurador na tabela
                    for x = 1 : 1 : tamanho_vapor(1)
                        if tabela_vapor(x,2) >= temp && tabela_vapor(x,y) <= ener
                           break 
                        end
                    end

                    % Avalia a temperatura achada
                    if temp == tabela_vapor(x,2)
                        % Avalia o valor da energia interna
                        if tabela_vapor(x,y) == ener
                            % Printa os resultados as propriedades
                            pres = tabela_vapor(x,1);
                            volu = tabela_vapor(x,3);
    %                         ener = tabela_vapor(x,4);
                            enta = tabela_vapor(x,5);
                            entr = tabela_vapor(x,6);

                        elseif tabela_vapor(x,y) < ener
                            tabela_vapor = TabelaVaporInterpolada3Propri(tabela_vapor,tamanho_vapor,ener,x,y);       

                            % Define a coluna para pesquisa
                            y = 2;

                            % Procura pelo valor de temperatura
                            while tabela_vapor(x,y) < temp
                                x = x + 1;
                                y = 2;
                            end

                            % Interpola��o para caso n�o ache os valores
                            if tabela_vapor(x,y) > temp
                                tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,y);
                            end

                            % Printa os resultados as propriedades
                            pres = tabela_vapor(x,1);
                            volu = tabela_vapor(x,3);
    %                         ener = tabela_vapor(x,4);
                            enta = tabela_vapor(x,5);
                            entr = tabela_vapor(x,6);   
                        end

                    elseif temp > tabela_vapor(x,2)
                        % Interpola��o para caso n�o ache os valores
                        if tabela_vapor(x,2) > temp
                            tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,2);
                        end

                         % Coluna para printar
                         y = 4;

                        % Avalia o valor da energia interna
                        if tabela_vapor(x,y) == ener
                            % Printa os resultados as propriedades
                            pres = tabela_vapor(x,1);
                            volu = tabela_vapor(x,3);
    %                         ener = tabela_vapor(x,4);
                            enta = tabela_vapor(x,5);
                            entr = tabela_vapor(x,6);

                        elseif tabela_vapor(x,y) < ener
                            % Define a nova tabela de pres para o vapor
                            tabela_vapor = TabelaVaporInterpolada3Propri(tabela_vapor,tamanho_vapor,ener,x,y);                  

                            % Define a coluna para pesquisa
                            y = 2;

                            % Procura pelo valor de temperatura
                            while tabela_vapor(x,y) < temp
                                x = x + 1;
                                y = 2;
                            end

                            % Interpola��o para caso n�o ache os valores
                            if tabela_vapor(x,y) > temp
                                tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,y);
                            end

                            % Printa os resultados as propriedades
                            pres = tabela_vapor(x,1);
                            volu = tabela_vapor(x,3);
    %                         ener = tabela_vapor(x,4);
                            enta = tabela_vapor(x,5);
                            entr = tabela_vapor(x,6);   
                        end                                                                                    
                    else
                        errordlg('Erro err0206. Entradas fora dos limites v�lidos.','ERRO');
                        return;
                    end          

                else %Estado de Satura��o
                    % Define a coluna para procura
                    y = 1;
                    x = 1;

                    % Procurador na tabela
                    while tabela_satT(x,y) < temp
                        x = x + 1;
                        y  = 1;
                    end

                    % Interpola��o para caso n�o ache os valores
                    if tabela_satT(x,1) > temp
                        tabela_satT = InterpolacaoCompleta(tabela_satT,temp,x);
                    end

                    % Avalia a segunda propriedade
                    if ener > tabela_satT(x,7) %Caso vapor super aquecido
                        % Confere o limite da tabela
                        if ener > 386.99 || temp > 180
                            errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                            return;
                        end

                        % Procura na nova coluna 
                        y = 4;

                        % Procurador na tabela
                        for x = 1 : 1 : tamanho_vapor(1)
                            if tabela_vapor(x,2) >= temp && tabela_vapor(x,y) <= ener
                               break 
                            end
                        end

                        % Defini o estado e o t�tulo
                        esta = 'Vapor Super Aquecido'; %Estado
                        if tabela_vapor(x-1,1) ~= tabela_vapor(x,1)                         
                            titu = 1;                     
                        else
                            titu = '--';                     
                        end
                        
                        % Avalia a temperatura achada
                        if temp == tabela_vapor(x,2)
                            % Avalia o valor da energia interna
                            if tabela_vapor(x,y) == ener
                                % Printa os resultados as propriedades
                                pres = tabela_vapor(x,1);
                                volu = tabela_vapor(x,3);
        %                         ener = tabela_vapor(x,4);
                                enta = tabela_vapor(x,5);
                                entr = tabela_vapor(x,6);

                            elseif tabela_vapor(x,y) < ener
                                % Define a nova tabela de pres para o vapor
                                tabela_vapor = TabelaVaporInterpolada3Propri(tabela_vapor,tamanho_vapor,ener,x,y);                  

                                % Define a coluna para pesquisa
                                y = 2;

                                % Procura pelo valor de temperatura
                                while tabela_vapor(x,y) < temp
                                    x = x + 1;
                                    y = 2;
                                end

                                % Interpola��o para caso n�o ache os valores
                                if tabela_vapor(x,y) > temp
                                    tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,y);
                                end

                                % Printa os resultados as propriedades
                                pres = tabela_vapor(x,1);
                                volu = tabela_vapor(x,3);
        %                         ener = tabela_vapor(x,4);
                                enta = tabela_vapor(x,5);
                                entr = tabela_vapor(x,6);   
                            end

                        elseif temp > tabela_vapor(x,2)
                            % Interpola��o para caso n�o ache os valores
                            if tabela_vapor(x,2) > temp
                                tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,2);
                            end

                            % Coluna para printar
                            y = 4;

                            % Avalia o valor da energia interna
                            if tabela_vapor(x,y) == ener
                                % Printa os resultados as propriedades
                                pres = tabela_vapor(x,1);
                                volu = tabela_vapor(x,3);
        %                         ener = tabela_vapor(x,4);
                                enta = tabela_vapor(x,5);
                                entr = tabela_vapor(x,6);

                            elseif tabela_vapor(x,y) < ener
                                 % Define a nova tabela de pres para o vapor
                                tabela_vapor = TabelaVaporInterpolada3Propri(tabela_vapor,tamanho_vapor,ener,x,y);                  

                                % Define a coluna para pesquisa
                                y = 2;

                                % Procura pelo valor de temperatura
                                while tabela_vapor(x,y) < temp
                                    x = x + 1;
                                    y = 2;
                                end

                                % Interpola��o para caso n�o ache os valores
                                if tabela_vapor(x,y) > temp
                                    tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,y);
                                end

                                % Printa os resultados as propriedades
                                pres = tabela_vapor(x,1);
                                volu = tabela_vapor(x,3);
        %                         ener = tabela_vapor(x,4);
                                enta = tabela_vapor(x,5);
                                entr = tabela_vapor(x,6);   
                            end  
                        end

                    elseif ener == tabela_satT(x,7) %Caso Vapor saturado
                        % Printa os resultados as propriedades
                        pres = tabela_satT(x,2);
                        volu = tabela_satT(x,4);
    %                     ener = tabela_satT(x,7);
                        enta = tabela_satT(x,10);
                        entr = tabela_satT(x,13);
                        titu = 1;
                        esta = 'Vapor Saturado';

                    elseif ener <= tabela_satT(x,5) %Caso l�quido comprimido
                        esta = 'L�quido Comprimido'; %Estado
                        titu = 0;

                        % Questiona se quer corrigir a entalpia com uma nova entrada de press�o
                        escolha = questdlg('Deseja entrar com uma nova press�o para corrigir a entalpia?','ENCERRAR','SIM','N�O','SIM');

                        if strcmp(escolha,'SIM') == 1
                            % Nova entrada de press�o
                            c = inputdlg('Digite um valor para Press�o (kPa): ','Necess�rio Press�o.',[1 45]);     

                            % Verifica cancelamento
                            if size(c) == 0
                                return
                            end

                            % Conversosr para n�mero
                            pressao = str2double(c);

                            % Contra entrada em letra
                            if isnan(pressao)
                                warndlg('Erro err0302. As entradas apresentam caracteres inv�lidos.','Erro');
                                return
                            end

                            % Validador f�sico do interbalo
                            if  pressao <= 0
                                errordlg('Erro err0305. Entradas fora dos limites f�sicos v�lidos.','Erro');
                                return
                            end

                            % Corre��o da entalpia
                            entalpia = tabela_satT(x,8) + (tabela_satT(x,3) * (pressao - tabela_satT(x,2))); 

                            % Atribui a press�o
                            pres = pressao;

                        else 
                            entalpia = tabela_satT(x,8);
                            pres = tabela_satT(x,2);

                        end                   

                        % Propriedades
    %                     pres = tabela_satT(x,2);
                        volu = tabela_satT(x,3);
    %                     ener = tabela_satT(x,5);
                        enta = entalpia;
                        entr = tabela_satT(x,11);                     

                    else %Caso mistura
                        esta = 'Mistura'; %Estado

                        % Calculo do t�tulo e das propriedades com t�tulo
                        titu = (ener-tabela_satT(x,5)) / tabela_satT(x,6);
                        pres = tabela_satT(x,2);
                        volu = CalculoComTitulo(titu,tabela_satT(x,3),tabela_satT(x,4));
    %                     ener = CalculoComTitulo(titu,tabela_satT(x,5),tabela_satT(x,7));
                        enta = CalculoComTitulo(titu,tabela_satT(x,8),tabela_satT(x,10));
                        entr = CalculoComTitulo(titu,tabela_satT(x,11),tabela_satT(x,13));

                    end
                end

            case 4 %Entrada como Entalpia
                % Propriedade
                enta = prop_2;

                % Valida��o dos limites f�sicos das entradas
                if enta <= 0 || temp <= -273.15
                    errordlg('Erro err0205. Entradas fora dos limites f�sicos v�lidos.','ERRO');
                    return;
                end        

                % Avalia o estado baseado na temperatura (entre saturado e vapor)
                if temp > tabela_satT(tamanho_sat(1),1) % Estado de Vapor

                    % Define a coluna de pesquisa
                    y = 5;

                    % Confere o limite da tabela
                    if enta > 422.64 || temp > 180
                        errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                        return;
                    end

                    % Defini��o do Estado e t�tulo
                    esta = 'Vapor Super Aquecido'; %Estado
                    titu = '--';

                    % Procurador na tabela
                    for x = 1 : 1 : tamanho_vapor(1)
                        if tabela_vapor(x,2) >= temp && tabela_vapor(x,y) <= enta
                           break 
                        end
                    end

                    % Avalia a temperatura achada
                    if temp == tabela_vapor(x,2)
                        % Avalia o valor da energia interna
                        if tabela_vapor(x,y) == enta
                            % Printa os resultados as propriedades
                            pres = tabela_vapor(x,1);
                            volu = tabela_vapor(x,3);
                            ener = tabela_vapor(x,4);
    %                         enta = tabela_vapor(x,5);
                            entr = tabela_vapor(x,6);

                        elseif tabela_vapor(x,y) < enta
                            % Define a nova tabela de pres para o vapor
                            tabela_vapor = TabelaVaporInterpolada3Propri(tabela_vapor,tamanho_vapor,enta,x,y);                  

                            % Define a coluna para pesquisa
                            y = 2;

                            % Procura pelo valor de temperatura
                            while tabela_vapor(x,y) < temp
                                x = x + 1;
                                y = 2;
                            end

                            % Interpola��o para caso n�o ache os valores
                            if tabela_vapor(x,y) > temp
                                tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,y);
                            end

                            % Printa os resultados as propriedades
                            pres = tabela_vapor(x,1);
                            volu = tabela_vapor(x,3);
                            ener = tabela_vapor(x,4);
    %                         enta = tabela_vapor(x,5);
                            entr = tabela_vapor(x,6);   
                        end

                    elseif temp > tabela_vapor(x,2)
                        % Interpola��o para caso n�o ache os valores
                        if tabela_vapor(x,2) > temp
                            tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,2);
                        end

                         % Coluna para printar
                         y = 5;

                        % Avalia o valor da energia interna
                        if tabela_vapor(x,y) == enta
                            % Printa os resultados as propriedades
                            pres = tabela_vapor(x,1);
                            volu = tabela_vapor(x,3);
                            ener = tabela_vapor(x,4);
    %                         enta = tabela_vapor(x,5);
                            entr = tabela_vapor(x,6);

                        elseif tabela_vapor(x,y) < enta
                            % Define a nova tabela de pres para o vapor
                            tabela_vapor = TabelaVaporInterpolada3Propri(tabela_vapor,tamanho_vapor,enta,x,y);                  

                            % Define a coluna para pesquisa
                            y = 2;

                            % Procura pelo valor de temperatura
                            while tabela_vapor(x,y) < temp
                                x = x + 1;
                                y = 2;
                            end

                            % Interpola��o para caso n�o ache os valores
                            if tabela_vapor(x,y) > temp
                                tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,y);
                            end

                            % Printa os resultados as propriedades
                            pres = tabela_vapor(x,1);
                            volu = tabela_vapor(x,3);
                            ener = tabela_vapor(x,4);
    %                         enta = tabela_vapor(x,5);
                            entr = tabela_vapor(x,6);   
                        end                                                                                    
                    else
                        errordlg('Erro err0206. Entradas fora dos limites v�lidos.','ERRO');
                        return;
                    end                 

                else %Estado de Satura��o
                    % Coordenadas para pesquisa
                    y = 1;
                    x = 1;

                    % Procurador na tabela
                    while tabela_satT(x,y) < temp
                        x = x + 1;
                        y = 1;
                    end

                    % Interpola��o para caso n�o ache os valores
                    if tabela_satT(x,1) > temp
                        tabela_satT = InterpolacaoCompleta(tabela_satT,temp,x);
                    end

                    % Avalia a segunda propriedade
                    if enta > tabela_satT(x,10) %Caso vapor super aquecido
                        % Confere o limite da tabela
                        if enta > 422.64 || temp > 180
                            errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                            return;
                        end

                        % Procura na nova coluna 
                        y = 5;

                        % Procurador na tabela
                        for x = 1 : 1 : tamanho_vapor(1)
                            if tabela_vapor(x,2) >= temp && tabela_vapor(x,y) <= enta
                               break 
                            end
                        end

                        % Defini o estado e o t�tulo
                        esta = 'Vapor Super Aquecido'; %Estado
                        if tabela_vapor(x-1,1) ~= tabela_vapor(x,1)                         
                            titu = 1;                     
                        else
                            titu = '--';                     
                        end
                        
                        % Avalia a temperatura achada
                        if temp == tabela_vapor(x,2)
                            % Avalia o valor da energia interna
                            if tabela_vapor(x,y) == enta
                                % Printa os resultados as propriedades
                                pres = tabela_vapor(x,1);
                                volu = tabela_vapor(x,3);
                                ener = tabela_vapor(x,4);
    %                             enta = tabela_vapor(x,5);
                                entr = tabela_vapor(x,6);

                            elseif tabela_vapor(x,y) < enta
                                % Define a nova tabela de pres para o vapor
                                tabela_vapor = TabelaVaporInterpolada3Propri(tabela_vapor,tamanho_vapor,enta,x,y);                  

                                % Define a coluna para pesquisa
                                y = 2;

                                % Procura pelo valor de temperatura
                                while tabela_vapor(x,y) < temp
                                    x = x + 1;
                                    y = 2;
                                end

                                % Interpola��o para caso n�o ache os valores
                                if tabela_vapor(x,y) > temp
                                    tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,y);
                                end

                                % Printa os resultados as propriedades
                                pres = tabela_vapor(x,1);
                                volu = tabela_vapor(x,3);
                                ener = tabela_vapor(x,4);
    %                             enta = tabela_vapor(x,5);
                                entr = tabela_vapor(x,6);   
                            end

                        elseif temp > tabela_vapor(x,2)
                            % Interpola��o para caso n�o ache os valores
                            if tabela_vapor(x,2) > temp
                                tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,2);
                            end

                            % Define a coluna para pesquisa
                            y = 5;

                            % Avalia o valor da energia interna
                            if tabela_vapor(x,y) == enta
                                % Printa os resultados as propriedades
                                pres = tabela_vapor(x,1);
                                volu = tabela_vapor(x,3);
                                ener = tabela_vapor(x,4);
    %                             enta = tabela_vapor(x,5);
                                entr = tabela_vapor(x,6);

                            elseif tabela_vapor(x,y) < enta
                                 % Define a nova tabela de pres para o vapor
                                tabela_vapor = TabelaVaporInterpolada3Propri(tabela_vapor,tamanho_vapor,enta,x,y);                  

                                % Define a coluna para pesquisa
                                y = 2;

                                % Procura pelo valor de temperatura
                                while tabela_vapor(x,y) < temp
                                    x = x + 1;
                                    y = 2;
                                end

                                % Interpola��o para caso n�o ache os valores
                                if tabela_vapor(x,y) > temp
                                    tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,y);
                                end

                                % Printa os resultados as propriedades
                                pres = tabela_vapor(x,1);
                                volu = tabela_vapor(x,3);
                                ener = tabela_vapor(x,4);
    %                             enta = tabela_vapor(x,5);
                                entr = tabela_vapor(x,6);   
                            end  
                        end                         

                    elseif enta == tabela_satT(x,10) %Caso Vapor saturado
                        % Printa os resultados as propriedades
                        pres = tabela_satT(x,2);
                        volu = tabela_satT(x,4);
                        ener = tabela_satT(x,7);
    %                     enta = tabela_satT(x,10);
                        entr = tabela_satT(x,13);
                        titu = 1;
                        esta = 'Vapor Saturado';

                    elseif enta <= tabela_satT(x,8) %Caso l�quido comprimido
                        esta = 'L�quido Comprimido'; %Estado
                        titu = 0;     

                        % Propriedades
                        pres = tabela_satT(x,2);
                        volu = tabela_satT(x,3);
                        ener = tabela_satT(x,5);
    %                     enta = entalpia;
                        entr = tabela_satT(x,11);                     

                    else %Caso mistura
                        esta = 'Mistura'; %Estado

                        % Calculo do t�tulo e das propriedades com t�tulo
                        titu = (enta-tabela_satT(x,8)) / tabela_satT(x,9);
                        pres = tabela_satT(x,2);
                        volu = CalculoComTitulo(titu,tabela_satT(x,3),tabela_satT(x,4));
                        ener = CalculoComTitulo(titu,tabela_satT(x,5),tabela_satT(x,7));
    %                     enta = CalculoComTitulo(titu,tabela_satT(x,8),tabela_satT(x,10));
                        entr = CalculoComTitulo(titu,tabela_satT(x,11),tabela_satT(x,13));

                    end
                end             

            case 5 %Entrada como Entropia
                % Propriedade
                entr = prop_2;

                % Valida��o dos limites f�sicos das entradas
                if entr <= 0 || temp <= -273.15
                    errordlg('Erro err0205. Entradas fora dos limites f�sicos v�lidos.','ERRO');
                    return;
                end

                % Avalia o estado baseado na temperatura (entre saturado e vapor)
                if temp > tabela_satT(tamanho_sat(1),1) % Estado de Vapor

                    % Define a coluna de pesquisa
                    y = 6;

                    % Confere o limite da tabela
                    if entr > 1.3327 || temp > 180
                        errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                        return;
                    end

                    % Procurador na tabela
                    for x = 1 : 1 : tamanho_vapor(1)
                        if tabela_vapor(x,2) >= temp && tabela_vapor(x,y) <= entr
                           break 
                        end
                    end

                    % Defini��o do Estado e t�tulo
                    esta = 'Vapor Super Aquecido'; %Estado 
                    titu = '--';

                    % Avalia a temperatura achada
                    if temp == tabela_vapor(x,2)
                        % Avalia o valor da energia interna
                        if tabela_vapor(x,y) == entr
                            % Printa os resultados as propriedades
                            pres = tabela_vapor(x,1);
                            volu = tabela_vapor(x,3);
                            ener = tabela_vapor(x,4);
                            enta = tabela_vapor(x,5);
    %                         entr = tabela_vapor(x,6);

                        elseif tabela_vapor(x,y) < entr
                            % Define a nova tabela de pres para o vapor
                            tabela_vapor = TabelaVaporInterpolada3Propri(tabela_vapor,tamanho_vapor,entr,x,y);                  

                            % Define a coluna para pesquisa
                            y = 2;

                            % Procura pelo valor de temperatura
                            while tabela_vapor(x,y) < temp
                                x = x + 1;
                                y = 2;
                            end

                            % Interpola��o para caso n�o ache os valores
                            if tabela_vapor(x,y) > temp
                                tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,y);
                            end

                            % Printa os resultados as propriedades
                            pres = tabela_vapor(x,1);
                            volu = tabela_vapor(x,3);
                            ener = tabela_vapor(x,4);
                            enta = tabela_vapor(x,5);
    %                         entr = tabela_vapor(x,6);   
                        end

                    elseif temp > tabela_vapor(x,2)
                        % Interpola��o para caso n�o ache os valores
                        if tabela_vapor(x,2) > temp
                            tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,2);
                        end

                         % Coluna para printar
                         y = 6;

                        % Avalia o valor da energia interna
                        if tabela_vapor(x,y) == entr
                            % Printa os resultados as propriedades
                            pres = tabela_vapor(x,1);
                            volu = tabela_vapor(x,3);
                            ener = tabela_vapor(x,4);
                            enta = tabela_vapor(x,5);
    %                         entr = tabela_vapor(x,6);

                        elseif tabela_vapor(x,y) < entr
                            % Define a nova tabela de pres para o vapor
                            tabela_vapor = TabelaVaporInterpolada3Propri(tabela_vapor,tamanho_vapor,entr,x,y);                  

                            % Define a coluna para pesquisa
                            y = 2;

                            % Procura pelo valor de temperatura
                            while tabela_vapor(x,y) < temp
                                x = x + 1;
                                y = 2;
                            end

                            % Interpola��o para caso n�o ache os valores
                            if tabela_vapor(x,y) > temp
                                tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,y);
                            end

                            % Printa os resultados as propriedades
                            pres = tabela_vapor(x,1);
                            volu = tabela_vapor(x,3);
                            ener = tabela_vapor(x,4);
                            enta = tabela_vapor(x,5);
    %                         entr = tabela_vapor(x,6);   
                        end                                                                                    
                    else
                        errordlg('Erro err0206. Entradas fora dos limites v�lidos.','ERRO');
                        return;
                    end

                else %Estado de Satura��o
                    % Inicio
                    x = 1;
                    y = 1;

                    % Procurador na tabela
                    while tabela_satT(x,y) < temp
                        x = x + 1;
                        y  = 1;
                    end

                    % Interpola��o para caso n�o ache os valores
                    if tabela_satT(x,1) > temp
                        tabela_satT = InterpolacaoCompleta(tabela_satT,temp,x);
                    end

                    % Avalia a segunda propriedade
                    if entr > tabela_satT(x,13) %Caso vapor super aquecido
                        % Confere o limite da tabela
                        if entr > 1.3520 || temp > 180
                            errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                            return;
                        end

                        % Procura na nova coluna 
                        y = 6;

                        % Procurador na tabela
                        for x = 1 : 1 : tamanho_vapor(1)
                            if tabela_vapor(x,2) >= temp && tabela_vapor(x,y) <= entr
                               break 
                            end
                        end

                        % Defini o estado e o t�tulo
                        esta = 'Vapor Super Aquecido'; %Estado
                        if tabela_vapor(x-1,1) ~= tabela_vapor(x,1)                         
                            titu = 1;                     
                        else
                            titu = '--';                     
                        end
                        
                        % Avalia a temperatura achada
                        if temp == tabela_vapor(x,2)
                            % Avalia o valor da energia interna
                            if tabela_vapor(x,y) == entr
                                % Printa os resultados as propriedades
                                pres = tabela_vapor(x,1);
                                volu = tabela_vapor(x,3);
                                ener = tabela_vapor(x,4);
                                enta = tabela_vapor(x,5);
    %                             entr = tabela_vapor(x,6);

                            elseif tabela_vapor(x,y) < entr
                                % Define a nova tabela de pres para o vapor
                                tabela_vapor = TabelaVaporInterpolada3Propri(tabela_vapor,tamanho_vapor,entr,x,y);                  

                                % Define a coluna para pesquisa
                                y = 2;

                                % Procura pelo valor de temperatura
                                while tabela_vapor(x,y) < temp
                                    x = x + 1;
                                    y = 2;
                                end

                                % Interpola��o para caso n�o ache os valores
                                if tabela_vapor(x,y) > temp
                                    tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,y);
                                end

                                % Printa os resultados as propriedades
                                pres = tabela_vapor(x,1);
                                volu = tabela_vapor(x,3);
                                ener = tabela_vapor(x,4);
                                enta = tabela_vapor(x,5);
    %                             entr = tabela_vapor(x,6);   
                            end

                        elseif temp > tabela_vapor(x,2)
                            % Interpola��o para caso n�o ache os valores
                            if tabela_vapor(x,2) > temp
                                tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,2);
                            end

                            % Define a coluna para pesquisa
                            y = 6;

                            % Avalia o valor da energia interna
                            if tabela_vapor(x,y) == entr
                                % Printa os resultados as propriedades
                                pres = tabela_vapor(x,1);
                                volu = tabela_vapor(x,3);
                                ener = tabela_vapor(x,4);
                                enta = tabela_vapor(x,5);
    %                             entr = tabela_vapor(x,6);

                            elseif tabela_vapor(x,y) < entr
                                 % Define a nova tabela de pres para o vapor
                                tabela_vapor = TabelaVaporInterpolada3Propri(tabela_vapor,tamanho_vapor,entr,x,y);                  

                                % Define a coluna para pesquisa
                                y = 2;

                                % Procura pelo valor de temperatura
                                while tabela_vapor(x,y) < temp
                                    x = x + 1;
                                    y = 2;
                                end

                                % Interpola��o para caso n�o ache os valores
                                if tabela_vapor(x,y) > temp
                                    tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x);
                                end

                                % Printa os resultados as propriedades
                                pres = tabela_vapor(x,1);
                                volu = tabela_vapor(x,3);
                                ener = tabela_vapor(x,4);
                                enta = tabela_vapor(x,5);
    %                             entr = tabela_vapor(x,6);   
                            end  
                        end                         

                    elseif entr == tabela_satT(x,13) %Caso Vapor saturado
                        % Printa os resultados as propriedades
                        pres = tabela_satT(x,2);
                        volu = tabela_satT(x,4);
                        ener = tabela_satT(x,7);
                        enta = tabela_satT(x,10);
    %                     entr = tabela_satT(x,13);
                        titu = 1;
                        esta = 'Vapor Saturado';

                    elseif entr <= tabela_satT(x,11) %Caso l�quido comprimido
                        esta = 'L�quido Comprimido'; %Estado
                        titu = 0;

                        % Questiona se quer corrigir a entalpia com uma nova entrada de press�o
                        escolha = questdlg('Deseja entrar com uma nova press�o para corrigir a entalpia?','ENCERRAR','SIM','N�O','SIM');

                        if strcmp(escolha,'SIM') == 1
                            % Nova entrada de press�o
                            c = inputdlg('Digite um valor para Press�o (kPa): ','Necess�rio Press�o.',[1 45]);     

                            % Verifica cancelamento
                            if size(c) == 0
                                return
                            end

                            % Conversosr para n�mero
                            pressao = str2double(c);

                            % Contra entrada em letra
                            if isnan(pressao)
                                warndlg('Erro err0302. As entradas apresentam caracteres inv�lidos.','Erro');
                                return
                            end

                            % Validador f�sico do interbalo
                            if  pressao <= 0
                                errordlg('Erro err0305. Entradas fora dos limites f�sicos v�lidos.','Erro');
                                return
                            end

                            % Corre��o da entalpia
                            entalpia = tabela_satT(x,8) + (tabela_satT(x,3) * (pressao - tabela_satT(x,2))); 

                            % Atribui a press�o
                            pres = pressao;
                            pres = tabela_satT(x,2);

                        else 
                            entalpia = tabela_satT(x,8);

                        end                   

                        % Propriedades
    %                     pres = tabela_satT(x,2);
                        volu = tabela_satT(x,3);
                        ener = tabela_satT(x,5);
                        enta = entalpia;
    %                     entr = tabela_satT(x,11);                     

                    else %Caso mistura
                        esta = 'Mistura'; %Estado

                        % Calculo do t�tulo e das propriedades com t�tulo
                        titu = (entr-tabela_satT(x,11)) / tabela_satT(x,12);
                        pres = tabela_satT(x,2);
                        volu = CalculoComTitulo(titu,tabela_satT(x,3),tabela_satT(x,4));
                        ener = CalculoComTitulo(titu,tabela_satT(x,5),tabela_satT(x,7));
                        enta = CalculoComTitulo(titu,tabela_satT(x,8),tabela_satT(x,10));
    %                     entr = CalculoComTitulo(titu,tabela_satT(x,11),tabela_satT(x,13));

                    end
                end                

            case 6 %Entrada como T�tulo
                % Propriedade e estado
                titu = prop_2;
                if titu == 1
                    esta = 'Vapor Saturado'; %Estado de Mistura 
                elseif titu == 0
                    esta = 'L�quido Saturado'; %Estado de Mistura 
                else
                    esta = 'Mistura'; %Estado de Mistura 
                end

                % Valida��o dos limites f�sicos das entradas
                if temp <= -273.15
                    errordlg('Erro err0205. Entradas fora dos limites f�sicos v�lidos.','ERRO');
                    return;
                end

                % Avalia os limites da tabela
                if temp > tabela_satT(tamanho_sat(1),1)
                    errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                    return;
                end

                % Valida��o te�rica do t�tulo
                if  titu > 1 || titu < 0
                    errordlg('Erro err0307. Entradas fora dos limites te�ricos v�lidos.','Erro');
                    return
                end

                % Procurador na tabela
                while tabela_satT(x,y) < temp
                    x = x + 1;
                    y  = 1;
                end

                % Interpola��o para caso n�o ache os valores
                if tabela_satT(x,1) > temp
                    tabela_satT = InterpolacaoCompleta(tabela_satT,temp,x);
                end

                % Calculo do t�tulo e das propriedades com t�tulo
                pres = tabela_satT(x,2);
                volu = CalculoComTitulo(titu,tabela_satT(x,3),tabela_satT(x,4));
                ener = CalculoComTitulo(titu,tabela_satT(x,5),tabela_satT(x,7));
                enta = CalculoComTitulo(titu,tabela_satT(x,8),tabela_satT(x,10));
                entr = CalculoComTitulo(titu,tabela_satT(x,11),tabela_satT(x,13));

            otherwise
                errordlg('Erro err0204. Op��o da segunda propriedade de entrada � inv�lida ou incoerente.','ERRO');
                return;
        end
    end

    % �gua
    if strcmp(fluido,'�gua') == 1

        % Conferir v�lidade das entradas
        if isnan(temp) || isnan(prop_2)
            errordlg('Erro err0202. As entradas apresentam caracteres inv�lidos.','ERRO');
            return;
        end

        % Tamanho das tabelas
        tamanho_sat = size(tabela_satT);
        tamanho_vapor = size(tabela_vapor);
        tamanho_liq = size(tabela_liqComp);

        % Avalia a segunda entrada
        switch segunda_entrada
            case 1 %Entrada como Press�o
                pres = prop_2;
                % Valida��o dos limites f�sicos das entradas
                if pres <= 0 || temp <= -273.15
                    errordlg('Erro err0205. Entradas fora dos limites f�sicos v�lidos.','ERRO');
                    return;
                end

                % Valida��o da entrada dentro dos limites da tabela
                if temp < tabela_satT(1,1) || temp > tabela_vapor(tamanho_vapor(1),2)
                    errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                    return;
                end

                % Avalia o estado baseado na temperatura (entre saturado e vapor)
                if temp > tabela_satT(tamanho_sat(1),1) % Estado de Vapor
                    % Confere o limite de press�o
                    if pres > tabela_vapor(tamanho_vapor(1),1) || pres < tabela_vapor(1,1)
                        errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                        return;
                    end

                    % Defini��o do Estado e t�tulo
                    esta = 'Vapor Super Aquecido'; %Estado
                    titu = '--';

                    % Procurador na tabela
                    while tabela_vapor(x,y) < pres
                        x = x + 1;
                        y  = 1;
                    end                

                    % Avalia a press�o
                    if pres == tabela_vapor(x,1)
                        % variaveis necess�rias
                        I = 1;
                        i = x;

                        % Confere o limite da faixa de press�o igual
                        while tabela_vapor(i,1) == tabela_vapor(x,1)
                            i = i + 1;

                            % Evitar ultrapassar o limite da tabela
                            if i > tamanho_vapor(1)
                               break; 
                            end 
                        end  

                        % Avalia a temperatura na ultima coordenada de press�o igual
                        if tabela_vapor(i-1,2) < temp
                            errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                            return;
                        end    

                        % Nova coluna para procura
                        y = 2;

                        % Procura temperatura
                        while tabela_vapor(x,y) < temp
                            x = x + 1;
                            y = 2;
                        end

                        % Interpola��o para caso n�o ache os valores
                        if tabela_vapor(x,y) > temp
                            tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,y);
                        end

                        % Ajuste a coluna de press�o
                        tabela_vapor(x,1) = pres;
                        tabela_vapor(x,2) = temp;

                        % Propriedades
                        volu = tabela_vapor(x,3);
                        ener = tabela_vapor(x,4);
                        enta = tabela_vapor(x,5);
                        entr = tabela_vapor(x,6);

                    elseif pres < tabela_vapor(x,1)
                        % variaveis necess�rias
                        I = 1;
                        i = x;

                        % Confere o limite da faixa de press�o igual
                        while tabela_vapor(i,1) == tabela_vapor(x,1)
                            for k = 1 : 1 : tamanho_vapor(2)
                                tabela_interpolMax(I,k) = tabela_vapor(i,k);
                            end
                            I = I + 1;
                            i = i + 1;

                            % Eveitar ultrapassar o limite da tabela
                            if i > tamanho_vapor(1)
                               break; 
                            end 
                        end  

                        % Zera os contadores para pr�xima matriz
                        i = x-1;
                        I = 1;

                        % Delimita os valores iniciais e finais das temperaturas para interpolar para press�o menor 
                        while tabela_vapor(i,1) == tabela_vapor(x-1,1)
                            for k = 1 : 1 : tamanho_vapor(2)
                                tabela_interpolMin(I,k) = tabela_vapor(i,k);
                            end
                            I = I + 1;
                            i = i - 1;

                            % Eveitar ultrapassar o limite da tabela
                            if i <= 0
                               break; 
                            end 
                        end

                        % Desinverte matriz
                        tabela_interpolMin = InverteMatriz(tabela_interpolMin);

                        % Interpola entre uma tabela e outra
                        tabela_vapor = InterpolacaoEntreTabelaCompletaVapor(tabela_vapor,tabela_interpolMax,tabela_interpolMin,pres,x);                  

                        % Define a coluna para pesquisa
                        y = 2;

                        % Procura pelo valor de temperatura
                        while tabela_vapor(x,y) < temp
                            x = x + 1;
                            y = 2;
                        end

                        % Interpola��o para caso n�o ache os valores
                        if tabela_vapor(x,y) > temp
                            tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,y);
                        end

                        % Ajuste a coluna de press�o
                        tabela_vapor(x,1) = pres;
                        tabela_vapor(x,2) = temp;

                        % Printa os resultados as propriedades
                        volu = tabela_vapor(x,3);
                        ener = tabela_vapor(x,4);
                        enta = tabela_vapor(x,5);
                        entr = tabela_vapor(x,6);               

                    else
                        errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                        return;
                    end          

                else %Estado de Satura��o
                    % Procurador na tabela
                    while tabela_satT(x,y) < temp
                        x = x + 1;
                        y  = 1;
                    end

                    % Interpola��o para caso n�o ache os valores
                    if tabela_satT(x,1) > temp
                        tabela_satT = InterpolacaoCompleta(tabela_satT,temp,x);
                    end

                    % Avalia a press�o achada
                    if pres < tabela_satT(x,2) %Caso vapor super aquecido
                        % Avalia os limites de press�o na tabela
                        if tabela_vapor(1,1) > pres
                            errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                            return;
                        end  

                        % Variaveis para procura
                        x = 1;
                        y = 1;

                        % Procurador na tabela
                        while tabela_vapor(x,y) < pres
                            x = x + 1;
                            y  = 1;
                        end                
                            
                        % Defini o estado
                        esta = 'Vapor Super Aquecido'; %Estado
                        
                        % Avalia a press�o
                        if pres == tabela_vapor(x,1)
                            % Variavel de pesquisa
                            p = x;

                            % Confere o limite da faixa de press�o igual
                            while tabela_vapor(p,1) == pres
                                p = p + 1;

                                % Evitar ultrapassar o limite da tabela
                                if p > tamanho_vapor(1)
                                   break; 
                                end 
                            end  

                            % Avalia a temperatura na ultima coordenada de press�o igual
                            if tabela_vapor(p-1,2) < temp
                                errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                                return;
                            end    

                            % Nova coluna para procura
                            y = 2;

                            % Procura temperatura
                            while tabela_vapor(x,y) < temp
                                x = x + 1;
                                y = 2;
                            end

                            % Interpola��o para caso n�o ache os valores
                            if tabela_vapor(x,y) > temp
                                tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,y);
                            end
                            
                            % Define o t�tulo
                            if tabela_vapor(x-1,1) ~= tabela_vapor(x,1)                         
                                titu = 1;                     
                            else
                                titu = '--';                     
                            end
                            
                            % Ajuste a coluna de press�o
                            tabela_vapor(x,1) = pres;
                            tabela_vapor(x,2) = temp;

                            % Propriedades
                            volu = tabela_vapor(x,3);
                            ener = tabela_vapor(x,4);
                            enta = tabela_vapor(x,5);
                            entr = tabela_vapor(x,6);

                        elseif pres < tabela_vapor(x,1)
                            % variaveis necess�rias
                            I = 1;
                            i = x;

                            % Confere o limite da faixa de press�o igual
                            while tabela_vapor(i,1) == tabela_vapor(x,1)
                                for k = 1 : 1 : tamanho_vapor(2)
                                    tabela_interpolMax(I,k) = tabela_vapor(i,k);
                                end
                                I = I + 1;
                                i = i + 1;

                                % Eveitar ultrapassar o limite da tabela
                                if i > tamanho_vapor(1)
                                   break; 
                                end 
                            end  

                            % Zera os contadores para pr�xima matriz
                            i = x-1;
                            I = 1;

                            % Delimita os valores iniciais e finais das temperaturas para interpolar para press�o menor 
                            while tabela_vapor(i,1) == tabela_vapor(x-1,1)
                                for k = 1 : 1 : tamanho_vapor(2)
                                    tabela_interpolMin(I,k) = tabela_vapor(i,k);
                                end
                                I = I + 1;
                                i = i - 1;

                                % Eveitar ultrapassar o limite da tabela
                                if i <= 0
                                   break; 
                                end 
                            end

                            % Desinverte matriz
                            tabela_interpolMin = InverteMatriz(tabela_interpolMin);

                            % Interpola entre uma tabela e outra
                            tabela_vapor = InterpolacaoEntreTabelaCompletaVapor(tabela_vapor,tabela_interpolMax,tabela_interpolMin,pres,x);                  

                            % Define a coluna para pesquisa
                            y = 2;

                            % Procura pelo valor de temperatura
                            while tabela_vapor(x,y) < temp
                                x = x + 1;
                                y = 2;
                            end

                            % Interpola��o para caso n�o ache os valores
                            if tabela_vapor(x,y) > temp
                                tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,y);
                            end

                            if (tabela_vapor(x-1,1) ~= tabela_vapor(x,1)) && x > 1                     
                                titu = 1;                     
                            else
                                titu = '--';                     
                            end
                            
                            % Ajuste a coluna de press�o
                            tabela_vapor(x,1) = pres;
                            tabela_vapor(x,2) = temp;

                            % Printa os resultados as propriedades
                            volu = tabela_vapor(x,3);
                            ener = tabela_vapor(x,4);
                            enta = tabela_vapor(x,5);
                            entr = tabela_vapor(x,6);               

                        else
                            errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                            return;
                        end                           

                    elseif pres > tabela_satT(x,2) %Caso l�quido comprimido
                        esta = 'L�quido Comprimido'; %Estado
                        titu = '--';
                        
                        % Tamanho da tabela de l�quido
                        tamanho_liq = size(tabela_liqComp);
                        
                        % Avalia os limites de press�o na tabela
                        if tabela_liqComp(1,1) > pres
                            errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                            return;
                        end  

                        % Variaveis para procura
                        x = 1;
                        y = 1;

                        % Procurador na tabela
                        while tabela_liqComp(x,y) < pres
                            x = x + 1;
                            y  = 1;
                        end                
                                                   
                        % Avalia a press�o
                        if pres == tabela_liqComp(x,1)
                            % Variavel de pesquisa
                            p = x;

                            % Confere o limite da faixa de press�o igual
                            while tabela_liqComp(p,1) == pres
                                p = p + 1;

                                % Evitar ultrapassar o limite da tabela
                                if p > tamanho_liq(1)
                                   break; 
                                end 
                            end  

                            % Avalia a temperatura na ultima coordenada de press�o igual
                            if tabela_liqComp(p-1,2) < temp
                                errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                                return;
                            end    

                            % Nova coluna para procura
                            y = 2;

                            % Procura temperatura
                            while tabela_liqComp(x,y) < temp
                                x = x + 1;
                                y = 2;
                            end

                            % Interpola��o para caso n�o ache os valores
                            if tabela_liqComp(x,y) > temp
                                tabela_liqComp = InterpolacaoCompletaVapor(tabela_liqComp,temp,x,y);
                            end
                            
                            % Define o t�tulo
                            if tabela_liqComp(x-1,1) ~= tabela_liqComp(x,1)                         
                                titu = 1;                     
                            else
                                titu = '--';                     
                            end
                            
                            % Ajuste a coluna de press�o
                            tabela_liqComp(x,1) = pres;
                            tabela_liqComp(x,2) = temp;

                            % Propriedades
                            volu = tabela_liqComp(x,3);
                            ener = tabela_liqComp(x,4);
                            enta = tabela_liqComp(x,5);
                            entr = tabela_liqComp(x,6);

                        elseif pres < tabela_liqComp(x,1)
                            % variaveis necess�rias
                            I = 1;
                            i = x;

                            % Confere o limite da faixa de press�o igual
                            while tabela_liqComp(i,1) == tabela_liqComp(x,1)
                                for k = 1 : 1 : tamanho_liq(2)
                                    tabela_interpolMax(I,k) = tabela_liqComp(i,k);
                                end
                                I = I + 1;
                                i = i + 1;

                                % Eveitar ultrapassar o limite da tabela
                                if i > tamanho_liq(1)
                                   break; 
                                end 
                            end  

                            % Zera os contadores para pr�xima matriz
                            i = x-1;
                            I = 1;

                            % Delimita os valores iniciais e finais das temperaturas para interpolar para press�o menor 
                            while tabela_liqComp(i,1) == tabela_liqComp(x-1,1)
                                for k = 1 : 1 : tamanho_liq(2)
                                    tabela_interpolMin(I,k) = tabela_liqComp(i,k);
                                end
                                I = I + 1;
                                i = i - 1;

                                % Eveitar ultrapassar o limite da tabela
                                if i <= 0
                                   break; 
                                end 
                            end

                            % Desinverte matriz
                            tabela_interpolMin = InverteMatriz(tabela_interpolMin);

                            % Interpola entre uma tabela e outra
                            tabela_liqComp = InterpolacaoEntreTabelaCompletaVapor(tabela_liqComp,tabela_interpolMax,tabela_interpolMin,pres,x);                  

                            % Define a coluna para pesquisa
                            y = 2;

                            % Procura pelo valor de temperatura
                            while tabela_liqComp(x,y) < temp
                                x = x + 1;
                                y = 2;
                            end

                            % Interpola��o para caso n�o ache os valores
                            if tabela_liqComp(x,y) > temp
                                tabela_liqComp = InterpolacaoCompletaVapor(tabela_liqComp,temp,x,y);
                            end
                            
                            % Ajuste a coluna de press�o
                            tabela_liqComp(x,1) = pres;
                            tabela_liqComp(x,2) = temp;

                            % Printa os resultados as propriedades
                            volu = tabela_liqComp(x,3);
                            ener = tabela_liqComp(x,4);
                            enta = tabela_liqComp(x,5);
                            entr = tabela_liqComp(x,6);               

                        else
                            errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                            return;
                        end       

                    else %Caso mistura
                        esta = 'Mistura'; %Estado
                        propri = menu('Escolha uma propriedade:','Titulo','Volume Espec�fico (m�/kg)','Energia Interna (kJ/kg)','Entalpia (kJ/kg)','Entropia (kJ/kg � K)');

                        % Verifica cancelamento
                        if propri == 0
                            return;
                        end
                        
                        % Nova entrada
                        [volu , ener , enta , entr , titu] = NovaPropriedade(tabela_satT,x,y,propri);
                    end
                end

            case 2 %Entrada como Volume Espec�fico
                volu = prop_2;
                % Valida��o dos limites f�sicos das entradas
                if volu <= 0 || temp <= -273.15
                    errordlg('Erro err0205. Entradas fora dos limites f�sicos v�lidos.','ERRO');
                    return;
                end

                % Avalia o estado baseado na temperatura (entre saturado e vapor)
                if temp > tabela_satT(tamanho_sat(1),1) % Estado de Vapor
                    % Confere o limite da tabela
                    if volu > 0.72610 || temp > 1300
                        errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                        return;
                    end

                    % Defini��o do Estado e t�tulo
                    esta = 'Vapor Super Aquecido'; %Estado
                    titu = '--';

                    % Define a coluna para procura
                    y = 3;

                    % Procurador na tabela
                    for x = 1 : 1 : tamanho_vapor(1)
                        if tabela_vapor(x,2) >= temp && tabela_vapor(x,y) <= volu
                           break 
                        end
                    end

                    % Avalia a temperatura achada
                    if temp == tabela_vapor(x,2)
                        % Avalia o valor da energia interna
                        if tabela_vapor(x,y) == volu
                            % Printa os resultados as propriedades
                            pres = tabela_vapor(x,1);
    %                         volu = tabela_vapor(x,3);
                            ener = tabela_vapor(x,4);
                            enta = tabela_vapor(x,5);
                            entr = tabela_vapor(x,6);

                        elseif tabela_vapor(x,y) < volu
                            tabela_vapor = TabelaVaporInterpolada3Propri(tabela_vapor,tamanho_vapor,volu,x,y);       

                            % Define a coluna para pesquisa
                            y = 2;

                            % Procura pelo valor de temperatura
                            while tabela_vapor(x,y) < temp
                                x = x + 1;
                                y = 2;
                            end

                            % Interpola��o para caso n�o ache os valores
                            if tabela_vapor(x,y) > temp
                                tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,y);
                            end

                            % Printa os resultados as propriedades
                            pres = tabela_vapor(x,1);
    %                         volu = tabela_vapor(x,3);
                            ener = tabela_vapor(x,4);
                            enta = tabela_vapor(x,5);
                            entr = tabela_vapor(x,6);   
                        end

                    elseif temp > tabela_vapor(x,2)
                        % Interpola��o para caso n�o ache os valores
                        if tabela_vapor(x,2) > temp
                            tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,2);
                        end

                         % Coluna para printar
                         y = 3;

                        % Avalia o valor da energia interna
                        if tabela_vapor(x,y) == volu
                            % Printa os resultados as propriedades
                            pres = tabela_vapor(x,1);
    %                         volu = tabela_vapor(x,3);
                            ener = tabela_vapor(x,4);
                            enta = tabela_vapor(x,5);
                            entr = tabela_vapor(x,6);

                        elseif tabela_vapor(x,y) < volu
                            % Define a nova tabela de pres para o vapor
                            tabela_vapor = TabelaVaporInterpolada3Propri(tabela_vapor,tamanho_vapor,volu,x,y);                  

                            % Define a coluna para pesquisa
                            y = 2;

                            % Procura pelo valor de temperatura
                            while tabela_vapor(x,y) < temp
                                x = x + 1;
                                y = 2;
                            end

                            % Interpola��o para caso n�o ache os valores
                            if tabela_vapor(x,y) > temp
                                tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,y);
                            end

                            % Printa os resultados as propriedades
                            pres = tabela_vapor(x,1);
    %                         volu = tabela_vapor(x,3);
                            ener = tabela_vapor(x,4);
                            enta = tabela_vapor(x,5);
                            entr = tabela_vapor(x,6);   
                        end                                                                                    
                    else
                        errordlg('Erro err0206. Entradas fora dos limites v�lidos.','ERRO');
                        return;
                    end          

                else %Estado de Satura��o
                    % Define a coluna para procura
                    y = 1;
                    x = 1;

                    % Procurador na tabela
                    while tabela_satT(x,y) < temp
                        x = x + 1;
                        y  = 1;
                    end

                    % Interpola��o para caso n�o ache os valores
                    if tabela_satT(x,1) > temp
                        tabela_satT = InterpolacaoCompleta(tabela_satT,temp,x);
                    end

                    % Avalia a segunda propriedade
                    if volu > tabela_satT(x,4) %Caso vapor super aquecido
                        % Confere o limite da tabela
                        if volu > 0.72610 || temp > 1300
                            errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                            return;
                        end

                        % Procura na nova coluna 
                        y = 3;

                        % Procurador na tabela
                        for x = 1 : 1 : tamanho_vapor(1)
                            if tabela_vapor(x,2) >= temp && tabela_vapor(x,y) <= volu
                               break 
                            end
                        end

                        % Defini o estado e o t�tulo
                        esta = 'Vapor Super Aquecido'; %Estado
                        if tabela_vapor(x-1,1) ~= tabela_vapor(x,1)                         
                            titu = 1;                     
                        else
                            titu = '--';                     
                        end
                        
                        % Avalia a temperatura achada
                        if temp == tabela_vapor(x,2)
                            % Avalia o valor da energia interna
                            if tabela_vapor(x,y) == volu
                                % Printa os resultados as propriedades
                                pres = tabela_vapor(x,1);
    %                             volu = tabela_vapor(x,3);
                                ener = tabela_vapor(x,4);
                                enta = tabela_vapor(x,5);
                                entr = tabela_vapor(x,6);

                            elseif tabela_vapor(x,y) < volu
                                % Define a nova tabela de pres para o vapor
                                tabela_vapor = TabelaVaporInterpolada3Propri(tabela_vapor,tamanho_vapor,volu,x,y);                  

                                % Define a coluna para pesquisa
                                y = 2;

                                % Procura pelo valor de temperatura
                                while tabela_vapor(x,y) < temp
                                    x = x + 1;
                                    y = 2;
                                end

                                % Interpola��o para caso n�o ache os valores
                                if tabela_vapor(x,y) > temp
                                    tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,y);
                                end

                                % Printa os resultados as propriedades
                                pres = tabela_vapor(x,1);
    %                             volu = tabela_vapor(x,3);
                                ener = tabela_vapor(x,4);
                                enta = tabela_vapor(x,5);
                                entr = tabela_vapor(x,6);   
                            end

                        elseif temp > tabela_vapor(x,2)
                            % Interpola��o para caso n�o ache os valores
                            if tabela_vapor(x,2) > temp
                                tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,2);
                            end

                            % Coluna para printar
                            y = 3;

                            % Avalia o valor da energia interna
                            if tabela_vapor(x,y) == volu
                                % Printa os resultados as propriedades
                                pres = tabela_vapor(x,1);
    %                             volu = tabela_vapor(x,3);
                                ener = tabela_vapor(x,4);
                                enta = tabela_vapor(x,5);
                                entr = tabela_vapor(x,6);

                            elseif tabela_vapor(x,y) < volu
                                 % Define a nova tabela de pres para o vapor
                                tabela_vapor = TabelaVaporInterpolada3Propri(tabela_vapor,tamanho_vapor,volu,x,y);                  

                                % Define a coluna para pesquisa
                                y = 2;

                                % Procura pelo valor de temperatura
                                while tabela_vapor(x,y) < temp
                                    x = x + 1;
                                    y = 2;
                                end

                                % Interpola��o para caso n�o ache os valores
                                if tabela_vapor(x,y) > temp
                                    tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,y);
                                end

                                % Printa os resultados as propriedades
                                pres = tabela_vapor(x,1);
    %                             volu = tabela_vapor(x,3);
                                ener = tabela_vapor(x,4);
                                enta = tabela_vapor(x,5);
                                entr = tabela_vapor(x,6);   
                            end  
                        end

                    elseif volu == tabela_satT(x,4) %Caso Vapor saturado
                        % Printa os resultados as propriedades
                        pres = tabela_satT(x,2);
    %                     volu = tabela_satT(x,4);
                        ener = tabela_satT(x,7);
                        enta = tabela_satT(x,10);
                        entr = tabela_satT(x,13);
                        titu = 1;
                        esta = 'Vapor Saturado';

                    elseif volu == tabela_satT(x,3)
                        % Printa os resultados as propriedades
                        pres = tabela_satT(x,2);
    %                     volu = tabela_satT(x,3);
                        ener = tabela_satT(x,5);
                        enta = tabela_satT(x,8);
                        entr = tabela_satT(x,11);
                        titu = 0;
                        esta = 'L�quido Comprimido';        
                        
                    elseif volu < tabela_satT(x,3) %Caso l�quido comprimido
                        esta = 'L�quido Comprimido'; %Estado
                        titu = '--';

                        % Confere o limite da tabela
                        if volu > 0.0018729 || temp > 380
                            errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                            return;
                        end

                        % Procura na nova coluna 
                        y = 3;

                        % Procurador na tabela
                        for x = 1 : 1 : tamanho_liq(1)
                            if tabela_liqComp(x,2) >= temp && tabela_liqComp(x,y) <= volu
                               break 
                            end
                        end
                        
                        % Avalia a temperatura achada
                        if temp == tabela_liqComp(x,2)
                            % Avalia o valor da energia interna
                            if tabela_liqComp(x,y) == volu
                                % Printa os resultados as propriedades
                                pres = tabela_liqComp(x,1);
    %                             volu = tabela_liqComp(x,3);
                                ener = tabela_liqComp(x,4);
                                enta = tabela_liqComp(x,5);
                                entr = tabela_liqComp(x,6);

                            elseif tabela_liqComp(x,y) < volu
                                % Define a nova tabela de pres para o vapor
                                tabela_liqComp = TabelaVaporInterpolada3Propri(tabela_liqComp,tamanho_liq,volu,x,y);                  

                                % Define a coluna para pesquisa
                                y = 2;

                                % Procura pelo valor de temperatura
                                while tabela_liqComp(x,y) < temp
                                    x = x + 1;
                                    y = 2;
                                end

                                % Interpola��o para caso n�o ache os valores
                                if tabela_liqComp(x,y) > temp
                                    tabela_liqComp = InterpolacaoCompletaVapor(tabela_liqComp,temp,x,y);
                                end

                                % Printa os resultados as propriedades
                                pres = tabela_liqComp(x,1);
    %                             volu = tabela_liqComp(x,3);
                                ener = tabela_liqComp(x,4);
                                enta = tabela_liqComp(x,5);
                                entr = tabela_liqComp(x,6);   
                            end

                        elseif temp > tabela_liqComp(x,2)
                            % Interpola��o para caso n�o ache os valores
                            if tabela_liqComp(x,2) > temp
                                tabela_liqComp = InterpolacaoCompletaVapor(tabela_liqComp,temp,x,2);
                            end

                            % Coluna para printar
                            y = 3;

                            % Avalia o valor da energia interna
                            if tabela_liqComp(x,y) == volu
                                % Printa os resultados as propriedades
                                pres = tabela_liqComp(x,1);
    %                             volu = tabela_liqComp(x,3);
                                ener = tabela_liqComp(x,4);
                                enta = tabela_liqComp(x,5);
                                entr = tabela_liqComp(x,6);

                            elseif tabela_liqComp(x,y) < volu
                                 % Define a nova tabela de pres para o vapor
                                tabela_liqComp = TabelaVaporInterpolada3Propri(tabela_liqComp,tamanho_liq,volu,x,y);                  

                                % Define a coluna para pesquisa
                                y = 2;

                                % Procura pelo valor de temperatura
                                while tabela_liqComp(x,y) < temp
                                    x = x + 1;
                                    y = 2;
                                end

                                % Interpola��o para caso n�o ache os valores
                                if tabela_liqComp(x,y) > temp
                                    tabela_liqComp = InterpolacaoCompletaVapor(tabela_liqComp,temp,x,y);
                                end

                                % Printa os resultados as propriedades
                                pres = tabela_liqComp(x,1);
    %                             volu = tabela_liqComp(x,3);
                                ener = tabela_liqComp(x,4);
                                enta = tabela_liqComp(x,5);
                                entr = tabela_liqComp(x,6);   
                            end  
                        end

                    else %Caso mistura
                        esta = 'Mistura'; %Estado

                        % Calculo do t�tulo e das propriedades com t�tulo
                        titu = (volu-tabela_satT(x,3)) / (tabela_satT(x,4) - tabela_satT(x,3));
                        pres = tabela_satT(x,2);
    %                     volu = CalculoComTitulo(titu,tabela_satT(x,3),tabela_satT(x,4));
                        ener = CalculoComTitulo(titu,tabela_satT(x,5),tabela_satT(x,7));
                        enta = CalculoComTitulo(titu,tabela_satT(x,8),tabela_satT(x,10));
                        entr = CalculoComTitulo(titu,tabela_satT(x,11),tabela_satT(x,13));

                    end
                end           

            case 3 %Entrada como Energia Interna
                ener = prop_2;
                % Valida��o dos limites f�sicos das entradas
                if ener <= 0 || temp <= -273.15
                    errordlg('Erro err0205. Entradas fora dos limites f�sicos v�lidos.','ERRO');
                    return;
                end

                % Avalia o estado baseado na temperatura (entre saturado e vapor)
                if temp > tabela_satT(tamanho_sat(1),1) % Estado de Vapor
                    % Confere o limite da tabela
                    if ener > 4685.8 || temp > 1300
                        errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                        return;
                    end

                    % Defini��o do Estado e t�tulo
                    esta = 'Vapor Super Aquecido'; %Estado
                    titu = '--';

                    % Define a coluna para procura
                    y = 4;

                    % Procurador na tabela
                    for x = 1 : 1 : tamanho_vapor(1)
                        if tabela_vapor(x,2) >= temp && tabela_vapor(x,y) <= ener
                           break 
                        end
                    end

                    % Avalia a temperatura achada
                    if temp == tabela_vapor(x,2)
                        % Avalia o valor da energia interna
                        if tabela_vapor(x,y) == ener
                            % Printa os resultados as propriedades
                            pres = tabela_vapor(x,1);
                            volu = tabela_vapor(x,3);
    %                         ener = tabela_vapor(x,4);
                            enta = tabela_vapor(x,5);
                            entr = tabela_vapor(x,6);

                        elseif tabela_vapor(x,y) < ener
                            tabela_vapor = TabelaVaporInterpolada3Propri(tabela_vapor,tamanho_vapor,ener,x,y);       

                            % Define a coluna para pesquisa
                            y = 2;

                            % Procura pelo valor de temperatura
                            while tabela_vapor(x,y) < temp
                                x = x + 1;
                                y = 2;
                            end

                            % Interpola��o para caso n�o ache os valores
                            if tabela_vapor(x,y) > temp
                                tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,y);
                            end

                            % Printa os resultados as propriedades
                            pres = tabela_vapor(x,1);
                            volu = tabela_vapor(x,3);
    %                         ener = tabela_vapor(x,4);
                            enta = tabela_vapor(x,5);
                            entr = tabela_vapor(x,6);   
                        end

                    elseif temp > tabela_vapor(x,2)
                        % Interpola��o para caso n�o ache os valores
                        if tabela_vapor(x,2) > temp
                            tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,2);
                        end

                         % Coluna para printar
                         y = 4;

                        % Avalia o valor da energia interna
                        if tabela_vapor(x,y) == ener
                            % Printa os resultados as propriedades
                            pres = tabela_vapor(x,1);
                            volu = tabela_vapor(x,3);
    %                         ener = tabela_vapor(x,4);
                            enta = tabela_vapor(x,5);
                            entr = tabela_vapor(x,6);

                        elseif tabela_vapor(x,y) < ener
                            % Define a nova tabela de pres para o vapor
                            tabela_vapor = TabelaVaporInterpolada3Propri(tabela_vapor,tamanho_vapor,ener,x,y);                  

                            % Define a coluna para pesquisa
                            y = 2;

                            % Procura pelo valor de temperatura
                            while tabela_vapor(x,y) < temp
                                x = x + 1;
                                y = 2;
                            end

                            % Interpola��o para caso n�o ache os valores
                            if tabela_vapor(x,y) > temp
                                tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,y);
                            end

                            % Printa os resultados as propriedades
                            pres = tabela_vapor(x,1);
                            volu = tabela_vapor(x,3);
    %                         ener = tabela_vapor(x,4);
                            enta = tabela_vapor(x,5);
                            entr = tabela_vapor(x,6);   
                        end                                                                                    
                    else
                        errordlg('Erro err0206. Entradas fora dos limites v�lidos.','ERRO');
                        return;
                    end          

                else %Estado de Satura��o
                    % Define a coluna para procura
                    y = 1;
                    x = 1;

                    % Procurador na tabela
                    while tabela_satT(x,y) < temp
                        x = x + 1;
                        y  = 1;
                    end

                    % Interpola��o para caso n�o ache os valores
                    if tabela_satT(x,1) > temp
                        tabela_satT = InterpolacaoCompleta(tabela_satT,temp,x);
                    end

                    % Avalia a segunda propriedade
                    if ener > tabela_satT(x,7) %Caso vapor super aquecido
                        % Confere o limite da tabela
                        if ener > 4685.8 || temp > 1300
                            errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                            return;
                        end

                        % Procura na nova coluna 
                        y = 4;

                        % Procurador na tabela
                        for x = 1 : 1 : tamanho_vapor(1)
                            if tabela_vapor(x,2) >= temp && tabela_vapor(x,y) <= ener
                               break 
                            end
                        end

                        % Defini o estado e o t�tulo
                        esta = 'Vapor Super Aquecido'; %Estado
                        if tabela_vapor(x-1,1) ~= tabela_vapor(x,1)                         
                            titu = 1;                     
                        else
                            titu = '--';                     
                        end
                        
                        % Avalia a temperatura achada
                        if temp == tabela_vapor(x,2)
                            % Avalia o valor da energia interna
                            if tabela_vapor(x,y) == ener
                                % Printa os resultados as propriedades
                                pres = tabela_vapor(x,1);
                                volu = tabela_vapor(x,3);
        %                         ener = tabela_vapor(x,4);
                                enta = tabela_vapor(x,5);
                                entr = tabela_vapor(x,6);

                            elseif tabela_vapor(x,y) < ener
                                % Define a nova tabela de pres para o vapor
                                tabela_vapor = TabelaVaporInterpolada3Propri(tabela_vapor,tamanho_vapor,ener,x,y);                  

                                % Define a coluna para pesquisa
                                y = 2;

                                % Procura pelo valor de temperatura
                                while tabela_vapor(x,y) < temp
                                    x = x + 1;
                                    y = 2;
                                end

                                % Interpola��o para caso n�o ache os valores
                                if tabela_vapor(x,y) > temp
                                    tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,y);
                                end

                                % Printa os resultados as propriedades
                                pres = tabela_vapor(x,1);
                                volu = tabela_vapor(x,3);
        %                         ener = tabela_vapor(x,4);
                                enta = tabela_vapor(x,5);
                                entr = tabela_vapor(x,6);   
                            end

                        elseif temp > tabela_vapor(x,2)
                            % Interpola��o para caso n�o ache os valores
                            if tabela_vapor(x,2) > temp
                                tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,2);
                            end

                            % Coluna para printar
                            y = 4;

                            % Avalia o valor da energia interna
                            if tabela_vapor(x,y) == ener
                                % Printa os resultados as propriedades
                                pres = tabela_vapor(x,1);
                                volu = tabela_vapor(x,3);
        %                         ener = tabela_vapor(x,4);
                                enta = tabela_vapor(x,5);
                                entr = tabela_vapor(x,6);

                            elseif tabela_vapor(x,y) < ener
                                 % Define a nova tabela de pres para o vapor
                                tabela_vapor = TabelaVaporInterpolada3Propri(tabela_vapor,tamanho_vapor,ener,x,y);                  

                                % Define a coluna para pesquisa
                                y = 2;

                                % Procura pelo valor de temperatura
                                while tabela_vapor(x,y) < temp
                                    x = x + 1;
                                    y = 2;
                                end

                                % Interpola��o para caso n�o ache os valores
                                if tabela_vapor(x,y) > temp
                                    tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,y);
                                end

                                % Printa os resultados as propriedades
                                pres = tabela_vapor(x,1);
                                volu = tabela_vapor(x,3);
        %                         ener = tabela_vapor(x,4);
                                enta = tabela_vapor(x,5);
                                entr = tabela_vapor(x,6);   
                            end  
                        end

                    elseif ener == tabela_satT(x,7) %Caso Vapor saturado
                        % Printa os resultados as propriedades
                        pres = tabela_satT(x,2);
                        volu = tabela_satT(x,4);
    %                     ener = tabela_satT(x,7);
                        enta = tabela_satT(x,10);
                        entr = tabela_satT(x,13);
                        titu = 1;
                        esta = 'Vapor Saturado';

                    elseif ener == tabela_satT(x,5)
                        % Printa os resultados as propriedades
                        pres = tabela_satT(x,2);
                        volu = tabela_satT(x,3);
%                         ener = tabela_satT(x,5);
                        enta = tabela_satT(x,8);
                        entr = tabela_satT(x,11);
                        titu = 0;
                        esta = 'L�quido Comprimido';   
                        
                    elseif ener < tabela_satT(x,5) %Caso l�quido comprimido
                        esta = 'L�quido Comprimido'; %Estado
                        titu = '--';

                        % Confere o limite da tabela
                        if ener > 1782.0 || temp > 380
                            errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                            return;
                        end

                        % Procura na nova coluna 
                        y = 4;

                        % Procurador na tabela
                        for x = 1 : 1 : tamanho_liq(1)
                            if tabela_liqComp(x,2) >= temp && tabela_liqComp(x,y) <= ener
                               break 
                            end
                        end
                        
                        % Avalia a temperatura achada
                        if temp == tabela_liqComp(x,2)
                            % Avalia o valor da energia interna
                            if tabela_liqComp(x,y) == ener
                                % Printa os resultados as propriedades
                                pres = tabela_liqComp(x,1);
                                volu = tabela_liqComp(x,3);
        %                         ener = tabela_liqComp(x,4);
                                enta = tabela_liqComp(x,5);
                                entr = tabela_liqComp(x,6);

                            elseif tabela_liqComp(x,y) < ener
                                % Define a nova tabela de pres para o vapor
                                tabela_liqComp = TabelaVaporInterpolada3Propri(tabela_liqComp,tamanho_liq,ener,x,y);                  

                                % Define a coluna para pesquisa
                                y = 2;

                                % Procura pelo valor de temperatura
                                while tabela_liqComp(x,y) < temp
                                    x = x + 1;
                                    y = 2;
                                end

                                % Interpola��o para caso n�o ache os valores
                                if tabela_liqComp(x,y) > temp
                                    tabela_liqComp = InterpolacaoCompletaVapor(tabela_liqComp,temp,x,y);
                                end

                                % Printa os resultados as propriedades
                                pres = tabela_liqComp(x,1);
                                volu = tabela_liqComp(x,3);
        %                         ener = tabela_liqComp(x,4);
                                enta = tabela_liqComp(x,5);
                                entr = tabela_liqComp(x,6);   
                            end

                        elseif temp > tabela_liqComp(x,2)
                            % Interpola��o para caso n�o ache os valores
                            if tabela_liqComp(x,2) > temp
                                tabela_liqComp = InterpolacaoCompletaVapor(tabela_liqComp,temp,x,2);
                            end

                            % Coluna para printar
                            y = 4;

                            % Avalia o valor da energia interna
                            if tabela_liqComp(x,y) == ener
                                % Printa os resultados as propriedades
                                pres = tabela_liqComp(x,1);
                                volu = tabela_liqComp(x,3);
        %                         ener = tabela_liqComp(x,4);
                                enta = tabela_liqComp(x,5);
                                entr = tabela_liqComp(x,6);

                            elseif tabela_liqComp(x,y) < ener
                                 % Define a nova tabela de pres para o vapor
                                tabela_liqComp = TabelaVaporInterpolada3Propri(tabela_liqComp,tamanho_liq,ener,x,y);                  

                                % Define a coluna para pesquisa
                                y = 2;

                                % Procura pelo valor de temperatura
                                while tabela_liqComp(x,y) < temp
                                    x = x + 1;
                                    y = 2;
                                end

                                % Interpola��o para caso n�o ache os valores
                                if tabela_liqComp(x,y) > temp
                                    tabela_liqComp = InterpolacaoCompletaVapor(tabela_liqComp,temp,x,y);
                                end

                                % Printa os resultados as propriedades
                                pres = tabela_liqComp(x,1);
                                volu = tabela_liqComp(x,3);
        %                         ener = tabela_liqComp(x,4);
                                enta = tabela_liqComp(x,5);
                                entr = tabela_liqComp(x,6);   
                            end  
                        end                   

                    else %Caso mistura
                        esta = 'Mistura'; %Estado

                        % Calculo do t�tulo e das propriedades com t�tulo
                        titu = (ener-tabela_satT(x,5)) / tabela_satT(x,6);
                        pres = tabela_satT(x,2);
                        volu = CalculoComTitulo(titu,tabela_satT(x,3),tabela_satT(x,4));
    %                     ener = CalculoComTitulo(titu,tabela_satT(x,5),tabela_satT(x,7));
                        enta = CalculoComTitulo(titu,tabela_satT(x,8),tabela_satT(x,10));
                        entr = CalculoComTitulo(titu,tabela_satT(x,11),tabela_satT(x,13));

                    end
                end

            case 4 %Entrada como Entalpia
                % Propriedade
                enta = prop_2;

                % Valida��o dos limites f�sicos das entradas
                if enta <= 0 || temp <= -273.15
                    errordlg('Erro err0205. Entradas fora dos limites f�sicos v�lidos.','ERRO');
                    return;
                end        

                % Avalia o estado baseado na temperatura (entre saturado e vapor)
                if temp > tabela_satT(tamanho_sat(1),1) % Estado de Vapor

                    % Define a coluna de pesquisa
                    y = 5;

                    % Confere o limite da tabela
                    if enta > 5411.9 || temp > 1300
                        errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                        return;
                    end

                    % Defini��o do Estado e t�tulo
                    esta = 'Vapor Super Aquecido'; %Estado
                    titu = '--';

                    % Procurador na tabela
                    for x = 1 : 1 : tamanho_vapor(1)
                        if tabela_vapor(x,2) >= temp && tabela_vapor(x,y) <= enta
                           break 
                        end
                    end

                    % Avalia a temperatura achada
                    if temp == tabela_vapor(x,2)
                        % Avalia o valor da energia interna
                        if tabela_vapor(x,y) == enta
                            % Printa os resultados as propriedades
                            pres = tabela_vapor(x,1);
                            volu = tabela_vapor(x,3);
                            ener = tabela_vapor(x,4);
    %                         enta = tabela_vapor(x,5);
                            entr = tabela_vapor(x,6);

                        elseif tabela_vapor(x,y) < enta
                            % Define a nova tabela de pres para o vapor
                            tabela_vapor = TabelaVaporInterpolada3Propri(tabela_vapor,tamanho_vapor,enta,x,y);                  

                            % Define a coluna para pesquisa
                            y = 2;

                            % Procura pelo valor de temperatura
                            while tabela_vapor(x,y) < temp
                                x = x + 1;
                                y = 2;
                            end

                            % Interpola��o para caso n�o ache os valores
                            if tabela_vapor(x,y) > temp
                                tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,y);
                            end

                            % Printa os resultados as propriedades
                            pres = tabela_vapor(x,1);
                            volu = tabela_vapor(x,3);
                            ener = tabela_vapor(x,4);
    %                         enta = tabela_vapor(x,5);
                            entr = tabela_vapor(x,6);   
                        end

                    elseif temp > tabela_vapor(x,2)
                        % Interpola��o para caso n�o ache os valores
                        if tabela_vapor(x,2) > temp
                            tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,2);
                        end

                         % Coluna para printar
                         y = 5;

                        % Avalia o valor da energia interna
                        if tabela_vapor(x,y) == enta
                            % Printa os resultados as propriedades
                            pres = tabela_vapor(x,1);
                            volu = tabela_vapor(x,3);
                            ener = tabela_vapor(x,4);
    %                         enta = tabela_vapor(x,5);
                            entr = tabela_vapor(x,6);

                        elseif tabela_vapor(x,y) < enta
                            % Define a nova tabela de pres para o vapor
                            tabela_vapor = TabelaVaporInterpolada3Propri(tabela_vapor,tamanho_vapor,enta,x,y);                  

                            % Define a coluna para pesquisa
                            y = 2;

                            % Procura pelo valor de temperatura
                            while tabela_vapor(x,y) < temp
                                x = x + 1;
                                y = 2;
                            end

                            % Interpola��o para caso n�o ache os valores
                            if tabela_vapor(x,y) > temp
                                tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,y);
                            end

                            % Printa os resultados as propriedades
                            pres = tabela_vapor(x,1);
                            volu = tabela_vapor(x,3);
                            ener = tabela_vapor(x,4);
    %                         enta = tabela_vapor(x,5);
                            entr = tabela_vapor(x,6);   
                        end                                                                                    
                    else
                        errordlg('Erro err0206. Entradas fora dos limites v�lidos.','ERRO');
                        return;
                    end                 

                else %Estado de Satura��o
                    % Coordenadas para pesquisa
                    y = 1;
                    x = 1;

                    % Procurador na tabela
                    while tabela_satT(x,y) < temp
                        x = x + 1;
                        y = 1;
                    end

                    % Interpola��o para caso n�o ache os valores
                    if tabela_satT(x,1) > temp
                        tabela_satT = InterpolacaoCompleta(tabela_satT,temp,x);
                    end

                    % Avalia a segunda propriedade
                    if enta > tabela_satT(x,10) %Caso vapor super aquecido
                        % Confere o limite da tabela
                        if enta > 5411.9 || temp > 1300
                            errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                            return;
                        end

                        % Procura na nova coluna 
                        y = 5;

                        % Procurador na tabela
                        for x = 1 : 1 : tamanho_vapor(1)
                            if tabela_vapor(x,2) >= temp && tabela_vapor(x,y) <= enta
                               break 
                            end
                        end

                        % Defini o estado e o t�tulo
                        esta = 'Vapor Super Aquecido'; %Estado
                        if tabela_vapor(x-1,1) ~= tabela_vapor(x,1)                         
                            titu = 1;                     
                        else
                            titu = '--';                     
                        end
                        
                        % Avalia a temperatura achada
                        if temp == tabela_vapor(x,2)
                            % Avalia o valor da energia interna
                            if tabela_vapor(x,y) == enta
                                % Printa os resultados as propriedades
                                pres = tabela_vapor(x,1);
                                volu = tabela_vapor(x,3);
                                ener = tabela_vapor(x,4);
    %                             enta = tabela_vapor(x,5);
                                entr = tabela_vapor(x,6);

                            elseif tabela_vapor(x,y) < enta
                                % Define a nova tabela de pres para o vapor
                                tabela_vapor = TabelaVaporInterpolada3Propri(tabela_vapor,tamanho_vapor,enta,x,y);                  

                                % Define a coluna para pesquisa
                                y = 2;

                                % Procura pelo valor de temperatura
                                while tabela_vapor(x,y) < temp
                                    x = x + 1;
                                    y = 2;
                                end

                                % Interpola��o para caso n�o ache os valores
                                if tabela_vapor(x,y) > temp
                                    tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,y);
                                end

                                % Printa os resultados as propriedades
                                pres = tabela_vapor(x,1);
                                volu = tabela_vapor(x,3);
                                ener = tabela_vapor(x,4);
    %                             enta = tabela_vapor(x,5);
                                entr = tabela_vapor(x,6);   
                            end

                        elseif temp > tabela_vapor(x,2)
                            % Interpola��o para caso n�o ache os valores
                            if tabela_vapor(x,2) > temp
                                tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,2);
                            end

                            % Define a coluna para pesquisa
                            y = 5;

                            % Avalia o valor da energia interna
                            if tabela_vapor(x,y) == enta
                                % Printa os resultados as propriedades
                                pres = tabela_vapor(x,1);
                                volu = tabela_vapor(x,3);
                                ener = tabela_vapor(x,4);
    %                             enta = tabela_vapor(x,5);
                                entr = tabela_vapor(x,6);

                            elseif tabela_vapor(x,y) < enta
                                 % Define a nova tabela de pres para o vapor
                                tabela_vapor = TabelaVaporInterpolada3Propri(tabela_vapor,tamanho_vapor,enta,x,y);                  

                                % Define a coluna para pesquisa
                                y = 2;

                                % Procura pelo valor de temperatura
                                while tabela_vapor(x,y) < temp
                                    x = x + 1;
                                    y = 2;
                                end

                                % Interpola��o para caso n�o ache os valores
                                if tabela_vapor(x,y) > temp
                                    tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,y);
                                end

                                % Printa os resultados as propriedades
                                pres = tabela_vapor(x,1);
                                volu = tabela_vapor(x,3);
                                ener = tabela_vapor(x,4);
    %                             enta = tabela_vapor(x,5);
                                entr = tabela_vapor(x,6);   
                            end  
                        end                         

                    elseif enta == tabela_satT(x,10) %Caso Vapor saturado
                        % Printa os resultados as propriedades
                        pres = tabela_satT(x,2);
                        volu = tabela_satT(x,4);
                        ener = tabela_satT(x,7);
    %                     enta = tabela_satT(x,10);
                        entr = tabela_satT(x,13);
                        titu = 1;
                        esta = 'Vapor Saturado';

                    elseif enta == tabela_satT(x,8)
                        % Printa os resultados as propriedades
                        pres = tabela_satT(x,2);
                        volu = tabela_satT(x,3);
                        ener = tabela_satT(x,5);
%                         enta = tabela_satT(x,8);
                        entr = tabela_satT(x,11);
                        titu = 0;
                        esta = 'L�quido Comprimido';
                        
                    elseif enta < tabela_satT(x,8) %Caso l�quido comprimido
                        esta = 'L�quido Comprimido'; %Estado
                        titu = '--';     

                        % Confere o limite da tabela
                        if enta > 1838.2 || temp > 380
                            errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                            return;
                        end

                        % Procura na nova coluna 
                        y = 5;

                        % Procurador na tabela
                        for x = 1 : 1 : tamanho_liq(1)
                            if tabela_liqComp(x,2) >= temp && tabela_liqComp(x,y) <= enta
                               break 
                            end
                        end
                        
                        % Avalia a temperatura achada
                        if temp == tabela_liqComp(x,2)
                            % Avalia o valor da energia interna
                            if tabela_liqComp(x,y) == enta
                                % Printa os resultados as propriedades
                                pres = tabela_liqComp(x,1);
                                volu = tabela_liqComp(x,3);
                                ener = tabela_liqComp(x,4);
    %                             enta = tabela_liqComp(x,5);
                                entr = tabela_liqComp(x,6);

                            elseif tabela_liqComp(x,y) < enta
                                % Define a nova tabela de pres para o vapor
                                tabela_liqComp = TabelaVaporInterpolada3Propri(tabela_liqComp,tamanho_liq,enta,x,y);                  

                                % Define a coluna para pesquisa
                                y = 2;

                                % Procura pelo valor de temperatura
                                while tabela_liqComp(x,y) < temp
                                    x = x + 1;
                                    y = 2;
                                end

                                % Interpola��o para caso n�o ache os valores
                                if tabela_liqComp(x,y) > temp
                                    tabela_liqComp = InterpolacaoCompletaVapor(tabela_liqComp,temp,x,y);
                                end

                                % Printa os resultados as propriedades
                                pres = tabela_liqComp(x,1);
                                volu = tabela_liqComp(x,3);
                                ener = tabela_liqComp(x,4);
    %                             enta = tabela_liqComp(x,5);
                                entr = tabela_liqComp(x,6);   
                            end

                        elseif temp > tabela_liqComp(x,2)
                            % Interpola��o para caso n�o ache os valores
                            if tabela_liqComp(x,2) > temp
                                tabela_liqComp = InterpolacaoCompletaVapor(tabela_liqComp,temp,x,2);
                            end

                            % Define a coluna para pesquisa
                            y = 5;

                            % Avalia o valor da energia interna
                            if tabela_liqComp(x,y) == enta
                                % Printa os resultados as propriedades
                                pres = tabela_liqComp(x,1);
                                volu = tabela_liqComp(x,3);
                                ener = tabela_liqComp(x,4);
    %                             enta = tabela_liqComp(x,5);
                                entr = tabela_liqComp(x,6);

                            elseif tabela_liqComp(x,y) < enta
                                 % Define a nova tabela de pres para o vapor
                                tabela_liqComp = TabelaVaporInterpolada3Propri(tabela_liqComp,tamanho_liq,enta,x,y);                  

                                % Define a coluna para pesquisa
                                y = 2;

                                % Procura pelo valor de temperatura
                                while tabela_liqComp(x,y) < temp
                                    x = x + 1;
                                    y = 2;
                                end

                                % Interpola��o para caso n�o ache os valores
                                if tabela_liqComp(x,y) > temp
                                    tabela_liqComp = InterpolacaoCompletaVapor(tabela_liqComp,temp,x,y);
                                end

                                % Printa os resultados as propriedades
                                pres = tabela_liqComp(x,1);
                                volu = tabela_liqComp(x,3);
                                ener = tabela_liqComp(x,4);
    %                             enta = tabela_liqComp(x,5);
                                entr = tabela_liqComp(x,6);   
                            end  
                        end          
                        
                    else %Caso mistura
                        esta = 'Mistura'; %Estado

                        % Calculo do t�tulo e das propriedades com t�tulo
                        titu = (enta-tabela_satT(x,8)) / tabela_satT(x,9);
                        pres = tabela_satT(x,2);
                        volu = CalculoComTitulo(titu,tabela_satT(x,3),tabela_satT(x,4));
                        ener = CalculoComTitulo(titu,tabela_satT(x,5),tabela_satT(x,7));
    %                     enta = CalculoComTitulo(titu,tabela_satT(x,8),tabela_satT(x,10));
                        entr = CalculoComTitulo(titu,tabela_satT(x,11),tabela_satT(x,13));

                    end
                end             

            case 5 %Entrada como Entropia
                % Propriedade
                entr = prop_2;

                % Valida��o dos limites f�sicos das entradas
                if entr < -0.0010 || temp <= -273.15
                    errordlg('Erro err0205. Entradas fora dos limites f�sicos v�lidos.','ERRO');
                    return;
                end

                % Avalia o estado baseado na temperatura (entre saturado e vapor)
                if temp > tabela_satT(tamanho_sat(1),1) % Estado de Vapor

                    % Define a coluna de pesquisa
                    y = 6;

                    % Confere o limite da tabela
                    if entr > 11.5857 || temp > 1300
                        errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                        return;
                    end

                    % Procurador na tabela
                    for x = 1 : 1 : tamanho_vapor(1)
                        if tabela_vapor(x,2) >= temp && tabela_vapor(x,y) <= entr
                           break 
                        end
                    end

                    % Defini��o do Estado e t�tulo
                    esta = 'Vapor Super Aquecido'; %Estado 
                    titu = '--';

                    % Avalia a temperatura achada
                    if temp == tabela_vapor(x,2)
                        % Avalia o valor da energia interna
                        if tabela_vapor(x,y) == entr
                            % Printa os resultados as propriedades
                            pres = tabela_vapor(x,1);
                            volu = tabela_vapor(x,3);
                            ener = tabela_vapor(x,4);
                            enta = tabela_vapor(x,5);
    %                         entr = tabela_vapor(x,6);

                        elseif tabela_vapor(x,y) < entr
                            % Define a nova tabela de pres para o vapor
                            tabela_vapor = TabelaVaporInterpolada3Propri(tabela_vapor,tamanho_vapor,entr,x,y);                  

                            % Define a coluna para pesquisa
                            y = 2;

                            % Procura pelo valor de temperatura
                            while tabela_vapor(x,y) < temp
                                x = x + 1;
                                y = 2;
                            end

                            % Interpola��o para caso n�o ache os valores
                            if tabela_vapor(x,y) > temp
                                tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,y);
                            end

                            % Printa os resultados as propriedades
                            pres = tabela_vapor(x,1);
                            volu = tabela_vapor(x,3);
                            ener = tabela_vapor(x,4);
                            enta = tabela_vapor(x,5);
    %                         entr = tabela_vapor(x,6);   
                        end

                    elseif temp > tabela_vapor(x,2)
                        % Interpola��o para caso n�o ache os valores
                        if tabela_vapor(x,2) > temp
                            tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,2);
                        end

                         % Coluna para printar
                         y = 6;

                        % Avalia o valor da energia interna
                        if tabela_vapor(x,y) == entr
                            % Printa os resultados as propriedades
                            pres = tabela_vapor(x,1);
                            volu = tabela_vapor(x,3);
                            ener = tabela_vapor(x,4);
                            enta = tabela_vapor(x,5);
    %                         entr = tabela_vapor(x,6);

                        elseif tabela_vapor(x,y) < entr
                            % Define a nova tabela de pres para o vapor
                            tabela_vapor = TabelaVaporInterpolada3Propri(tabela_vapor,tamanho_vapor,entr,x,y);                  

                            % Define a coluna para pesquisa
                            y = 2;

                            % Procura pelo valor de temperatura
                            while tabela_vapor(x,y) < temp
                                x = x + 1;
                                y = 2;
                            end

                            % Interpola��o para caso n�o ache os valores
                            if tabela_vapor(x,y) > temp
                                tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,y);
                            end

                            % Printa os resultados as propriedades
                            pres = tabela_vapor(x,1);
                            volu = tabela_vapor(x,3);
                            ener = tabela_vapor(x,4);
                            enta = tabela_vapor(x,5);
    %                         entr = tabela_vapor(x,6);   
                        end                                                                                    
                    else
                        errordlg('Erro err0206. Entradas fora dos limites v�lidos.','ERRO');
                        return;
                    end

                else %Estado de Satura��o
                    % Inicio
                    x = 1;
                    y = 1;

                    % Procurador na tabela
                    while tabela_satT(x,y) < temp
                        x = x + 1;
                        y  = 1;
                    end

                    % Interpola��o para caso n�o ache os valores
                    if tabela_satT(x,1) > temp
                        tabela_satT = InterpolacaoCompleta(tabela_satT,temp,x);
                    end

                    % Avalia a segunda propriedade
                    if entr > tabela_satT(x,13) %Caso vapor super aquecido
                        % Confere o limite da tabela
                        if entr > 11.5857 || temp > 1300
                            errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                            return;
                        end

                        % Procura na nova coluna 
                        y = 6;

                        % Procurador na tabela
                        for x = 1 : 1 : tamanho_vapor(1)
                            if tabela_vapor(x,2) >= temp && tabela_vapor(x,y) <= entr
                               break 
                            end
                        end

                        % Defini o estado e o t�tulo
                        esta = 'Vapor Super Aquecido'; %Estado
                        if tabela_vapor(x-1,1) ~= tabela_vapor(x,1)                         
                            titu = 1;                     
                        else
                            titu = '--';                     
                        end
                        
                        % Avalia a temperatura achada
                        if temp == tabela_vapor(x,2)
                            % Avalia o valor da energia interna
                            if tabela_vapor(x,y) == entr
                                % Printa os resultados as propriedades
                                pres = tabela_vapor(x,1);
                                volu = tabela_vapor(x,3);
                                ener = tabela_vapor(x,4);
                                enta = tabela_vapor(x,5);
    %                             entr = tabela_vapor(x,6);

                            elseif tabela_vapor(x,y) < entr
                                % Define a nova tabela de pres para o vapor
                                tabela_vapor = TabelaVaporInterpolada3Propri(tabela_vapor,tamanho_vapor,entr,x,y);                  

                                % Define a coluna para pesquisa
                                y = 2;

                                % Procura pelo valor de temperatura
                                while tabela_vapor(x,y) < temp
                                    x = x + 1;
                                    y = 2;
                                end

                                % Interpola��o para caso n�o ache os valores
                                if tabela_vapor(x,y) > temp
                                    tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,y);
                                end

                                % Printa os resultados as propriedades
                                pres = tabela_vapor(x,1);
                                volu = tabela_vapor(x,3);
                                ener = tabela_vapor(x,4);
                                enta = tabela_vapor(x,5);
    %                             entr = tabela_vapor(x,6);   
                            end

                        elseif temp > tabela_vapor(x,2)
                            % Interpola��o para caso n�o ache os valores
                            if tabela_vapor(x,2) > temp
                                tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,2);
                            end

                            % Define a coluna para pesquisa
                            y = 6;

                            % Avalia o valor da energia interna
                            if tabela_vapor(x,y) == entr
                                % Printa os resultados as propriedades
                                pres = tabela_vapor(x,1);
                                volu = tabela_vapor(x,3);
                                ener = tabela_vapor(x,4);
                                enta = tabela_vapor(x,5);
    %                             entr = tabela_vapor(x,6);

                            elseif tabela_vapor(x,y) < entr
                                 % Define a nova tabela de pres para o vapor
                                tabela_vapor = TabelaVaporInterpolada3Propri(tabela_vapor,tamanho_vapor,entr,x,y);                  

                                % Define a coluna para pesquisa
                                y = 2;

                                % Procura pelo valor de temperatura
                                while tabela_vapor(x,y) < temp
                                    x = x + 1;
                                    y = 2;
                                end

                                % Interpola��o para caso n�o ache os valores
                                if tabela_vapor(x,y) > temp
                                    tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x);
                                end

                                % Printa os resultados as propriedades
                                pres = tabela_vapor(x,1);
                                volu = tabela_vapor(x,3);
                                ener = tabela_vapor(x,4);
                                enta = tabela_vapor(x,5);
    %                             entr = tabela_vapor(x,6);   
                            end  
                        end                         

                    elseif entr == tabela_satT(x,13) %Caso Vapor saturado
                        % Printa os resultados as propriedades
                        pres = tabela_satT(x,2);
                        volu = tabela_satT(x,4);
                        ener = tabela_satT(x,7);
                        enta = tabela_satT(x,10);
    %                     entr = tabela_satT(x,13);
                        titu = 1;
                        esta = 'Vapor Saturado';

                    elseif entr == tabela_satT(x,11)
                        % Printa os resultados as propriedades
                        pres = tabela_satT(x,2);
                        volu = tabela_satT(x,3);
                        ener = tabela_satT(x,5);
                        enta = tabela_satT(x,8);
%                         entr = tabela_satT(x,11);
                        titu = 0;
                        esta = 'L�quido Comprimido';
                        
                    elseif entr < tabela_satT(x,11) %Caso l�quido comprimido
                        esta = 'L�quido Comprimido'; %Estado
                        titu = '--';

                        % Confere o limite da tabela
                        if entr > 4.0026 || temp > 380
                            errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                            return;
                        end

                        % Procura na nova coluna 
                        y = 6;

                        % Procurador na tabela
                        for x = 1 : 1 : tamanho_liq(1)
                            if tabela_liqComp(x,2) >= temp && tabela_liqComp(x,y) <= entr
                               break 
                            end
                        end
                        
                        % Avalia a temperatura achada
                        if temp == tabela_liqComp(x,2)
                            % Avalia o valor da energia interna
                            if tabela_liqComp(x,y) == entr
                                % Printa os resultados as propriedades
                                pres = tabela_liqComp(x,1);
                                volu = tabela_liqComp(x,3);
                                ener = tabela_liqComp(x,4);
                                enta = tabela_liqComp(x,5);
    %                             entr = tabela_liqComp(x,6);

                            elseif tabela_liqComp(x,y) < entr
                                % Define a nova tabela de pres para o vapor
                                tabela_liqComp = TabelaVaporInterpolada3Propri(tabela_liqComp,tamanho_liq,entr,x,y);                  

                                % Define a coluna para pesquisa
                                y = 2;

                                % Procura pelo valor de temperatura
                                while tabela_liqComp(x,y) < temp
                                    x = x + 1;
                                    y = 2;
                                end

                                % Interpola��o para caso n�o ache os valores
                                if tabela_liqComp(x,y) > temp
                                    tabela_liqComp = InterpolacaoCompletaVapor(tabela_liqComp,temp,x,y);
                                end

                                % Printa os resultados as propriedades
                                pres = tabela_liqComp(x,1);
                                volu = tabela_liqComp(x,3);
                                ener = tabela_liqComp(x,4);
                                enta = tabela_liqComp(x,5);
    %                             entr = tabela_liqComp(x,6);   
                            end

                        elseif temp > tabela_liqComp(x,2)
                            % Interpola��o para caso n�o ache os valores
                            if tabela_liqComp(x,2) > temp
                                tabela_liqComp = InterpolacaoCompletaVapor(tabela_liqComp,temp,x,2);
                            end

                            % Define a coluna para pesquisa
                            y = 6;

                            % Avalia o valor da energia interna
                            if tabela_liqComp(x,y) == entr
                                % Printa os resultados as propriedades
                                pres = tabela_liqComp(x,1);
                                volu = tabela_liqComp(x,3);
                                ener = tabela_liqComp(x,4);
                                enta = tabela_liqComp(x,5);
    %                             entr = tabela_liqComp(x,6);

                            elseif tabela_liqComp(x,y) < entr
                                 % Define a nova tabela de pres para o vapor
                                tabela_liqComp = TabelaVaporInterpolada3Propri(tabela_liqComp,tamanho_liq,entr,x,y);                  

                                % Define a coluna para pesquisa
                                y = 2;

                                % Procura pelo valor de temperatura
                                while tabela_liqComp(x,y) < temp
                                    x = x + 1;
                                    y = 2;
                                end

                                % Interpola��o para caso n�o ache os valores
                                if tabela_liqComp(x,y) > temp
                                    tabela_liqComp = InterpolacaoCompletaVapor(tabela_liqComp,temp,x);
                                end

                                % Printa os resultados as propriedades
                                pres = tabela_liqComp(x,1);
                                volu = tabela_liqComp(x,3);
                                ener = tabela_liqComp(x,4);
                                enta = tabela_liqComp(x,5);
    %                             entr = tabela_liqComp(x,6);   
                            end  
                        end                                     

                    else %Caso mistura
                        esta = 'Mistura'; %Estado

                        % Calculo do t�tulo e das propriedades com t�tulo
                        titu = (entr-tabela_satT(x,11)) / tabela_satT(x,12);
                        pres = tabela_satT(x,2);
                        volu = CalculoComTitulo(titu,tabela_satT(x,3),tabela_satT(x,4));
                        ener = CalculoComTitulo(titu,tabela_satT(x,5),tabela_satT(x,7));
                        enta = CalculoComTitulo(titu,tabela_satT(x,8),tabela_satT(x,10));
    %                     entr = CalculoComTitulo(titu,tabela_satT(x,11),tabela_satT(x,13));

                    end
                end                

            case 6 %Entrada como T�tulo
                % Propriedade e estado
                titu = prop_2;
                if titu == 1
                    esta = 'Vapor Saturado'; %Estado de Mistura 
                elseif titu == 0
                    esta = 'L�quido Saturado'; %Estado de Mistura 
                else
                    esta = 'Mistura'; %Estado de Mistura 
                end

                % Valida��o dos limites f�sicos das entradas
                if temp <= -273.15
                    errordlg('Erro err0205. Entradas fora dos limites f�sicos v�lidos.','ERRO');
                    return;
                end

                % Avalia os limites da tabela
                if temp > tabela_satT(tamanho_sat(1),1)
                    errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                    return;
                end

                % Valida��o te�rica do t�tulo
                if  titu > 1 || titu < 0
                    errordlg('Erro err0307. Entradas fora dos limites te�ricos v�lidos.','Erro');
                    return
                end

                % Procurador na tabela
                while tabela_satT(x,y) < temp
                    x = x + 1;
                    y  = 1;
                end

                % Interpola��o para caso n�o ache os valores
                if tabela_satT(x,1) > temp
                    tabela_satT = InterpolacaoCompleta(tabela_satT,temp,x);
                end

                % Calculo do t�tulo e das propriedades com t�tulo
                pres = tabela_satT(x,2);
                volu = CalculoComTitulo(titu,tabela_satT(x,3),tabela_satT(x,4));
                ener = CalculoComTitulo(titu,tabela_satT(x,5),tabela_satT(x,7));
                enta = CalculoComTitulo(titu,tabela_satT(x,8),tabela_satT(x,10));
                entr = CalculoComTitulo(titu,tabela_satT(x,11),tabela_satT(x,13));

            otherwise
                errordlg('Erro err0204. Op��o da segunda propriedade de entrada � inv�lida ou incoerente.','ERRO');
                return;
        end
    end
    
elseif primeira_entrada == 2 %Entrada principal como press�o
    % Define a primeira propriedade
    pres = prop_1;
        
    % R134a
    if strcmp(fluido,'R134a') == 1

        % Conferir v�lidade das entradas
        if isnan(pres) || isnan(prop_2)
            errordlg('Erro err0202. As entradas apresentam caracteres inv�lidos.','ERRO');
            return;
        end

        % Tamanho das tabelas
        tamanho_sat = size(tabela_satP);
        tamanho_vapor = size(tabela_vapor);

        % Avalia a segunda entrada
        switch segunda_entrada
            case 1 %Entrada como Temperatura
                temp = prop_2;
                
                % Valida��o dos limites f�sicos das entradas
                if pres <= 0 || temp <= -273.15
                    errordlg('Erro err0205. Entradas fora dos limites f�sicos v�lidos.','ERRO');
                    return;
                end

                % Valida��o da entrada dentro dos limites da tabela
                if pres < tabela_satP(1,1) || pres > tabela_satP(tamanho_sat(1),1)
                    errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                    return;
                end

                % Procurador na tabela
                while tabela_satP(x,y) < pres
                    x = x + 1;
                    y  = 1;
                end

                % Interpola��o para caso n�o ache os valores
                if tabela_satP(x,1) > pres
                    tabela_satP = InterpolacaoCompleta(tabela_satP,temp,x);
                end

                % Avalia a press�o achada
                if temp > tabela_satP(x,2) %Caso vapor super aquecido
                    % Avalia os limites de press�o na tabela
                    if tabela_vapor(1,1) > pres || tabela_vapor(tamanho_vapor(1),1) < pres
                        errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                        return;
                    end  

                    % Variaveis para procura
                    x = 1;
                    y = 1;

                    % Procurador na tabela
                    while tabela_vapor(x,y) < pres
                        x = x + 1;
                        y  = 1;
                    end                
                            
                    % Defini o estado
                    esta = 'Vapor Super Aquecido'; %Estado

                    % Avalia a press�o
                    if pres == tabela_vapor(x,1)
                        % Variavel de pesquisa
                        p = x;

                        % Confere o limite da faixa de press�o igual
                        while tabela_vapor(p,1) == pres
                            p = p + 1;

                            % Evitar ultrapassar o limite da tabela
                            if p > tamanho_vapor(1)
                               break; 
                            end 
                        end  

                        % Avalia a temperatura na ultima coordenada de press�o igual
                        if tabela_vapor(p-1,2) < temp
                            errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                            return;
                        end    

                        % Nova coluna para procura
                        y = 2;

                        % Procura temperatura
                        while tabela_vapor(x,y) < temp
                            x = x + 1;
                            y = 2;
                        end

                        % Interpola��o para caso n�o ache os valores
                        if tabela_vapor(x,y) > temp
                            tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,y);
                        end

                        % Define o t�tulo
                        if tabela_vapor(x-1,1) ~= tabela_vapor(x,1)                         
                            titu = 1;                     
                        else
                            titu = '--';                     
                        end

                        % Ajuste a coluna de press�o
                        tabela_vapor(x,1) = pres;
                        tabela_vapor(x,2) = temp;

                        % Propriedades
                        volu = tabela_vapor(x,3);
                        ener = tabela_vapor(x,4);
                        enta = tabela_vapor(x,5);
                        entr = tabela_vapor(x,6);

                    elseif pres < tabela_vapor(x,1)
                        % variaveis necess�rias
                        I = 1;
                        i = x;

                        % Confere o limite da faixa de press�o igual
                        while tabela_vapor(i,1) == tabela_vapor(x,1)
                            for k = 1 : 1 : tamanho_vapor(2)
                                tabela_interpolMax(I,k) = tabela_vapor(i,k);
                            end
                            I = I + 1;
                            i = i + 1;

                            % Eveitar ultrapassar o limite da tabela
                            if i > tamanho_vapor(1)
                               break; 
                            end 
                        end  

                        % Zera os contadores para pr�xima matriz
                        i = x-1;
                        I = 1;

                        % Delimita os valores iniciais e finais das temperaturas para interpolar para press�o menor 
                        while tabela_vapor(i,1) == tabela_vapor(x-1,1)
                            for k = 1 : 1 : tamanho_vapor(2)
                                tabela_interpolMin(I,k) = tabela_vapor(i,k);
                            end
                            I = I + 1;
                            i = i - 1;

                            % Eveitar ultrapassar o limite da tabela
                            if i <= 0
                               break; 
                            end 
                        end

                        % Desinverte matriz
                        tabela_interpolMin = InverteMatriz(tabela_interpolMin);

                        % Interpola entre uma tabela e outra
                        tabela_vapor = InterpolacaoEntreTabelaCompletaVapor(tabela_vapor,tabela_interpolMax,tabela_interpolMin,pres,x);                  

                        % Define a coluna para pesquisa
                        y = 2;

                        % Procura pelo valor de temperatura
                        while tabela_vapor(x,y) < temp
                            x = x + 1;
                            y = 2;
                        end

                        % Interpola��o para caso n�o ache os valores
                        if tabela_vapor(x,y) > temp
                            tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,y);
                        end

                        if (tabela_vapor(x-1,1) ~= tabela_vapor(x,1)) && x > 1                     
                            titu = 1;                     
                        else
                            titu = '--';                     
                        end

                        % Ajuste a coluna de press�o
                        tabela_vapor(x,1) = pres;
                        tabela_vapor(x,2) = temp;

                        % Printa os resultados as propriedades
                        volu = tabela_vapor(x,3);
                        ener = tabela_vapor(x,4);
                        enta = tabela_vapor(x,5);
                        entr = tabela_vapor(x,6);               

                    else
                        errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                        return;
                    end                           

                elseif temp < tabela_satP(x,2) %Caso l�quido comprimido
                    esta = 'L�quido Comprimido'; %Estado
                    titu = 0;

                    % Propriedades
                    volu = tabela_satP(x,3);
                    ener = tabela_satP(x,5);
                    enta = tabela_satP(x,8);
                    entr = tabela_satP(x,11);

                    else %Caso mistura
                        esta = 'Mistura'; %Estado
                        propri = menu('Escolha uma propriedade:','Titulo','Volume Espec�fico (m�/kg)','Energia Interna (kJ/kg)','Entalpia (kJ/kg)','Entropia (kJ/kg � K)');

                        % Verifica cancelamento
                        if propri == 0
                            return;
                        end
                        
                        % Nova entrada
                        [volu , ener , enta , entr , titu] = NovaPropriedade(tabela_satP,x,y,propri);
                end

            case 2 %Entrada como Volume Espec�fico
                %Entrada
                volu = prop_2;
                
                % Valida��o dos limites f�sicos das entradas
                if volu <= 0 || pres <= 0
                    errordlg('Erro err0205. Entradas fora dos limites f�sicos v�lidos.','ERRO');
                    return;
                end
                
                % Define a coluna para procura
                y = 1;
                x = 1;

                % Procurador na tabela
                while tabela_satP(x,y) < pres
                    x = x + 1;
                    y = 1;
                end

                % Interpola��o para caso n�o ache os valores
                if tabela_satP(x,1) > pres
                    tabela_satP = InterpolacaoCompleta(tabela_satP,pres,x);
                end

                % Avalia a segunda propriedade
                if volu > tabela_satP(x,4) %Caso vapor super aquecido                  
                    % Confere o limite da tabela
                    if volu > 0.31121
                        errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                        return;
                    end

                    % Avalia os limites de press�o na tabela
                    if tabela_vapor(1,1) > pres || tabela_vapor(tamanho_vapor(1),1) < pres
                        errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                        return;
                    end  

                    % Define a coluna para procura
                    y = 1;
                    x = 1;

                    % Procurador na tabela
                    while tabela_vapor(x,y) < pres
                        x = x + 1;
                        y  = 1;
                    end                    
                    
                    % Interpola caso n�o ache o valor
                    if pres < tabela_vapor(x,1)
                        % variaveis necess�rias
                        I = 1;
                        i = x;

                        % Confere o limite da faixa de press�o igual
                        while tabela_vapor(i,1) == tabela_vapor(x,1)
                            for k = 1 : 1 : tamanho_vapor(2)
                                tabela_interpolMax(I,k) = tabela_vapor(i,k);
                            end
                            I = I + 1;
                            i = i + 1;

                            % Eveitar ultrapassar o limite da tabela
                            if i > tamanho_vapor(1)
                               break; 
                            end 
                        end  

                        % Zera os contadores para pr�xima matriz
                        i = x-1;
                        I = 1;

                        % Delimita os valores iniciais e finais das temperaturas para interpolar para press�o menor 
                        while tabela_vapor(i,1) == tabela_vapor(x-1,1)
                            for k = 1 : 1 : tamanho_vapor(2)
                                tabela_interpolMin(I,k) = tabela_vapor(i,k);
                            end
                            I = I + 1;
                            i = i - 1;

                            % Eveitar ultrapassar o limite da tabela
                            if i <= 0
                               break; 
                            end 
                        end

                        % Desinverte matriz
                        tabela_interpolMin = InverteMatriz(tabela_interpolMin);

                        % Interpola entre uma tabela e outra
                        tabela_vapor = InterpolacaoEntreTabelaCompletaVapor(tabela_vapor,tabela_interpolMax,tabela_interpolMin,pres,x);                  
                        
                    end
                    
                    % Procura na nova coluna 
                    y = 3;
                    
                    % Procurador na tabela
                    while tabela_vapor(x,y) < volu
                        x = x + 1;
                        y = 3;
                    end                   
                    
                    % Interpola��o para caso n�o ache os valores
                    if tabela_vapor(x,y) > volu
                        % Calculo da temperatura
%                         temp = Interpolacao(tabela_vapor(x-1,y),tabela_vapor(x,y),tabela_vapor(x-1,2),tabela_vapor(x,2),volu);
                        
                        % Interpola��o
                        tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,volu,x,y);
                    end
                    
                    % Defini o estado e o t�tulo
                    esta = 'Vapor Super Aquecido'; %Estado
                    if tabela_vapor(x-1,1) ~= tabela_vapor(x,1)                         
                        titu = 1;                     
                    else
                        titu = '--';                     
                    end
                    
                    % Printa os resultados as propriedades
                    temp = tabela_vapor(x,2);
%                     volu = tabela_vapor(x,3);
                    ener = tabela_vapor(x,4);
                    enta = tabela_vapor(x,5);
                    entr = tabela_vapor(x,6);

                elseif volu == tabela_satP(x,4) %Caso Vapor saturado
                    % Printa os resultados as propriedades
%                     pres = tabela_satP(x,1);
                    temp = tabela_satP(x,2);
%                     volu = tabela_satP(x,4);
                    ener = tabela_satP(x,7);
                    enta = tabela_satP(x,10);
                    entr = tabela_satP(x,13);
                    titu = 1;
                    esta = 'Vapor Saturado';

                elseif volu <= tabela_satP(x,3) %Caso l�quido comprimido
                    esta = 'L�quido Comprimido'; %Estado
                    titu = 0;

                    % Propriedades
%                     pres = tabela_satP(x,1);
                    temp = tabela_satP(x,2);
%                     volu = tabela_satP(x,3);
                    ener = tabela_satP(x,5);
                    enta = tabela_satP(x,8);
                    entr = tabela_satP(x,11);                     

                else %Caso mistura
                    esta = 'Mistura'; %Estado

                    % Calculo do t�tulo e das propriedades com t�tulo
                    titu = (volu-tabela_satP(x,3)) / (tabela_satP(x,4) - tabela_satP(x,3));
                    temp = tabela_satP(x,2);
%                     volu = CalculoComTitulo(titu,tabela_satP(x,3),tabela_satP(x,4));
                    ener = CalculoComTitulo(titu,tabela_satP(x,5),tabela_satP(x,7));
                    enta = CalculoComTitulo(titu,tabela_satP(x,8),tabela_satP(x,10));
                    entr = CalculoComTitulo(titu,tabela_satP(x,11),tabela_satP(x,13));

                end           

            case 3 %Entrada como Energia Interna
                % Propriedade
                ener = prop_2;
                
                % Valida��o dos limites f�sicos das entradas
                if ener <= 0 || pres <= 0
                    errordlg('Erro err0205. Entradas fora dos limites f�sicos v�lidos.','ERRO');
                    return;
                end  
                
                % Define a coluna para procura
                y = 1;
                x = 1;

                % Procurador na tabela
                while tabela_satP(x,y) < pres
                    x = x + 1;
                    y = 1;
                end

                % Interpola��o para caso n�o ache os valores
                if tabela_satP(x,1) > pres
                    tabela_satP = InterpolacaoCompleta(tabela_satP,pres,x);
                end

                % Avalia a segunda propriedade
                if ener > tabela_satP(x,7) %Caso vapor super aquecido                  
                    % Confere o limite da tabela
                    if ener > 386.99
                        errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                        return;
                    end

                    % Avalia os limites de press�o na tabela
                    if tabela_vapor(1,1) > pres || tabela_vapor(tamanho_vapor(1),1) < pres
                        errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                        return;
                    end  

                    % Define a coluna para procura
                    y = 1;
                    x = 1;

                    % Procurador na tabela
                    while tabela_vapor(x,y) < pres
                        x = x + 1;
                        y  = 1;
                    end                    
                    
                    % Interpola caso n�o ache o valor
                    if pres < tabela_vapor(x,1)
                        % variaveis necess�rias
                        I = 1;
                        i = x;

                        % Confere o limite da faixa de press�o igual
                        while tabela_vapor(i,1) == tabela_vapor(x,1)
                            for k = 1 : 1 : tamanho_vapor(2)
                                tabela_interpolMax(I,k) = tabela_vapor(i,k);
                            end
                            I = I + 1;
                            i = i + 1;

                            % Eveitar ultrapassar o limite da tabela
                            if i > tamanho_vapor(1)
                               break; 
                            end 
                        end  

                        % Zera os contadores para pr�xima matriz
                        i = x-1;
                        I = 1;

                        % Delimita os valores iniciais e finais das temperaturas para interpolar para press�o menor 
                        while tabela_vapor(i,1) == tabela_vapor(x-1,1)
                            for k = 1 : 1 : tamanho_vapor(2)
                                tabela_interpolMin(I,k) = tabela_vapor(i,k);
                            end
                            I = I + 1;
                            i = i - 1;

                            % Eveitar ultrapassar o limite da tabela
                            if i <= 0
                               break; 
                            end 
                        end

                        % Desinverte matriz
                        tabela_interpolMin = InverteMatriz(tabela_interpolMin);

                        % Interpola entre uma tabela e outra
                        tabela_vapor = InterpolacaoEntreTabelaCompletaVapor(tabela_vapor,tabela_interpolMax,tabela_interpolMin,pres,x);                  
                        
                    end
                    
                    % Procura na nova coluna 
                    y = 4;
                    
                    % Procurador na tabela
                    while tabela_vapor(x,y) < ener
                        x = x + 1;
                        y = 4;
                    end                   
                    
                    % Interpola��o para caso n�o ache os valores
                    if tabela_vapor(x,y) > ener
                        % Calculo da temperatura
%                         temp = Interpolacao(tabela_vapor(x-1,y),tabela_vapor(x,y),tabela_vapor(x-1,2),tabela_vapor(x,2),volu);
                        
                        % Interpola��o
                        tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,ener,x,y);
                    end
                    
                    % Defini o estado e o t�tulo
                    esta = 'Vapor Super Aquecido'; %Estado
                    if tabela_vapor(x-1,1) ~= tabela_vapor(x,1)                         
                        titu = 1;                     
                    else
                        titu = '--';                     
                    end
                    
                    % Printa os resultados as propriedades
                    temp = tabela_vapor(x,2);
                    volu = tabela_vapor(x,3);
%                     ener = tabela_vapor(x,4);
                    enta = tabela_vapor(x,5);
                    entr = tabela_vapor(x,6);

                elseif ener == tabela_satP(x,7) %Caso Vapor saturado
                    % Printa os resultados as propriedades
%                     pres = tabela_satP(x,1);
                    temp = tabela_satP(x,2);
                    volu = tabela_satP(x,4);
%                     ener = tabela_satP(x,7);
                    enta = tabela_satP(x,10);
                    entr = tabela_satP(x,13);
                    titu = 1;
                    esta = 'Vapor Saturado';

                elseif ener <= tabela_satP(x,5) %Caso l�quido comprimido
                    esta = 'L�quido Comprimido'; %Estado
                    titu = 0;

                    % Propriedades
%                     pres = tabela_satP(x,1);
                    temp = tabela_satP(x,2);
                    volu = tabela_satP(x,3);
%                     ener = tabela_satP(x,5);
                    enta = tabela_satP(x,8);
                    entr = tabela_satP(x,11);                     

                else %Caso mistura
                    esta = 'Mistura'; %Estado

                    % Calculo do t�tulo e das propriedades com t�tulo
                    titu = (ener-tabela_satP(x,5)) / tabela_satP(x,6);
                    temp = tabela_satP(x,2);
                    volu = CalculoComTitulo(titu,tabela_satP(x,3),tabela_satP(x,4));
%                     ener = CalculoComTitulo(titu,tabela_satP(x,5),tabela_satP(x,7));
                    enta = CalculoComTitulo(titu,tabela_satP(x,8),tabela_satP(x,10));
                    entr = CalculoComTitulo(titu,tabela_satP(x,11),tabela_satP(x,13));

                end                  
                
            case 4 %Entrada como Entalpia
                % Propriedade
                enta = prop_2;

                % Valida��o dos limites f�sicos das entradas
                if enta <= 0 || pres <= 0
                    errordlg('Erro err0205. Entradas fora dos limites f�sicos v�lidos.','ERRO');
                    return;
                end        
                
                % Define a coluna para procura
                y = 1;
                x = 1;

                % Procurador na tabela
                while tabela_satP(x,y) < pres
                    x = x + 1;
                    y = 1;
                end

                % Interpola��o para caso n�o ache os valores
                if tabela_satP(x,1) > pres
                    tabela_satP = InterpolacaoCompleta(tabela_satP,pres,x);
                end

                % Avalia a segunda propriedade
                if enta > tabela_satP(x,10) %Caso vapor super aquecido                  
                    % Confere o limite da tabela
                    if enta > 422.64
                        errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                        return;
                    end

                    % Avalia os limites de press�o na tabela
                    if tabela_vapor(1,1) > pres || tabela_vapor(tamanho_vapor(1),1) < pres
                        errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                        return;
                    end  

                    % Define a coluna para procura
                    y = 1;
                    x = 1;

                    % Procurador na tabela
                    while tabela_vapor(x,y) < pres
                        x = x + 1;
                        y  = 1;
                    end                    
                    
                    % Interpola caso n�o ache o valor
                    if pres < tabela_vapor(x,1)
                        % variaveis necess�rias
                        I = 1;
                        i = x;

                        % Confere o limite da faixa de press�o igual
                        while tabela_vapor(i,1) == tabela_vapor(x,1)
                            for k = 1 : 1 : tamanho_vapor(2)
                                tabela_interpolMax(I,k) = tabela_vapor(i,k);
                            end
                            I = I + 1;
                            i = i + 1;

                            % Eveitar ultrapassar o limite da tabela
                            if i > tamanho_vapor(1)
                               break; 
                            end 
                        end  

                        % Zera os contadores para pr�xima matriz
                        i = x-1;
                        I = 1;

                        % Delimita os valores iniciais e finais das temperaturas para interpolar para press�o menor 
                        while tabela_vapor(i,1) == tabela_vapor(x-1,1)
                            for k = 1 : 1 : tamanho_vapor(2)
                                tabela_interpolMin(I,k) = tabela_vapor(i,k);
                            end
                            I = I + 1;
                            i = i - 1;

                            % Eveitar ultrapassar o limite da tabela
                            if i <= 0
                               break; 
                            end 
                        end

                        % Desinverte matriz
                        tabela_interpolMin = InverteMatriz(tabela_interpolMin);

                        % Interpola entre uma tabela e outra
                        tabela_vapor = InterpolacaoEntreTabelaCompletaVapor(tabela_vapor,tabela_interpolMax,tabela_interpolMin,pres,x);                  
                        
                    end
                    
                    % Procura na nova coluna 
                    y = 5;
                    
                    % Procurador na tabela
                    while tabela_vapor(x,y) < enta
                        x = x + 1;
                        y = 5;
                    end                   
                    
                    % Interpola��o para caso n�o ache os valores
                    if tabela_vapor(x,y) > enta
                        % Calculo da temperatura
%                         temp = Interpolacao(tabela_vapor(x-1,y),tabela_vapor(x,y),tabela_vapor(x-1,2),tabela_vapor(x,2),volu);
                        
                        % Interpola��o
                        tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,enta,x,y);
                    end
                    
                    % Defini o estado e o t�tulo
                    esta = 'Vapor Super Aquecido'; %Estado
                    if tabela_vapor(x-1,1) ~= tabela_vapor(x,1)                         
                        titu = 1;                     
                    else
                        titu = '--';                     
                    end
                    
                    % Printa os resultados as propriedades
                    temp = tabela_vapor(x,2);
                    volu = tabela_vapor(x,3);
                    ener = tabela_vapor(x,4);
%                     enta = tabela_vapor(x,5);
                    entr = tabela_vapor(x,6);

                elseif enta == tabela_satP(x,10) %Caso Vapor saturado
                    % Printa os resultados as propriedades
%                     pres = tabela_satP(x,1);
                    temp = tabela_satP(x,2);
                    volu = tabela_satP(x,4);
                    ener = tabela_satP(x,7);
%                     enta = tabela_satP(x,10);
                    entr = tabela_satP(x,13);
                    titu = 1;
                    esta = 'Vapor Saturado';

                elseif enta <= tabela_satP(x,8) %Caso l�quido comprimido
                    esta = 'L�quido Comprimido'; %Estado
                    titu = 0;

                    % Propriedades
%                     pres = tabela_satP(x,1);
                    temp = tabela_satP(x,2);
                    volu = tabela_satP(x,3);
                    ener = tabela_satP(x,5);
%                     enta = tabela_satP(x,8);
                    entr = tabela_satP(x,11);                     

                else %Caso mistura
                    esta = 'Mistura'; %Estado

                    % Calculo do t�tulo e das propriedades com t�tulo
                    titu = (enta-tabela_satP(x,8)) / tabela_satP(x,9);
                    temp = tabela_satP(x,2);
                    volu = CalculoComTitulo(titu,tabela_satP(x,3),tabela_satP(x,4));
                    ener = CalculoComTitulo(titu,tabela_satP(x,5),tabela_satP(x,7));
%                     enta = CalculoComTitulo(titu,tabela_satP(x,8),tabela_satP(x,10));
                    entr = CalculoComTitulo(titu,tabela_satP(x,11),tabela_satP(x,13));

                end               

            case 5 %Entrada como Entropia
                % Propriedade
                entr = prop_2;

                % Valida��o dos limites f�sicos das entradas
                if entr <= 0 || pres <= 0
                    errordlg('Erro err0205. Entradas fora dos limites f�sicos v�lidos.','ERRO');
                    return;
                end

                % Propriedade
                entr = prop_2;

                % Valida��o dos limites f�sicos das entradas
                if entr <= 0 || pres <= 0
                    errordlg('Erro err0205. Entradas fora dos limites f�sicos v�lidos.','ERRO');
                    return;
                end        
                
                % Define a coluna para procura
                y = 1;
                x = 1;

                % Procurador na tabela
                while tabela_satP(x,y) < pres
                    x = x + 1;
                    y = 1;
                end

                % Interpola��o para caso n�o ache os valores
                if tabela_satP(x,1) > pres
                    tabela_satP = InterpolacaoCompleta(tabela_satP,pres,x);
                end

                % Avalia a segunda propriedade
                if entr > tabela_satP(x,13) %Caso vapor super aquecido                  
                    % Confere o limite da tabela
                    if entr > 1.3520
                        errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                        return;
                    end

                    % Avalia os limites de press�o na tabela
                    if tabela_vapor(1,1) > pres || tabela_vapor(tamanho_vapor(1),1) < pres
                        errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                        return;
                    end  

                    % Define a coluna para procura
                    y = 1;
                    x = 1;

                    % Procurador na tabela
                    while tabela_vapor(x,y) < pres
                        x = x + 1;
                        y  = 1;
                    end                    
                    
                    % Interpola caso n�o ache o valor
                    if pres < tabela_vapor(x,1)
                        % variaveis necess�rias
                        I = 1;
                        i = x;

                        % Confere o limite da faixa de press�o igual
                        while tabela_vapor(i,1) == tabela_vapor(x,1)
                            for k = 1 : 1 : tamanho_vapor(2)
                                tabela_interpolMax(I,k) = tabela_vapor(i,k);
                            end
                            I = I + 1;
                            i = i + 1;

                            % Eveitar ultrapassar o limite da tabela
                            if i > tamanho_vapor(1)
                               break; 
                            end 
                        end  

                        % Zera os contadores para pr�xima matriz
                        i = x-1;
                        I = 1;

                        % Delimita os valores iniciais e finais das temperaturas para interpolar para press�o menor 
                        while tabela_vapor(i,1) == tabela_vapor(x-1,1)
                            for k = 1 : 1 : tamanho_vapor(2)
                                tabela_interpolMin(I,k) = tabela_vapor(i,k);
                            end
                            I = I + 1;
                            i = i - 1;

                            % Eveitar ultrapassar o limite da tabela
                            if i <= 0
                               break; 
                            end 
                        end

                        % Desinverte matriz
                        tabela_interpolMin = InverteMatriz(tabela_interpolMin);

                        % Interpola entre uma tabela e outra
                        tabela_vapor = InterpolacaoEntreTabelaCompletaVapor(tabela_vapor,tabela_interpolMax,tabela_interpolMin,pres,x);                  
                        
                    end
                    
                    % Procura na nova coluna 
                    y = 6;
                    
                    % Procurador na tabela
                    while tabela_vapor(x,y) < entr
                        x = x + 1;
                        y = 6;
                    end                   
                    
                    % Interpola��o para caso n�o ache os valores
                    if tabela_vapor(x,y) > entr
                        % Calculo da temperatura
%                         temp = Interpolacao(tabela_vapor(x-1,y),tabela_vapor(x,y),tabela_vapor(x-1,2),tabela_vapor(x,2),volu);
                        
                        % Interpola��o
                        tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,entr,x,y);
                    end
                    
                    % Defini o estado e o t�tulo
                    esta = 'Vapor Super Aquecido'; %Estado
                    if tabela_vapor(x-1,1) ~= tabela_vapor(x,1)                         
                        titu = 1;                     
                    else
                        titu = '--';                     
                    end
                    
                    % Printa os resultados as propriedades
                    temp = tabela_vapor(x,2);
                    volu = tabela_vapor(x,3);
                    ener = tabela_vapor(x,4);
                    enta = tabela_vapor(x,5);
%                     entr = tabela_vapor(x,6);

                elseif entr == tabela_satP(x,13) %Caso Vapor saturado
                    % Printa os resultados as propriedades
%                     pres = tabela_satP(x,1);
                    temp = tabela_satP(x,2);
                    volu = tabela_satP(x,4);
                    ener = tabela_satP(x,7);
                    enta = tabela_satP(x,10);
%                     entr = tabela_satP(x,13);
                    titu = 1;
                    esta = 'Vapor Saturado';

                elseif entr <= tabela_satP(x,11) %Caso l�quido comprimido
                    esta = 'L�quido Comprimido'; %Estado
                    titu = 0;

                    % Propriedades
%                     pres = tabela_satP(x,1);
                    temp = tabela_satP(x,2);
                    volu = tabela_satP(x,3);
                    ener = tabela_satP(x,5);
                    enta = tabela_satP(x,8);
%                     entr = tabela_satP(x,11);                     

                else %Caso mistura
                    esta = 'Mistura'; %Estado

                    % Calculo do t�tulo e das propriedades com t�tulo
                    titu = (entr-tabela_satP(x,11)) / tabela_satP(x,12);
                    temp = tabela_satP(x,2);
                    volu = CalculoComTitulo(titu,tabela_satP(x,3),tabela_satP(x,4));
                    ener = CalculoComTitulo(titu,tabela_satP(x,5),tabela_satP(x,7));
                    enta = CalculoComTitulo(titu,tabela_satP(x,8),tabela_satP(x,10));
%                     entr = CalculoComTitulo(titu,tabela_satP(x,11),tabela_satP(x,13));

                end               
                
            case 6 %Entrada como T�tulo
                % Propriedade e estado
                titu = prop_2;
                
                % Avalia o t�tulo
                if titu == 1
                    esta = 'Vapor Saturado'; %Estado de Mistura 
                elseif titu == 0
                    esta = 'L�quido Saturado'; %Estado de Mistura 
                else
                    esta = 'Mistura'; %Estado de Mistura 
                end

                % Valida��o dos limites f�sicos das entradas
                if pres <= 0
                    errordlg('Erro err0205. Entradas fora dos limites f�sicos v�lidos.','ERRO');
                    return;
                end

                % Avalia os limites da tabela
                if pres > tabela_satP(tamanho_sat(1),1)
                    errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                    return;
                end

                % Valida��o te�rica do t�tulo
                if  titu > 1 || titu < 0
                    errordlg('Erro err0307. Entradas fora dos limites te�ricos v�lidos.','Erro');
                    return
                end

                % Redefine coordendas
                x = 1;
                y = 1;
                
                % Procurador na tabela
                while tabela_satP(x,y) < pres
                    x = x + 1;
                    y  = 1;
                end

                % Interpola��o para caso n�o ache os valores
                if tabela_satP(x,1) > pres
                    tabela_satP = InterpolacaoCompleta(tabela_satP,pres,x);
                end

                % Calculo do t�tulo e das propriedades com t�tulo
                temp = tabela_satP(x,2);
                volu = CalculoComTitulo(titu,tabela_satP(x,3),tabela_satP(x,4));
                ener = CalculoComTitulo(titu,tabela_satP(x,5),tabela_satP(x,7));
                enta = CalculoComTitulo(titu,tabela_satP(x,8),tabela_satP(x,10));
                entr = CalculoComTitulo(titu,tabela_satP(x,11),tabela_satP(x,13));

            otherwise
                errordlg('Erro err0204. Op��o da segunda propriedade de entrada � inv�lida ou incoerente.','ERRO');
                return;
        end
    end

    % �gua
    if strcmp(fluido,'�gua') == 1

        % Conferir v�lidade das entradas
        if isnan(pres) || isnan(prop_2)
            errordlg('Erro err0202. As entradas apresentam caracteres inv�lidos.','ERRO');
            return;
        end

        % Tamanho das tabelas
        tamanho_sat = size(tabela_satP);
        tamanho_vapor = size(tabela_vapor);
        tamanho_liq = size(tabela_liqComp);

        % Avalia a segunda entrada
        switch segunda_entrada
            case 1 %Entrada como Temperatura
                temp = prop_2;
                
                % Valida��o dos limites f�sicos das entradas
                if pres <= 0 || temp <= -273.15
                    errordlg('Erro err0205. Entradas fora dos limites f�sicos v�lidos.','ERRO');
                    return;
                end

                % Valida��o da entrada dentro dos limites da tabela
                if pres < tabela_satP(1,1) || pres > tabela_liqComp(tamanho_liq(1),1) || temp > 1300
                    errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                    return;
                end
                
                % Avalia se a press�o ultrapassa o a tabela de satura�ao
                if pres > tabela_satP(tamanho_sat(1),1) % Liquido comprimido
                    
                    esta = 'L�quido Comprimido'; %Estado
                    titu = '--';

                    % Avalia os limites de press�o na tabela
                    if tabela_liqComp(1,1) > pres || tabela_liqComp(tamanho_liq(1),1) < pres || temp > 380
                        errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                        return;
                    end  

                    % Variaveis para procura
                    x = 1;
                    y = 1;

                    % Procurador na tabela
                    while tabela_liqComp(x,y) < pres
                        x = x + 1;
                        y  = 1;
                    end                

                    % Avalia a press�o
                    if pres == tabela_liqComp(x,1)
                        % Variavel de pesquisa
                        p = x;

                        % Confere o limite da faixa de press�o igual
                        while tabela_liqComp(p,1) == pres
                            p = p + 1;

                            % Evitar ultrapassar o limite da tabela
                            if p > tamanho_liq(1)
                               break; 
                            end 
                        end  

                        % Avalia a temperatura na ultima coordenada de press�o igual
                        if tabela_liqComp(p-1,2) < temp
                            errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                            return;
                        end    

                        % Nova coluna para procura
                        y = 2;

                        % Procura temperatura
                        while tabela_liqComp(x,y) < temp
                            x = x + 1;
                            y = 2;
                        end

                        % Interpola��o para caso n�o ache os valores
                        if tabela_liqComp(x,y) > temp
                            tabela_liqComp = InterpolacaoCompletaVapor(tabela_liqComp,temp,x,y);
                        end

                        % Define o t�tulo
                        if tabela_liqComp(x-1,1) ~= tabela_liqComp(x,1)                         
                            titu = 1;                     
                        else
                            titu = '--';                     
                        end

                        % Ajuste a coluna de press�o
                        tabela_liqComp(x,1) = pres;
                        tabela_liqComp(x,2) = temp;

                        % Propriedades
                        volu = tabela_liqComp(x,3);
                        ener = tabela_liqComp(x,4);
                        enta = tabela_liqComp(x,5);
                        entr = tabela_liqComp(x,6);

                    elseif pres < tabela_liqComp(x,1)
                        % variaveis necess�rias
                        I = 1;
                        i = x;

                        % Confere o limite da faixa de press�o igual
                        while tabela_liqComp(i,1) == tabela_liqComp(x,1)
                            for k = 1 : 1 : tamanho_liq(2)
                                tabela_interpolMax(I,k) = tabela_liqComp(i,k);
                            end
                            I = I + 1;
                            i = i + 1;

                            % Eveitar ultrapassar o limite da tabela
                            if i > tamanho_liq(1)
                               break; 
                            end 
                        end  

                        % Zera os contadores para pr�xima matriz
                        i = x-1;
                        I = 1;

                        % Delimita os valores iniciais e finais das temperaturas para interpolar para press�o menor 
                        while tabela_liqComp(i,1) == tabela_liqComp(x-1,1)
                            for k = 1 : 1 : tamanho_liq(2)
                                tabela_interpolMin(I,k) = tabela_liqComp(i,k);
                            end
                            I = I + 1;
                            i = i - 1;

                            % Eveitar ultrapassar o limite da tabela
                            if i <= 0
                               break; 
                            end 
                        end

                        % Desinverte matriz
                        tabela_interpolMin = InverteMatriz(tabela_interpolMin);

                        % Interpola entre uma tabela e outra
                        tabela_liqComp = InterpolacaoEntreTabelaCompletaVapor(tabela_liqComp,tabela_interpolMax,tabela_interpolMin,pres,x);                  

                        % Define a coluna para pesquisa
                        y = 2;

                        % Procura pelo valor de temperatura
                        while tabela_liqComp(x,y) < temp
                            x = x + 1;
                            y = 2;
                        end

                        % Interpola��o para caso n�o ache os valores
                        if tabela_liqComp(x,y) > temp
                            tabela_liqComp = InterpolacaoCompletaVapor(tabela_liqComp,temp,x,y);
                        end

                        % Ajuste a coluna de press�o
                        tabela_liqComp(x,1) = pres;
                        tabela_liqComp(x,2) = temp;

                        % Printa os resultados as propriedades
                        volu = tabela_liqComp(x,3);
                        ener = tabela_liqComp(x,4);
                        enta = tabela_liqComp(x,5);
                        entr = tabela_liqComp(x,6);               

                    else
                        errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                        return;
                    end
                    
                else % Estado de satura��o
                   
                    % Procurador na tabela
                    while tabela_satP(x,y) < pres
                        x = x + 1;
                        y  = 1;
                    end

                    % Interpola��o para caso n�o ache os valores
                    if tabela_satP(x,1) > pres
                        tabela_satP = InterpolacaoCompleta(tabela_satP,temp,x);
                    end

                    % Avalia a press�o achada
                    if temp > tabela_satP(x,2) %Caso vapor super aquecido
                        % Avalia os limites de press�o na tabela
                        if tabela_vapor(1,1) > pres || tabela_vapor(tamanho_vapor(1),1) < pres || temp > 380 
                            errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                            return;
                        end  

                        % Variaveis para procura
                        x = 1;
                        y = 1;

                        % Procurador na tabela
                        while tabela_vapor(x,y) < pres
                            x = x + 1;
                            y  = 1;
                        end                

                        % Defini o estado
                        esta = 'Vapor Super Aquecido'; %Estado

                        % Avalia a press�o
                        if pres == tabela_vapor(x,1)
                            % Variavel de pesquisa
                            p = x;

                            % Confere o limite da faixa de press�o igual
                            while tabela_vapor(p,1) == pres
                                p = p + 1;

                                % Evitar ultrapassar o limite da tabela
                                if p > tamanho_vapor(1)
                                   break; 
                                end 
                            end  

                            % Avalia a temperatura na ultima coordenada de press�o igual
                            if tabela_vapor(p-1,2) < temp
                                errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                                return;
                            end    

                            % Nova coluna para procura
                            y = 2;

                            % Procura temperatura
                            while tabela_vapor(x,y) < temp
                                x = x + 1;
                                y = 2;
                            end

                            % Interpola��o para caso n�o ache os valores
                            if tabela_vapor(x,y) > temp
                                tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,y);
                            end

                            % Define o t�tulo
                            if tabela_vapor(x-1,1) ~= tabela_vapor(x,1)                         
                                titu = 1;                     
                            else
                                titu = '--';                     
                            end

                            % Ajuste a coluna de press�o
                            tabela_vapor(x,1) = pres;
                            tabela_vapor(x,2) = temp;

                            % Propriedades
                            volu = tabela_vapor(x,3);
                            ener = tabela_vapor(x,4);
                            enta = tabela_vapor(x,5);
                            entr = tabela_vapor(x,6);

                        elseif pres < tabela_vapor(x,1)
                            % variaveis necess�rias
                            I = 1;
                            i = x;

                            % Confere o limite da faixa de press�o igual
                            while tabela_vapor(i,1) == tabela_vapor(x,1)
                                for k = 1 : 1 : tamanho_vapor(2)
                                    tabela_interpolMax(I,k) = tabela_vapor(i,k);
                                end
                                I = I + 1;
                                i = i + 1;

                                % Eveitar ultrapassar o limite da tabela
                                if i > tamanho_vapor(1)
                                   break; 
                                end 
                            end  

                            % Zera os contadores para pr�xima matriz
                            i = x-1;
                            I = 1;

                            % Delimita os valores iniciais e finais das temperaturas para interpolar para press�o menor 
                            while tabela_vapor(i,1) == tabela_vapor(x-1,1)
                                for k = 1 : 1 : tamanho_vapor(2)
                                    tabela_interpolMin(I,k) = tabela_vapor(i,k);
                                end
                                I = I + 1;
                                i = i - 1;

                                % Eveitar ultrapassar o limite da tabela
                                if i <= 0
                                   break; 
                                end 
                            end

                            % Desinverte matriz
                            tabela_interpolMin = InverteMatriz(tabela_interpolMin);

                            % Interpola entre uma tabela e outra
                            tabela_vapor = InterpolacaoEntreTabelaCompletaVapor(tabela_vapor,tabela_interpolMax,tabela_interpolMin,pres,x);                  

                            % Define a coluna para pesquisa
                            y = 2;

                            % Procura pelo valor de temperatura
                            while tabela_vapor(x,y) < temp
                                x = x + 1;
                                y = 2;
                            end

                            % Interpola��o para caso n�o ache os valores
                            if tabela_vapor(x,y) > temp
                                tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,temp,x,y);
                            end

                            if (tabela_vapor(x-1,1) ~= tabela_vapor(x,1)) && x > 1                     
                                titu = 1;                     
                            else
                                titu = '--';                     
                            end

                            % Ajuste a coluna de press�o
                            tabela_vapor(x,1) = pres;
                            tabela_vapor(x,2) = temp;

                            % Printa os resultados as propriedades
                            volu = tabela_vapor(x,3);
                            ener = tabela_vapor(x,4);
                            enta = tabela_vapor(x,5);
                            entr = tabela_vapor(x,6);               

                        else
                            errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                            return;
                        end                           

                    elseif temp < tabela_satP(x,2) %Caso l�quido comprimido
                        esta = 'L�quido Comprimido'; %Estado
                        titu = '--';

                        % Avalia os limites de press�o na tabela
                        if tabela_liqComp(1,1) > pres || tabela_liqComp(tamanho_liq(1),1) < pres
                            errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                            return;
                        end  

                        % Variaveis para procura
                        x = 1;
                        y = 1;

                        % Procurador na tabela
                        while tabela_liqComp(x,y) < pres
                            x = x + 1;
                            y  = 1;
                        end                

                        % Avalia a press�o
                        if pres == tabela_liqComp(x,1)
                            % Variavel de pesquisa
                            p = x;

                            % Confere o limite da faixa de press�o igual
                            while tabela_liqComp(p,1) == pres
                                p = p + 1;

                                % Evitar ultrapassar o limite da tabela
                                if p > tamanho_liq(1)
                                   break; 
                                end 
                            end  

                            % Avalia a temperatura na ultima coordenada de press�o igual
                            if tabela_liqComp(p-1,2) < temp
                                errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                                return;
                            end    

                            % Nova coluna para procura
                            y = 2;

                            % Procura temperatura
                            while tabela_liqComp(x,y) < temp
                                x = x + 1;
                                y = 2;
                            end

                            % Interpola��o para caso n�o ache os valores
                            if tabela_liqComp(x,y) > temp
                                tabela_liqComp = InterpolacaoCompletaVapor(tabela_liqComp,temp,x,y);
                            end

                            % Define o t�tulo
                            if tabela_liqComp(x-1,1) ~= tabela_liqComp(x,1)                         
                                titu = 1;                     
                            else
                                titu = '--';                     
                            end

                            % Ajuste a coluna de press�o
                            tabela_liqComp(x,1) = pres;
                            tabela_liqComp(x,2) = temp;

                            % Propriedades
                            volu = tabela_liqComp(x,3);
                            ener = tabela_liqComp(x,4);
                            enta = tabela_liqComp(x,5);
                            entr = tabela_liqComp(x,6);

                        elseif pres < tabela_liqComp(x,1)
                            % variaveis necess�rias
                            I = 1;
                            i = x;

                            % Confere o limite da faixa de press�o igual
                            while tabela_liqComp(i,1) == tabela_liqComp(x,1)
                                for k = 1 : 1 : tamanho_liq(2)
                                    tabela_interpolMax(I,k) = tabela_liqComp(i,k);
                                end
                                I = I + 1;
                                i = i + 1;

                                % Eveitar ultrapassar o limite da tabela
                                if i > tamanho_liq(1)
                                   break; 
                                end 
                            end  

                            % Zera os contadores para pr�xima matriz
                            i = x-1;
                            I = 1;

                            % Delimita os valores iniciais e finais das temperaturas para interpolar para press�o menor 
                            while tabela_liqComp(i,1) == tabela_liqComp(x-1,1)
                                for k = 1 : 1 : tamanho_liq(2)
                                    tabela_interpolMin(I,k) = tabela_liqComp(i,k);
                                end
                                I = I + 1;
                                i = i - 1;

                                % Eveitar ultrapassar o limite da tabela
                                if i <= 0
                                   break; 
                                end 
                            end

                            % Desinverte matriz
                            tabela_interpolMin = InverteMatriz(tabela_interpolMin);

                            % Interpola entre uma tabela e outra
                            tabela_liqComp = InterpolacaoEntreTabelaCompletaVapor(tabela_liqComp,tabela_interpolMax,tabela_interpolMin,pres,x);                  

                            % Define a coluna para pesquisa
                            y = 2;

                            % Procura pelo valor de temperatura
                            while tabela_liqComp(x,y) < temp
                                x = x + 1;
                                y = 2;
                            end

                            % Interpola��o para caso n�o ache os valores
                            if tabela_liqComp(x,y) > temp
                                tabela_liqComp = InterpolacaoCompletaVapor(tabela_liqComp,temp,x,y);
                            end

                            % Ajuste a coluna de press�o
                            tabela_liqComp(x,1) = pres;
                            tabela_liqComp(x,2) = temp;

                            % Printa os resultados as propriedades
                            volu = tabela_liqComp(x,3);
                            ener = tabela_liqComp(x,4);
                            enta = tabela_liqComp(x,5);
                            entr = tabela_liqComp(x,6);               

                        else
                            errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                            return;
                        end

                    else %Caso mistura
                        esta = 'Mistura'; %Estado
                        propri = menu('Escolha uma propriedade:','Titulo','Volume Espec�fico (m�/kg)','Energia Interna (kJ/kg)','Entalpia (kJ/kg)','Entropia (kJ/kg � K)');

                        % Verifica cancelamento
                        if propri == 0
                            return;
                        end

                        % Nova entrada
                        [volu , ener , enta , entr , titu] = NovaPropriedade(tabela_satP,x,y,propri);
                    end
                    
                end
        

            case 2 %Entrada como Volume Espec�fico
                %Entrada
                volu = prop_2;
                
                % Valida��o dos limites f�sicos das entradas
                if volu <= 0 || pres <= 0
                    errordlg('Erro err0205. Entradas fora dos limites f�sicos v�lidos.','ERRO');
                    return;
                end
                
                if pres > tabela_satP(tamanho_sat(1),1) % Liquido comprimido
                    
                    % Define estado e t�tulo
                    esta = 'L�quido Comprimido'; %Estado
                    titu = '--';

                    % Confere o limite da tabela
                    if volu > 0.0018729
                        errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                        return;
                    end

                    % Avalia os limites de press�o na tabela
                    if tabela_liqComp(1,1) > pres || tabela_liqComp(tamanho_liq(1),1) < pres
                        errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                        return;
                    end  

                    % Define a coluna para procura
                    y = 1;
                    x = 1;

                    % Procurador na tabela
                    while tabela_liqComp(x,y) < pres
                        x = x + 1;
                        y  = 1;
                    end                    

                    % Interpola caso n�o ache o valor
                    if pres < tabela_liqComp(x,1)
                        % variaveis necess�rias
                        I = 1;
                        i = x;

                        % Confere o limite da faixa de press�o igual
                        while tabela_liqComp(i,1) == tabela_liqComp(x,1)
                            for k = 1 : 1 : tamanho_liq(2)
                                tabela_interpolMax(I,k) = tabela_liqComp(i,k);
                            end
                            I = I + 1;
                            i = i + 1;

                            % Eveitar ultrapassar o limite da tabela
                            if i > tamanho_liq(1)
                               break; 
                            end 
                        end  

                        % Zera os contadores para pr�xima matriz
                        i = x-1;
                        I = 1;

                        % Delimita os valores iniciais e finais das temperaturas para interpolar para press�o menor 
                        while tabela_liqComp(i,1) == tabela_liqComp(x-1,1)
                            for k = 1 : 1 : tamanho_liq(2)
                                tabela_interpolMin(I,k) = tabela_liqComp(i,k);
                            end
                            I = I + 1;
                            i = i - 1;

                            % Eveitar ultrapassar o limite da tabela
                            if i <= 0
                               break; 
                            end 
                        end

                        % Desinverte matriz
                        tabela_interpolMin = InverteMatriz(tabela_interpolMin);

                        % Interpola entre uma tabela e outra
                        tabela_liqComp = InterpolacaoEntreTabelaCompletaVapor(tabela_liqComp,tabela_interpolMax,tabela_interpolMin,pres,x);                  

                    end

                    % Procura na nova coluna 
                    y = 3;

                    % Procurador na tabela
                    while tabela_liqComp(x,y) < volu
                        x = x + 1;
                        y = 3;
                    end                   

                    % Interpola��o para caso n�o ache os valores
                    if tabela_liqComp(x,y) > volu
                        % Calculo da temperatura
%                         temp = Interpolacao(tabela_liqComp(x-1,y),tabela_liqComp(x,y),tabela_liqComp(x-1,2),tabela_liqComp(x,2),volu);

                        % Interpola��o
                        tabela_liqComp = InterpolacaoCompletaVapor(tabela_liqComp,volu,x,y);
                    end

                    % Printa os resultados as propriedades
                    temp = tabela_liqComp(x,2);
%                     volu = tabela_liqComp(x,3);
                    ener = tabela_liqComp(x,4);
                    enta = tabela_liqComp(x,5);
                    entr = tabela_liqComp(x,6);
                    
                else % Estado de satura��o
                    
                    % Define a coluna para procura
                    y = 1;
                    x = 1;

                    % Procurador na tabela
                    while tabela_satP(x,y) < pres
                        x = x + 1;
                        y = 1;
                    end

                    % Interpola��o para caso n�o ache os valores
                    if tabela_satP(x,1) > pres
                        tabela_satP = InterpolacaoCompleta(tabela_satP,pres,x);
                    end

                    % Avalia a segunda propriedade
                    if volu > tabela_satP(x,4) %Caso vapor super aquecido                  
                        % Confere o limite da tabela
                        if volu > 0.72610
                            errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                            return;
                        end

                        % Avalia os limites de press�o na tabela
                        if tabela_vapor(1,1) > pres || tabela_vapor(tamanho_vapor(1),1) < pres
                            errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                            return;
                        end  

                        % Define a coluna para procura
                        y = 1;
                        x = 1;

                        % Procurador na tabela
                        while tabela_vapor(x,y) < pres
                            x = x + 1;
                            y  = 1;
                        end                    

                        % Interpola caso n�o ache o valor
                        if pres < tabela_vapor(x,1)
                            % variaveis necess�rias
                            I = 1;
                            i = x;

                            % Confere o limite da faixa de press�o igual
                            while tabela_vapor(i,1) == tabela_vapor(x,1)
                                for k = 1 : 1 : tamanho_vapor(2)
                                    tabela_interpolMax(I,k) = tabela_vapor(i,k);
                                end
                                I = I + 1;
                                i = i + 1;

                                % Eveitar ultrapassar o limite da tabela
                                if i > tamanho_vapor(1)
                                   break; 
                                end 
                            end  

                            % Zera os contadores para pr�xima matriz
                            i = x-1;
                            I = 1;

                            % Delimita os valores iniciais e finais das temperaturas para interpolar para press�o menor 
                            while tabela_vapor(i,1) == tabela_vapor(x-1,1)
                                for k = 1 : 1 : tamanho_vapor(2)
                                    tabela_interpolMin(I,k) = tabela_vapor(i,k);
                                end
                                I = I + 1;
                                i = i - 1;

                                % Eveitar ultrapassar o limite da tabela
                                if i <= 0
                                   break; 
                                end 
                            end

                            % Desinverte matriz
                            tabela_interpolMin = InverteMatriz(tabela_interpolMin);

                            % Interpola entre uma tabela e outra
                            tabela_vapor = InterpolacaoEntreTabelaCompletaVapor(tabela_vapor,tabela_interpolMax,tabela_interpolMin,pres,x);                  

                        end

                        % Procura na nova coluna 
                        y = 3;

                        % Procurador na tabela
                        while tabela_vapor(x,y) < volu
                            x = x + 1;
                            y = 3;
                        end                   

                        % Interpola��o para caso n�o ache os valores
                        if tabela_vapor(x,y) > volu
                            % Calculo da temperatura
    %                         temp = Interpolacao(tabela_vapor(x-1,y),tabela_vapor(x,y),tabela_vapor(x-1,2),tabela_vapor(x,2),volu);

                            % Interpola��o
                            tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,volu,x,y);
                        end

                        % Defini o estado e o t�tulo
                        esta = 'Vapor Super Aquecido'; %Estado
                        if tabela_vapor(x-1,1) ~= tabela_vapor(x,1)                         
                            titu = 1;                     
                        else
                            titu = '--';                     
                        end

                        % Printa os resultados as propriedades
                        temp = tabela_vapor(x,2);
    %                     volu = tabela_vapor(x,3);
                        ener = tabela_vapor(x,4);
                        enta = tabela_vapor(x,5);
                        entr = tabela_vapor(x,6);

                    elseif volu == tabela_satP(x,4) %Caso Vapor saturado
                        % Printa os resultados as propriedades
    %                     pres = tabela_satP(x,1);
                        temp = tabela_satP(x,2);
    %                     volu = tabela_satP(x,4);
                        ener = tabela_satP(x,7);
                        enta = tabela_satP(x,10);
                        entr = tabela_satP(x,13);
                        titu = 1;
                        esta = 'Vapor Saturado';

                    elseif volu <= tabela_satP(x,3) %Caso l�quido comprimido
                        esta = 'L�quido Comprimido'; %Estado
                        titu = 0;

                        % Confere o limite da tabela
                        if volu > 0.0018729
                            errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                            return;
                        end

                        % Avalia os limites de press�o na tabela
                        if tabela_liqComp(1,1) > pres || tabela_liqComp(tamanho_liq(1),1) < pres
                            errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                            return;
                        end  

                        % Define a coluna para procura
                        y = 1;
                        x = 1;

                        % Procurador na tabela
                        while tabela_liqComp(x,y) < pres
                            x = x + 1;
                            y  = 1;
                        end                    

                        % Interpola caso n�o ache o valor
                        if pres < tabela_liqComp(x,1)
                            % variaveis necess�rias
                            I = 1;
                            i = x;

                            % Confere o limite da faixa de press�o igual
                            while tabela_liqComp(i,1) == tabela_liqComp(x,1)
                                for k = 1 : 1 : tamanho_liq(2)
                                    tabela_interpolMax(I,k) = tabela_liqComp(i,k);
                                end
                                I = I + 1;
                                i = i + 1;

                                % Eveitar ultrapassar o limite da tabela
                                if i > tamanho_liq(1)
                                   break; 
                                end 
                            end  

                            % Zera os contadores para pr�xima matriz
                            i = x-1;
                            I = 1;

                            % Delimita os valores iniciais e finais das temperaturas para interpolar para press�o menor 
                            while tabela_liqComp(i,1) == tabela_liqComp(x-1,1)
                                for k = 1 : 1 : tamanho_liq(2)
                                    tabela_interpolMin(I,k) = tabela_liqComp(i,k);
                                end
                                I = I + 1;
                                i = i - 1;

                                % Eveitar ultrapassar o limite da tabela
                                if i <= 0
                                   break; 
                                end 
                            end

                            % Desinverte matriz
                            tabela_interpolMin = InverteMatriz(tabela_interpolMin);

                            % Interpola entre uma tabela e outra
                            tabela_liqComp = InterpolacaoEntreTabelaCompletaVapor(tabela_liqComp,tabela_interpolMax,tabela_interpolMin,pres,x);                  

                        end

                        % Procura na nova coluna 
                        y = 3;

                        % Procurador na tabela
                        while tabela_liqComp(x,y) < volu
                            x = x + 1;
                            y = 3;
                        end                   

                        % Interpola��o para caso n�o ache os valores
                        if tabela_liqComp(x,y) > volu
                            % Calculo da temperatura
    %                         temp = Interpolacao(tabela_liqComp(x-1,y),tabela_liqComp(x,y),tabela_liqComp(x-1,2),tabela_liqComp(x,2),volu);

                            % Interpola��o
                            tabela_liqComp = InterpolacaoCompletaVapor(tabela_liqComp,volu,x,y);
                        end

                        % Printa os resultados as propriedades
                        temp = tabela_liqComp(x,2);
    %                     volu = tabela_liqComp(x,3);
                        ener = tabela_liqComp(x,4);
                        enta = tabela_liqComp(x,5);
                        entr = tabela_liqComp(x,6);                     

                    else %Caso mistura
                        esta = 'Mistura'; %Estado

                        % Calculo do t�tulo e das propriedades com t�tulo
                        titu = (volu-tabela_satP(x,3)) / (tabela_satP(x,4) - tabela_satP(x,3));
                        temp = tabela_satP(x,2);
    %                     volu = CalculoComTitulo(titu,tabela_satP(x,3),tabela_satP(x,4));
                        ener = CalculoComTitulo(titu,tabela_satP(x,5),tabela_satP(x,7));
                        enta = CalculoComTitulo(titu,tabela_satP(x,8),tabela_satP(x,10));
                        entr = CalculoComTitulo(titu,tabela_satP(x,11),tabela_satP(x,13));

                    end  
                end          

            case 3 %Entrada como Energia Interna
                % Propriedade
                ener = prop_2;
                
                % Valida��o dos limites f�sicos das entradas
                if ener <= 0 || pres <= 0
                    errordlg('Erro err0205. Entradas fora dos limites f�sicos v�lidos.','ERRO');
                    return;
                end  
                
                if pres > tabela_satP(tamanho_sat(1),1) % Liquido comprimido
                    esta = 'L�quido Comprimido'; %Estado
                    titu = '--';
                    
                    % Confere o limite da tabela
                    if ener > 1782.0
                        errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                        return;
                    end

                    % Avalia os limites de press�o na tabela
                    if tabela_liqComp(1,1) > pres || tabela_liqComp(tamanho_liq(1),1) < pres
                        errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                        return;
                    end  

                    % Define a coluna para procura
                    y = 1;
                    x = 1;

                    % Procurador na tabela
                    while tabela_liqComp(x,y) < pres
                        x = x + 1;
                        y  = 1;
                    end                    

                    % Interpola caso n�o ache o valor
                    if pres < tabela_liqComp(x,1)
                        % variaveis necess�rias
                        I = 1;
                        i = x;

                        % Confere o limite da faixa de press�o igual
                        while tabela_liqComp(i,1) == tabela_liqComp(x,1)
                            for k = 1 : 1 : tamanho_liq(2)
                                tabela_interpolMax(I,k) = tabela_liqComp(i,k);
                            end
                            I = I + 1;
                            i = i + 1;

                            % Eveitar ultrapassar o limite da tabela
                            if i > tamanho_liq(1)
                               break; 
                            end 
                        end  

                        % Zera os contadores para pr�xima matriz
                        i = x-1;
                        I = 1;

                        % Delimita os valores iniciais e finais das temperaturas para interpolar para press�o menor 
                        while tabela_liqComp(i,1) == tabela_liqComp(x-1,1)
                            for k = 1 : 1 : tamanho_liq(2)
                                tabela_interpolMin(I,k) = tabela_liqComp(i,k);
                            end
                            I = I + 1;
                            i = i - 1;

                            % Eveitar ultrapassar o limite da tabela
                            if i <= 0
                               break; 
                            end 
                        end

                        % Desinverte matriz
                        tabela_interpolMin = InverteMatriz(tabela_interpolMin);

                        % Interpola entre uma tabela e outra
                        tabela_liqComp = InterpolacaoEntreTabelaCompletaVapor(tabela_liqComp,tabela_interpolMax,tabela_interpolMin,pres,x);                  

                    end

                    % Procura na nova coluna 
                    y = 4;

                    % Procurador na tabela
                    while tabela_liqComp(x,y) < ener
                        x = x + 1;
                        y = 4;
                    end                   

                    % Interpola��o para caso n�o ache os valores
                    if tabela_liqComp(x,y) > ener
                        % Calculo da temperatura
%                         temp = Interpolacao(tabela_liqComp(x-1,y),tabela_liqComp(x,y),tabela_liqComp(x-1,2),tabela_liqComp(x,2),volu);

                        % Interpola��o
                        tabela_liqComp = InterpolacaoCompletaVapor(tabela_liqComp,ener,x,y);
                    end

                    % Printa os resultados as propriedades
                    temp = tabela_liqComp(x,2);
                    volu = tabela_liqComp(x,3);
%                     ener = tabela_liqComp(x,4);
                    enta = tabela_liqComp(x,5);
                    entr = tabela_liqComp(x,6);
                    
                else %Saturado
                    
                   % Define a coluna para procura
                    y = 1;
                    x = 1;

                    % Procurador na tabela
                    while tabela_satP(x,y) < pres
                        x = x + 1;
                        y = 1;
                    end

                    % Interpola��o para caso n�o ache os valores
                    if tabela_satP(x,1) > pres
                        tabela_satP = InterpolacaoCompleta(tabela_satP,pres,x);
                    end

                    % Avalia a segunda propriedade
                    if ener > tabela_satP(x,7) %Caso vapor super aquecido                  
                        % Confere o limite da tabela
                        if ener > 4685.8
                            errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                            return;
                        end

                        % Avalia os limites de press�o na tabela
                        if tabela_vapor(1,1) > pres || tabela_vapor(tamanho_vapor(1),1) < pres
                            errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                            return;
                        end  

                        % Define a coluna para procura
                        y = 1;
                        x = 1;

                        % Procurador na tabela
                        while tabela_vapor(x,y) < pres
                            x = x + 1;
                            y  = 1;
                        end                    

                        % Interpola caso n�o ache o valor
                        if pres < tabela_vapor(x,1)
                            % variaveis necess�rias
                            I = 1;
                            i = x;

                            % Confere o limite da faixa de press�o igual
                            while tabela_vapor(i,1) == tabela_vapor(x,1)
                                for k = 1 : 1 : tamanho_vapor(2)
                                    tabela_interpolMax(I,k) = tabela_vapor(i,k);
                                end
                                I = I + 1;
                                i = i + 1;

                                % Eveitar ultrapassar o limite da tabela
                                if i > tamanho_vapor(1)
                                   break; 
                                end 
                            end  

                            % Zera os contadores para pr�xima matriz
                            i = x-1;
                            I = 1;

                            % Delimita os valores iniciais e finais das temperaturas para interpolar para press�o menor 
                            while tabela_vapor(i,1) == tabela_vapor(x-1,1)
                                for k = 1 : 1 : tamanho_vapor(2)
                                    tabela_interpolMin(I,k) = tabela_vapor(i,k);
                                end
                                I = I + 1;
                                i = i - 1;

                                % Eveitar ultrapassar o limite da tabela
                                if i <= 0
                                   break; 
                                end 
                            end

                            % Desinverte matriz
                            tabela_interpolMin = InverteMatriz(tabela_interpolMin);

                            % Interpola entre uma tabela e outra
                            tabela_vapor = InterpolacaoEntreTabelaCompletaVapor(tabela_vapor,tabela_interpolMax,tabela_interpolMin,pres,x);                  

                        end

                        % Procura na nova coluna 
                        y = 4;

                        % Procurador na tabela
                        while tabela_vapor(x,y) < ener
                            x = x + 1;
                            y = 4;
                        end                   

                        % Interpola��o para caso n�o ache os valores
                        if tabela_vapor(x,y) > ener
                            % Calculo da temperatura
    %                         temp = Interpolacao(tabela_vapor(x-1,y),tabela_vapor(x,y),tabela_vapor(x-1,2),tabela_vapor(x,2),volu);

                            % Interpola��o
                            tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,ener,x,y);
                        end

                        % Defini o estado e o t�tulo
                        esta = 'Vapor Super Aquecido'; %Estado
                        if tabela_vapor(x-1,1) ~= tabela_vapor(x,1)                         
                            titu = 1;                     
                        else
                            titu = '--';                     
                        end

                        % Printa os resultados as propriedades
                        temp = tabela_vapor(x,2);
                        volu = tabela_vapor(x,3);
    %                     ener = tabela_vapor(x,4);
                        enta = tabela_vapor(x,5);
                        entr = tabela_vapor(x,6);

                    elseif ener == tabela_satP(x,7) %Caso Vapor saturado
                        % Printa os resultados as propriedades
    %                     pres = tabela_satP(x,1);
                        temp = tabela_satP(x,2);
                        volu = tabela_satP(x,4);
    %                     ener = tabela_satP(x,7);
                        enta = tabela_satP(x,10);
                        entr = tabela_satP(x,13);
                        titu = 1;
                        esta = 'Vapor Saturado';

                    elseif ener <= tabela_satP(x,5) %Caso l�quido comprimido
                        esta = 'L�quido Comprimido'; %Estado
                        titu = 0;

                        % Confere o limite da tabela
                        if ener > 1782.0
                            errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                            return;
                        end

                        % Avalia os limites de press�o na tabela
                        if tabela_liqComp(1,1) > pres || tabela_liqComp(tamanho_liq(1),1) < pres
                            errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                            return;
                        end  

                        % Define a coluna para procura
                        y = 1;
                        x = 1;

                        % Procurador na tabela
                        while tabela_liqComp(x,y) < pres
                            x = x + 1;
                            y  = 1;
                        end                    

                        % Interpola caso n�o ache o valor
                        if pres < tabela_liqComp(x,1)
                            % variaveis necess�rias
                            I = 1;
                            i = x;

                            % Confere o limite da faixa de press�o igual
                            while tabela_liqComp(i,1) == tabela_liqComp(x,1)
                                for k = 1 : 1 : tamanho_liq(2)
                                    tabela_interpolMax(I,k) = tabela_liqComp(i,k);
                                end
                                I = I + 1;
                                i = i + 1;

                                % Eveitar ultrapassar o limite da tabela
                                if i > tamanho_liq(1)
                                   break; 
                                end 
                            end  

                            % Zera os contadores para pr�xima matriz
                            i = x-1;
                            I = 1;

                            % Delimita os valores iniciais e finais das temperaturas para interpolar para press�o menor 
                            while tabela_liqComp(i,1) == tabela_liqComp(x-1,1)
                                for k = 1 : 1 : tamanho_liq(2)
                                    tabela_interpolMin(I,k) = tabela_liqComp(i,k);
                                end
                                I = I + 1;
                                i = i - 1;

                                % Eveitar ultrapassar o limite da tabela
                                if i <= 0
                                   break; 
                                end 
                            end

                            % Desinverte matriz
                            tabela_interpolMin = InverteMatriz(tabela_interpolMin);

                            % Interpola entre uma tabela e outra
                            tabela_liqComp = InterpolacaoEntreTabelaCompletaVapor(tabela_liqComp,tabela_interpolMax,tabela_interpolMin,pres,x);                  

                        end

                        % Procura na nova coluna 
                        y = 4;

                        % Procurador na tabela
                        while tabela_liqComp(x,y) < ener
                            x = x + 1;
                            y = 4;
                        end                   

                        % Interpola��o para caso n�o ache os valores
                        if tabela_liqComp(x,y) > ener
                            % Calculo da temperatura
    %                         temp = Interpolacao(tabela_liqComp(x-1,y),tabela_liqComp(x,y),tabela_liqComp(x-1,2),tabela_liqComp(x,2),volu);

                            % Interpola��o
                            tabela_liqComp = InterpolacaoCompletaVapor(tabela_liqComp,ener,x,y);
                        end

                        % Printa os resultados as propriedades
                        temp = tabela_liqComp(x,2);
                        volu = tabela_liqComp(x,3);
    %                     ener = tabela_liqComp(x,4);
                        enta = tabela_liqComp(x,5);
                        entr = tabela_liqComp(x,6);                   

                    else %Caso mistura
                        esta = 'Mistura'; %Estado

                        % Calculo do t�tulo e das propriedades com t�tulo
                        titu = (ener-tabela_satP(x,5)) / tabela_satP(x,6);
                        temp = tabela_satP(x,2);
                        volu = CalculoComTitulo(titu,tabela_satP(x,3),tabela_satP(x,4));
    %                     ener = CalculoComTitulo(titu,tabela_satP(x,5),tabela_satP(x,7));
                        enta = CalculoComTitulo(titu,tabela_satP(x,8),tabela_satP(x,10));
                        entr = CalculoComTitulo(titu,tabela_satP(x,11),tabela_satP(x,13));

                    end   
                    
                end               
                
            case 4 %Entrada como Entalpia
                % Propriedade
                enta = prop_2;

                % Valida��o dos limites f�sicos das entradas
                if enta <= 0 || pres <= 0
                    errordlg('Erro err0205. Entradas fora dos limites f�sicos v�lidos.','ERRO');
                    return;
                end        
                
                if pres > tabela_satP(tamanho_sat(1),1) % Liquido comprimido
                    
                    esta = 'L�quido Comprimido'; %Estado
                    titu = '--';
                    
                    % Confere o limite da tabela
                    if enta > 1838.2
                        errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                        return;
                    end

                    % Avalia os limites de press�o na tabela
                    if tabela_liqComp(1,1) > pres || tabela_liqComp(tamanho_liq(1),1) < pres
                        errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                        return;
                    end  

                    % Define a coluna para procura
                    y = 1;
                    x = 1;

                    % Procurador na tabela
                    while tabela_liqComp(x,y) < pres
                        x = x + 1;
                        y  = 1;
                    end                    

                    % Interpola caso n�o ache o valor
                    if pres < tabela_liqComp(x,1)
                        % variaveis necess�rias
                        I = 1;
                        i = x;

                        % Confere o limite da faixa de press�o igual
                        while tabela_liqComp(i,1) == tabela_liqComp(x,1)
                            for k = 1 : 1 : tamanho_liq(2)
                                tabela_interpolMax(I,k) = tabela_liqComp(i,k);
                            end
                            I = I + 1;
                            i = i + 1;

                            % Eveitar ultrapassar o limite da tabela
                            if i > tamanho_liq(1)
                               break; 
                            end 
                        end  

                        % Zera os contadores para pr�xima matriz
                        i = x-1;
                        I = 1;

                        % Delimita os valores iniciais e finais das temperaturas para interpolar para press�o menor 
                        while tabela_liqComp(i,1) == tabela_liqComp(x-1,1)
                            for k = 1 : 1 : tamanho_liq(2)
                                tabela_interpolMin(I,k) = tabela_liqComp(i,k);
                            end
                            I = I + 1;
                            i = i - 1;

                            % Eveitar ultrapassar o limite da tabela
                            if i <= 0
                               break; 
                            end 
                        end

                        % Desinverte matriz
                        tabela_interpolMin = InverteMatriz(tabela_interpolMin);

                        % Interpola entre uma tabela e outra
                        tabela_liqComp = InterpolacaoEntreTabelaCompletaVapor(tabela_liqComp,tabela_interpolMax,tabela_interpolMin,pres,x);                  

                    end

                    % Procura na nova coluna 
                    y = 5;

                    % Procurador na tabela
                    while tabela_liqComp(x,y) < enta
                        x = x + 1;
                        y = 5;
                    end                   

                    % Interpola��o para caso n�o ache os valores
                    if tabela_liqComp(x,y) > enta
                        % Calculo da temperatura
%                         temp = Interpolacao(tabela_liqComp(x-1,y),tabela_liqComp(x,y),tabela_liqComp(x-1,2),tabela_liqComp(x,2),volu);

                        % Interpola��o
                        tabela_liqComp = InterpolacaoCompletaVapor(tabela_liqComp,enta,x,y);
                    end

                    % Printa os resultados as propriedades
                    temp = tabela_liqComp(x,2);
                    volu = tabela_liqComp(x,3);
                    ener = tabela_liqComp(x,4);
%                     enta = tabela_liqComp(x,5);
                    entr = tabela_liqComp(x,6);
                    
                else
                   
                   % Define a coluna para procura
                    y = 1;
                    x = 1;

                    % Procurador na tabela
                    while tabela_satP(x,y) < pres
                        x = x + 1;
                        y = 1;
                    end

                    % Interpola��o para caso n�o ache os valores
                    if tabela_satP(x,1) > pres
                        tabela_satP = InterpolacaoCompleta(tabela_satP,pres,x);
                    end

                    % Avalia a segunda propriedade
                    if enta > tabela_satP(x,10) %Caso vapor super aquecido                  
                        % Confere o limite da tabela
                        if enta > 5411.9
                            errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                            return;
                        end

                        % Avalia os limites de press�o na tabela
                        if tabela_vapor(1,1) > pres || tabela_vapor(tamanho_vapor(1),1) < pres
                            errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                            return;
                        end  

                        % Define a coluna para procura
                        y = 1;
                        x = 1;

                        % Procurador na tabela
                        while tabela_vapor(x,y) < pres
                            x = x + 1;
                            y  = 1;
                        end                    

                        % Interpola caso n�o ache o valor
                        if pres < tabela_vapor(x,1)
                            % variaveis necess�rias
                            I = 1;
                            i = x;

                            % Confere o limite da faixa de press�o igual
                            while tabela_vapor(i,1) == tabela_vapor(x,1)
                                for k = 1 : 1 : tamanho_vapor(2)
                                    tabela_interpolMax(I,k) = tabela_vapor(i,k);
                                end
                                I = I + 1;
                                i = i + 1;

                                % Eveitar ultrapassar o limite da tabela
                                if i > tamanho_vapor(1)
                                   break; 
                                end 
                            end  

                            % Zera os contadores para pr�xima matriz
                            i = x-1;
                            I = 1;

                            % Delimita os valores iniciais e finais das temperaturas para interpolar para press�o menor 
                            while tabela_vapor(i,1) == tabela_vapor(x-1,1)
                                for k = 1 : 1 : tamanho_vapor(2)
                                    tabela_interpolMin(I,k) = tabela_vapor(i,k);
                                end
                                I = I + 1;
                                i = i - 1;

                                % Eveitar ultrapassar o limite da tabela
                                if i <= 0
                                   break; 
                                end 
                            end

                            % Desinverte matriz
                            tabela_interpolMin = InverteMatriz(tabela_interpolMin);

                            % Interpola entre uma tabela e outra
                            tabela_vapor = InterpolacaoEntreTabelaCompletaVapor(tabela_vapor,tabela_interpolMax,tabela_interpolMin,pres,x);                  

                        end

                        % Procura na nova coluna 
                        y = 5;

                        % Procurador na tabela
                        while tabela_vapor(x,y) < enta
                            x = x + 1;
                            y = 5;
                        end                   

                        % Interpola��o para caso n�o ache os valores
                        if tabela_vapor(x,y) > enta
                            % Calculo da temperatura
    %                         temp = Interpolacao(tabela_vapor(x-1,y),tabela_vapor(x,y),tabela_vapor(x-1,2),tabela_vapor(x,2),volu);

                            % Interpola��o
                            tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,enta,x,y);
                        end

                        % Defini o estado e o t�tulo
                        esta = 'Vapor Super Aquecido'; %Estado
                        if tabela_vapor(x-1,1) ~= tabela_vapor(x,1)                         
                            titu = 1;                     
                        else
                            titu = '--';                     
                        end

                        % Printa os resultados as propriedades
                        temp = tabela_vapor(x,2);
                        volu = tabela_vapor(x,3);
                        ener = tabela_vapor(x,4);
    %                     enta = tabela_vapor(x,5);
                        entr = tabela_vapor(x,6);

                    elseif enta == tabela_satP(x,10) %Caso Vapor saturado
                        % Printa os resultados as propriedades
    %                     pres = tabela_satP(x,1);
                        temp = tabela_satP(x,2);
                        volu = tabela_satP(x,4);
                        ener = tabela_satP(x,7);
    %                     enta = tabela_satP(x,10);
                        entr = tabela_satP(x,13);
                        titu = 1;
                        esta = 'Vapor Saturado';

                    elseif enta <= tabela_satP(x,8) %Caso l�quido comprimido
                        esta = 'L�quido Comprimido'; %Estado
                        titu = 0;

                        % Confere o limite da tabela
                        if enta > 5411.9
                            errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                            return;
                        end

                        % Avalia os limites de press�o na tabela
                        if tabela_liqComp(1,1) > pres || tabela_liqComp(tamanho_liq(1),1) < pres
                            errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                            return;
                        end  

                        % Define a coluna para procura
                        y = 1;
                        x = 1;

                        % Procurador na tabela
                        while tabela_liqComp(x,y) < pres
                            x = x + 1;
                            y  = 1;
                        end                    

                        % Interpola caso n�o ache o valor
                        if pres < tabela_liqComp(x,1)
                            % variaveis necess�rias
                            I = 1;
                            i = x;

                            % Confere o limite da faixa de press�o igual
                            while tabela_liqComp(i,1) == tabela_liqComp(x,1)
                                for k = 1 : 1 : tamanho_liq(2)
                                    tabela_interpolMax(I,k) = tabela_liqComp(i,k);
                                end
                                I = I + 1;
                                i = i + 1;

                                % Eveitar ultrapassar o limite da tabela
                                if i > tamanho_liq(1)
                                   break; 
                                end 
                            end  

                            % Zera os contadores para pr�xima matriz
                            i = x-1;
                            I = 1;

                            % Delimita os valores iniciais e finais das temperaturas para interpolar para press�o menor 
                            while tabela_liqComp(i,1) == tabela_liqComp(x-1,1)
                                for k = 1 : 1 : tamanho_liq(2)
                                    tabela_interpolMin(I,k) = tabela_liqComp(i,k);
                                end
                                I = I + 1;
                                i = i - 1;

                                % Eveitar ultrapassar o limite da tabela
                                if i <= 0
                                   break; 
                                end 
                            end

                            % Desinverte matriz
                            tabela_interpolMin = InverteMatriz(tabela_interpolMin);

                            % Interpola entre uma tabela e outra
                            tabela_liqComp = InterpolacaoEntreTabelaCompletaVapor(tabela_liqComp,tabela_interpolMax,tabela_interpolMin,pres,x);                  

                        end

                        % Procura na nova coluna 
                        y = 5;

                        % Procurador na tabela
                        while tabela_liqComp(x,y) < enta
                            x = x + 1;
                            y = 5;
                        end                   

                        % Interpola��o para caso n�o ache os valores
                        if tabela_liqComp(x,y) > enta
                            % Calculo da temperatura
    %                         temp = Interpolacao(tabela_liqComp(x-1,y),tabela_liqComp(x,y),tabela_liqComp(x-1,2),tabela_liqComp(x,2),volu);

                            % Interpola��o
                            tabela_liqComp = InterpolacaoCompletaVapor(tabela_liqComp,enta,x,y);
                        end

                        % Printa os resultados as propriedades
                        temp = tabela_liqComp(x,2);
                        volu = tabela_liqComp(x,3);
                        ener = tabela_liqComp(x,4);
    %                     enta = tabela_liqComp(x,5);
                        entr = tabela_liqComp(x,6);    

                    else %Caso mistura
                        esta = 'Mistura'; %Estado

                        % Calculo do t�tulo e das propriedades com t�tulo
                        titu = (enta-tabela_satP(x,8)) / tabela_satP(x,9);
                        temp = tabela_satP(x,2);
                        volu = CalculoComTitulo(titu,tabela_satP(x,3),tabela_satP(x,4));
                        ener = CalculoComTitulo(titu,tabela_satP(x,5),tabela_satP(x,7));
    %                     enta = CalculoComTitulo(titu,tabela_satP(x,8),tabela_satP(x,10));
                        entr = CalculoComTitulo(titu,tabela_satP(x,11),tabela_satP(x,13));

                    end 
                    
                end              

            case 5 %Entrada como Entropia
                % Propriedade
                entr = prop_2;

                % Valida��o dos limites f�sicos das entradas
                if entr < -0.0010 || pres <= 0
                    errordlg('Erro err0205. Entradas fora dos limites f�sicos v�lidos.','ERRO');
                    return;
                end
                
                if pres > tabela_satP(tamanho_sat(1),1) % Liquido comprimido

                    esta = 'L�quido Comprimido'; %Estado
                    titu = '--';

                    % Confere o limite da tabela
                    if entr > 4.0026
                        errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                        return;
                    end

                    % Avalia os limites de press�o na tabela
                    if tabela_liqComp(1,1) > pres || tabela_liqComp(tamanho_liq(1),1) < pres
                        errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                        return;
                    end  

                    % Define a coluna para procura
                    y = 1;
                    x = 1;

                    % Procurador na tabela
                    while tabela_liqComp(x,y) < pres
                        x = x + 1;
                        y  = 1;
                    end                    

                    % Interpola caso n�o ache o valor
                    if pres < tabela_liqComp(x,1)
                        % variaveis necess�rias
                        I = 1;
                        i = x;

                        % Confere o limite da faixa de press�o igual
                        while tabela_liqComp(i,1) == tabela_liqComp(x,1)
                            for k = 1 : 1 : tamanho_liq(2)
                                tabela_interpolMax(I,k) = tabela_liqComp(i,k);
                            end
                            I = I + 1;
                            i = i + 1;

                            % Eveitar ultrapassar o limite da tabela
                            if i > tamanho_liq(1)
                               break; 
                            end 
                        end  

                        % Zera os contadores para pr�xima matriz
                        i = x-1;
                        I = 1;

                        % Delimita os valores iniciais e finais das temperaturas para interpolar para press�o menor 
                        while tabela_liqComp(i,1) == tabela_liqComp(x-1,1)
                            for k = 1 : 1 : tamanho_liq(2)
                                tabela_interpolMin(I,k) = tabela_liqComp(i,k);
                            end
                            I = I + 1;
                            i = i - 1;

                            % Eveitar ultrapassar o limite da tabela
                            if i <= 0
                               break; 
                            end 
                        end

                        % Desinverte matriz
                        tabela_interpolMin = InverteMatriz(tabela_interpolMin);

                        % Interpola entre uma tabela e outra
                        tabela_liqComp = InterpolacaoEntreTabelaCompletaVapor(tabela_liqComp,tabela_interpolMax,tabela_interpolMin,pres,x);                  

                    end

                    % Procura na nova coluna 
                    y = 6;

                    % Procurador na tabela
                    while tabela_liqComp(x,y) < entr
                        x = x + 1;
                        y = 6;
                    end                   

                    % Interpola��o para caso n�o ache os valores
                    if tabela_liqComp(x,y) > entr
                        % Calculo da temperatura
%                         temp = Interpolacao(tabela_liqComp(x-1,y),tabela_liqComp(x,y),tabela_liqComp(x-1,2),tabela_liqComp(x,2),volu);

                        % Interpola��o
                        tabela_liqComp = InterpolacaoCompletaVapor(tabela_liqComp,entr,x,y);
                    end

                    % Printa os resultados as propriedades
                    temp = tabela_liqComp(x,2);
                    volu = tabela_liqComp(x,3);
                    ener = tabela_liqComp(x,4);
                    enta = tabela_liqComp(x,5);
%                     entr = tabela_liqComp(x,6);
                    
                else %Estado de satura��o
                    
                    % Define a coluna para procura
                    y = 1;
                    x = 1;

                    % Procurador na tabela
                    while tabela_satP(x,y) < pres
                        x = x + 1;
                        y = 1;
                    end

                    % Interpola��o para caso n�o ache os valores
                    if tabela_satP(x,1) > pres
                        tabela_satP = InterpolacaoCompleta(tabela_satP,pres,x);
                    end

                    % Avalia a segunda propriedade
                    if entr > tabela_satP(x,13) %Caso vapor super aquecido                  
                        % Confere o limite da tabela
                        if entr > 11.5857
                            errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                            return;
                        end

                        % Avalia os limites de press�o na tabela
                        if tabela_vapor(1,1) > pres || tabela_vapor(tamanho_vapor(1),1) < pres
                            errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                            return;
                        end  

                        % Define a coluna para procura
                        y = 1;
                        x = 1;

                        % Procurador na tabela
                        while tabela_vapor(x,y) < pres
                            x = x + 1;
                            y  = 1;
                        end                    

                        % Interpola caso n�o ache o valor
                        if pres < tabela_vapor(x,1)
                            % variaveis necess�rias
                            I = 1;
                            i = x;

                            % Confere o limite da faixa de press�o igual
                            while tabela_vapor(i,1) == tabela_vapor(x,1)
                                for k = 1 : 1 : tamanho_vapor(2)
                                    tabela_interpolMax(I,k) = tabela_vapor(i,k);
                                end
                                I = I + 1;
                                i = i + 1;

                                % Eveitar ultrapassar o limite da tabela
                                if i > tamanho_vapor(1)
                                   break; 
                                end 
                            end  

                            % Zera os contadores para pr�xima matriz
                            i = x-1;
                            I = 1;

                            % Delimita os valores iniciais e finais das temperaturas para interpolar para press�o menor 
                            while tabela_vapor(i,1) == tabela_vapor(x-1,1)
                                for k = 1 : 1 : tamanho_vapor(2)
                                    tabela_interpolMin(I,k) = tabela_vapor(i,k);
                                end
                                I = I + 1;
                                i = i - 1;

                                % Eveitar ultrapassar o limite da tabela
                                if i <= 0
                                   break; 
                                end 
                            end

                            % Desinverte matriz
                            tabela_interpolMin = InverteMatriz(tabela_interpolMin);

                            % Interpola entre uma tabela e outra
                            tabela_vapor = InterpolacaoEntreTabelaCompletaVapor(tabela_vapor,tabela_interpolMax,tabela_interpolMin,pres,x);                  

                        end

                        % Procura na nova coluna 
                        y = 6;

                        % Procurador na tabela
                        while tabela_vapor(x,y) < entr
                            x = x + 1;
                            y = 6;
                        end                   

                        % Interpola��o para caso n�o ache os valores
                        if tabela_vapor(x,y) > entr
                            % Calculo da temperatura
    %                         temp = Interpolacao(tabela_vapor(x-1,y),tabela_vapor(x,y),tabela_vapor(x-1,2),tabela_vapor(x,2),volu);

                            % Interpola��o
                            tabela_vapor = InterpolacaoCompletaVapor(tabela_vapor,entr,x,y);
                        end

                        % Defini o estado e o t�tulo
                        esta = 'Vapor Super Aquecido'; %Estado
                        if tabela_vapor(x-1,1) ~= tabela_vapor(x,1)                         
                            titu = 1;                     
                        else
                            titu = '--';                     
                        end

                        % Printa os resultados as propriedades
                        temp = tabela_vapor(x,2);
                        volu = tabela_vapor(x,3);
                        ener = tabela_vapor(x,4);
                        enta = tabela_vapor(x,5);
    %                     entr = tabela_vapor(x,6);

                    elseif entr == tabela_satP(x,13) %Caso Vapor saturado
                        % Printa os resultados as propriedades
    %                     pres = tabela_satP(x,1);
                        temp = tabela_satP(x,2);
                        volu = tabela_satP(x,4);
                        ener = tabela_satP(x,7);
                        enta = tabela_satP(x,10);
    %                     entr = tabela_satP(x,13);
                        titu = 1;
                        esta = 'Vapor Saturado';

                    elseif entr <= tabela_satP(x,11) %Caso l�quido comprimido
                        esta = 'L�quido Comprimido'; %Estado
                        titu = 0;

                        % Confere o limite da tabela
                        if entr > 11.5857
                            errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                            return;
                        end

                        % Avalia os limites de press�o na tabela
                        if tabela_liqComp(1,1) > pres || tabela_liqComp(tamanho_liq(1),1) < pres
                            errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                            return;
                        end  

                        % Define a coluna para procura
                        y = 1;
                        x = 1;

                        % Procurador na tabela
                        while tabela_liqComp(x,y) < pres
                            x = x + 1;
                            y  = 1;
                        end                    

                        % Interpola caso n�o ache o valor
                        if pres < tabela_liqComp(x,1)
                            % variaveis necess�rias
                            I = 1;
                            i = x;

                            % Confere o limite da faixa de press�o igual
                            while tabela_liqComp(i,1) == tabela_liqComp(x,1)
                                for k = 1 : 1 : tamanho_liq(2)
                                    tabela_interpolMax(I,k) = tabela_liqComp(i,k);
                                end
                                I = I + 1;
                                i = i + 1;

                                % Eveitar ultrapassar o limite da tabela
                                if i > tamanho_liq(1)
                                   break; 
                                end 
                            end  

                            % Zera os contadores para pr�xima matriz
                            i = x-1;
                            I = 1;

                            % Delimita os valores iniciais e finais das temperaturas para interpolar para press�o menor 
                            while tabela_liqComp(i,1) == tabela_liqComp(x-1,1)
                                for k = 1 : 1 : tamanho_liq(2)
                                    tabela_interpolMin(I,k) = tabela_liqComp(i,k);
                                end
                                I = I + 1;
                                i = i - 1;

                                % Eveitar ultrapassar o limite da tabela
                                if i <= 0
                                   break; 
                                end 
                            end

                            % Desinverte matriz
                            tabela_interpolMin = InverteMatriz(tabela_interpolMin);

                            % Interpola entre uma tabela e outra
                            tabela_liqComp = InterpolacaoEntreTabelaCompletaVapor(tabela_liqComp,tabela_interpolMax,tabela_interpolMin,pres,x);                  

                        end

                        % Procura na nova coluna 
                        y = 6;

                        % Procurador na tabela
                        while tabela_liqComp(x,y) < entr
                            x = x + 1;
                            y = 6;
                        end                   

                        % Interpola��o para caso n�o ache os valores
                        if tabela_liqComp(x,y) > entr
                            % Calculo da temperatura
    %                         temp = Interpolacao(tabela_liqComp(x-1,y),tabela_liqComp(x,y),tabela_liqComp(x-1,2),tabela_liqComp(x,2),volu);

                            % Interpola��o
                            tabela_liqComp = InterpolacaoCompletaVapor(tabela_liqComp,entr,x,y);
                        end

                        % Printa os resultados as propriedades
                        temp = tabela_liqComp(x,2);
                        volu = tabela_liqComp(x,3);
                        ener = tabela_liqComp(x,4);
                        enta = tabela_liqComp(x,5);
    %                     entr = tabela_liqComp(x,6);

                    else %Caso mistura
                        esta = 'Mistura'; %Estado

                        % Calculo do t�tulo e das propriedades com t�tulo
                        titu = (entr-tabela_satP(x,11)) / tabela_satP(x,12);
                        temp = tabela_satP(x,2);
                        volu = CalculoComTitulo(titu,tabela_satP(x,3),tabela_satP(x,4));
                        ener = CalculoComTitulo(titu,tabela_satP(x,5),tabela_satP(x,7));
                        enta = CalculoComTitulo(titu,tabela_satP(x,8),tabela_satP(x,10));
    %                     entr = CalculoComTitulo(titu,tabela_satP(x,11),tabela_satP(x,13));

                    end               
                    
                end
                
            case 6 %Entrada como T�tulo
                % Propriedade e estado
                titu = prop_2;
                
                % Avalia o t�tulo
                if titu == 1
                    esta = 'Vapor Saturado'; %Estado de Mistura 
                elseif titu == 0
                    esta = 'L�quido Saturado'; %Estado de Mistura 
                else
                    esta = 'Mistura'; %Estado de Mistura 
                end

                % Valida��o dos limites f�sicos das entradas
                if pres <= 0
                    errordlg('Erro err0205. Entradas fora dos limites f�sicos v�lidos.','ERRO');
                    return;
                end

                % Avalia os limites da tabela
                if pres > tabela_satP(tamanho_sat(1),1)
                    errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                    return;
                end

                % Valida��o te�rica do t�tulo
                if  titu > 1 || titu < 0
                    errordlg('Erro err0307. Entradas fora dos limites te�ricos v�lidos.','Erro');
                    return
                end

                % Redefine coordendas
                x = 1;
                y = 1;
                
                % Procurador na tabela
                while tabela_satP(x,y) < pres
                    x = x + 1;
                    y  = 1;
                end

                % Interpola��o para caso n�o ache os valores
                if tabela_satP(x,1) > pres
                    tabela_satP = InterpolacaoCompleta(tabela_satP,pres,x);
                end

                % Calculo do t�tulo e das propriedades com t�tulo
                temp = tabela_satP(x,2);
                volu = CalculoComTitulo(titu,tabela_satP(x,3),tabela_satP(x,4));
                ener = CalculoComTitulo(titu,tabela_satP(x,5),tabela_satP(x,7));
                enta = CalculoComTitulo(titu,tabela_satP(x,8),tabela_satP(x,10));
                entr = CalculoComTitulo(titu,tabela_satP(x,11),tabela_satP(x,13));

            otherwise
                errordlg('Erro err0204. Op��o da segunda propriedade de entrada � inv�lida ou incoerente.','ERRO');
                return;
        end
    end
end
    
% Ar
if strcmp(fluido,'Ar') == 1 && novo_fluido == 1
    
    % Conferir v�lidade das entradas
    if isnan(prop_2)
        errordlg('Erro err0202. As entradas apresentam caracteres inv�lidos.','ERRO');
        return;
    end
    
    % Avalia qual a entrada
    switch segunda_entrada
        case 1 %Entrada como Temperatura
            temp = prop_2;  
                        
            % Coluna para procurar
            y = segunda_entrada;
            
            % Valida��o dos limites f�sicos das entradas
            if temp <= -273.15
                errordlg('Erro err0205. Entradas fora dos limites f�sicos v�lidos.','ERRO');
                return;
            end
            
            % Valida��o da entrada dentro dos limites da tabela
            tamanho_sat = size(tabela_ar);
            if temp < tabela_ar(1,y) || temp > tabela_ar(tamanho_sat(1),y)
                errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                return;
            end
            
            % Inicio das linhas
            x = 1;
            
            % Procurador na tabela
            while tabela_ar(x,y) < temp
                x = x + 1;
            end
            
            % Interpola��o para caso n�o ache os valores
            if tabela_ar(x,y) > temp
                tabela_ar = InterpolacaoCompletaAr(tabela_ar,temp,x,y);
            end
            
%             temp = tabela_ar(x,1);
            enta = tabela_ar(x,2);
            pres = tabela_ar(x,3);
            ener = tabela_ar(x,4);
            volu = tabela_ar(x,5);
            entr = tabela_ar(x,6);
            
        case 2 %Entrada como Entalpia
            enta = prop_2;
            
            % Coluna para procurar
            y = segunda_entrada;
            
            % Valida��o dos limites f�sicos das entradas
            if enta <= 0
                ERRORrdlg('Erro err0205. Entradas fora dos limites f�sicos v�lidos.','ERRO');
                return;
            end
            
            % Valida��o da entrada dentro dos limites da tabela
            tamanho_sat = size(tabela_ar);
            if enta < tabela_ar(1,y) || enta > tabela_ar(tamanho_sat(1),y)
                errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                return;
            end
            
            % Inicio das linhas
            x = 1;
            
            % Procurador na tabela
            while tabela_ar(x,y) < enta
                x = x + 1;
            end
            
            % Interpola��o para caso n�o ache os valores
            if tabela_ar(x,y) > enta
                tabela_ar = InterpolacaoCompletaAr(tabela_ar,enta,x,y);
            end
            
            temp = tabela_ar(x,1);
            pres = tabela_ar(x,3);
            ener = tabela_ar(x,4);
            volu = tabela_ar(x,5);
            entr = tabela_ar(x,6);
        
        case 3 %Entrada como Press�o Relativa
            pres = prop_2;
                        
            % Coluna para procurar
            y = segunda_entrada;
            
            % Valida��o dos limites f�sicos das entradas
            if pres <= 0
                errordlg('Erro err0205. Entradas fora dos limites f�sicos v�lidos.','ERRO');
                return;
            end
            
            % Valida��o da entrada dentro dos limites da tabela
            tamanho_sat = size(tabela_ar);
            if pres < tabela_ar(1,y) || pres > tabela_ar(tamanho_sat(1),y)
                errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                return;
            end
            
            % Inicio das linhas
            x = 1;
            
            % Procurador na tabela
            while tabela_ar(x,y) < pres
                    x = x + 1;
            end
            
            % Interpola��o para caso n�o ache os valores
            if tabela_ar(x,y) > pres
                tabela_ar = InterpolacaoCompletaAr(tabela_ar,pres,x,y);
            end
            
            enta = tabela_ar(x,2);
            temp = tabela_ar(x,1);
            ener = tabela_ar(x,4);
            volu = tabela_ar(x,5);
            entr = tabela_ar(x,6);
        
        case 4 %Entrada como Energia Interna
            ener = prop_2;
                   
            % Coluna para procurar
            y = segunda_entrada;
            
            % Valida��o dos limites f�sicos das entradas
            if ener <= 0
                errordlg('Erro err0205. Entradas fora dos limites f�sicos v�lidos.','ERRO');
                return;
            end
            
            % Valida��o da entrada dentro dos limites da tabela
            tamanho_sat = size(tabela_ar);
            if ener < tabela_ar(1,y) || ener > tabela_ar(tamanho_sat(1),y)
                errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                return;
            end
            
            % Inicio das linhas
            x = 1;
            
            % Procurador na tabela
            while tabela_ar(x,y) < ener
                    x = x + 1;
            end
            
            % Interpola��o para caso n�o ache os valores
            if tabela_ar(x,y) > ener
                tabela_ar = InterpolacaoCompletaAr(tabela_ar,ener,x,y);
            end
            
            enta = tabela_ar(x,2);
            pres = tabela_ar(x,3);
            temp = tabela_ar(x,1);
            volu = tabela_ar(x,5);
            entr = tabela_ar(x,6);
        
        case 5 %Entrada como Volume Relativo
            volu = prop_2;
              
            % Coluna para procurar
            y = segunda_entrada;
            
            % Valida��o dos limites f�sicos das entradas
            if volu <= 0
                errordlg('Erro err0205. Entradas fora dos limites f�sicos v�lidos.','ERRO');
                return;
            end
            
            % Valida��o da entrada dentro dos limites da tabela
            tamanho_sat = size(tabela_ar);
            if volu > tabela_ar(1,y) || volu < tabela_ar(tamanho_sat(1),y)
                errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                return;
            end
            
            % Inicio das linhas
            x = 1;
            
            % Procurador na tabela
            while tabela_ar(x,y) > volu
                    x = x + 1;
            end
            
            % Interpola��o para caso n�o ache os valores
            if tabela_ar(x,y) < volu
                tabela_ar = InterpolacaoCompletaAr(tabela_ar,volu,x,y);
            end
            
            enta = tabela_ar(x,2);
            pres = tabela_ar(x,3);
            ener = tabela_ar(x,4);
            temp = tabela_ar(x,1);
            entr = tabela_ar(x,6);
            
        case 6 %Entrada como Entropia
            entr = prop_2;
            
            % Coluna para procurar
            y = segunda_entrada;
            
            % Valida��o dos limites f�sicos das entradas
            if entr <= 0
                errordlg('Erro err0205. Entradas fora dos limites f�sicos v�lidos.','ERRO');
                return;
            end
            
            % Valida��o da entrada dentro dos limites da tabela
            tamanho_sat = size(tabela_ar);
            if entr < tabela_ar(1,y) || entr > tabela_ar(tamanho_sat(1),y)
                errordlg('Erro err0206. Entradas fora dos limites v�lidos da tabela.','ERRO');
                return;
            end
            
            % Inicio das linhas
            x = 1;
            
            % Procurador na tabela
            while tabela_ar(x,y) < entr
                    x = x + 1;
            end
            
            % Interpola��o para caso n�o ache os valores
            if tabela_ar(x,y) > entr
                tabela_ar = InterpolacaoCompletaAr(tabela_ar,entr,x,y);
            end
            
            enta = tabela_ar(x,2);
            pres = tabela_ar(x,3);
            ener = tabela_ar(x,4);
            volu = tabela_ar(x,5);
            temp = tabela_ar(x,1);

        otherwise
            errordlg('Erro err0204. Op��o da segunda propriedade de entrada � inv�lida ou incoerente.','ERRO');
            return;
    end
end

% Caso seja um novo fluido seguindo padr�o do ar
if strcmp(fluido,'Ar') == 1 && novo_fluido == 0
    % Conferir v�lidade das entradas
    if isnan(prop_2)
        errordlg('Erro err0202. As entradas apresentam caracteres inv�lidos.','ERRO');
        return;
    end

    % Avalia qual a entrada
    switch segunda_entrada
        case 1 %Entrada como Temperatura
            temp = prop_2;  
                        
            % Coluna para procurar
            y = segunda_entrada;
                        
            % Linha
            x = 1;
            
            % Procurador na tabela
            while tabela_ar(x,y) < temp
                x = x + 1;
            end
            
            % Interpola��o para caso n�o ache os valores
            if tabela_ar(x,y) > temp
                tabela_ar = InterpolacaoCompletaAr(tabela_ar,temp,x,y);
            end
            
            enta = tabela_ar(x,2);
            ener = tabela_ar(x,3);
            entr = tabela_ar(x,4);
            
        case 2 %Entrada como Entalpia
            enta = prop_2;
            
            % Coluna para procurar
            y = segunda_entrada;
                        
            % Linha
            x = 1;
            
            % Procurador na tabela
            while tabela_ar(x,y) < enta
                    x = x + 1;
            end
            
            % Interpola��o para caso n�o ache os valores
            if tabela_ar(x,y) > enta
                tabela_ar = InterpolacaoCompletaAr(tabela_ar,enta,x,y);
            end
            
            temp = tabela_ar(x,1);
            ener = tabela_ar(x,3);
            entr = tabela_ar(x,4);
        
        case 3 %Entrada como Press�o Relativa
            ener = prop_2;
                        
            % Coluna para procurar
            y = segunda_entrada;
                        
            % Linha
            x = 1;
            
            % Procurador na tabela
            while tabela_ar(x,y) < ener
                    x = x + 1;
            end
            
            % Interpola��o para caso n�o ache os valores
            if tabela_ar(x,y) > ener
                tabela_ar = InterpolacaoCompletaAr(tabela_ar,ener,x,y);
            end
            
            enta = tabela_ar(x,2);
            temp = tabela_ar(x,1);
            entr = tabela_ar(x,4);
        
        case 4 %Entrada como Energia Interna
            entr = prop_2;
                   
            % Coluna para procurar
            y = segunda_entrada;
                       
            % Linha
            x = 1;
            
            % Procurador na tabela
            while tabela_ar(x,y) < entr
                x = x + 1;
            end
            
            % Interpola��o para caso n�o ache os valores
            if tabela_ar(x,y) > entr
                tabela_ar = InterpolacaoCompletaAr(tabela_ar,entr,x,y);
            end
            
            enta = tabela_ar(x,2);
            ener = tabela_ar(x,3);
            temp = tabela_ar(x,1);
            
        otherwise
            errordlg('Erro err0204. Op��o da segunda propriedade de entrada � inv�lida ou incoerente.','ERRO');
            return;
    end
end

% Impress�o dos resultados
if strcmp(fluido,'R134a') == 1 || strcmp(fluido,'�gua') == 1
    % Impress�o dos Resultados para R134a e �gua
    set(handles.temp,'String',temp);
    set(handles.pres,'String',pres);
    set(handles.volu,'String',volu);
    set(handles.ener,'String',ener);
    set(handles.enta,'String',enta);
    set(handles.entr,'String',entr);
    set(handles.titu,'String',titu);
    set(handles.esta,'String',esta);

elseif strcmp(fluido,'Ar') == 1 && novo_fluido == 1
    % Impress�o dos resultados para Ar
    set(handles.temp,'String',temp);
    set(handles.pres,'String',enta);
    set(handles.volu,'String',pres);
    set(handles.ener,'String',ener);
    set(handles.enta,'String',volu);
    set(handles.entr,'String',entr);

elseif strcmp(fluido,'Ar') == 1 && novo_fluido == 0
    % Impress�o dos resultados para Ar
    set(handles.temp,'String',temp);
    set(handles.pres,'String',enta);
    set(handles.volu,'String',ener);
    set(handles.ener,'String',entr);
else
    errordlg('Erro err!&@#. Erro inesperado.','ERRO');
    return;
end

% Ativa salvamento e exibi��o
set(handles.salvar_tabela_toda,'Enable','on')
set(handles.exibir,'Enable','on')

% Avalia o estado para desbloquear as op��es de exibi��o
if strcmp(esta,'Vapor Super Aquecido') == 1
    set(handles.exibir_tabela_vapor,'Enable','on')
    set(handles.exibir_tabela_mistura,'Enable','off')
    set(handles.exibir_tabela_liquido,'Enable','off')
    set(handles.exibir_tabela_ar,'Enable','off')
    
elseif strcmp(esta,'L�quido Comprimido') == 1  
    % Avalia o fluido
    if strcmp(fluido,'�gua') == 1
        set(handles.exibir_tabela_liquido,'Enable','on')
        
    elseif strcmp(fluido,'R134a') == 1
        set(handles.exibir_tabela_mistura,'Enable','on')
    
    end
    set(handles.exibir_tabela_vapor,'Enable','off')
    set(handles.exibir_tabela_ar,'Enable','off')
        
elseif strcmp(esta,'Mistura') == 1
    set(handles.exibir_tabela_vapor,'Enable','off')
    set(handles.exibir_tabela_mistura,'Enable','on')
    set(handles.exibir_tabela_liquido,'Enable','off')
    set(handles.exibir_tabela_ar,'Enable','off')

end

if strcmp(fluido,'Ar') == 1
    set(handles.exibir_tabela_vapor,'Enable','off')
    set(handles.exibir_tabela_mistura,'Enable','off')
    set(handles.exibir_tabela_liquido,'Enable','off')
    set(handles.exibir_tabela_ar,'Enable','on')
    
    if novo_fluido == 0
        set(handles.exibir_tabela_ar,'Label','Flu�do N�o Padr�o')
        set(handles.exibir_tabela_ar,'Enable','on')
    
    end
    
end

% Valida o bot�o gr�fico
if strcmp(fluido,'R134a') == 1 || strcmp(fluido,'�gua') == 1
    if strcmp(esta,'Vapor Super Aquecido') == 1 || strcmp(esta,'L�quido Comprimido') == 1 || strcmp(esta,'Mistura') == 1 || strcmp(esta,'Vapor Saturado') == 1 || strcmp(esta,'L�quido Saturado') == 1
        set(handles.grafico,'Enable','on') %Ativa o bot�o gr�fico
    else
        errordlg('Erro err0509. Erro na defini��o do estado.','ERRO') 
        return;
    end
end

%Salvamento
set(handles.salvar,'Enable','on') %Ativa o bot�o salvar

% Avalia o fluido
if strcmp(fluido,'R134a') == 1 || strcmp(fluido,'�gua') == 1
%     Indices
%     Hdados_entrada(1) = Qual fluido                    | Hdados_saida(1) = Qual fluido
%     Hdados_entrada(2) = Qual a primeira propriedade    | Hdados_saida(...) = Propriedades de sa�da
%     Hdados_entrada(3) = Valor da primeira propriedade  |
%     Hdados_entrada(4) = Qual a segunda propriedade     |
%     Hdados_entrada(5) = Valor da segunda propriedade   |
    
    % Enumera o fluido
    if strcmp(fluido,'R134a') == 1
        fluido_num = 1;
    elseif strcmp(fluido,'�gua') == 1
        fluido_num = 2;
    end
    
    % Define o fluido no verto de salvamento
    Hdados_entrada(1) = fluido_num;
    
    % Avalia a primeira propriedade de entrada
    if primeira_entrada == 1 %Entrada como temperatura
        Hdados_entrada(2) = 1;
        Hdados_entrada(3) = temp;
        
    elseif primeira_entrada == 2 %Entrada como press�o
        Hdados_entrada(2) = 2;
        Hdados_entrada(3) = pres;
        
    end
    
    % Avalia a segunda propriedade de entrada
    switch segunda_entrada
        case 1
            if primeira_entrada == 1
                Hdados_entrada(4) = 1.1;
                Hdados_entrada(5) = pres;
                
            elseif primeira_entrada == 2
                Hdados_entrada(4) = 1.2;
                Hdados_entrada(5) = temp;
            end
        case 2
            Hdados_entrada(4) = segunda_entrada;
            Hdados_entrada(5) = volu;
            
        case 3
            Hdados_entrada(4) = segunda_entrada;
            Hdados_entrada(5) = ener;
            
        case 4
            Hdados_entrada(4) = segunda_entrada;
            Hdados_entrada(5) = enta;
            
        case 5
            Hdados_entrada(4) = segunda_entrada;
            Hdados_entrada(5) = entr;
            
        case 6
            Hdados_entrada(4) = segunda_entrada;
            Hdados_entrada(5) = titu;
            
    end
    
    % Avalia o estado
    if strcmp(esta,'Vapor Super Aquecido') == 1 || strcmp(esta,'Vapor Saturado') == 1
        esta_num = 1;
        titu_num = 1;

    elseif strcmp(esta,'L�quido Comprimido') == 1 || strcmp(esta,'L�quido Saturado') == 1
        esta_num = 2;
        titu_num = 0;

    elseif strcmp(esta,'Mistura') == 1 
        esta_num = 3;
        titu_num = titu;
        
    end
    
    % Sa�da
    Hdados_saida = [ fluido_num temp pres volu ener enta entr titu_num esta_num ];
        
elseif strcmp(fluido,'Ar') == 1
%     Indices
%     Hdados_entrada(1) = Qual fluido                    | Hdados_saida(1) = Qual fluido
%     Hdados_entrada(2) = Qual a primeira propriedade    | Hdados_saida(...) = Propriedades de sa�da
%     Hdados_entrada(3) = Valor da primeira propriedade  |
    
    % Enumera o fluido
    if novo_fluido == 1 %Flu�do padr�o ar
        fluido_num = 3;
        
        % Define o fluido no vetor de salvamento
        Hdados_entrada(1) = fluido_num;

        % Avalia a propriedade de entrada
        switch segunda_entrada
            case 1
                Hdados_entrada(2) = segunda_entrada;
                Hdados_entrada(3) = temp;

            case 2
                Hdados_entrada(2) = segunda_entrada;
                Hdados_entrada(3) = enta;

            case 3
                Hdados_entrada(2) = segunda_entrada;
                Hdados_entrada(3) = pres;

            case 4
                Hdados_entrada(2) = segunda_entrada;
                Hdados_entrada(3) = ener;

            case 5
                Hdados_entrada(2) = segunda_entrada;
                Hdados_entrada(3) = volu;

            case 6
                Hdados_entrada(2) = segunda_entrada;
                Hdados_entrada(3) = entr;

        end

        % Sa�da
        Hdados_saida = [ fluido_num temp enta pres ener volu entr ];
    
    elseif novo_fluido == 0 %Flu�do n�o padr�o
        fluido_num = 3.1;
        
        % Define o fluido no vetor de salvamento
        Hdados_entrada(1) = fluido_num;

        % Avalia a segunda propriedade de entrada
        switch segunda_entrada
            case 1
                Hdados_entrada(2) = segunda_entrada;
                Hdados_entrada(3) = temp;

            case 2
                Hdados_entrada(2) = segunda_entrada;
                Hdados_entrada(3) = enta;

            case 3
                Hdados_entrada(2) = segunda_entrada;
                Hdados_entrada(3) = ener;

            case 4
                Hdados_entrada(2) = segunda_entrada;
                Hdados_entrada(3) = entr;

        end

        % Sa�da
        Hdados_saida = [ fluido_num temp enta ener entr ];
    end
        
else
    errordlg('Erro err0203. Nenhum flu�do selecionado.','ERRO');
    return;    
end

% Limpadores finais
clearvars -except fluido esta novo_fluido tabela_ar tabela_liqComp tabela_vapor tabela_satT fluido_confimacao prop_1 prop_2 segunda_entrada primeira_entrada Hdados_entrada Hdados_saida
% clc;

% Abrir gr�fico
function grafico_Callback(hObject, eventdata, handles)
% Globaliza��o
global esta

% Avalia o estado
if strcmp(esta,'Vapor Super Aquecido') == 1 || strcmp(esta,'Vapor Saturado') == 1
    Grafico_vapo;
    
elseif strcmp(esta,'L�quido Comprimido') == 1  
    Grafico_liqu;
        
elseif strcmp(esta,'Mistura') == 1 || strcmp(esta,'L�quido Saturado') == 1
    Grafico_mist;

else
    errordlg('Erro err0509. Erro na defini��o do estado.','ERRO') 
    return;
end

% Salvar tabela toda
function salvar_tabela_toda_ClickedCallback(hObject, eventdata, handles)
global tabela_satT
global tabela_satP
global tabela_vapor
global tabela_liqComp
global tabela_ar
global fluido
global esta
global novo_fluido
global primeira_entrada

% Inicio da op��o
opcao = 0;
status = 1;

if strcmp(esta,'Vapor Super Aquecido') == 1
    % Abre janela para pegar nome e endere�o que vai salvar
    [nome_arq , endereco_arq] = uiputfile('Vapor Super Aquecido.xls','SALVAR TABELA');
    opcao = 1;
    
elseif strcmp(esta,'L�quido Comprimido') == 1  
    % Avalia o fluido
    if strcmp(fluido,'�gua') == 1
        % Abre janela para pegar nome e endere�o que vai salvar
        [nome_arq , endereco_arq] = uiputfile('L�quido Comprimido.xls','SALVAR TABELA');
        opcao = 2;
    
    elseif strcmp(fluido,'R134a') == 1
        % Abre janela para pegar nome e endere�o que vai salvar
        [nome_arq , endereco_arq] = uiputfile('L�quido Saturado (aproxima��o).xls','SALVAR TABELA');
        opcao = 3;
    
    end
        
elseif strcmp(esta,'Mistura') == 1
    % Abre janela para pegar nome e endere�o que vai salvar
    [nome_arq , endereco_arq] = uiputfile('Saturada e mistura.xls','SALVAR TABELA');
    opcao = 4;
end

if strcmp(fluido,'Ar') == 1
    opcao = 5;
    if novo_fluido == 1
        [nome_arq , endereco_arq] = uiputfile('Ar.xls','SALVAR TABELA');
    elseif novo_fluido == 0
        [nome_arq , endereco_arq] = uiputfile('Flu�do N�o Padr�o.xls','SALVAR TABELA');
    end
    
end

% Confirma��o de endere�o e nome escolhido
if isequal(nome_arq,0) == 1 || isequal(endereco_arq,0) == 1
    warndlg('Nenhum arquivo foi salvo. A��o cancelada ou nome / local inv�lido','AVISO')
    return;
end

% Concatena��o do nome com endere�o
nome_e_ender_salvar = strcat(endereco_arq,nome_arq);

% Salva tabela
switch opcao
    case 1
        status = xlswrite(nome_e_ender_salvar,tabela_vapor);
    case 2
        status = xlswrite(nome_e_ender_salvar,tabela_liqComp);
    case 3
        if primeira_entrada == 1
            status = xlswrite(nome_e_ender_salvar,tabela_satT);
        elseif primeira_entrada == 2
            status = xlswrite(nome_e_ender_salvar,tabela_satP);
        end
    case 4
        if primeira_entrada == 1
            status = xlswrite(nome_e_ender_salvar,tabela_satT);
        elseif primeira_entrada == 2
            status = xlswrite(nome_e_ender_salvar,tabela_satP);
        end
    case 5
        status = xlswrite(nome_e_ender_salvar,tabela_ar);
    otherwise
        warndlg('Nenhum arquivo foi salvo. A��o cancelada ou nome / local inv�lido','AVISO')   
end

if status == 1
    msgbox('As tabelas foram salvas com sucesso.','SALVO')
    set(handles.salvar_tabela_toda,'Enable','off')
else
    errordlg('Erro err0408. Salvamento n�o efetuado.','ERRO') 
    return;
end

% Abrir uma nova tabela
function abrir_tabela_NP_ClickedCallback(hObject, eventdata, handles)
% Globaliza��o
global tabela_ar
global fluido
global fluido_confimacao
global novo_fluido

% Avisos pr�vios
uiwait(warndlg({'Para funcionamento perfeito � necess�rio que a tabela esteja organizada da forma correta (consulte manual). A organiza��o da tabela de forma pr�via � de responsabilidade do usu�rio.';' ';'A entrada e a interpreta��o das unidades de medida em tabelas n�o oficiais s�o de responsabilidade do usu�rio.';' ';'A entrada de valores dentro dos limites da tabela, dentro dos limites f�sicos, sem caracteres alfab�ticos, entre outros, garantem o bom funcionamento. Estas entradas s�o de responsabilidade do usu�rio.';' ';'O n�o cumprimento desses avisos pode resultar em dados n�o ver�dicos ou em erros fatais de funcionamento.'},'AVISO'))

% Fluido base da tabela
fluido = 'Ar';

% Abrir nova tabela
[nome_arq , endereco_arq] = uigetfile('*.xlsx','ABRIR TABELA');

% Confirma��o de endere�o e nome escolhido
if isequal(nome_arq,0) == 1 || isequal(endereco_arq,0) == 1
    warndlg('Nenhum arquivo foi aberto. A��o cancelada ou nome / local inv�lido','AVISO')
    return
end

% Concatena��o do nome com endere�o
nome_e_ender_salvar = strcat(endereco_arq,nome_arq);

% Abrindo e verificando tabela de Ar
load = waitbar(0,'Abrindo tabela');
tabela_ar = xlsread(nome_e_ender_salvar); %Tabela personalizada, g�s ideal ar
close(load);

% Verifica��o de caracteres inv�lidos
load = waitbar(0.5,'Verificando tabela');
VerificarTabela(tabela_ar,load);
close(load);

% Verifica��o de compatibilidade
tamanho_tabela = size(tabela_ar);
if tamanho_tabela(2) > 4
   errordlg('Erro err0610. Tabela fora dos padr�es esperados.','ERRO') 
   return;
end

% Finaliza a porcentagem
load = waitbar(1,'Completo');
close(load);

% Zera os resultados anteriores
set(handles.temp,'String',' ');
set(handles.pres,'String',' ');
set(handles.volu,'String',' ');
set(handles.ener,'String',' ');
set(handles.enta,'String',' ');
set(handles.entr,'String',' ');
set(handles.titu,'String',' ');
set(handles.esta,'String',' ');
set(handles.entrada_1,'String','Digite aqui');
set(handles.entrada_2,'String','Digite aqui');

% Nome do fluido
novo_fluido_nome = inputdlg('Qual o flu�do de trabalho?','Novo flu�do.',[1 45]);
tamanho_novo_fluido = size(novo_fluido_nome);
if tamanho_novo_fluido(1) == 0
    set(handles.fluido_atual,'String','(Atual: Personalizado)'); %Seleciona o flu�do atual como personalizado
    
else
    atual = '(Atual: ';
    fluido_quase_atual = strcat(atual,novo_fluido_nome);
    fluido_atual = strcat(fluido_quase_atual,')');
    set(handles.fluido_atual,'String',fluido_atual); %Seleciona o flu�do atual
    
end

% Ajustes gr�ficos
set(handles.grafico,'Enable','off') %Desativa o bot�o gr�fico
set(handles.Primeira_propriedade,'Visible','off') %Deixa invis�vel o texto da temperatura
set(handles.entrada_1,'Visible','off') %Deixa invis�vel a entrada de temperatura

% Ajuste do Menu pop-up
set(handles.Segunda_propriedade,'String',{'Temperatura:';'Entalpia:';'Energia Interna:';'Entropia:'},'Value',1) %Ajusta as op��es do menu popup

% Ajustes de posi��o
set(handles.Segunda_propriedade,'Position',[104.4 30.462 40.2 3.077]) %Movimenta as op��es da entrada secund�ria
set(handles.entrada_2,'Position',[145 31.615 24.8 1.692]) %Movimenta a entrada secund�ria
set(handles.volu,'Position',[22.4 5.385 26.2 1.692]) %Movimenta a resposta do volume
set(handles.ener,'Position',[13 1.231 26.2 2]) %Movimenta a resposta do energia
set(handles.pres,'Position',[13.8 8.231 26.2 2.538]) %Movimenta a resposta do press�o
set(handles.entr,'Position',[83.4 8.154 18.4 2.615]) %Movimenta a resposta do entropia
set(handles.temp,'Position',[19.8 12.231 26.2 2.538]) %Movimenta a resposta do temperatura
set(handles.fluido_atual,'Position',[29.8 28 50.2 3.923]) %Movimenta a resposta do fluido

% Ajustes do menu de op��es
set(handles.R134a,'Value',0);
set(handles.agua,'Value',0);
set(handles.ar,'Value',0);

% Ativa o bot�o para outros fluidos
set(handles.fluido_nao_padrao,'String',novo_fluido_nome); %Atribui o nome do fluido escolhido
set(handles.fluido_nao_padrao,'Visible','On'); %Deixa visivel o bot�o
set(handles.fluido_nao_padrao,'Value',1); %Marca ele como op�ao

% Ajustes da sa�da
set(handles.temp_saida,'String','Temperatura:');
set(handles.pres_saida,'String','Entalpia:');
set(handles.volu_saida,'String','Energia Interna:');
set(handles.ener_saida,'String','Entropia:');
set(handles.enta_saida,'String',' ');
set(handles.entr_saida,'String',' ');
set(handles.titu_saida,'String',' ');
set(handles.esta_saida,'String',' ');

% Confirma que h� um fluido selecionado
fluido_confimacao = 0;
novo_fluido = 0;

% Ajuda para convers�o
function help_conversao_ClickedCallback(hObject, eventdata, handles)
Conversoes;

% Voltar para o in�cio
function inicio_Callback(hObject, eventdata, handles)
% Limpadndo a variavel fluido
clearvars

delete(gcf);
STTAR_inicio;

% Salvar os dados de entrada e sa�da no hist�rico
function salvar_Callback(hObject, eventdata, handles)
% Globaliza��o
global Hdados_entrada
global Hdados_saida

% Barra de load
load = waitbar(0,'Preparando dados para salvar.');

% Abre os arquivos
dados_historico_entrada = xlsread('Dados de Entrada.xlsx');
dados_historico_saida = xlsread('Dados de Sa�da.xlsx');

% Define o tamanho das matrizes
tamanho_Hentrada = size(dados_historico_entrada);
tamanho_Hsaida = size(dados_historico_saida);
tamanho_HdadosE = size(Hdados_entrada);
tamanho_HdadosS = size(Hdados_saida);

% Barra de load
close(load);
load = waitbar(0.33333,'Salvando dados.');

% Coloca os novos dados de entrada no vetor
for i = 1 : 1 : tamanho_HdadosE(2)
    dados_historico_entrada(tamanho_Hentrada(1)+1,i) = Hdados_entrada(i);
end

% Coloca os novos dados de saida no vetor
for i = 1 : 1 : tamanho_HdadosS(2)
    dados_historico_saida(tamanho_Hsaida(1)+1,i) = Hdados_saida(i);
end

% Deleta 
delete('Dados de Sa�da.xlsx');
delete('Dados de Entrada.xlsx');

% Barra de load
close(load);
load = waitbar(0.66666,'Salvando dados.');

% Salva os novos dados
xlswrite('Dados de Sa�da.xlsx',dados_historico_saida); %Dados de sa�da
xlswrite('Dados de Entrada.xlsx',dados_historico_entrada); %Dados de entrada


% Barra de load
close(load);
load = waitbar(1,'Dados salvos.');
close(load);

% Aviso de salvamento efetuado
msgbox('Os dados foram salvos com sucesso.','SALVO')

%Salvamento
set(handles.salvar,'Enable','off') %Ativa o bot�o salvar

% Recarrega a tela
function recarregar_Callback(hObject, eventdata, handles)
% Limpadndo a variavel fluido
clearvars

delete(gcf);
STTAR;

% Fecha o programa
function encerrar_Callback(hObject, eventdata, handles)
% Encerramento
Encerrar; %Questiona se quer encerrar o programa

% -------------------------------- Menus ----------------------------------

% Menu de ajuda
function ajuda_Callback(hObject, eventdata, handles)

% Abrir manual de instru��es
function manual_Callback(hObject, eventdata, handles)
winopen('Manual de Instru��es.pdf');

% Abrir LEIA ME
function leia_me_Callback(hObject, eventdata, handles)
winopen('LEIA ME.txt');

% Abrir se��o de erros
function secao_erros_Callback(hObject, eventdata, handles)
winopen('Erros.pdf');

% Abri o ap�ndice do �engel
function tabela_apendice_Callback(hObject, eventdata, handles)
winopen('Tabelas Completa (�engel).pdf');

% Menu exibir
function exibir_Callback(hObject, eventdata, handles)

% Mostrar op��es de exibi��o
function exibir_tabela_Callback(hObject, eventdata, handles)

% Exibi tabela de vapor
function exibir_tabela_vapor_Callback(hObject, eventdata, handles)
% Globaliza��o
global tabela_vapor

% Transforma a matriz em uma melhor visualiza��o
T = array2table(tabela_vapor,'VariableNames',{'P' 'T' 'v' 'u' 'h' 's'})

% Exibi tabela de mistura
function exibir_tabela_mistura_Callback(hObject, eventdata, handles)
% Globaliza��o
global tabela_satT
global tabela_satP
global fluido
global primeira_entrada

% Avalia o fluido
if strcmp(fluido,'�gua') == 1
    % Avalia o primeiro valor para saber se � tabela de press�o ou temperatura
    if primeira_entrada == 1 %Tabela de temperatura �gua
        % Transforma a matriz em uma melhor visualiza��o
        Tabela = array2table(tabela_satT,'VariableNames',{'T' 'P' 'vl' 'vg' 'ul' 'ulg' 'ug' 'hl' 'hlg' 'hg' 'sl' 'slg' 'sg'})
    
    elseif primeira_entrada == 2 %Tabela de press�o �gua
        % Transforma a matriz em uma melhor visualiza��o
        Tabela = array2table(tabela_satP,'VariableNames',{'P' 'T' 'vl' 'vg' 'ul' 'ulg' 'ug' 'hl' 'hlg' 'hg' 'sl' 'slg' 'sg'})

    else
        errordlg('Erro err!&@#. Erro inesperado.','ERRO');
        return;
    end
    
elseif strcmp(fluido,'R134a') == 1  
    % Avalia o primeiro valor para saber se � tabela de press�o ou temperatura
    if primeira_entrada == 1 %Tabela de temperatura �gua
        % Transforma a matriz em uma melhor visualiza��o
        Tabela = array2table(tabela_satT,'VariableNames',{'T' 'P' 'vl' 'vg' 'ul' 'ulg' 'ug' 'hl' 'hlg' 'hg' 'sl' 'slg' 'sg'})
    
    elseif primeira_entrada == 2 %Tabela de press�o �gua
        % Transforma a matriz em uma melhor visualiza��o
        Tabela = array2table(tabela_satP,'VariableNames',{'P' 'T' 'vl' 'vg' 'ul' 'ulg' 'ug' 'hl' 'hlg' 'hg' 'sl' 'slg' 'sg'})

    else
        errordlg('Erro err!&@#. Erro inesperado.','ERRO');
        return;
    end
    
else
    errordlg('Erro err!&@#. Erro inesperado.','ERRO');
    return;
end

% Exibi a tabela de l�quido comprimido
function exibir_tabela_liquido_Callback(hObject, eventdata, handles)
% Globaliza��o
global tabela_liqComp

% Transforma a matriz em uma melhor visualiza��o
Tabela = array2table(tabela_liqComp,'VariableNames',{'P' 'T' 'v' 'u' 'h' 's'})

% Exibi a tabela de ar
function exibir_tabela_ar_Callback(hObject, eventdata, handles)
% Globaliza�ao
global tabela_ar
global novo_fluido

if novo_fluido == 1
    % Transforma a matriz em uma melhor visualiza��o
    Tabela = array2table(tabela_ar,'VariableNames',{'T' 'h' 'Pr' 'u' 'Vr' 's'})

elseif novo_fluido == 0
    % Transforma a matriz em uma melhor visualiza��o
    Tabela = array2table(tabela_ar,'VariableNames',{'T' 'h' 'u' 's'})
end

% Menu hist�rico
function historico_Callback(hObject, eventdata, handles)

% Hist�rico de dados de entrada
function historico_entrada_Callback(hObject, eventdata, handles)

% Mostra o hist�rico de dados de entrada
function mostrar_dados_entrada_Callback(hObject, eventdata, handles)
% barra de load
load = waitbar(0,'Abrindo hist�rico de entrada.');

% Abre os arquivos
dados_historico_entrada = xlsread('Dados de Entrada.xlsx');

% Fecha o load
close(load)
load = waitbar(1,'Abrindo hist�rico de entrada.');
close(load)

% Tamanho da p�gina
tamanho_dados = size(dados_historico_entrada);

% Cria as cells
Mostrar_Hentrada_R134a = cell(1,5);
Mostrar_Hentrada_Agua = cell(1,5);
Mostrar_Hentrada_Ar = cell(1,3);
Mostrar_Hentrada_NP = cell(1,3);
k1 = 1;
k2 = 1;
k3 = 1;
k4 = 1;

% Avalia o fluido
for i = 1 : 1 : tamanho_dados(1)
    if dados_historico_entrada(i,1) == 1
        % Define o fluido
        Mostrar_Hentrada_R134a{k1,1} = 'R134a';
        
        % Valor das propriedades
        Mostrar_Hentrada_R134a{k1,3} = dados_historico_entrada(i,3); %Valor da primeira
        Mostrar_Hentrada_R134a{k1,5} = dados_historico_entrada(i,5); %Valor da segunda
        
        % Avalia qual a primeira propriedade
        if dados_historico_entrada(i,2) == 1
            Mostrar_Hentrada_R134a{k1,2} = 'Temperatura';
            
        elseif dados_historico_entrada(i,2) == 2
            Mostrar_Hentrada_R134a{k1,2} = 'Press�o';
        
        end
        
        % Avalia qual a segunda propriedade
        if dados_historico_entrada(i,4) == 1.1
            Mostrar_Hentrada_R134a{k1,4} = 'Press�o';
            
        elseif dados_historico_entrada(i,4) == 1.2
            Mostrar_Hentrada_R134a{k1,4} = 'Temperatura';
            
        elseif dados_historico_entrada(i,4) == 2
            Mostrar_Hentrada_R134a{k1,4} = 'Volume Espec�fico';
            
        elseif dados_historico_entrada(i,4) == 3
            Mostrar_Hentrada_R134a{k1,4} = 'Energia Interna';
            
        elseif dados_historico_entrada(i,4) == 4
            Mostrar_Hentrada_R134a{k1,4} = 'Entalpia';
            
        elseif dados_historico_entrada(i,4) == 5
            Mostrar_Hentrada_R134a{k1,4} = 'Entropia';
            
        elseif dados_historico_entrada(i,4) == 6
            Mostrar_Hentrada_R134a{k1,4} = 'T�tulo';
        
        end
        
        % Incrementa o valor de k
        k1 = k1 + 1;
        
    elseif dados_historico_entrada(i,1) == 2
        % Define o fluido
        Mostrar_Hentrada_Agua{k2,1} = '�gua';
        
        % Valor das propriedades
        Mostrar_Hentrada_Agua{k2,3} = dados_historico_entrada(i,3); %Valor da primeira
        Mostrar_Hentrada_Agua{k2,5} = dados_historico_entrada(i,5); %Valor da segunda
        
        % Avalia qual a primeira propriedade
        if dados_historico_entrada(i,2) == 1
            Mostrar_Hentrada_Agua{k2,2} = 'Temperatura';
            
        elseif dados_historico_entrada(i,2) == 2
            Mostrar_Hentrada_Agua{k2,2} = 'Press�o';
        
        end
        
        % Avalia qual a segunda propriedade
        if dados_historico_entrada(i,4) == 1.1
            Mostrar_Hentrada_Agua{k2,4} = 'Press�o';
            
        elseif dados_historico_entrada(i,4) == 1.2
            Mostrar_Hentrada_Agua{k2,4} = 'Temperatura';
            
        elseif dados_historico_entrada(i,4) == 2
            Mostrar_Hentrada_Agua{k2,4} = 'Volume Espec�fico';
            
        elseif dados_historico_entrada(i,4) == 3
            Mostrar_Hentrada_Agua{k2,4} = 'Energia Interna';
            
        elseif dados_historico_entrada(i,4) == 4
            Mostrar_Hentrada_Agua{k2,4} = 'Entalpia';
            
        elseif dados_historico_entrada(i,4) == 5
            Mostrar_Hentrada_Agua{k2,4} = 'Entropia';
            
        elseif dados_historico_entrada(i,4) == 6
            Mostrar_Hentrada_Agua{k2,4} = 'T�tulo';
        
        end
        
        % Incrementa o valor de k
        k2 = k2 + 1;
        
    elseif dados_historico_entrada(i,1) == 3
        % Define o fluido
        Mostrar_Hentrada_Ar{k3,1} = 'Ar';
        
        % Avalia qual a segunda propriedade
        if dados_historico_entrada(i,2) == 1
            Mostrar_Hentrada_Ar{k3,2} = 'Temperatura';
            
        elseif dados_historico_entrada(i,2) == 2
            Mostrar_Hentrada_Ar{k3,2} = 'Entalpia';
            
        elseif dados_historico_entrada(i,2) == 3
            Mostrar_Hentrada_Ar{k3,2} = 'Press�o Relativa';
            
        elseif dados_historico_entrada(i,2) == 4
            Mostrar_Hentrada_Ar{k3,2} = 'Energia Interna';
            
        elseif dados_historico_entrada(i,2) == 5
            Mostrar_Hentrada_Ar{k3,2} = 'Volume Relativo';
            
        elseif dados_historico_entrada(i,2) == 6
            Mostrar_Hentrada_Ar{k3,2} = 'Entropia';
                    
        end
        
        Mostrar_Hentrada_Ar{k3,3} = dados_historico_entrada(i,3);
        
        
        % Incrementa o valor de k
        k3 = k3 + 1;
        
    elseif dados_historico_entrada(i,1) == 3.1
        % Define o fluido
        Mostrar_Hentrada_NP{k4,1} = 'N�o Padr�o';
               
        % Avalia qual a segunda propriedade
        if dados_historico_entrada(i,2) == 1
            Mostrar_Hentrada_NP{k4,2} = 'Temperatura';
            
        elseif dados_historico_entrada(i,2) == 2
            Mostrar_Hentrada_NP{k4,2} = 'Entalpia';
            
        elseif dados_historico_entrada(i,2) == 3
           Mostrar_Hentrada_NP{k4,2} = 'Energia Interna';
            
        elseif dados_historico_entrada(i,2) == 4
            Mostrar_Hentrada_NP{k4,2} = 'Entropia';
                   
        end
        
        Mostrar_Hentrada_NP{k4,3} = dados_historico_entrada(i,3);
        
        % Incrementa o valor de k
        k4 = k4 + 1;
    end   
end

% Exibi como tabela
Historico_R134a_entrada = cell2table(Mostrar_Hentrada_R134a,'VariableNames',{'Fluido' 'Propri1' 'Valor1' 'Propri2' 'Valor2'})
Historico_Agua_entrada = cell2table(Mostrar_Hentrada_Agua,'VariableNames',{'Fluido' 'Propri1' 'Valor1' 'Propri2' 'Valor2'})
Historico_Ar_entrada = cell2table(Mostrar_Hentrada_Ar,'VariableNames',{'Fluido' 'Propri' 'Valor'})
Historico_NaoPadrao_entrada = cell2table(Mostrar_Hentrada_NP,'VariableNames',{'Fluido' 'Propri' 'Valor'})

% Deleta o hist�rico dos dados de entrada
function deletar_dados_entrada_Callback(hObject, eventdata, handles)
% Verifica se realmente quer deletar
verificacao = questdlg('Tem certeza que deseja deletar o hist�rico dos dados de entrada?','DELETAR DADOS DE ENTRADA','SIM','N�O','SIM');

% Avalia a escolha
switch verificacao
    case 'SIM'
        % Barra de load
        load = waitbar(0.33333,'Preparando dados para serem deletados.');
        
        % Deleta o arquivo existente
        delete('Dados de Entrada.xlsx');

        % Barra de load
        close(load);
        load = waitbar(0.66666,'Deletando dados.');
        
        % Cria um novo arquivo
        espaco_inicial = [ 0 0 0 0 0 0 ];
        xlswrite('Dados de Entrada.xlsx',espaco_inicial); %Dados de sa�da
        
        % Barra de load
        close(load);
        load = waitbar(1,'Dados Deletados.');
        close(load);

    case 'N�O'
        return
end

% Aviso de delete efetuado
msgbox('Os dados de entrada foram deletados com sucesso.','DELETADO')

% Hist�rico de dados de saida
function historico_saida_Callback(hObject, eventdata, handles)

% Mostra o hist�rico dos dados de sa�da
function mostrar_dados_saida_Callback(hObject, eventdata, handles)
% barra de load
load = waitbar(0,'Abrindo hist�rico de sa�da.');

% Abre os arquivos
dados_historico_saida = xlsread('Dados de Sa�da.xlsx');

% Fecha o load
close(load)
load = waitbar(1,'Abrindo hist�rico de sa�da.');
close(load)

% Tamanho da p�gina
tamanho_dados = size(dados_historico_saida);

% Cria as cells
Mostrar_Hsaida_R134a = cell(1,9);
Mostrar_Hsaida_Agua = cell(1,9);
Mostrar_Hsaida_Ar = cell(1,7);
Mostrar_Hsaida_NP = cell(1,5);
k1 = 1;
k2 = 1;
k3 = 1;
k4 = 1;

% Avalia o fluido
for i = 1 : 1 : tamanho_dados(1)
    if dados_historico_saida(i,1) == 1
        % Define o fluido
        Mostrar_Hsaida_R134a{k1,1} = 'R134a';
        
        % Salva no vetor para exibir
        for j = 2 : 1 : 8
            Mostrar_Hsaida_R134a{k1,j} = dados_historico_saida(i,j);
        end
        
        % Avalia o titulo para exibir
        if dados_historico_saida(i,9) == 1
            Mostrar_Hsaida_R134a{k1,9} = 'Vapor';
            
        elseif dados_historico_saida(i,9) == 2
            Mostrar_Hsaida_R134a{k1,9} = 'Liquido';
            
        elseif dados_historico_saida(i,9) == 3
            Mostrar_Hsaida_R134a{k1,9} = 'Mistura';
            
        end
        
        % Incrementa o valor de k
        k1 = k1 + 1;
        
    elseif dados_historico_saida(i,1) == 2
        % Define o fluido
        Mostrar_Hsaida_Agua{k2,1} = '�gua';
        
        % Salva no vetor para exibir
        for j = 2 : 1 : 8
            Mostrar_Hsaida_Agua{k2,j} = dados_historico_saida(i,j);
        end
        
        % Avalia o titulo para exibir
        if dados_historico_saida(i,9) == 1
            Mostrar_Hsaida_Agua{k2,9} = 'Vapor';
            
        elseif dados_historico_saida(i,9) == 2
            Mostrar_Hsaida_Agua{k2,9} = 'Liquido';
            
        elseif dados_historico_saida(i,9) == 3
            Mostrar_Hsaida_Agua{k2,9} = 'Mistura';
            
        end
        
        % Incrementa o valor de k
        k2 = k2 + 1;
        
    elseif dados_historico_saida(i,1) == 3
        % Define o fluido
        Mostrar_Hsaida_Ar{k3,1} = 'Ar';
        
        % Salva no vetor para exibir
        for j = 2 : 1 : 7
            Mostrar_Hsaida_Ar{k3,j} = dados_historico_saida(i,j);
        end
        
        % Incrementa o valor de k
        k3 = k3 + 1;
        
    elseif dados_historico_saida(i,1) == 3.1
        % Define o fluido
        Mostrar_Hsaida_NP{k4,1} = 'N�o Padr�o';
        
        % Salva no vetor para exibir
        for j = 2 : 1 : 5
            Mostrar_Hsaida_NP{k4,j} = dados_historico_saida(i,j);
        end
        
        % Incrementa o valor de k
        k4 = k4 + 1;
    end   
end

% Exibi como tabela
Historico_R134a_saida = cell2table(Mostrar_Hsaida_R134a,'VariableNames',{'Fluido' 'T' 'P' 'v' 'u' 'h' 's' 'x' 'Estado'})
Historico_Agua_saida = cell2table(Mostrar_Hsaida_Agua,'VariableNames',{'Fluido' 'T' 'P' 'v' 'u' 'h' 's' 'x' 'Estado'})
Historico_Ar_saida = cell2table(Mostrar_Hsaida_Ar,'VariableNames',{'Fluido' 'T' 'h' 'Pr' 'u' 'Vr' 's'})
Historico_NaoPadrao_saida = cell2table(Mostrar_Hsaida_NP,'VariableNames',{'Fluido' 'T' 'h' 'u' 's'})

% Deleta o Hist�rico dos dados de sa�da
function deletar_dados_saida_Callback(hObject, eventdata, handles)
% Verifica se realmente quer deletar
verificacao = questdlg('Tem certeza que deseja deletar o hist�rico dos dados de sa�da?','DELETAR DADOS DE SA�DA','SIM','N�O','SIM');

% Avalia a escolha
switch verificacao
    case 'SIM'
        % Barra de load
        load = waitbar(0.33333,'Preparando dados para serem deletados.');
        
        % Deleta o arquivo existente
        delete('Dados de Sa�da.xlsx');
        
        % Barra de load
        close(load);
        load = waitbar(0.66666,'Deletando dados.');

        % Cria um novo arquivo
        espaco_inicial = [ 0 0 0 0 0 0 ];
        xlswrite('Dados de Sa�da.xlsx',espaco_inicial); %Dados de sa�da
        
        % Barra de load
        close(load);
        load = waitbar(1,'Dados Deletados.');
        close(load);

    case 'N�O'
        return
end

% Aviso de delete efetuado
msgbox('Os dados de sa�da foram deletados com sucesso.','DELETADO')

% ---------------------------- Fun��es gerais -----------------------------
function closeGUI(src,evnt) %Colocar como fun��o
Encerrar %Questiona se quer encerrar o programa

% _________________________________________________________________________

% ------------------------------- IMAGENS ---------------------------------

% Logo superior
function logo_titulo_CreateFcn(hObject, eventdata, handles)
% Logo
imshow('STTAR_Logo_titulo.jpg')

% Plano de fundo
function fundo_CreateFcn(hObject, eventdata, handles)
% Fundo
imshow('Borda.jpg')

% _________________________________________________________________________

% -------------------------------- Outros ---------------------------------
% --- Executes during object creation, after setting all properties.
function Segunda_propriedade_CreateFcn(hObject, eventdata, handles)
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function entrada_2_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function entrada_1_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function Primeira_propriedade_CreateFcn(hObject, eventdata, handles)
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
