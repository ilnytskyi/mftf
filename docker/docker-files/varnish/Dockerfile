FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

# Update apt sources
#RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list

# Update the package repository
RUN apt-get -qq update

# Install base system
RUN apt-get install -y varnish vim net-tools

# Make our custom VCLs available on the container
ADD default.vcl /etc/varnish/default.vcl

# Export environment variables
ENV VARNISH_PORT 80
ENV VARNISH_MEMORY 64m
ENV VARNISH_VCL_PATH /etc/varnish/default.vcl

# Expose port 8082
EXPOSE 8080

COPY start.sh /start

RUN chmod 0755 /start

CMD ["/start"]
