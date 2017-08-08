%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dados do Programa principal 
%     Nome: STTAR.m
%     Vers�o: 2.4
% 
% Dados do MATLAB:
%     Vers�o utilizada: R2015a
% 
% Dados da fun��o
%     Nome: Interpola��o.m
%     Vers�o: 2.0    
%     Objetivo: Interpola entre os valores fornecidos.
%     Vari�vel de Entrada: - x1 e y1 = Valores para o ponto 1, antes do
%                          valor desejado para interpolar.
%                          - x2 e y2 = Valores para o ponto 2, depois do
%                          valor desejado para interpolar.
%                          - x = propriedade que se deseja obter o valor
%                          interpolado.
%     Vari�vel de Sa�da: - y = valor da interpola��o para a propriedade x. 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function y = Interpolacao(x1,x2,y1,y2,x)

% x � temperatura y � press�o (p/ temperatura)
% x1 < x2 e y1 < y2

y = y1 + (((x-x1)/(x2-x1))*(y2-y1));

end
