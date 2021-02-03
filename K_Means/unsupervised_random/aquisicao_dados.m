function [X, y] = aquisicao_dados()
    [X, y] = random();

    return;
   
    function [X, y] = random()
        X = [gallery('uniformdata',[10 3],12)+1; ...
            gallery('uniformdata',[30 3],13)+1.9; ...
            gallery('uniformdata',[30 3],14)+3.5; ...
            gallery('uniformdata',[70 3],15)+2.5];
        y = [ones(10,1);2*(ones(30,1));3*(ones(30,1));4*(ones(70,1))];
    end
end