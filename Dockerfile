From gcr.io/tensorflow/tensorflow:latest

EXPOSE 6006 8888

RUN apt-get update \
    && apt-get install wget \
    && apt-get install -y build-essential cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev

RUN mkdir /opencv \
    && cd /opencv \
    && wget https://github.com/opencv/opencv/archive/3.4.0.zip \
    && unzip 3.4.0.zip \
    && mkdir opencv-3.4.0/build \
    && cd opencv-3.4.0/build \
    && cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_IPP=ON .. \
    && make -j7 \
    && make install
