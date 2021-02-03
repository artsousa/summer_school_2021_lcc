function y = erro_quadratico(X,C,Y)
    y = 0;
    for c=1:1
        comp = find(Y==c);
        y = y + sum((X(comp(:,1),:)-C(c,:)).^2, 'all');
    end
    
    return;
end