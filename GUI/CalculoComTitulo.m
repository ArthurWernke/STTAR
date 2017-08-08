%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dados do Programa principal 
%     Nome: STTAR.m
%     Versão: 2.4
% 
% Dados do MATLAB:
%     Versão utilizada: R2015a
% 
% Dados da função
%     Nome: CalculoComTitulo.m
%     Versão: 2.0    
%     Objetivo: Realizar o cálculo do título e das propriedades na zona de
%               mistura.
%     Variável de Entrada: - titulo = titulo da mistura;
%                          - xl = Valor da propriedade como líquido;
%                          - xg = Valor da propriedade como gás.
%     Variável de Saída: - resul = resultado da propriedade com o título
%                        aplicado
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function resul = CalculoComTitulo(titulo,xl,xg)

resul = xl + (titulo*(xg-xl));

end
