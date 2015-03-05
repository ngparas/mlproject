function [ coeff, lam ] = trainSVM()
%trainSVM returns the trained coefficients and optimal lambda for an SVM
%   dataPath is the path to the folder of photos
%   dataNum is the number of Positive case photos to use
%   sampNum is 1/10 the number of Negative case photos to generate
%   k is the number of folds to use in Cross Validation
%   lamRange is the range of lambda values to use in CV
%   coeff returns the trained coefficients for the optimal model after
%   refitting to all of the training data
%   lam returns the optimal lambda found through k fold CV

% Number of folds for CV
k = 5;

dataNum = 100;
sampNum = 10;
lambdaRange = 0:0.1:1;

%Import Data
data = create_training_data(dataNum,sampNum);

%Separate features from labels
D = data(1:(size(data,1)-1),:);
b = data(size(data,1),:);

lam = cross_validate_classification(k,D,b,lambdaRange);
coeff = soft_SVM(D, b, lam);

end

