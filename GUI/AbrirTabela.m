%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dados do Programa principal 
%     Nome: STTAR.m
%     Versão: 2.4
% 
% Dados do MATLAB:
%     Versão utilizada: R2015a
% 
% Dados da função
%     Nome: AbrirTabelaR134a.m
%     Versão: 1.0    
%     Objetivo: Abrir as tabela termodinâmicas do R134a (tabelas A11, A12 e
%               A13) para utilização no programa principal STTAR.
%     Variável de Entrada: - fluido: Qual o fluído de trabalho.
%     Variável de Saída: - tabela1 é tabela do fluido Saturada com entrada
%                        em Temperatura.
%                        - tabela2 é tabela de fluído Saturada com entrada
%                        em pressão.
%                        - tabela3 é a tabela de ar vapor superaquecido 
%                        com entrada em pressão. 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [tabela1 , tabela2 , tabela3 , tabela4] = AbrirTabela(fluido)

if strcmp(fluido,'R134a') == 1 %Caso escolha seja R134a
    % Abrindo tabela de saturada com entrada em temperada
    load = waitbar(0,'Abrindo tabela de saturação com entrada em temperatura');
    tabela1 = xlsread('R134a Saturada Temperatura (A11).xlsx'); %Tabela A11, R134a Temperatura
    close(load);
    load = waitbar(0.16,'Verificando tabela');
    VerificarTabela(tabela1,load);
    close(load);
    
    % Abrindo tabela de saturada com entrada em pressão
    load = waitbar(0.33,'Abrindo tabela de saturação com entrada em pressão');
    tabela2 = xlsread('R134a Saturada Pressão (A12).xlsx'); %Tabela A12, R134a Pressão
    close(load);
    load = waitbar(0.5,'Verificando tabela');
    VerificarTabela(tabela2,load);
    close(load);
    
    % Abrindo tabela de vapor
    load = waitbar(0.66,'Abrindo tabela de vapor');
    tabela3 = xlsread('R134a Vapor (A13).xlsx'); %Tabela A13, R134a em vapor superaquecido
    close(load);
    load = waitbar(0.83,'Verificando tabela');
    VerificarTabela(tabela3,load);
    close(load);
    
    tabela4 = 0; %Apenas para retornar
    
    % Barra completa
    load = waitbar(1,'Completo');
    close(load);
end

if strcmp(fluido,'Água') == 1 %Caso escolha seja água
    % Abrindo tabela de saturada com entrada em temperada
    load = waitbar(0,'Abrindo tabela de saturação com entrada em temperatura');
    tabela1 = xlsread('Água Saturada Temperatura (A4).xlsx'); %Tabela A4, água Temperatura
    close(load);
    load = waitbar(0.125,'Verificando tabela');
    VerificarTabela(tabela1,load);
    close(load);
    
    % Abrindo tabela de saturada com entrada em pressão
    load = waitbar(0.25,'Abrindo tabela de saturação com entrada em pressão');
    tabela2 = xlsread('Água Saturada Pressão (A5).xlsx'); %Tabela A5, água Pressão
    close(load);
    load = waitbar(0.375,'Verificando tabela');
    VerificarTabela(tabela2,load);
    close(load);
    
    % Abrindo tabela de vapor
    load = waitbar(0.5,'Abrindo tabela de vapor');
    tabela3 = xlsread('Água Vapor (A6).xlsx'); %Tabela A6, água em vapor superaquecido    close(load);
    close(load);
    load = waitbar(0.625,'Verificando tabela');
    VerificarTabela(tabela3,load);
    close(load);
    
    % Abrindo tabela de liquido comprimido
    load = waitbar(0.75,'Abrindo tabela de líquido comprimido');
    tabela4 = xlsread('Água Liquido Comprimido (A7).xlsx'); %Tabela A6, água em vapor superaquecido    close(load);
    close(load);
    load = waitbar(0.875,'Verificando tabela');
    VerificarTabela(tabela3,load);
    close(load);
    
    % Barra completa
    load = waitbar(1,'Completo');
    close(load);
        
end

if strcmp(fluido,'Ar') == 1 %Caso escolha seja ar
    % Abrindo tabela de Ar
    load = waitbar(0,'Abrindo tabela');
    tabela1 = xlsread('Gas ideal Ar (A17).xlsx'); %Tabela A17, gás ideal ar
    close(load);
    load = waitbar(0.5,'Verificando tabela');
    VerificarTabela(tabela1,load);
    close(load);
    
    tabela2 = 0; %Apenas para retornar
    
    tabela3 = 0; %Apenas para retornar
    
    tabela4 = 0; %Apenas para retornar

    % Barra completa
    load = waitbar(1,'Completo');
    close(load);
end

end
