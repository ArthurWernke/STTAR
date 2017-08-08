%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dados do Programa principal 
%     Nome: STTAR.m
%     Versão: 2.4
% 
% Dados do MATLAB:
%     Versão utilizada: R2015a
% 
% Dados da função
%     Nome: InterpolacaoCompletaVapor.m
%     Versão: 1.0    
%     Objetivo: Interpola entre os valores fornecidos na tabela de vapor.
%     Variável de Entrada: - tabela_vapor = tabela de entrada para
%                          interpolação
%                          - temp = propriedade para interpolação
%                          - x = linha
%                          - y = Coluna de interesse
%     Variável de Saída: - tabela_vapor = Tabela com um novo tamanho.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [tabela_vapor] = InterpolacaoCompletaVapor(tabela_vapor,temp,x,y)

% Tamanho da tabela
tamanho_sat = size(tabela_vapor);

% Aumenta uma linha a mais com os dados interpolados
tabela_aumento = ones(tamanho_sat(1)+1,tamanho_sat(2));
tabela_aumento(x,2) = temp;

% Ajuste das linhas antes de x
for i = 1 : 1 : x-1
    for j = 1 : 1 : tamanho_sat(2)
        tabela_aumento(i,j) = tabela_vapor(i,j);
    end
end

%Ajustes das linhas depois de x
for i = x : 1 : tamanho_sat(1)
    for j = 1 : 1 : tamanho_sat(2)
        tabela_aumento(i+1,j) = tabela_vapor(i,j);
    end
end

% Interpola os dados
for i = 1 : 1 : tamanho_sat(2)
    resultado_interpol(i) = Interpolacao(tabela_vapor(x,y),tabela_vapor(x-1,y),tabela_vapor(x,i),tabela_vapor(x-1,i),temp);
end

% Atribui valor na tabela ones
for i = 1 : 1 : tamanho_sat(2)
    tabela_aumento(x,i) = resultado_interpol(i);
end

%Adiciona uma nova linha na tabela de saturação
for i = 1 : 1 : tamanho_sat(1)+1
    for j = 1 : 1 : tamanho_sat(2)
        tabela_vapor(i,j) = tabela_aumento(i,j);
    end
end

end
