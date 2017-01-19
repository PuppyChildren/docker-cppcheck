FROM alpine:3.5

MAINTAINER Uilian Ries <uilianries@gmail.com>

RUN apk update && \
	apk add --no-cache -t .required_apks git make g++ pcre-dev && \
    git clone --branch 1.77 https://github.com/danmar/cppcheck.git /tmp/cppcheck && \
    cd /tmp/cppcheck && \ 
    make CFGDIR=/cfg HAVE_RULES=yes CXXFLAGS="-O2 -DNDEBUG -Wall -Wno-sign-compare -Wno-unused-function --static" && \
	make install && \
	apk del .required_apks && \
    rm -rf /tmp/cppcheck && \
    mkdir /src
    
ENTRYPOINT ["cppcheck", "/src", "--verbose", "--enable=all", "--inconclusive", "--std=c++11", "--language=c++", "--error-exitcode=1"]
