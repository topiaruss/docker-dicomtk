FROM python:3.6

# based on code for an Alpine build, at https://hub.docker.com/r/darthunix/dcmtk/~/dockerfile/


# The recommended build uses cmake, but ignore-deprecation allows us to build
# using the .configure autoconf path.
# This should be updated to a cmake build pipeline at some point.

RUN apt-get update && \
    apt-get install -y libstdc++ g++ make git

RUN git clone https://github.com/DCMTK/dcmtk.git && \
    cd dcmtk && \
    ./configure --ignore-deprecation && \
    make all && \
    make install && \
    make distclean && \
    cd .. && \
    rm -r dcmtk && \
    rm -rf /var/lib/apt/lists/*

COPY tests/ /tests

