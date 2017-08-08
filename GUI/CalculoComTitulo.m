%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dados do Programa principal 
%     Nome: STTAR.m
%     Vers�o: 2.4
% 
% Dados do MATLAB:
%     Vers�o utilizada: R2015a
% 
% Dados da fun��o
%     Nome: CalculoComTitulo.m
%     Vers�o: 2.0    
%     Objetivo: Realizar o c�lculo do t�tulo e das propriedades na zona de
%               mistura.
%     Vari�vel de Entrada: - titulo = titulo da mistura;
%                          - xl = Valor da propriedade como l�quido;
%                          - xg = Valor da propriedade como g�s.
%     Vari�vel de Sa�da: - resul = resultado da propriedade com o t�tulo
%                        aplicado
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function resul = CalculoComTitulo(titulo,xl,xg)

resul = xl + (titulo*(xg-xl));

end
