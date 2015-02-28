function data = create_training_data()

%creating dataset
data = [];

%%%%PART 1: IMPORTING FACE IMAGES

%Number of images
dataNum = 7092;

%use dataNum in loop to select all images
for x=(1:dataNum)
    
    %Make sure to modify path as needed
    path = 'C:\Users\Dell_PC\Documents\MATLAB\mlproject\Caltech_WebFaces\';
    %Importing the picture
    img = imread([path 'pic' num2str(x) '.jpg']);
    
    %Resize the image to 28 x 28 x 3
    img = imresize(img, [28,28]);
    
    %Selecting just one channel from the image (red):
    img_red = img(:,:,1);
    %img_blue = img(:,:,2);
    %img_green = img(:,:,3);
    
    %Vectorizing and normalizing the imgture
    img_red = vec_norm(img_red);
    %img_blue = vec_norm(img_blue);
    %img_green = vec_norm(img_green);
    
    %Adding '1' as the classifier label
    img = [img_red 1]';
    %img = [img_red; img_blue; img_green; 1]';
    
    %Adding to data
    data = [data img];
    
end

%%%%PART 2: GENERATING NON-FACE IMAGES

%Number of images to sample from
imgNum = 10;

%Number of samples per image
sampNum = 3500;



end