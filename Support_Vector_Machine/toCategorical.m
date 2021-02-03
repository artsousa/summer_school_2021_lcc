function [m] = toCategorical(array)    
    labels = length(unique(array));
    m = zeros(size(array,1), labels);
    for i = 1:labels
        m(array == i, i) = i;
    end
