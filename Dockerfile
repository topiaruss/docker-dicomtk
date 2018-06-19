FROM alpine:latest

# This is lifted from https://hub.docker.com/r/darthunix/dcmtk/~/dockerfile/


# The recommended build uses cmake, but ignore-deprecation allows us to build
# using the .configure autoconf path.
# This should be updated to a cmake build pipeline at some point.

RUN apk update && \
    apk add --no-cache libstdc++ g++ make git && \
    git clone https://github.com/DCMTK/dcmtk.git && \
    cd dcmtk && \
    ./configure --ignore-deprecation && \
    make all && \
    make install && \
    make distclean && \
    cd .. && \
    rm -r dcmtk && \
    apk del g++ make git && \
    rm /var/cache/apk/*

