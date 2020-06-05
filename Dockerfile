FROM ubuntu:16.04 as evalvid

RUN apt-get update -y \
    && apt-get install --no-install-recommends -y git make g++ \
    libopencv-dev cmake\
    && rm -rf /var/lib/apt/lists/*

WORKDIR /home/vmqt
COPY src/ .
RUN cd VQMT/ \
    && cmake ./ \
    && make \
    && make install \
    && make clean
#RUN sh ./compile.sh
#RUN sh compile-static.sh
#RUN mkdir -p /data
CMD ["/bin/bash"]

#FROM evalvid as evalvidffmpeg
#RUN apt-get update -y && apt-get install -y --no-install-recommends ffmpeg && rm -rf /var/lib/apt/lists/*