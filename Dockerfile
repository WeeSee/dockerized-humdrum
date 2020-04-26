FROM ubuntu:20.04

LABEL maintainer="weesee@web.de"

RUN  apt-get update \
    && apt-get install -y \
        software-properties-common \
    && apt-get install -y \
        apt-utils \
        automake \
        gcc \
        g++ \
        make \
        git \
        curl \
        libtool \
        unzip \
        vim \
    && rm -rf /var/lib/apt/lists/*

RUN adduser --disabled-password --gecos '' --home /app --shell /bin/bash humdrummy 
USER humdrummy
WORKDIR /app

ENV PATH="/app/humdrum-tools/humdrum/bin:/app/humdrum-tools/humextra/bin:${PATH}"
RUN echo 'export PATH=/app/humdrum-tools/humdrum/bin:$PATH' >> ~/.profile \
    && echo 'export PATH=/app/humdrum-tools/humextra/bin:$PATH'  >> ~/.profile \
    && echo 'echo "Letzte zeile in profile. path= $PATH"'  >> ~/.profile
  
# see https://www.humdrum.org/install/github/
RUN git clone --recursive https://github.com/humdrum-tools/humdrum-tools
RUN cd humdrum-tools \
    && make update  \
    && make \
    && make install \
    && make regression \
    && make data \
    && make doc  

ENTRYPOINT [ "/bin/bash", "-c" ]
CMD [ "/bin/bash" ]
