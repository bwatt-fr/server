FROM ubuntu:16.04
MAINTAINER Aurelie Suzanne

# Install libraries
RUN apt-get update -y
RUN apt-get install -y locales git
RUN apt-get install -y libboost-all-dev libzmq3-dev libsqlite3-dev build-essential cmake

# Set the locale
RUN locale-gen fr_FR.UTF-8  
ENV LANG fr_FR.UTF-8  
ENV LANGUAGE fr_FR:fr 
ENV LC_ALL fr_FR.UTF-8

WORKDIR /tmp
RUN git clone -b master https://github.com/lilireli/house-monitoring.git
RUN mkdir house-monitoring/server-monitoring/build

WORKDIR /tmp/house-monitoring/server-monitoring/build
RUN cmake ..
RUN make

WORKDIR /tmp/house-monitoring/server-monitoring/
RUN mkdir /app
RUN cp -r web /app/web
RUN cp -r build/webserver /app
COPY house-monitoring.db /app
COPY conf.json /app
