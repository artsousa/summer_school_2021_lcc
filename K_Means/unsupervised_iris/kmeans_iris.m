clear; close all; clc;

path = pwd();

%% load data
data = read_data(strcat(path, '\IRIS.csv'), 2);
data = cell2table(data);

[train, test] = split_data(data);

%% train algorithm
unsupervised_train = table2array(train(:,1:size(train,2)-1));
[~, C] = kmeans(unsupervised_train,3);

%% test algorithm
unsupervised_test = table2array(test(:,1:size(test,2)-1));
[~,idx_test] = pdist2(C,unsupervised_test,'euclidean','Smallest',1);

%% get the label of the centroid
c=table('Size',[3 1],'VariableTypes',{'string'});
for x=1:3    
    d=zeros(size(test,1),1);
    for y=1:size(test,1)
        d(y,1)=calcular_distancia(C(x,:),unsupervised_test(y,:));
    end
    
    [~, index] = min(d);
    c(x,1)=test(index,5);
end

%% check with the real value
total=0;
hit=0;
for x=1:size(unsupervised_test,1)
    a = table2cell(c(idx_test(1,x),1)); % classified
    s = table2cell(test(x,5)); % real value
    
    if a{1,1} == s{1,1}
        hit = hit+1;
    end

    total = total+1;
end

%% disp the results
disp(strcat('Acertos :', num2str(hit*100/total), '%.'));
disp(strcat('Hits :', num2str(hit)));
disp(strcat('Testes :', num2str(total)));

