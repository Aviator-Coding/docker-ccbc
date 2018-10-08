FROM ubuntu:16.04
LABEL   maintainer="Aviator" \
        discord="Aviator#1024"

RUN apt-get update && \
    apt-get --no-install-recommends --yes install \
         git \
         automake \
         build-essential \
         libtool \
         autotools-dev \
         autoconf \
         pkg-config \
         libssl-dev \ 
         libboost-all-dev \
         libevent-dev \
         bsdmainutils \
         vim \
         software-properties-common && \
         rm -rf /var/lib/apt/lists/* 

RUN add-apt-repository ppa:bitcoin/bitcoin && \
    apt-get update && \
    apt-get --no-install-recommends --yes install \
          libdb4.8-dev \
          libdb4.8++-dev \
          libminiupnpc-dev && \
          rm -rf /var/lib/apt/lists/* 

WORKDIR /ccbc

ENV CCBC_VERSION v1.0.0.4

RUN git clone -b master https://github.com/CryptoCashBack-Hub/CCBC.git . && \
    git checkout $CCBC_VERSION && \
    ./autogen.sh && \
    ./configure && \
    make &&\
    strip /ccbc/src/ccbcd /ccbc/src/ccbc-cli && \
    mv /ccbc/src/ccbcd /usr/local/bin/ && \
    mv /ccbc/src/ccbc-cli /usr/local/bin/ && \
    # clean
    rm -rf /ccbc 

VOLUME ["/root/.ccbc"]

EXPOSE 5520/tcp

CMD ccbcd -printtoconsole
