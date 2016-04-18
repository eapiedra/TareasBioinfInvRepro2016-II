#################################################################
# Dockerfile
#
# Version:          1
# Software:         FastX Toolkit
# Software Version: 0.0.14
# Description:      A command line tools for Short-Reads FASTA/FASTQ files preprocessing.
# Website:          http://hannonlab.cshl.edu/fastx_toolkit/
# Tags:             FASTA|FASTAQ|Next-Generation_sequencing
# Provides:         FastX_Toolkit-0.0.14|libgtextutils-0.7
# Base Image:       biodckr/FastX toolkit
# Build Cmd:        docker build tarea6/fastx:v1
# Run Cmd:          docker run -it tarea6/fastx:v1 /bin/bash
#################################################################

# Set the base image to Ubuntu
FROM biodckr/biodocker

################## BEGIN INSTALLATION ######################

# Change user to root
USER root

# Instala actualizaciones
RUN apt-get update

# Instala las utilidades de Gtextutils
RUN wget https://github.com/agordon/libgtextutils/releases/download/0.7/libgtextutils-0.7.tar.gz && \
    tar -xvf libgtextutils-0.7.tar.gz && \
    cd libgtextutils-0.7 && \
    ./configure && \
    make &&\
    make install &&\
    cd ..

# Instala FastX tools        
RUN wget https://github.com/agordon/fastx_toolkit/releases/download/0.0.14/fastx_toolkit-0.0.14.tar.bz2 && \
    tar -xvf fastx_toolkit-0.0.14.tar.bz2 && \
    cd fastx_toolkit-0.0.14 &&\
    ./configure && \
    make && \
    make install &&\
    cd ..

# Remueve directorios innecesarios
RUN rm -rf fas* lib*

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Erick Arias <eapiedra@gmail.com>