
# EECS 395 Final Project: Face Detection Learning

### Rohan Agarwal, Annabel Buckfire, Nick Paras, Leon Sasson

## Introduction
Most people would say that they can tell whether something is a face or not with just a quick glimpse.  And yet, being able to program computers to identify faces in images has proven to be a tremendously hard problem. That said, after many years and countless of researchers and papers, many solutions have been proposed and the face detection problem is now considered to be solved by most researchers. 
In this project, we aim at using methods learned in class to apply supervised machine learning models, as well as computer vision concepts and methods to develop a functional face detection model. 

## Methodology

### Overview
Our method, like most machine learning solutions, starts with a relatively large data set containing images with both faces and no faces. Images are then converted to grayscale and features are extracted using a Histogram of Gradients (HoG) method which is then vectorize to form the matrix that our learning model will take as an input. With the data matrix and the known labels (e.g face or no face), our system then uses a Soft SVM model as the underlying learning model. Our model finds the optimal margin coefficients by performing a hessian descent on the soft SVM cost function. Since the Soft SVM algorithm requires a fixed error penalty for mislabeled observations (e.g Lambda) we also perform K-Fold cross validation to obtain the value of lambda which minimizes our testing error.

After the model is trained and the optimal coefficients are known, our system is ready to classify new images and find faces in them. Since images are rarely just a face, our system uses a sliding-window algorithm to scan through and image and test whether every sub-patch is a face or not using the trained coefficients. We do this for multiple patch sizes to account for the fact that resolution and relative size of faces often varies from image to image.


### Data Set
As with most supervised learning models, the data used to learn a certain problem space is an important part of the process, and can have the most impact in the accuracy and effectiveness of the solution.

**TODO**
We tried numerous data sets, and decided to settle on the X image dataset. It contains Y number of faces, in mostly square images with relatively good resolution and little noise.

### Pre-Processing and Feature Extraction
**TODO** this section

### Soft SVM and Cross Validation

The underlying classification model that we use to detect faces is a Soft Margin Support Vector Machine. The model classifies input observations to a binary fashion, as opposed to the probabilistic output of Logistic Regression, another model we considered. Our implementation of the Soft Margin SVM uses a hessian descent as the iterative optimization to find the optimal weights that minimize the cost function.

Since Soft Margin SVM allow observations to be mislabeled, the cost function also includes a penalty parameter, lambda, to control the tradeoff between a small margin and mislabeled observations. To choose lambda, we perform a K-Fold cross validation with multiple lambda values ranging from X to Y, and choose the one that chooses the weights that minimize the testing error.

### Finding faces in new images
Since most images are not just a single face, like our training data set, we need to use a method to look within an image for a face. To do this, we use a sliding-window algorithm that, conceptually, goes across the image extracting patches and using the trained classifier to test whether each patch is a face or not. The algorithm starts by scanning the input image horizontally and vertically, and extracting patches using multiple different patch sizes and aspect ratios. For each of these patches, it performs the same feature extraction and vectorization, that is, each patch gets resized to the appropriate size (we used 28x28) and the same Histogram of Gradient method is applied. Subsequently, the data is now classified using the trained coefficients of the Soft Margin SVM to determine whether any given patch is a face or not. Since often multiple patches are classified as a face, if they are overlapping, we choose the smallest patch and draw a box on its borders. This enables a box to be drawn tightly surrounding each face and avoids have large margins around faces.

## Demo and Results
**TODO**

## Limitations and Next Steps
As discussed above, we found good, promising results in using our methodology. That said, there is always room for improvement, from improving the data set  used, to using a better model and optimization method.
While the data set of faces we used was large, it was largely composed of caucasian faces, which proved to be a challenge later on when testing our models with faces of other races. We also learned that a good data set of non-faces was important particularly to avoid faces being detected in areas with high grainy-ness but otherwise flat features.
As we wanted to increase the size of our non-face dataset, we saw computation times significantly increase.
While computation time is generally a problem, in our case it was challenging because it didn’t allow us to perform a reasonable size K-fold cross-validation along with a large range of penalty (Lambda) values. 
Due to the scope of your project, we only tested with using one predictive model, soft margin SVM. It would be critical to test and cross-validate against other predictive models such as Logistic Regression and Neural Nets to be able to determine which model performs better for this specific use case.



