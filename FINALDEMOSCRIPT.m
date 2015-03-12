%This script file is the final demo file for our EECS 395 ML Project
%Rohan Agarwal, Annabel Buckfire, Nick Paras, Leon Sasson
%It uses a soft-margin SVM classifier with HoG features to detect faces


%%%Initialize the VLFeat Package
%initialize VLFeat for HoG features
loadVLFeat();

%%%Import Data, 10000 faces, 50000 non-faces, HoG cell size=7
data = create_training_data(10000,7);

%Separate features from labels
D = data(1:(end-1),:);
b = data(end,:);

%%%Train Classifier
%optimal lambda is found to be 1 through 3-fold CV (see trainSVM.m)
%use perceptron solution as x0, load from workspace. If load fails use
%starting solution of x0 = ones()
%refit entire model using optimal lambda
finalCoeff = soft_SVM(D,b,1);

%%%misclassification score on Training Set
score = evaluate(D', b', finalCoeff);

%%%misclassification score on Testing Set
%create testing data
dataTest = create_testing_data(2000,7);
%Separate features from labels
Dt = dataTest(1:(end-1),:);
bt = dataTest(end,:);
scoreTest = evaluate(Dt', bt', finalCoeff);

%%%Perform Deno
%Now test on 14 Images with varying success
%note some images are rescaled to show sensitivity of model to size
detectFaces('mlDemo15.jpg',finalCoeff,7,1/2)
detectFaces('mlDemo14.jpg',finalCoeff,7,1/2)
detectFaces('mlDemo13.jpg',finalCoeff,7,1/2)
detectFaces('mlDemo12.jpg',finalCoeff,7,1/1.5)
detectFaces('mlDemo11.jpg',finalCoeff,7,1)
detectFaces('mlDemo10.jpg',finalCoeff,7,1/3)
detectFaces('mlDemo9.jpg',finalCoeff,7,1/1.5)
detectFaces('mlDemo7.jpg',finalCoeff,7,1/2)
detectFaces('mlDemo6.jpg',finalCoeff,7,1/4)
detectFaces('mlDemo5.jpg',finalCoeff,7,1/4)
detectFaces('mlDemo4.jpg',finalCoeff,7,1/4)
detectFaces('mlDemo3.jpg',finalCoeff,7,1/4)
detectFaces('mlDemo2.jpg',finalCoeff,7,1/4)
detectFaces('mlDemo1.jpg',finalCoeff,7,1/4)

%display misclassification results
fprintf('The training misclassification score is %f \n',score);
fprintf('The testing misclassification score is %f \n',scoreTest);


