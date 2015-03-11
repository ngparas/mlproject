%trainSVM is the demo wrapper
%   dataNum is the number of Positive case photos to use
%   k is the number of folds to use in Cross Validation
%   lamRange is the range of lambda values to use in CV

% Number of folds for CV
k = 3;

dataNum = 10000;
hogParam = 7;
lambdaRange = [0 0.001 0.01 0.1 1];

%Import Data
data = create_training_data(dataNum,hogParam);

%Separate features from labels
D = data(1:(end-1),:);
b = data(end,:);


%ran soft_SVM with x0 = 1 to get closer starting value for CV
%initCoeff = soft_SVM(D, b, lam);
%saved initCoeff as xSVM.mat

%changed initial starting point x0 = xSVM in soft_SVM()

%cross validate to tune lambda
[lam, errors] = cross_validate_classification(k,D,b,lambdaRange);
%optimal lambda is found to be 1


%refit entire model using optimal lambda
finalCoeff = soft_SVM(D,b,lam);

%misclassification score on Training Set
score = evaluate(D', b', finalCoeff);