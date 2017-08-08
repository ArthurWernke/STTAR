%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dados do Programa principal 
%     Nome: STTAR.m
%     Vers�o: 2.4
% 
% Dados do MATLAB:
%     Vers�o utilizada: R2015a
% 
% Dados da fun��o
%     Nome: AbrirTabelaR134a.m
%     Vers�o: 1.0    
%     Objetivo: Pede uma nova propriedade para definir o estado e ent�o faz
%               os calculos necess�rios para retornar as propriedades.
%     Vari�vel de Entrada: - tabela = Tabela para pegar os dados
%                          - x e y s�o as coordenadas j� definidas da
%                          temperatura encontrada anteriormente;
%                          - propri � a propriedade escolhida para nova
%                          entrada.
%     Vari�vel de Sa�da: - Os valores das propriedades do flu�do no estado 
%                        encontrado.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [volu , ener , enta , entr , titu] = NovaPropriedade(tabela,x,y,propri)

% Avalia qual propriedade
switch propri
    case 0 % Fechou a janela
        return

    case 1 % Escolheu titulo
        % Nova entrada de t�tulo
        c = inputdlg('Digite um valor para o titulo:','Necess�rio t�tulo.',[1 45]);     

        % Verifica cancelamento
        if size(c) == 0
            return
        end

        % Conversosr para n�mero
        titulo = str2double(c);

        % Contra entrada em letra
        if isnan(titulo)
            errordlg('Erro err0302. As entradas apresentam caracteres inv�lidos.','Erro');
            return
        end

        % Validador f�sica do intervalo
        if  titulo > 1 || titulo < 0
            errordlg('Erro err0307. Entradas fora dos limites te�ricos v�lidos.','Erro');
            return
        end

        % C�lculo das propriedades com t�tulo
        volu = CalculoComTitulo(titulo,tabela(x,3),tabela(x,4));
        ener = CalculoComTitulo(titulo,tabela(x,5),tabela(x,7));
        enta = CalculoComTitulo(titulo,tabela(x,8),tabela(x,10));
        entr = CalculoComTitulo(titulo,tabela(x,11),tabela(x,13));
        titu = titulo;

    case 2 % Escolheu volume especifico
        % Nova entrada
        c = inputdlg('Digite um valor para o Volume Espec�fico (m�/kg): ','Necess�rio Volume Espec�fico.',[1 55]);     

        % Verifica cancelamento
        if size(c) == 0
            return
        end

        % Conversosr para n�mero
        vol_especifico = str2double(c);

        % Contra entrada em letra
        if isnan(vol_especifico)
            warndlg('Erro err0302. As entradas apresentam caracteres inv�lidos.','Erro');
            return
        end

        % Validador f�sico do interbalo
        if  vol_especifico <= 0
            errordlg('Erro err0305. Entradas fora dos limites f�sicos v�lidos.','Erro');
            return
        end
        
        % Calculo do t�tulo e das propriedades do t�tulo
        titu = (vol_especifico-tabela(x,3)) / (tabela(x,4)-tabela(x,3));
        entr = CalculoComTitulo(titu,tabela(x,11),tabela(x,13));
        ener = CalculoComTitulo(titu,tabela(x,5),tabela(x,7));
        enta = CalculoComTitulo(titu,tabela(x,8),tabela(x,10));
        volu = vol_especifico;

    case 3 % Escolheu energia interna
        % Nova entrada
        c = inputdlg('Digite um valor para a Energia Interna (kJ/kg): ','Necess�rio Energia Interna.',[1 55]);         

        % Verifica cancelamento
        if size(c) == 0
            return
        end

        % Conversosr para n�mero
        energia = str2double(c);

        % Contra entrada em letra
        if isnan(energia)
            warndlg('Erro err0302. As entradas apresentam caracteres inv�lidos.','Erro');
            return
        end

        % Validador f�sico do intervalo
        if  energia <= 0
            errordlg('Erro err0305. Entradas fora dos limites f�sicos v�lidos.','Erro');
            return
        end
              
        % Calculo do t�tulo e das propriedades com t�tulo
        titu = (energia-tabela(x,5)) / tabela(x,6);
        volu= CalculoComTitulo(titu,tabela(x,3),tabela(x,4));
        enta = CalculoComTitulo(titu,tabela(x,8),tabela(x,10));
        entr = CalculoComTitulo(titu,tabela(x,11),tabela(x,13));
        ener = energia;

    case 4 % Escolheu entalpia
        % Nova entrada
        c = inputdlg('Digite um valor para a Entalpia (kJ/kg): ','Necess�rio Entalpia.',[1 45]);     

        % Verifica cancelamento
        if size(c) == 0
            return
        end

        % Conversosr para n�mero
        entalpia = str2double(c);

        % Contra entrada em letra
        if isnan(entalpia)
            warndlg('Erro err0302. As entradas apresentam caracteres inv�lidos.','Erro');
            return
        end

        % Validador f�sico do interbalo
        if  entalpia <= 0
            errordlg('Erro err0305. Entradas fora dos limites f�sicos v�lidos.','Erro');
            return
        end
        
        % C�lculo do t�tulo e das propriedades com t�tulo
        titu = (entalpia-tabela(x,8)) / tabela(x,9);
        volu= CalculoComTitulo(titu,tabela(x,3),tabela(x,4));
        ener = CalculoComTitulo(titu,tabela(x,5),tabela(x,7));
        entr = CalculoComTitulo(titu,tabela(x,11),tabela(x,13));
        enta = entalpia;

    case 5 % Escolheu entropia
        % Nova entrada de t�tulo
        c = inputdlg('Digite um valor para a Entropia (kJ/kg � K): ','Necess�rio Entropia.',[1 45]);      

        % Verifica cancelamento
        if size(c) == 0
            return
        end

        % Conversosr para n�mero
        entropia = str2double(c);

        % Contra entrada em letra
        if isnan(entropia)
            warndlg('Erro err0302. As entradas apresentam caracteres inv�lidos.','Erro');
            return
        end

        % Validador f�sico do interbalo
        if  entropia <= 0
            errordlg('Erro err0305. Entradas fora dos limites f�sicos v�lidos.','Erro');
            return
        end

        % Calculo do t�tulo com propriedades com t�tulo
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

