FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && apt-get install -y git
RUN apt install openjdk-11-jre -y 

RUN git clone https://github.com/anthonyjmarchi/module6shadowjar.git 

WORKDIR /module6shadowjar

CMD ["java","-jar","java-image-gallery-all.jar"]

