FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC

RUN apt update
RUN apt install python3-dev python3-pip  \
    cmake build-essential pkg-config git \
    libatlas-base-dev liblapacke-dev gfortran -y

RUN apt install libopencv-dev python3-opencv -y

WORKDIR /app

RUN git clone --depth=1 https://github.com/Digitelektro/MeteorDemod.git
WORKDIR /app/MeteorDemod
RUN git submodule update --init --recursive
RUN mkdir build 
WORKDIR /app/MeteorDemod/build
RUN cmake ../
RUN make -j4
RUN make install
WORKDIR /data

ENTRYPOINT ["/usr/local/bin/meteordemod"]