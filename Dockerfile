# See https://www.mathworks.com/products/compiler/matlab-runtime.html for more info.
#
# @author Eros montin
# @creation 2020-08-26
#

#OS
FROM debian:stretch-slim
#it's me
MAINTAINER Eros Montin <eros.montin@gmail.com>

#ENV DEBIAN_FRONTEND noninteractive

#install needed tool
RUN apt-get update && apt-get install -y --no-install-recommends wine wine64
RUN apt-get install -q -y --no-install-recommends \
	  xorg \
      unzip \
      wget \
      curl && \
    apt-get clean 
    


# Download the MCR from MathWorks site an install with -mode silent
RUN mkdir /mcr-install && \
    mkdir /opt/mcr && \
    cd /mcr-install && \
    wget --no-check-certificate -q https://ssd.mathworks.com/supportfiles/downloads/R2019a/Release/8/deployment_files/installer/complete/glnxa64/MATLAB_Runtime_R2019a_Update_8_glnxa64.zip && \
    unzip -q MATLAB_Runtime_R2019a_Update_8_glnxa64 && \
    rm -f MATLAB_Runtime_R2019a_Update_8_glnxa64 && \
    ./install -destinationFolder /opt/mcr -agreeToLicense yes -mode silent && \
    cd / && \
    rm -rf mcr-install

RUN dpkg --add-architecture i386 && apt-get update && apt-get install -y wine32
# Configure environment variables for MCR
ENV LD_LIBRARY_PATH /opt/mcr/v96/runtime/glnxa64:/opt/mcr/v96/bin/glnxa64:/opt/mcr/v96/sys/os/glnxa64:/opt/mcr/v96/extern/bin/glnxa64
                    
ENV XAPPLRESDIR /etc/X11/app-defaults

#copy the code
COPY code /app
RUN mkdir /camrieTemp
WORKDIR /app

COPY testdata /app/testdata
cmd ["sh", "/app/run_camrie.sh", "/opt/mcr/v96/"]


#example
#docker build ./ -t camriecu
#docker run --rm -it --mount type=bind,source=/data/tmp,target=/camrieTemp camriecu bash
#sh run_camrie.sh /opt/mcr/v96/ /app/testdata/jsontest.json /camrieTemp/output.json /camrieTemp/l.json /camrieTemp/


