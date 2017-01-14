FROM alpine:3.5
MAINTAINER Mikael Kjaer <mikael@teletronics.ae>

RUN apk add --no-cache ruby git ruby-rake ruby-bundler

RUN git clone https://github.com/mivok/markdownlint && \
    cd markdownlint && \
    rake install && \
    cd .. && \
    rm -r markdownlint

RUN mkdir /inputfiles
WORKDIR /inputfiles

ENTRYPOINT [ "mdl" ]
CMD [ "/inputfiles" ]
