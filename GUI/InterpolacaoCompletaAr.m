%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dados do Programa principal 
%     Nome: STTAR.m
%     Vers�o: 2.4
% 
% Dados do MATLAB:
%     Vers�o utilizada: R2015a
% 
% Dados da fun��o
%     Nome: InterpolacaoCompletaAr.m
%     Vers�o: 1.0    
%     Objetivo: Interpola entre os valores fornecidos.
%     Vari�vel de Entrada: - tabela_ar = tabela de entrada para
%                          interpola��o
%                          - temp = propriedade para interpola��o
%                          - x = linha para interpolar
%                          - y = coluna da propriedade para interpola��o
%     Vari�vel de Sa�da: - tabela_ar = Tabela com um novo tamanho.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [tabela_ar] = InterpolacaoCompletaAr(tabela_ar,temp,x,y)
% Tamanho da tabela
tamanho_sat = size(tabela_ar);

% Aumenta uma linha a mais com os dados interpolados
tabela_aumento = ones(tamanho_sat(1)+1,tamanho_sat(2));
tabela_aumento(x,y) = temp;

% Ajuste das linhas antes de x
for i = 1 : 1 : x-1
    for j = 1 : 1 : tamanho_sat(2)
        tabela_aumento(i,j) = tabela_ar(i,j);
    end
end

%Ajustes das linhas depois de x
for i = x : 1 : tamanho_sat(1)
    for j = 1 : 1 : tamanho_sat(2)
        tabela_aumento(i+1,j) = tabela_ar(i,j);
    end
end

% Interpola os dados
for i = 1 : 1 : tamanho_sat(2)
    resultado_interpol(i) = Interpolacao(tabela_ar(x-1,y),tabela_ar(x,y),tabela_ar(x-1,i),tabela_ar(x,i),temp);
end

% Atribui valor na tabela ones
for i = 1 : 1 : tamanho_sat(2)
    tabela_aumento(x,i) = resultado_interpol(i);
end

%Adiciona uma nova linha na tabela de satura��o
for i = 1 : 1 : tamanho_sat(1)+1
    for j = 1 : 1 : tamanho_sat(2)
        tabela_ar(i,j) = tabela_aumento(i,j);
    end
end

end
