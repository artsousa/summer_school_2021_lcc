function IRIS = import_file_iris(filename, dataLines)
    if nargin < 2
        dataLines = [2, Inf];
    end

    %% Setup the Import Options
    opts = delimitedTextImportOptions("NumVariables", 5);

    % Specify range and delimiter
    opts.DataLines = dataLines;
    opts.Delimiter = ",";

    % Specify column names and types
    opts.VariableNames = ["sepal_length", "sepal_width", "petal_length", "petal_width", "species"];
    opts.VariableTypes = ["double", "double", "double", "double", "categorical"];
    opts = setvaropts(opts, 5, "EmptyFieldRule", "auto");
    opts.ExtraColumnsRule = "ignore";
    opts.EmptyLineRule = "read";

    % Import the data
    IRIS = readtable(filename, opts);
end