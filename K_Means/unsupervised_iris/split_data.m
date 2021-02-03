function [train, test] = split_data(data)
    %% porcentagem de cada classe que será treinada
    p = 70; 
    
    %% obtem todas as classes
    classes = unique(data(:, size(data,2)));
   
    %% define a quantidade de treino
    max_samples = size(data,1)/size(classes,1);
    qt = (p*max_samples)/100;
    
    train = table();
    test = table();
    
    for k=0:size(classes,1)-1
        i_train=(qt*k)+1;
        j_train=k*max_samples+1;
        
        qt_test=max_samples-qt;
        i_test=((max_samples-qt)*k)+1;
        j_test=j_train+qt;
        
        train(i_train:i_train+qt-1,:) = data(j_train:j_train+qt-1,:);
        test(i_test:i_test+qt_test-1,:) = data(j_test:j_test+qt_test-1,:);
    end
end