function [data, D, b] = create_training_data(dataNum,hogParam)
%dataNum is the number of face images
%hogParam is the number of hog pixels to block

%preserve 5:1 ratio of nonFace to Face
sampNum = 5*dataNum;

%HoG Parameters
hogDim = 31;

%Width of image (assuming square)
imgDim = 28;

%creating dataset
data = zeros(hogDim*(imgDim/hogParam)^2+1,dataNum+sampNum);

%setting path
fPath = [pwd  '/images/'];

%%%%PART 1: IMPORTING FACE IMAGES

%use dataNum in loop to select all images
for x=(1:dataNum)
    
    %Importing the picture
    img = imread([fPath 'pic' num2str(x) '.ppm']);
    %img = rgb2gray(img);
    %Resize the image to 28 x 28 x 3
    img = imresize(img, [imgDim, imgDim]);
    
    %Converting to greyscale
    img = rgb2gray(img);
    
    %Vectorizing and normalizing the imgture
    img = vec_norm(img,hogParam);
    %img_blue = vec_norm(img_blue);
    %img_green = vec_norm(img_green);
    
    %Adding '1' as the classifier label
    img = [img; 1];
    %img = [img_red; img_blue; img_green; 1]';
    
    %Adding to data
    data(:,x) = img;
    
end

%%%%PART 2: GENERATING NON-FACE IMAGES

%for x=(1:imgNum)
    
    %Generating image samples
    df = sampleimages(sampNum, 28, hogParam, fPath);
    
    %Adding '-1' as the classifier label
    df = [df; -ones(1,sampNum)];
    
    %Adding to data
    colIndex = 1+dataNum;
    data(:,colIndex:colIndex+sampNum-1) = df;
    
%end

%add bias term
data = [ones(1,size(data,2)); data];
D = data(1:(end-1),:);
b = data(end,:);

end