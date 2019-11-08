FROM rapidsai/rapidsai:0.10-cuda9.2-runtime-ubuntu18.04

ENV CONDA_ENV rapids

# install system tools and clean apt cache
RUN source activate $CONDA_ENV && \
    apt-get update && apt-get install -y htop vim git unzip screen font-manager && \
    rm -rf /var/lib/apt/*

# install ipyvolume for 3D interactive visualization
RUN source activate $CONDA_ENV && jupyter labextension install @jupyter-widgets/jupyterlab-manager
RUN source activate $CONDA_ENV && conda install -y -c conda-forge ipyvolume && conda clean -yac *
RUN source activate $CONDA_ENV && jupyter labextension install ipyvolume

# python-graphviz for drawing xgboost decision tree graph
RUN source activate $CONDA_ENV && conda install -c conda-forge python-graphviz && conda clean -yac *

# install dask_kubernetes
RUN source activate $CONDA_ENV && pip install dask-kubernetes

# clone demo code repo [ may be necessary to hard code to a release version hash ]
RUN source activate $CONDA_ENV && mkdir /rapids-dask-hpo && cd /rapids-dask-hpo && git clone https://github.com/miroenev/rapids    

# clone k8s-dask tools
RUN source activate $CONDA_ENV && mkdir /k8s-rapids-dask && cd /k8s-rapids-dask && git clone --depth=1 https://github.com/supertetelman/k8s-rapids-dask

EXPOSE 8888
EXPOSE 8787

WORKDIR /
# consider building an init script
