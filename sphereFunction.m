function f = sphereFunction(x)
    % UNTITLED2 Summary of this function goes here
    % Detailed explanation goes here
    % SPHEREFUNCTION Calculates the sum of squares of a vector x.
    % Input: x = [x1, x2, ..., xn] (a vector of any length)
    % Output: f = sum(x_i^2)
    
    % Square every element and then sum them up
    f = sum(x.^2);
end