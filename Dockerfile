FROM ubuntu:16.04
 
MAINTAINER Jolene <joh112@eng.ucsd.edu>
 
ENV DUMB_INIT_VER 1.2.0
 
RUN DEBIAN_FRONTEND=noninteractive apt-get -y update --fix-missing \
 && apt-get install -y \
    automake \
    autotools-dev \
    g++ \
    git \
    libcurl4-gnutls-dev \
    wget  \
    curl \
    unzip \
    libssl-dev \
    libxml2-dev \
    make \
    bzip2 \
    pkg-config \
    vim \
    git \
    zip \
    htop \
 && wget -O /tmp/dumb-init_${DUMB_INIT_VER}_amd64.deb https://github.com/Yelp/dumb-init/releases/download/v${DUMB_INIT_VER}/dumb-init_${DUMB_INIT_VER}_amd64.deb \
 && dpkg -i /tmp/dumb-init_*.deb

RUN DEBIAN_FRONTEND=noninteractive apt-get purge -y \
    wget \
    automake \
    autotools-dev \
    g++ \
    make \
 && apt-get -y autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
 
RUN curl https://repo.continuum.io/archive/Anaconda2-5.1.0-Linux-x86_64.sh -O

RUN apt-get -qq update \
 && apt-get --yes install python-pip \
 && pip install --upgrade pip

RUN pip install awscli \
 && pip install dicom \
 && pip install nibabel

ADD set_run.sh .
CMD sh set_run.sh
