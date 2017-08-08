%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dados do Programa principal 
%     Nome: STTAR.m
%     Versão: 2.4
% 
% Dados do MATLAB:
%     Versão utilizada: R2015a
% 
% Dados da função
%     Nome: Interpolação.m
%     Versão: 2.0    
%     Objetivo: Interpola entre os valores fornecidos.
%     Variável de Entrada: - x1 e y1 = Valores para o ponto 1, antes do
%                          valor desejado para interpolar.
%                          - x2 e y2 = Valores para o ponto 2, depois do
%                          valor desejado para interpolar.
%                          - x = propriedade que se deseja obter o valor
%                          interpolado.
%     Variável de Saída: - y = valor da interpolação para a propriedade x. 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function y = Interpolacao(x1,x2,y1,y2,x)

% x é temperatura y é pressão (p/ temperatura)
% x1 < x2 e y1 < y2

y = y1 + (((x-x1)/(x2-x1))*(y2-y1));

end
