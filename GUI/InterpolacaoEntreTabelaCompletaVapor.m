%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dados do Programa principal 
%     Nome: STTAR.m
%     Versão: 2.4
% 
% Dados do MATLAB:
%     Versão utilizada: R2015a
% 
% Dados da função
%     Nome: InterpolacaoEntreTabelaCompletaVapor.m
%     Versão: 1.0    
%     Objetivo: Interpola entre os valores fornecidos na tabela de vapor.
%     Variável de Entrada: - tabela_vapor = tabela de entrada para
%                          interpolação
%                          - pres = propriedade para interpolação
%                          - x = linha
%                          - tabela_interpolMax = Tabala com os valores 
%                          maiores para interpolação;
%                          - tabela_interpolMin = Tabela com os valores 
%                          menores para interpolação;
%     Variável de Saída: - tabela_vapor = Tabela com um novo tamanho.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [tabela_vapor] = InterpolacaoEntreTabelaCompletaVapor(tabela_vapor,tabela_interpolMax,tabela_interpolMin,pres,x)

% Tamanho da tabela
tamanho = size(tabela_vapor);

% Tamanho das tabelas para interpolar
tamanho_TabelaMin = size(tabela_interpolMin);
tamanho_TabelaMax = size(tabela_interpolMax);

% Avalia o limite da tabela
if tamanho_TabelaMax(1) >  tamanho_TabelaMin(1)
    limite_tabela = tamanho_TabelaMin(1);
    fim = 0;
elseif tamanho_TabelaMax(1) < tamanho_TabelaMin(1)
    limite_tabela = tamanho_TabelaMax(1);
    fim = 1;
else
    limite_tabela = tamanho_TabelaMin(1);
    fim = 0;
end

% Variaveis de inicia da interpolação
i = 1; %Linha para Min
j = 1; %Linha para Max
k = 1; %Linha para interpol
redutor = 0; %Reduz o limite da tabela para caso não tenha que pular valores

while i <= (limite_tabela + fim)
    if tabela_interpolMin(i,2) == tabela_interpolMax(j,2) || i == 1
        for l = 2 : 1 : tamanho(2)    
            resultado_interpol(k,1) = pres;
            resultado_interpol(k,l) = Interpolacao(tabela_interpolMin(i,1),tabela_interpolMax(j,1),tabela_interpolMin(i,l),tabela_interpolMax(j,l),pres);
        end
        
        % Incremento
        i = i + 1;
        j = j + 1;
        k = k + 1;
        
    elseif tabela_interpolMin(i,2) < tabela_interpolMax(i,2)
        i = i + 1;
        redutor = redutor + 1;
        
    elseif tabela_interpolMin(i,2) > tabela_interpolMax(i,2)
        j = j + 1;
        
    end
            
end

% Tamanho interpolado
tamanho_resultado = size(resultado_interpol);

% Ajusta o limite da tabela
if tamanho_resultado(1,1) > limite_tabela || tamanho_resultado(1,1) < limite_tabela
    limite_tabela = limite_tabela - redutor;
end

% Aumenta uma linha a mais com os dados interpolados
tabela_aumento = ones(tamanho(1) + limite_tabela , tamanho(2));

% Ajuste das linhas antes de x
for i = 1 : 1 : x-1
    for j = 1 : 1 : tamanho(2)
        tabela_aumento(i,j) = tabela_vapor(i,j);
    end
end

% Andador na linha
linha = 0;

% Ajustes das linhas depois de x
for i = x+limite_tabela : 1 : tamanho(1)+limite_tabela
    for j = 1 : 1 : tamanho(2)
        tabela_aumento(i,j) = tabela_vapor(x+linha,j);
    end
    linha = linha + 1;
end

linha = 1;

% Atribui valor na tabela ones
for i = x : 1 : x+limite_tabela-1
    for j = 1 : 1 : tamanho(2)
        tabela_aumento(i,j) = resultado_interpol(linha,j);
    end
    linha = linha + 1;
end

% Adiciona uma nova linha na tabela de saturação
for i = 1 : 1 : tamanho(1)+limite_tabela
    for j = 1 : 1 : tamanho(2)
        tabela_vapor(i,j) = tabela_aumento(i,j);
    end
end

end
