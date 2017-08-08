%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dados do Programa principal 
%     Nome: STTAR.m
%     Vers�o: 2.4
% 
% Dados do MATLAB:
%     Vers�o utilizada: R2015a
% 
% Dados da fun��o
%     Nome: VerificarTabela.m
%     Vers�o: 1.0    
%     Objetivo: Verificar se todos os valores das tabelas estam v�lidos.
%               Caso n�o retornar uma mensagem de erro.
%     Vari�vel de Entrada: - Tabela que ser� avaliada. 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function VerificarTabela(tabela,load)

% Verificador de entradas completas
tamanho = size(tabela);
total_linhas = tamanho(1);
total_colunas = tamanho(2);
for i=1:1:total_linhas
    for j=1:1:total_colunas
        if isnan(tabela(i,j))
            errordlg('Erro err0101. As tabelas possuem valores incoerentes.','Erro');
            close(load);
            break;
        end
    end
end

end
