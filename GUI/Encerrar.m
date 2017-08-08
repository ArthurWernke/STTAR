%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dados do Programa principal 
%     Nome: STTAR.m
%     Versão: 2.4
% 
% Dados do MATLAB:
%     Versão utilizada: R2015a
% 
% Dados da função
%     Nome: Encerrar.m
%     Versão: 1.0    
%     Objetivo: Questionar sobre o encerramento do programa.
%     Variável de Entrada: - Nenhuma.
%     Variável de Saída: - Nenhuma. 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Encerrar
% Abri nova tela perguntando se deseja fechar
escolha = questdlg('Tem certeza que deseja fechar?','ENCERRAR','SIM','NÃO','SIM');

% Avalia a escolha
switch escolha
    case 'SIM'
        delete(gcf);
        clearvars
    case 'NÃO'
        return
end
end
