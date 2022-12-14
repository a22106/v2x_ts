FROM ubuntu:18.04

WORKDIR /home/

RUN mkdir /home/50-1_v2x
RUN cd /home/50-1_v2x

COPY . ./

RUN apt-get update
RUN apt-get install wget git -y

# - Geographic area:  설정하기
RUN sudo apt -y install software-properties-common dirmngr apt-transport-https lsb-release ca-certificates
RUN add-apt-repository ppa:graphics-drivers/ppa
RUN apt-get install nvidia-driver-470
RUN apt-get install nvidia-cuda-toolkit

RUN apt-get install python3-pip

# pip 패키지 설치
RUN pip install --upgrade pip
RUN pip install tsai
RUN pip install numpy==1.23 IPython ipykernel