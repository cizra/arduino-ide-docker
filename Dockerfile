FROM ubuntu:bionic
LABEL maintainer Elmo Todurov <elmo.todurov@eesti.ee>
ARG UID=1000
RUN useradd -m -u $UID arduino
RUN apt-get update && apt-get --yes --no-install-recommends install \
  curl ca-certificates xz-utils \
  libx11-6 libxext6 libxrender1 libxtst6 libxi6 && apt-get clean
USER arduino
RUN cd /tmp && curl https://downloads.arduino.cc/arduino-1.8.12-linux64.tar.xz | tar -xJ
WORKDIR /home/arduino
CMD /tmp/arduino-1.8.12/arduino
