
#EECS 395 Final Project: Face Detection Learning

##Introduction
Most people would say that they can tell whether something is a face or not in just a quick glimpse, without thinking at all. And yet, being able to program computers to identify faces in images has proven to be a tremendously hard problem. That said, after many years and countless of researchers and papers, many solutions have been proposed and the face detection problem is now considered to be solved by most researchers. 
In this project, we aim at using methods learned in class to apply supervised machine learning models, as well as computer vision concepts and methods to develop a functional face detection model. 

## Methodology

### Overview
Our method, like most machine learning solutions, starts with a relatively large data set containing images with both faces and no faces. Images are then converted to grayscale and features are extracted using a Histogram of Gradients (HoG) method which is then vectorize to form the matrix that our learning model will take as an input. With the data matrix and the known labels (e.g face or no face), our system then uses a Soft SVM model as the underlying learning model. Our model finds the optimal margin coefficients by performing a hessian descent on the soft SVM cost function. Since the Soft SVM algorithm requires a fixed error penalty for mislabeled observations (e.g Lambda) we also perform K-Fold cross validation to obtain the value of lambda which minimizes our testing error.

After the model is trained and the optimal coefficients are known, our system is ready to classify new images and find faces in them. Since images are rarely just a face, our system uses a sliding-window algorithm to scan through and image and test whether every sub-patch is a face or not using the trained coefficients. We do this for multiple patch sizes to account for the fact that resolution and relative size of faces often varies from image to image.


### Data Set
As with most supervised learning models, the data used to learn a certain problem space is an important part of the process, and can have the most impact in the accuracy and effectiveness of the solution.

**TODO**
We tried numerous data sets, and decided to settle on the X image dataset. It contains Y number of faces, in a relatively clean fashion. 

### Pre-Processing and Feature Extraction

### Soft SVM and Cross Validation

The underlying classification model that we use to detect faces is a Soft Margin Support Vector Machine. The model classifies input observations to a binary fashion, as opposed to the probabilistic output of Logistic Regression, another model we considered. Our implementation of the Soft Margin SVM uses a hessian descent as the iterative optimization to find the optimal weights that minimize the cost function.

Since Soft Margin SVM allow observations to be mislabeled, the cost function also includes a penalty parameter, lambda, to control the tradeoff between a small margin and mislabeled observations. To choose lambda, we perform a K-Fold cross validation with multiple lambda values ranging from X to Y, and choose the one that chooses the weights that minimize the testing error.

### Finding faces in new images


## Demo and Results

## Limitations and Next Steps
