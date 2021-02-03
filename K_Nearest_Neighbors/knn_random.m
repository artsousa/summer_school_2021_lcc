clear; close all; clc;

%% generate data for classify

X=[51 1.73;83 1.80;69 1.76;64 1.73;65 1.72;56 1.74;58 1.69;53 1.75;55 1.70];
y=["Abaixo";"Normal";"Normal";"Normal";"Normal";"Abaixo";"Normal";"Abaixo";"Normal"];

figure('Name', 'Weight x height - Sample view');
gscatter(X(:,1),X(:,2),y,'rg','.',30,'on');
hold on;
xlabel('Peso');
ylabel('Altura');

Xt=[45 1.76; 63 1.90;69 1.70;72 1.83;45 1.80];
Yt=strings(size(Xt,1),1);
Yt(:,:)="Sem classe";

gscatter(Xt(:,1),Xt(:,2),Yt,'k','.',30,'off'); hold off;

%% test samples

figure('Name', 'Weight x height - Test');
gscatter(X(:,1),X(:,2),y,'rg','.',30,'on'); hold on;

for p=1:size(Xt,1)
    t=Xt(p,:);
    
    d=zeros(size(X,1),1);
    for m=1:size(X,1)
        d(m,1) = calcular_distancia(t,X(m,:));
    end
    
    [B, I] = mink(d,3); %% get the k smallest values in d
    response = unique(y(I,1));
    votes=zeros(size(response,1),1);
    
    for v=1:size(votes,1)
        i=find(y(I,1) == response(v,1));
        votes(v,1)=size(i,1);
    end
    
    [~,index]=max(votes);
    Yt(p,:)=response(index,1);
end
gscatter(Xt(:,1),Xt(:,2),Yt,'rg','.',30,'on'); hold off;