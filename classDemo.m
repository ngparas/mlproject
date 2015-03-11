function [ a ] = classDemo(model,hogParam)
%classDemo uses a trained soft margin SVM model to detect faces in several
%demo images
%   model is a column vector of trained model coefficients
%   hogParam is the HoG parameter
%initialize vlfeat
loadVLFeat();

%test on 14 images
detectFaces('mlDemo15.jpg',model,hogParam,1/2)
detectFaces('mlDemo14.jpg',model,hogParam,1/2)
detectFaces('mlDemo13.jpg',model,hogParam,1/2)
detectFaces('mlDemo12.jpg',model,hogParam,1/1.5)
detectFaces('mlDemo11.jpg',model,hogParam,1)
detectFaces('mlDemo10.jpg',model,hogParam,1/3)
detectFaces('mlDemo9.jpg',model,hogParam,1/1.5)
detectFaces('mlDemo7.jpg',model,hogParam,1/2)
detectFaces('mlDemo6.jpg',model,hogParam,1/4)
detectFaces('mlDemo5.jpg',model,hogParam,1/4)
detectFaces('mlDemo4.jpg',model,hogParam,1/4)
detectFaces('mlDemo3.jpg',model,hogParam,1/4)
detectFaces('mlDemo2.jpg',model,hogParam,1/4)
detectFaces('mlDemo1.jpg',model,hogParam,1/4)
end

