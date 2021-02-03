function IRIS = read_data(filename, dataLines)
    if nargin < 2
        dataLines = [5, Inf];
    end

    %% Setup the Import Options
    opts = delimitedTextImportOptions("NumVariables", 5);

    % Specify range and delimiter
    opts.DataLines = dataLines;
    opts.Delimiter = ",";

    % Specify column names and types
    opts.VariableNames = ["sepal_length", "sepal_width", "petal_length", "petal_width", "Var5"];
    opts.VariableTypes = ["double", "double", "double", "double", "char"];
    opts.ExtraColumnsRule = "ignore";
    opts.EmptyLineRule = "read";

    % Import the data
    IRIS = readtable(filename, opts);

    %% Convert to output type
    IRIS = table2cell(IRIS);
    numIdx = cellfun(@(x) ~isnan(str2double(x)), IRIS);
    IRIS(numIdx) = cellfun(@(x) {str2double(x)}, IRIS(numIdx));
end