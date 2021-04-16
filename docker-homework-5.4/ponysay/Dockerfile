FROM openjdk:8


RUN apt-get update && \
    apt-get install -y software-properties-common sudo && \
    add-apt-repository ppa:vincent-c/ponysay && \
    apt-get update
 

RUN apt-get install -y ponysay:3.0.3-1
ENTRYPOINT ["/usr/bin/ponysay"]

