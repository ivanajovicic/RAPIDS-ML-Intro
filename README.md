# RAPIDS-ML-Intro

## Setup Instructions 
 
## 1 -- clone repository

    git clone git@github.com:ivanajovicic/RAPIDS-ML-Intro.git


### 2 -- build container

    docker build -t ml_intro .


### 3 -- launch/run the container [ auto starts jupyter notebook ]

    docker run --runtime=nvidia -it -v </path/to/the/folder/>RAPIDS_ML_Intro/:/rapids/notebooks/ -p 8888:8888 -p 8787:8787 ml_intro

### 4 -- connect to the notebook(s)

