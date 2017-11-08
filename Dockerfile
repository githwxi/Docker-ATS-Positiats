# Dockerfile
FROM ubuntu:16.04
# No one is assgined
MAINTAINER Admin Postiats "gmpositiats@gmail.com"

# Do it here:
WORKDIR /MyRoot

# Install Deps
RUN apt-get update
RUN apt-get install -y gcc
RUN apt-get install -y git
RUN apt-get install -y build-essential
RUN apt-get install -y libgmp-dev libgc-dev libjson-c-dev

# Get the ATS2 and ATS2-contrib
RUN git clone "git://git.code.sf.net/p/ats2-lang/code" ATS2
#
# RUN git clone "git://git.code.sf.net/p/ats2-lang-contrib/code" ATS2-contrib
#
RUN git clone "https://github.com/githwxi/ATS-Postiats-contrib.git" ATS2-contrib

# Setup Env Vars
ENV PATSHOME="/MyRoot/ATS2"
ENV PATSCONTRIB="/MyRoot/ATS2-contrib"
ENV PATSHOMELOCS="./node_modules:./../node_modules:./../../node_modules:./../../../node_modules"
# No need for 'make install'
ENV PATH="${PATH}:${PATSHOME}/bin"

# Bootstrap ATS
RUN (cd ${PATSHOME} && ./configure && make all)

# For building atscc2js
RUN (cd ${PATSHOME}/contrib/CATS-atscc2js && make && mv -f bin/atscc2js ./../../bin/.)

# For building atscc2php
RUN (cd ${PATSHOME}/contrib/CATS-atscc2php && make && mv -f bin/atscc2php ./../../bin/.)

# Confirm that ATS is properly installed
RUN which patscc
RUN which patsopt
RUN which myatscc
RUN which atscc2js
RUN which atscc2php

# End of [Dockerfile]
