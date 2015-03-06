function [imgNorm] = vec_norm(img,hogParam)

%Transforming image to double precision
img = double(img);

%Vectorizing the image
%imgVector = img(:);

%Get and vectorize HoG features
imgNorm = vl_hog(single(img),hogParam,'verbose');
imgNorm = imgNorm(:);

%Normalizing the image 
%imgNorm = imgNorm/(norm(imgNorm) + eps);
%norm(imgNorm)

end