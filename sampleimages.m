function X = sampleimages(samples, winsize, hogParam, path)

% gathers patches from the grey-scale images, no preprocessing done yet
%
% INPUT variables:
% samples            total number of patches to take
% winsize            patch width in pixels
%
% OUTPUT variables:
% X                  the image patches as column vectors

%IMPORTANT: IMAGE DATA IS SUPPOSED TO BE IN DIRECTORY ./DATA/
%CHANGE THIS ON LINE 34 IF YOU HAVE MOVED THE DATA ELSEWHERE
  
%----------------------------------------------------------------------
% Gather rectangular image patches
%----------------------------------------------------------------------

% HoG Dimensions
hogDim = 31;
% We have a total of 7 images.
dataNum = 7;

% This is how many patches to take per image
getsample = floor(samples/dataNum);

% Initialize the matrix to hold the patches
%X = zeros(winsize^2,samples);
X = zeros(hogDim * (winsize / hogParam)^2,samples);
sampleNum = 1;  
for i=(1:dataNum)

  % Even things out (take enough from last image)
  if i==dataNum, getsample = samples-sampleNum+1; end
  
  % Load the image. Change the path here if needed.
  I = imread([path 'notface' num2str(i) '.jpg']);

  % Transform to double precision
  I = double(I);
  
  % Select first channel
  I = I(:,:,1);

  % Normalize to zero mean and unit variance (optional)
  %I = I-mean(mean(I));
  %I = I/sqrt(mean(mean(I.^2)));
  
  % Sample patches in random locations
  sizex = size(I,2); 
  sizey = size(I,1);
  posx = floor(rand(1,getsample)*(sizex-winsize-2))+1;
  posy = floor(rand(1,getsample)*(sizey-winsize-1))+1;
  for j=1:getsample
    %X(:,sampleNum) = reshape( I(posy(1,j):posy(1,j)+winsize-1,posx(1,j):posx(1,j)+winsize-1),[winsize^2 1]);
    X(:,sampleNum) = vec_norm( I(posy(1,j):posy(1,j)+winsize-1,posx(1,j):posx(1,j)+winsize-1),hogParam);
    sampleNum=sampleNum+1;
  end 
  
  %for xCol = 1:size(X,2)
  %   X(:,xCol) = X(:,xCol) /  norm(X(:,xCol)); 
  %end
  
end



