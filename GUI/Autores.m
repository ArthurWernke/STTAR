%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dados do Programa principal 
%     Nome: STTAR
%     Versão: 2.4
% 
% Dados do MATLAB:
%     Versão utilizada: R2015a
% 
% Dados da função
%     Nome: Autores.m
%     Versão: 2.0    
%     Objetivo: Mostrar os autores das versões do programa.
%     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function varargout = Autores(varargin)
% Last Modified by GUIDE v2.5 29-May-2017 11:46:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Autores_OpeningFcn, ...
                   'gui_OutputFcn',  @Autores_OutputFcn, ...
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

% --- Executes just before autores is made visible.
function Autores_OpeningFcn(hObject, eventdata, handles, varargin)
% Choose default command line output for autores
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% Centralizar na tela
%Pixels
set( handles.Autores, ...
    'Units', 'pixels' );

%Tamanho da tela
screenSize = get(0, 'ScreenSize');

%Calculo do centro da tela
position = get( handles.Autores, ...
    'Position' );
position(1) = (screenSize(3)-position(3))/2;
position(2) = (screenSize(4)-position(4))/2;

%Centralizando a janela
set( handles.Autores, ...
    'Position', position );

% Trocar icone em cima da tela
javaFrame = get(hObject, 'JavaFrame');
javaFrame.setFigureIcon(javax.swing.ImageIcon('STTAR_Logo.jpg'));
clc;

% --- Outputs from this function are returned to the command line.
function varargout = Autores_OutputFcn(hObject, eventdata, handles) 
% Get default command line output from handles structure
varargout{1} = handles.output;
