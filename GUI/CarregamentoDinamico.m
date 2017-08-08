%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dados do Programa principal 
%     Nome: STTAR.m
%     Versão: 2.4
% 
% Dados do MATLAB:
%     Versão utilizada: R2015a
% 
% Dados da função
%     Nome: CarregamentoDinamico.m
%     Versão: 1.0    
%     Objetivo: Proporcionar um enfeite durante a troca da interface
%               gráfica para a command window
%     Variável de Entrada: - afazer: Qual mensagem será mostrada na barra 
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
