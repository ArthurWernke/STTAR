%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dados do Programa principal 
%     Nome: STTAR
%     Versão: 2.4
% 
% Dados do MATLAB:
%     Versão utilizada: R2015a
% 
% Dados da função
%     Nome: Calculadora_Dimensoes.m
%     Versão: 0.0    
%     Objetivo: Possibilitar o calculo de forma fácil das conversões das
%               unidades de medida
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function varargout = Calculadora_Dimensoes(varargin)
% Last Modified by GUIDE v2.5 28-May-2017 21:17:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Calculadora_Dimensoes_OpeningFcn, ...
                   'gui_OutputFcn',  @Calculadora_Dimensoes_OutputFcn, ...
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
% End initialization code - DO NOT EDIT

% --- Executes just before Calculadora_Dimensoes is made visible.
function Calculadora_Dimensoes_OpeningFcn(hObject, eventdata, handles, varargin)
% Choose default command line output for Calculadora_Dimensoes
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% Centralizar na tela
%Pixels
set( handles.calculadora, ...
    'Units', 'pixels' );

%Tamanho da tela
screenSize = get(0, 'ScreenSize');

%Calculo do centro da tela
position = get( handles.calculadora, ...
    'Position' );
position(1) = (screenSize(3)-position(3))/2;
position(2) = (screenSize(4)-position(4))/2;

%Centralizando a janela
set( handles.calculadora, ...
    'Position', position );

% Trocar icone em cima da tela
javaFrame = get(hObject, 'JavaFrame');
javaFrame.setFigureIcon(javax.swing.ImageIcon('STTAR_Logo.jpg'));
clc;

% --- Outputs from this function are returned to the command line.
function varargout = Calculadora_Dimensoes_OutputFcn(hObject, eventdata, handles) 
% Get default command line output from handles structure
varargout{1} = handles.output;

% _________________________________________________________________________

% ------------------------------- Entradas --------------------------------
% Valor que quer converter
function valor_Callback(hObject, eventdata, handles)

% Seleciona unidade de entrada
function unidade_antes_Callback(hObject, eventdata, handles)

% Seleciona a unidade de saída
function unidade_saida_Callback(hObject, eventdata, handles)

% -------------------------------- Botões ---------------------------------
% Faz o calculo da conversão
function calculo_Callback(hObject, eventdata, handles)

% _________________________________________________________________________

% -------------------------------- Outros ---------------------------------
% --- Executes during object creation, after setting all properties.
function unidade_saida_CreateFcn(hObject, eventdata, handles)
% hObject    handle to unidade_saida (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function unidade_antes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to unidade_antes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function valor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to valor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
