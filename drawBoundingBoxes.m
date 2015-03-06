function [ imgWithBoxes ] = drawBoundingBoxes( imgMat, faceCoord )
%drawBoundingBoxes takes the output of window_slide() and plots boxes
%around the detected faces
%   imgMat is an image matrix
%   faceCoord is the matrix output of window_slide for a given image
%   imgWithBoxes is the image with the face bounding boxes appended

%initialize matrix of the locations of interior 1s
intOnes = zeros(size(faceCoord));

%search through faceCoord and find the locations of the interior 1s
for row = 2:(size(faceCoord,1) - 1)
   for col = 2:(size(faceCoord,2) - 1)
       if (faceCoord(row,col-1) == 1) && (faceCoord(row,col+1) == 1) && (faceCoord(row-1,col) == 1) && (faceCoord(row+1,col) == 1)
           intOnes(row,col) = 1;
       end
   end
end

%remove interior 1s
faceBoxes = faceCoord - intOnes;
%faceBoxes = faceCoord;

figure
imshow(imgMat);
hold on
spy(faceBoxes);

imgWithBoxes = faceBoxes; 


%# make sure the image doesn't disappear if we plot something else
%hold on

%# define points (in matrix coordinates)
%p1 = [10,100];
%p2 = [100,20];

%# plot the points.
%# Note that depending on the definition of the points,
%# you may have to swap x and y
%plot([p1(2),p2(2)],[p1(1),p2(1)],'Color','r','LineWidth',2)

end

