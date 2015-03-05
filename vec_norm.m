function imgNorm = vec_norm(img,hogParam)

%Transforming image to double precision
img = double(img);

%Vectorizing the image
%imgVector = img(:);

%Normalizing the image 
%imgNorm = imgVector/norm(imgVector);

%Get and vectorize HoG features
imgNorm = vl_hog(single(img),hogParam,'verbose');
imgNorm = imgNorm(:);

end