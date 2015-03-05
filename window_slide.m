function [ faceCoord ] = window_slide(imgMat, model, hogParam)
%window_slide uses a sliding window method to search for faces in an image
%   imgMat is a matrix representation of an image
%   model is a vector of learned coefficients for a classifier
%   faceCoord is a matrix of the same size as imgMat with 1/0 indicating
%   wither or not a pixel is part of a face/no face

%Initialize return matrix
faceCoord = zeros(size(imgMat));

%Set default patch size
%defPatchSize = 28;
hdefPatchSize = 25;
vdefPatchSize = 36;
%Set patch sizes to search with:
patchSizeRatios = [0.5:0.5:3.5];
%patchSizeRatios = 1;

%Search step size ratio
%stepSizeRatio = 0.01;

%Find size of image
imgSize = size(imgMat);


%loop for multiple patch sizes
for ratioInd = 1:length(patchSizeRatios)
   %size size of current patch
   %patchSize = round(defPatchSize * patchSizeRatios(ratioInd));
   hPatchSize = round(hdefPatchSize * patchSizeRatios(ratioInd));
   vPatchSize = round(vdefPatchSize * patchSizeRatios(ratioInd));
   
   
   %stepSize = round(stepSizeRatio * patchSize);
   stepSize = 1;
   %Initialize search indices
   vLoc = 1;
   hLoc = 1;   
   
   %slide patch down the image
   while ((vLoc + vPatchSize - 1) <= (imgSize(1)))
       %slide patch across the image
       while ((hLoc + hPatchSize - 1) <= (imgSize(2)))
           %get normalized vector of patch
           patch = vec_norm(imresize(imgMat(vLoc:(vLoc + vPatchSize - 1),hLoc:(hLoc + hPatchSize -1)),[28 28]),hogParam);
           %determine if the patch has a face or not
           isFace = classifySVM([1; patch], model);
           %if theres a face, update faceCoord
           if isFace == 1
               faceCoord(vLoc:(vLoc + vPatchSize - 1),hLoc:(hLoc + hPatchSize -1)) = 1;
              
           end
           %increment horizontal location
           hLoc = hLoc + stepSize;
       end
       %increment vertical location
       vLoc = vLoc + stepSize;
   end
end

%if nothing found, try whole image
%patch = [1; vec_norm(imresize(imgMat,[28 28]))];

%isFace = classifySVM(patch,model);
%if isFace == 1
%    faceCoord = ones(size(imgMat));
%end




end

