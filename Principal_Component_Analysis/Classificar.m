%Classificador: Distância Euclidiana
%Entrada:
%   PC = Conjunto de treinamento
%   x = amostra a ser comparada
%Saída
%d = posição do item com a menor distância euclidiana entre a amostra e as
%colunas do conjunto de treinamento
function d = Classificar(PC,x)
    d = 1;
    minDist = norm(PC(:,1) - x);
    for j = 2:size(PC)
        EucDist = norm(PC(:,j) - x);
        if minDist > EucDist
            d = j;
            minDist = EucDist;
        end
    end
end