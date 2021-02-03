clear; close all; clc;

path=pwd();

%% import data
data=import_file_diabetes(strcat(path,'\diabetes.csv'));

%% get the best accuracy
accuracy=train_classifier(data);