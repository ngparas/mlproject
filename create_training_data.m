function data = create_training_data(path,dataNum,sampNum)
%path is the path to the images
%dataNum is the number of face images
%sampNum is the number of samples to take from each of the 10 nonface
%images

%Width of image (assuming square)
imgDim = 28;

%Number of images to sample from
imgNum = 10;

%creating dataset
data = zeros(imgDim^2+1,dataNum+imgNum*sampNum);

%%%%PART 1: IMPORTING FACE IMAGES

%use dataNum in loop to select all images
for x=(1:dataNum)
    
    %Importing the picture
    img = imread([path 'pic' num2str(x) '.jpg']);
    
    %Resize the image to 28 x 28 x 3
    img = imresize(img, [imgDim, imgDim]);
    
    %Selecting just one channel from the image (red):
    img_red = img(:,:,1);
    %img_blue = img(:,:,2);
    %img_green = img(:,:,3);
    
    %Vectorizing and normalizing the imgture
    img_red = vec_norm(img_red);
    %img_blue = vec_norm(img_blue);
    %img_green = vec_norm(img_green);
    
    %Adding '1' as the classifier label
    img = [img_red; 1];
    %img = [img_red; img_blue; img_green; 1]';
    
    %Adding to data
    data(:,x) = img;
    
end

%%%%PART 2: GENERATING NON-FACE IMAGES

for x=(1:imgNum)
    
    %Generating image samples
    df = sampleimages(sampNum, 28, path);
    
    %Adding '-1' as the classifier label
    df = [df; -ones(1,sampNum)];
    
    %Adding to data
    colIndex = 1+dataNum+(x-1)*sampNum;
    data(:,colIndex:colIndex+sampNum-1) = df;
    
end

end