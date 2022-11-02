FROM ubuntu:20.04
RUN \
  export DEBIAN_FRONTEND=noninteractive && \
  export TZ=Europe\Paris && \
  ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
  apt-get update && \
  apt-get dist-upgrade -y && \
# install utilities
  apt-get install -y \
    wget \
    sudo && \
  # install node.js
  wget https://nodejs.org/dist/v16.18.0/node-v16.18.0-linux-x64.tar.gz -O /tmp/node.tar.gz && \
  tar -C /usr/local --strip-components 1 -xzf /tmp/node.tar.gz && \
  # upgrade npm
  npm install -g npm yo && \
  # cleanup
  apt-get clean && \
  rm -rf \
    /var/lib/apt/lists/* \
    /tmp/* \
    /var/tmp/*

ENV PATH $PATH:/usr/bin
