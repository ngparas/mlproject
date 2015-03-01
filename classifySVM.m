function [ label ] = classifySVM( newObs, coeff )
%predictSVM returns the predicted label for a new observation given a
%vector of trained coefficients
%   newobs is a vector of features for a new observation
%   coeff is a vector of the trained coefficients for an SVM
%   label is the predicted label either 1: face, 0: otherwise

%calculate d'*x for new data point with SVM hyperplane
preLabel = newObs' * coeff;

if preLabel > 0 %if above hyperplane, label 1: face
    label = 1;
else %if below hyperplane, label 0: not face
    label = 0;
end

end

