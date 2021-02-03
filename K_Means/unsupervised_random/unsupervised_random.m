clc; close all;

rng default;

%% Aquisicao dos dados
[X, T] = aquisicao_dados();
[~, y] = size(X);

% X = M;
% T = idx;

%% Definicao dos parametros
t = [2];
v = zeros(size(t,2),1);

%% Executar o algoritmo para diferentes valores de K
for i=1:size(t,2)
    K = t(i);
    figure;
    scatter3(X(:,1),X(:,2),X(:,3),100,'filled');

    title('K-means Algorithm - Parameters');
    hold on;
    
    C = rand(K,y)*5;
    scatter3(C(:,1),C(:,2),C(:,3),50,'filled');

    hold off;

    %% Primeira iteracao 
    [C, Y] = atribuir_centroides(X,C);
    plot_step(X,C,Y,1);

    %% Convergencia
    C = calcular_centroides(X,C,Y);
    plot_step(X,C,Y,1);

    old = zeros(size(C,1),size(C,2));

    step = 2;
    while ~isequal(old,C)
        old = C;

        [C, Y] = atribuir_centroides(X,C);
        plot_step(X,C,Y,step);

        C = calcular_centroides(X,C,Y);
        plot_step(X,C,Y,step);

        step = step+1;
    end
    
end

% %% Somatório erro quadratico
% v(i, 1) = erro_quadratico(X,C,Y);
% 
% %% exibir variancia para cada valor de K
% figure;
% scatter(t',v);
% ytickformat('usd')



