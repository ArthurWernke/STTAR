%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dados do Programa principal 
%     Nome: STTAR.m
%     Vers�o: 2.4
% 
% Dados do MATLAB:
%     Vers�o utilizada: R2015a
% 
% Dados da fun��o
%     Nome: InterpolacaoCompleta.m
%     Vers�o: 1.0    
%     Objetivo: Interpola entre os valores fornecidos.
%     Vari�vel de Entrada: - tabela_SatT = tabela de entrada para
%                          interpola��o
%                          - temp = propriedade para interpola��o
%     Vari�vel de Sa�da: - tabela_SatT = Tabela com um novo tamanho.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [tabela_satT] = InterpolacaoCompleta(tabela_satT,temp,x)
% Tamanho da tabela
tamanho_sat = size(tabela_satT);

% Aumenta uma linha a mais com os dados interpolados
tabela_aumento = ones(tamanho_sat(1)+1,tamanho_sat(2));
tabela_aumento(x,1) = temp;

% Ajuste das linhas antes de x
for i = 1 : 1 : x-1
    for j = 1 : 1 : tamanho_sat(2)
        tabela_aumento(i,j) = tabela_satT(i,j);
    end
end

%Ajustes das linhas depois de x
for i = x : 1 : tamanho_sat(1)
    for j = 1 : 1 : tamanho_sat(2)
        tabela_aumento(i+1,j) = tabela_satT(i,j);
    end
end

% Interpola os dados
for i = 2 : 1 : tamanho_sat(2)
    resultado_interpol(i) = Interpolacao(tabela_satT(x,1),tabela_satT(x-1,1),tabela_satT(x,i),tabela_satT(x-1,i),temp);
end

% Atribui valor na tabela ones
for i = 2 : 1 : tamanho_sat(2)
    tabela_aumento(x,i) = resultado_interpol(i);
end

%Adiciona uma nova linha na tabela de satura��o
for i = 1 : 1 : tamanho_sat(1)+1
    for j = 1 : 1 : tamanho_sat(2)
        tabela_satT(i,j) = tabela_aumento(i,j);
    end
end

end
