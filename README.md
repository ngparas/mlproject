# EECS 395 Machine Learning : Using a Soft-Margin Support Vector Machine for Face Detection
### Rohan Agarwal | Annabel Buckfire | Nick Paras | Leon Sasson

In this project, we aim to use methods learned in class to apply supervised machine learning models, as well as computer vision concepts and methods, to develop a functional face detection model. More specifically, we train a Soft-Margin Support Vector Machine using HoG (Histogram of Oriented Gradients) features to classify images as faces or non-faces, and then employ a sliding-window methodology to detect and locate faces in a new image.

#### See MLWrite-Up.pdf for the full report.

#### The demo video may be found at http://youtu.be/9mA_VJ2cCtU
Note: the demo video uses trainSVM.m and classDemo.svm independently for time purposes. To perform the demo on your own, we recommend cloning this repository and using FINALDEMOSCRIPT.m instead

#### The final 'plug and play' demo deliverable is FINALDEMOSCRIPT.m




Finally, a note on licensing: this project uses the VLFeat package:

VLFeat is distributed under the BSD license:

Copyright (C) 2007-11, Andrea Vedaldi and Brian Fulkerson
Copyright (C) 2012-13, The VLFeat Team
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met:
1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the
   distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
