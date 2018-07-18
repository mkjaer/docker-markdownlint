FROM alpine:3.8

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
