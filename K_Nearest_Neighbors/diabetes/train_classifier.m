function [validationAccuracy] = train_classifier(trainingData)
    inputTable = trainingData;
    
    columns = inputTable.Properties.VariableNames;
    predictorNames = columns(1,1:size(columns,2)-1);
    predictors = inputTable(:, predictorNames);
    response = inputTable.Outcome;

    % Train a classifier
    classificationKNN = fitcknn(...
        predictors, ...
        response, ...
        'Exponent', [], ...
        'OptimizeHyperparameters', 'auto', ...
        'Standardize', true, ...
        'ClassNames', [0; 1]);
    
    % Perform cross-validation
    partitionedModel = crossval(classificationKNN, 'KFold', 5);

    % Compute validation predictions
    [validationPredictions, validationScores] = kfoldPredict(partitionedModel);

    % Compute validation accuracy
    validationAccuracy = 1 - kfoldLoss(partitionedModel, 'LossFun', 'ClassifError');
end
