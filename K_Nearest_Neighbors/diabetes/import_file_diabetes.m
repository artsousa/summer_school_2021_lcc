function diabetes = import_file_diabetes(filename, dataLines)

    if nargin < 2
        dataLines = [2, Inf];
    end

    %% Setup the Import Options
    opts = delimitedTextImportOptions("NumVariables", 9);

    % Specify range and delimiter
    opts.DataLines = dataLines;
    opts.Delimiter = ",";

    % Specify column names and types
    opts.VariableNames = ["Pregnancies", "Glucose", "BloodPressure", "SkinThickness", "Insulin", "BMI", "DiabetesPedigreeFunction", "Age", "Outcome"];
    opts.VariableTypes = ["double", "double", "double", "double", "double", "double", "double", "double", "double"];
    opts.ExtraColumnsRule = "ignore";
    opts.EmptyLineRule = "read";

    % Import the data
    diabetes = readtable(filename, opts);

end