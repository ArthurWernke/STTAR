%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dados do Programa principal 
%     Nome: STTAR.m
%     Vers�o: 2.4
% 
% Dados do MATLAB:
%     Vers�o utilizada: R2015a
% 
% Dados da fun��o
%     Nome: TabelaVaporInterpolada3Propri.m
%     Vers�o: 1.0    
%     Objetivo: Interpola entre os valores fornecidos na tabela de vapor,
%               para casos da energia interna, entalpia e entropia.
%     Vari�vel de Entrada: - tabela_vapor = tabela de entrada para
%                          interpola��o
%                          - tamanho_vapor = tamanho da tabela de vapor
%                          - ener = Propriedade base de interpola��o
%                          - x = linha de interpola��o
%                          - y = coluna de interpola��o
%     Vari�vel de Sa�da: - tabela_vapor = Tabela com um novo tamanho.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [tabela_vapor] = TabelaVaporInterpolada3Propri(tabela_vapor,tamanho_vapor,ener,x,y)
% variaveis necess�rias
I = 1;
i = x;

% Confere o limite da faixa de press�o igual
while tabela_vapor(i,1) == tabela_vapor(x,1)
    for k = 1 : 1 : tamanho_vapor(2)
        tabela_interpolSeg(I,k) = tabela_vapor(i,k);
    end
    I = I + 1;
    i = i + 1;

    % Evitar ultrapassar o limite da tabela
    if i > tamanho_vapor(1)
       break; 
    end 
end  

% Zera os contadores para pr�xima matriz
i = x-1;
I = 1;

% Delimita os valores iniciais e finais das temperaturas para interpolar para press�o menor 
while tabela_vapor(i,1) == tabela_vapor(x-1,1)                       
    % Contador
    i = i - 1;

    % Evitar ultrapassar o limite da tabela
    if i <= 0
       break; 
    end 
end

% Pega a nova tabela
while tabela_vapor(i,y) > ener 
    for k = 1 : 1 : tamanho_vapor(2)
        tabela_interpolPri(I,k) = tabela_vapor(i,k);
    end

    % Caminhador
    I = I + 1;
    i = i - 1;
end

% Desinverte matriz
tabela_interpolPri = InverteMatriz(tabela_interpolPri);

% Interpola��o do valor de press�o
pres = Interpolacao(tabela_interpolPri(1,y),tabela_interpolSeg(1,y),tabela_interpolPri(1,1),tabela_interpolSeg(1,1),ener);

% Defini as tabelas para interpola��o entre tabelas vapor
% Variaveis necess�rias
I = 1;
i = x;

% Confere o limite da faixa de press�o igual
while tabela_vapor(i,1) == tabela_vapor(x,1)
    for k = 1 : 1 : tamanho_vapor(2)
        tabela_interpolMax(I,k) = tabela_vapor(i,k);
    end
    I = I + 1;
    i = i + 1;

    % Eveitar ultrapassar o limite da tabela
    if i > tamanho_vapor(1)
       break; 
    end 
end  

% Inverte matriz para dicionar novas valores
tabela_interpolMax = InverteMatriz(tabela_interpolMax);

% Reinicia variaveis
i = x-1;

% Define os valores minimos de press�o igual
while tabela_vapor(i,1) == tabela_vapor(x,1)
    for k = 1 : 1 : tamanho_vapor(2)
        tabela_interpolMax(I,k) = tabela_vapor(i,k);
    end
    I = I + 1;
    i = i - 1;

    % Eveitar ultrapassar o limite da tabela
    if i > tamanho_vapor(1)
       break; 
    end 
end  

% Inverte matriz para uso
tabela_interpolMax = InverteMatriz(tabela_interpolMax);

% Coordenada para adicionar a nova tabela
coord = i + 1;

% Zera os contadores para pr�xima matriz
I = 1;
j = i;

% Delimita os valores iniciais e finais das temperaturas para interpolar para press�o menor 
while tabela_vapor(i,1) == tabela_vapor(j,1)
    for k = 1 : 1 : tamanho_vapor(2)
        tabela_interpolMin(I,k) = tabela_vapor(i,k);
    end
    I = I + 1;
    i = i - 1;

    % Eveitar ultrapassar o limite da tabela
    if i <= 0
       break; 
    end 
end

% Desinverte matriz
tabela_interpolMin = InverteMatriz(tabela_interpolMin);

% Interpola entre uma tabela e outra
tabela_vapor = InterpolacaoEntreTabelaCompletaVapor(tabela_vapor,tabela_interpolMax,tabela_interpolMin,pres,coord); 
end
