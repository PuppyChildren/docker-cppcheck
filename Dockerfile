FROM alpine:3.5

MAINTAINER Uilian Ries <uilianries@gmail.com>

RUN apk update && \
    apk add --no-cache -t .required_apks wget make g++ pcre-dev && \
    wget --no-check-certificate -O /tmp/cppcheck-1.77.tar.gz https://github.com/danmar/cppcheck/archive/1.77.tar.gz && \
    tar -zxf /tmp/cppcheck-1.77.tar.gz -C /tmp && \
    cd /tmp/cppcheck-1.77 && \
    make install CFGDIR=/cfg HAVE_RULES=yes CXXFLAGS="-O2 -DNDEBUG -Wall -Wno-sign-compare -Wno-unused-function --static" && \
    apk del .required_apks && \
    rm -rf /tmp/cppcheck && \
    mkdir /src

CMD ["/bin/sh"]
