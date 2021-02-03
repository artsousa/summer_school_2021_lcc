function [C, Y] = atribuir_centroides(X, C)
    Y = zeros(size(X,1), 1);
    
    for x=1:size(X,1)
        dist = zeros(size(C,1), 1);
        for c=1:size(C,1)
            dist(c, 1) = calcular_distancia(X(x,:), C(c,:));
        end
        
        [~, index] = min(dist);
        Y(x, 1) = index;
    end
end