%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dados do Programa principal 
%     Nome: STTAR.m
%     Vers�o: 2.4
% 
% Dados do MATLAB:
%     Vers�o utilizada: R2015a
% 
% Dados da fun��o
%     Nome: CarregamentoDinamico.m
%     Vers�o: 1.0    
%     Objetivo: Proporcionar um enfeite durante a troca da interface
%               gr�fica para a command window
%     Vari�vel de Entrada: - afazer: Qual mensagem ser� mostrada na barra 
%                                    de load 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function CarregamentoDinamico(afazer)

h = waitbar(0,afazer);
steps = 1000;
for step = 1:steps
    waitbar(step / steps)
end
close(h) 

end
