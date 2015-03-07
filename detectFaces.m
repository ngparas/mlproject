function [ ] = detectFaces( photoPath, xSVM, hogParam, resizeParam )
%detectFaces locates and plots boxes around faces in a new photo
%   photoPath is the path of the photo to be tested
%   xSVM are learned coefficients for an SVM model
%   hogParam is the size of the HoG patch to be used
%   resizeParam is a scaling parameter to resize the photo

photo = imresize(imread(photoPath),resizeParam);
drawBoundingBoxes(photo,window_slide(rgb2gray(photo),xSVM,hogParam));


end

