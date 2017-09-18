# FROM python:3.6
FROM ubuntu:latest
MAINTAINER Pierrick Boitel

# Install libraries
RUN apt-get update -y
RUN apt-get install -y locales python3-pip python3-dev python3 libffi-dev libmysqlclient-dev git libzmq-dev libevent-dev libssl-dev

# Set the locale
RUN locale-gen fr_FR.UTF-8  
ENV LANG fr_FR.UTF-8  
ENV LANGUAGE fr_FR:fr 
ENV LC_ALL fr_FR.UTF-8  

# Install WSGI server
RUN pip3 install chaussette waitress==0.9.0 circus

# Install application
WORKDIR /app/blog-jonglage
RUN git clone -b dev https://github.com/lilireli/blog-jonglage.git .
RUN pip3 install -r requirements.txt
RUN mkdir instance
ADD config.py instance/
ADD start.sh .
ADD circus.ini .
RUN chmod +x start.sh
