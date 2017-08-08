%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dados do Programa principal 
%     Nome: STTAR
%     Vers�o: 2.4
% 
% Dados do MATLAB:
%     Vers�o utilizada: R2015a
% 
% Dados da fun��o
%     Nome: STTAR_inicio.m
%     Vers�o: 2.1    
%     Objetivo: Iniciar o programa STTAR.
%     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function varargout = STTAR_inicio(varargin)
% Last Modified by GUIDE v2.5 28-Jun-2017 12:33:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @STTAR_inicio_OpeningFcn, ...
                   'gui_OutputFcn',  @STTAR_inicio_OutputFcn, ...
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

function STTAR_inicio_OpeningFcn(hObject, eventdata, handles, varargin)
% Choose default command line output for STTAR_inicio
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% Centralizar na tela
%Pixels
set( handles.STTAR_inicio, ...
    'Units', 'pixels' );

%Tamanho da tela
screenSize = get(0, 'ScreenSize');

%Calculo do centro da tela
position = get( handles.STTAR_inicio, ...
    'Position' );
position(1) = (screenSize(3)-position(3))/2;
position(2) = (screenSize(4)-position(4))/2;

%Centralizando a janela
set( handles.STTAR_inicio, ...
    'Position', position );

% Trocar icone em cima da tela
javaFrame = get(hObject, 'JavaFrame');
javaFrame.setFigureIcon(javax.swing.ImageIcon('STTAR_Logo.jpg'));
clc;

%Perguntar ao fechar janela
set(handles.STTAR_inicio,'CloseRequestFcn',@closeGUI); %Para pergunta ao fechar

function varargout = STTAR_inicio_OutputFcn(hObject, eventdata, handles) 
% Get default command line output from handles structure
varargout{1} = handles.output;

% _________________________________________________________________________

% -------------------------------- Bot�es ---------------------------------
% Trabalhar com a interface gr�fica
function GUI_Callback(hObject, eventdata, handles)
% Aviso para limpar a mem�ria
uiwait(warndlg('Para uma melhor execu��o recomenda-se utilizar o comando "clear all" na Command Window.','AVISO IMPORTANTE'));

% Abrir nova tela
delete(gcf);
STTAR;

% Trabalhar com a command window
function command_window_Callback(hObject, eventdata, handles)
% Enfeite para ficar bonito
CarregamentoDinamico('Preparando Command Window')

% Abrir nova tela
delete(gcf);

% Mensagem de Constru��o
msgbox('EM CONSTRU��O AGUARDE NOVAS VERS�ES!','EM CONSTRU��O');

% Trabalhar como fun��o
function funcao_Callback(hObject, eventdata, handles)
% Aviso para abrir o manual e encerrar a GUI
uiwait(warndlg('O manual para utiliza��o deste recurso ser� aberto. Recomenda-se que a interface gr�fica seja fechada.','Modo fun��o'));

% Fechar a janela
close STTAR_inicio;

% Mensagem de Constru��o
msgbox('EM CONSTRU��O AGUARDE NOVAS VERS�ES!','EM CONSTRU��O');

% Fecha o programa
function encerrar_Callback(hObject, eventdata, handles)
Encerrar %Questiona se quer encerrar o programa

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

% Abrir tabela completa do �engel
function tabela_apendice_Callback(hObject, eventdata, handles)
winopen('Tabelas Completa (�engel).pdf');

% Menu exibir
function exibir_Callback(hObject, eventdata, handles)

% Exibe nome dos autores
function autores_Callback(hObject, eventdata, handles)
Autores;

% ---------------------------- Fun��es gerais -----------------------------
% Questionamento para fechar
function closeGUI(src,evnt) %Colocar como fun��o
Encerrar %Questiona se quer encerrar o programa

% _________________________________________________________________________

% ------------------------------- IMAGENS ---------------------------------

% --- Executes during object creation, after setting all properties.
function logo_titulo_CreateFcn(hObject, eventdata, handles)
% Logo
imshow('STTAR_Logo_titulo.jpg')

% Fundo
function fundo_CreateFcn(hObject, eventdata, handles)
% Fundo
imshow('Borda.jpg')
