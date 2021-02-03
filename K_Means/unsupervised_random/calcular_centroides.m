function C = calcular_centroides(X,C,Y)
    for c=1:size(C,1)
        comp = find(Y==c);
        
        if(size(comp, 1) > 0)
            comp = X(comp(:, 1),:);
            C(c, :) = mean(comp);
        end
    end
end