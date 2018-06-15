apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        apt-utils \
        libsm6 \
        libxext6 \
        libxrender-dev \
        libgtk2.0-dev


apt-get install -y --no-install-recommends --allow-downgrades \
        cuda-command-line-tools-9-0 \
        cuda-cublas-dev-9-0 \
        cuda-cudart-dev-9-0 \
        cuda-cufft-dev-9-0 \
        cuda-curand-dev-9-0 \
        cuda-cusolver-dev-9-0 \
        cuda-cusparse-dev-9-0 \
        curl \
        git \
        libcudnn7=7.0.5.15-1+cuda9.0 \
        libcudnn7-dev=7.0.5.15-1+cuda9.0 \
        libcurl3-dev \
        libfreetype6-dev \
        libpng12-dev \
        libzmq3-dev \
        pkg-config \
        python-dev \
        rsync \
        software-properties-common \
        unzip \
        zip \
        zlib1g-dev \
        wget \
        && \
    rm -rf /var/lib/apt/lists/* && \
    find /usr/local/cuda-9.0/lib64/ -type f -name 'lib*_static.a' -not -name 'libcudart_static.a' -delete && \
    rm /usr/lib/x86_64-linux-gnu/libcudnn_static_v7.a

pip install --upgrade pip \
 && pip install awscli \
 && pip install dicom \
 && pip install SimpleITK \
 && pip install nibabel \
 && pip install opencv-python \
 && pip install pydicom \
 && pip install shapely \
 && pip install scikit-image

echo /mastvol/heartsmart/preprocessing > /usr/local/lib/python3.5/dist-packages/heartsmart.pth
