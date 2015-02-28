function imgNorm = vec_norm(img)

%Transforming image to double precision
img = double(img);

%Vectorizing the image
imgVector = img(:);

%Normalizing the image 
imgNorm = imgVector/norm(imgVector);

end