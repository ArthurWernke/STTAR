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
%     Objetivo: Pede uma nova propriedade para definir o estado e então faz
%               os calculos necessários para retornar as propriedades.
%     Variável de Entrada: - tabela = Tabela para pegar os dados
%                          - x e y são as coordenadas já definidas da
%                          temperatura encontrada anteriormente;
%                          - propri é a propriedade escolhida para nova
%                          entrada.
%     Variável de Saída: - Os valores das propriedades do fluído no estado 
%                        encontrado.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [volu , ener , enta , entr , titu] = NovaPropriedade(tabela,x,y,propri)

% Avalia qual propriedade
switch propri
    case 0 % Fechou a janela
        return

    case 1 % Escolheu titulo
        % Nova entrada de título
        c = inputdlg('Digite um valor para o titulo:','Necessário título.',[1 45]);     

        % Verifica cancelamento
        if size(c) == 0
            return
        end

        % Conversosr para número
        titulo = str2double(c);

        % Contra entrada em letra
        if isnan(titulo)
            errordlg('Erro err0302. As entradas apresentam caracteres inválidos.','Erro');
            return
        end

        % Validador física do intervalo
        if  titulo > 1 || titulo < 0
            errordlg('Erro err0307. Entradas fora dos limites teóricos válidos.','Erro');
            return
        end

        % Cálculo das propriedades com título
        volu = CalculoComTitulo(titulo,tabela(x,3),tabela(x,4));
        ener = CalculoComTitulo(titulo,tabela(x,5),tabela(x,7));
        enta = CalculoComTitulo(titulo,tabela(x,8),tabela(x,10));
        entr = CalculoComTitulo(titulo,tabela(x,11),tabela(x,13));
        titu = titulo;

    case 2 % Escolheu volume especifico
        % Nova entrada
        c = inputdlg('Digite um valor para o Volume Específico (m³/kg): ','Necessário Volume Específico.',[1 55]);     

        % Verifica cancelamento
        if size(c) == 0
            return
        end

        % Conversosr para número
        vol_especifico = str2double(c);

        % Contra entrada em letra
        if isnan(vol_especifico)
            warndlg('Erro err0302. As entradas apresentam caracteres inválidos.','Erro');
            return
        end

        % Validador físico do interbalo
        if  vol_especifico <= 0
            errordlg('Erro err0305. Entradas fora dos limites físicos válidos.','Erro');
            return
        end
        
        % Calculo do título e das propriedades do título
        titu = (vol_especifico-tabela(x,3)) / (tabela(x,4)-tabela(x,3));
        entr = CalculoComTitulo(titu,tabela(x,11),tabela(x,13));
        ener = CalculoComTitulo(titu,tabela(x,5),tabela(x,7));
        enta = CalculoComTitulo(titu,tabela(x,8),tabela(x,10));
        volu = vol_especifico;

    case 3 % Escolheu energia interna
        % Nova entrada
        c = inputdlg('Digite um valor para a Energia Interna (kJ/kg): ','Necessário Energia Interna.',[1 55]);         

        % Verifica cancelamento
        if size(c) == 0
            return
        end

        % Conversosr para número
        energia = str2double(c);

        % Contra entrada em letra
        if isnan(energia)
            warndlg('Erro err0302. As entradas apresentam caracteres inválidos.','Erro');
            return
        end

        % Validador físico do intervalo
        if  energia <= 0
            errordlg('Erro err0305. Entradas fora dos limites físicos válidos.','Erro');
            return
        end
              
        % Calculo do título e das propriedades com título
        titu = (energia-tabela(x,5)) / tabela(x,6);
        volu= CalculoComTitulo(titu,tabela(x,3),tabela(x,4));
        enta = CalculoComTitulo(titu,tabela(x,8),tabela(x,10));
        entr = CalculoComTitulo(titu,tabela(x,11),tabela(x,13));
        ener = energia;

    case 4 % Escolheu entalpia
        % Nova entrada
        c = inputdlg('Digite um valor para a Entalpia (kJ/kg): ','Necessário Entalpia.',[1 45]);     

        % Verifica cancelamento
        if size(c) == 0
            return
        end

        % Conversosr para número
        entalpia = str2double(c);

        % Contra entrada em letra
        if isnan(entalpia)
            warndlg('Erro err0302. As entradas apresentam caracteres inválidos.','Erro');
            return
        end

        % Validador físico do interbalo
        if  entalpia <= 0
            errordlg('Erro err0305. Entradas fora dos limites físicos válidos.','Erro');
            return
        end
        
        % Cálculo do título e das propriedades com título
        titu = (entalpia-tabela(x,8)) / tabela(x,9);
        volu= CalculoComTitulo(titu,tabela(x,3),tabela(x,4));
        ener = CalculoComTitulo(titu,tabela(x,5),tabela(x,7));
        entr = CalculoComTitulo(titu,tabela(x,11),tabela(x,13));
        enta = entalpia;

    case 5 % Escolheu entropia
        % Nova entrada de título
        c = inputdlg('Digite um valor para a Entropia (kJ/kg • K): ','Necessário Entropia.',[1 45]);      

        % Verifica cancelamento
        if size(c) == 0
            return
        end

        % Conversosr para número
        entropia = str2double(c);

        % Contra entrada em letra
        if isnan(entropia)
            warndlg('Erro err0302. As entradas apresentam caracteres inválidos.','Erro');
            return
        end

        % Validador físico do interbalo
        if  entropia <= 0
            errordlg('Erro err0305. Entradas fora dos limites físicos válidos.','Erro');
            return
        end

        % Calculo do título com propriedades com título
        titu = (entropia-tabela(x,11)) / tabela(x,12);
        volu = CalculoComTitulo(titu,tabela(x,3),tabela(x,4));
        ener = CalculoComTitulo(titu,tabela(x,5),tabela(x,7));
        enta = CalculoComTitulo(titu,tabela(x,8),tabela(x,10));
        entr = entropia;

    otherwise
        warndlg('Erro errT2@#. Erro inesperado.','Erro');
        return
end

end

