function z = lerImgs(n)

    z = [];
    for j = 1:40
        file = strcat('D:\code\pca\case_pca\orl_faces','\s');  % COLOQUE O ENDEREÇO !!!!
        filename = strcat(file,int2str(j));
        cd(filename)
        for k = 1:n
            x = imread(strcat(int2str(k),'.pgm'));
            y = reshape(x,[size(x,1)*size(x,2),1]);
            z = [z , y];
        end
    end
end