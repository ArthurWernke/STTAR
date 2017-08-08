%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dados do Programa principal 
%     Nome: STTAR
%     Versão: 2.4
% 
% Dados do MATLAB:
%     Versão utilizada: R2015a
% 
% Dados da função
%     Nome: Conversoes.m
%     Versão: 1.0    
%     Objetivo: Exibe tabela de conversões de unidade
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function varargout = conversoes(varargin)
% Last Modified by GUIDE v2.5 28-May-2017 21:18:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @conversoes_OpeningFcn, ...
                   'gui_OutputFcn',  @conversoes_OutputFcn, ...
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

function conversoes_OpeningFcn(hObject, eventdata, handles, varargin)
% Choose default command line output for Conversoes
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% Centralizar na tela
%Pixels
set( handles.Conversoes, ...
    'Units', 'pixels' );

%Tamanho da tela
screenSize = get(0, 'ScreenSize');

%Calculo do centro da tela
position = get( handles.Conversoes, ...
    'Position' );
position(1) = (screenSize(3)-position(3))/2;
position(2) = (screenSize(4)-position(4))/2;

%Centralizando a janela
set( handles.Conversoes, ...
    'Position', position );

% Trocar icone em cima da tela
javaFrame = get(hObject, 'JavaFrame');
javaFrame.setFigureIcon(javax.swing.ImageIcon('STTAR_Logo.jpg'));
clc;

function varargout = conversoes_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% _________________________________________________________________________
% Calculadora_Dimensoes
function calc_ClickedCallback(hObject, eventdata, handles)
Calculadora_Dimensoes
