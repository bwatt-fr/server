FROM ubuntu:latest
MAINTAINER Pierrick Boitel

# Set the locale
RUN locale-gen fr_FR.UTF-8  
ENV LANG fr_FR.UTF-8  
ENV LANGUAGE fr_FR:fr 
ENV LC_ALL fr_FR.UTF-8  

# Install libraries
RUN apt-get update -y
RUN apt-get install -y python-pip python-dev libffi-dev libmysqlclient-dev git libzmq-dev libevent-dev libssl-dev

# Install WSGI server
RUN pip install chaussette waitress==0.9.0 circus

# Install application
WORKDIR /app/blog-jonglage
RUN git clone https://github.com/lilireli/blog-jonglage.git .
RUN pip install -r requirements.txt
RUN mkdir instance
ADD config.py instance/
ADD start.sh .
ADD circus.ini .
RUN chmod +x start.sh
