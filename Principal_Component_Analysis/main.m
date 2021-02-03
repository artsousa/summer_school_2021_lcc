%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Arthur Ricardo - PDI2019 %%
%%        MAIN             %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear, close all, clc;

hit = 0;
groups = 40;
nimages = 10;
folder = 'D:\code\pca\case_pca';
train = [0.5, 0.6 , 0.7];

cd(folder);

tmptrainned = round(nimages * train(3));
data = lerImgs(tmptrainned);

cd(folder);
[P, PC, mn] = GerarPCs(data);
for i = 1:groups
    hitsperclass = 0;
    for j=tmptrainned+1:nimages
        tmp = imread(strcat(folder,['\orl_faces\s' int2str(i) '\'],int2str(j),'.pgm'));
        x = reshape(tmp, [size(tmp, 1), size(tmp, 2)]);
        
        d = Classificar(PC, ProjetarAmostra(x,mn,P));
        if (ceil(d/tmptrainned) == i)
            hit = hit + 1;
            hitsperclass = hitsperclass + 1;
        else
%             figure(1);
%             imshowpair(reshape(data(:, d), size(x, 1), size(x, 2)), tmp, 'montage');
%             x = input('iit');
        end
    end
    
    fprintf('Hits per class (%d): %d - %d%%, total tested: %d \n', ...
                i, ...
                hitsperclass, ...
                100*hitsperclass/(nimages-tmptrainned), ...
                nimages - tmptrainned);
end

totalt = groups * (nimages - tmptrainned);

fprintf('numero de testes - %d\n', totalt);
fprintf('numero de acertos - %d\n', hit);
fprintf('Porcentagem de acerto - %f%%\n', 100 * (hit / totalt));
fprintf('Porcentagem de erro - %f%%\n \\\\\\\\', 100 * (1 - (hit / totalt)));

cd(folder);