function [validationAccuracy] = train_classifier(trainingData, k)
    inputTable = trainingData;
    
    columns = inputTable.Properties.VariableNames;
    predictorNames = columns(1,1:size(columns,2)-1);
    predictors = inputTable(:, predictorNames);
    response = inputTable.species;

    % Train a classifier
    classificationKNN = fitcknn(...
        predictors, ...
        response, ...
        'Exponent', [], ...
        'NumNeighbors', k, ...
        'Standardize', true, ...
        'ClassNames', unique(response));
    
    % Perform cross-validation
    partitionedModel = crossval(classificationKNN, 'KFold', 5);

    % Compute validation predictions
%     [validationPredictions, validationScores] = kfoldPredict(partitionedModel);

    % Compute validation accuracy
    validationAccuracy = 1 - kfoldLoss(partitionedModel, 'LossFun', 'ClassifError');
