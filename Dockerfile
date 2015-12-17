FROM phusion/baseimage:0.9.18
MAINTAINER Mikael Kjaer <mikael@teletronics.ae>

# Install dependencies
RUN apt-get clean \
 && apt-get update \
 && apt-get install -y rake ruby git \
 && rm -rf /var/lib/apt/lists/* \
 && gem install bundler

# Install markdownlint
RUN git clone https://github.com/mivok/markdownlint \
 && cd markdownlint \
 && rake install \ 
 && cd .. \
 && rm -r markdownlint

RUN mkdir /inputfiles

# Ignore rule MD013 Line length
ENTRYPOINT [ "mdl", "-r", "~MD013" ]
CMD [ "/inputfiles" ]