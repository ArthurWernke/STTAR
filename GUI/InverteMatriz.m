%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dados do Programa principal 
%     Nome: STTAR.m
%     Vers�o: 2.4
% 
% Dados do MATLAB:
%     Vers�o utilizada: R2015a
% 
% Dados da fun��o
%     Nome: InverteMatriz.m
%     Vers�o: 1.0    
%     Objetivo: Interpola entre os valores fornecidos.
%     Vari�vel de Entrada: - Tabela = Tabela com as linhas na ordem.
%     Vari�vel de Sa�da: - Tabela = Tabela com as linhas invertidas. 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [Tabela] = InverteMatriz(tabela)

% tamanho da tabela
tamanho = size(tabela);

% variavel inversora
inversor = 0;

% Inverte a matriz
for i = 1 : 1 : tamanho(1)
    for j = 1 : 1 : tamanho(2)
        Tabela(i,j) = tabela(tamanho(1) - inversor,j);
    
    end
    inversor = inversor + 1;
end

end
