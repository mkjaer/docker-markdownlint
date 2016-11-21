FROM alpine:3.4
MAINTAINER Mikael Kjaer <mikael@teletronics.ae>

RUN apk update && apk upgrade && apk --update add ruby git ruby-rake ruby-bundler

RUN git clone https://github.com/mivok/markdownlint && \
    cd markdownlint && \
    rake install && \
    cd .. && \
    rm -r markdownlint

RUN mkdir /inputfiles
WORKDIR /inputfiles

CMD [ "/inputfiles" ]
