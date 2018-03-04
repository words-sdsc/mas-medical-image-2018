FROM ubuntu:14.04
 
MAINTAINER Jolene <joh112@eng.ucsd.edu>
 
ENV DUMB_INIT_VER 1.2.0
ENV S3_BUCKET ''
ENV MNT_POINT /data
ENV S3_REGION ''
ENV AWS_KEY ''
ENV AWS_SECRET_KEY ''
 
RUN DEBIAN_FRONTEND=noninteractive apt-get -y update --fix-missing && \
    apt-get install -y automake autotools-dev g++ git libcurl4-gnutls-dev wget \
                       libfuse-dev libssl-dev libxml2-dev make pkg-config && \
    git clone https://github.com/s3fs-fuse/s3fs-fuse.git /tmp/s3fs-fuse && \
    cd /tmp/s3fs-fuse && ./autogen.sh && ./configure && make && make install && \
    ldconfig && /usr/local/bin/s3fs --version && \
    wget -O /tmp/dumb-init_${DUMB_INIT_VER}_amd64.deb https://github.com/Yelp/dumb-init/releases/download/v${DUMB_INIT_VER}/dumb-init_${DUMB_INIT_VER}_amd64.deb && \
    dpkg -i /tmp/dumb-init_*.deb
 

RUN mkdir -p "$MNT_POINT"
 
RUN DEBIAN_FRONTEND=noninteractive apt-get purge -y wget automake autotools-dev g++ git make && \
    apt-get -y autoremove --purge && apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
 
 
#CMD exec /usr/local/bin/s3fs $S3_BUCKET $MNT_POINT -o use_cache=/tmp -o allow_other -o dbglevel=info -f -o curldbg -o endpoint=${S3_REGION} -o passwd_file=/etc/passwd-s3fs -o retries=5 -o connect_timeout=10

ADD set_run.sh .

CMD sh set_run.sh

