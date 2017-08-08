%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dados do Programa principal 
%     Nome: STTAR.m
%     Vers�o: 2.4
% 
% Dados do MATLAB:
%     Vers�o utilizada: R2015a
% 
% Dados da fun��o
%     Nome: Encerrar.m
%     Vers�o: 1.0    
%     Objetivo: Questionar sobre o encerramento do programa.
%     Vari�vel de Entrada: - Nenhuma.
%     Vari�vel de Sa�da: - Nenhuma. 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Encerrar
% Abri nova tela perguntando se deseja fechar
escolha = questdlg('Tem certeza que deseja fechar?','ENCERRAR','SIM','N�O','SIM');

% Avalia a escolha
switch escolha
    case 'SIM'
        delete(gcf);
        clearvars
    case 'N�O'
        return
end
end
