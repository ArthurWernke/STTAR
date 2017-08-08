% movimentação nas tabelas de vapor
tamanho = size(tabela3);
num_linhas = tamanho(1);
num_colunas = tamanho(2);
for i = 1 : 1 : num_linhas
    if tabela3(i,1) == pres && tabela3(i,2) >= temp
        disp('oi')
        break;
    end
end

___________________________________________________________________________

%% Centralizar na tela (colocar na Fcn
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
__________________________________________________________________________

%% Questionamento para fechar
set(handles.figure1,'CloseRequestFcn',@closeGUI); %colocar na Fcn

function closeGUI(src,evnt) %Colocar como função
escolha = questdlg('Tem certeza que deseja fechar?','Encerrar','SIM','NÃO','SIM');
switch escolha
    case 'SIM'
        delete(gcf);
    case 'NÃO'
        return
end
___________________________________________________________________________

% Deixar o botão offline
set(handles.botao,'Enable','off')
___________________________________________________________________________

% Còdigo para menu popup
popup = get(handles.Segunda_propriedade,'Value')
___________________________________________________________________________

% Erros
warndlg('Erro err0411. Entradas não processadas.','Erro');
errordlg('Erro err0411. Entradas não processadas.','Erro');
___________________________________________________________________________

% Barra de load
h = waitbar(porcentagem,afazer);
___________________________________________________________________________