function plot_step(X,C,Y,step)
    figure('Name', 'Kmeans Algorithm');
    scatter3(X(:,1),X(:,2),X(:,3),10,Y, 'filled');

    hold on;

    title(strcat(int2str(step), ' - Step'));
    scatter3(C(:,1),C(:,2),C(:,3),50,'filled');

    hold off;
end