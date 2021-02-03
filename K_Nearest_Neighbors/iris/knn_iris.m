clear; close all; clc;

path=pwd();
data = import_file_iris(strcat(path,'\IRIS.csv'));

accuracy=train_classifier(data, 9);

disp(accuracy)