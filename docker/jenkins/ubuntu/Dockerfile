FROM ubuntu:latest
USER root

ARG jenkins_version=2.263.3
ARG jenkins_dir="jenkins"

ARG download_url=https://pkg.jenkins.io/debian-stable/jenkins.io.key

EXPOSE 8080
EXPOSE 8081

# RUN dpkg --add-architecture i386
RUN    apt-get update && apt-get install -y
RUN    apt-get update && apt-get install -yq software-properties-common \
       wget openjdk-11-jdk sudo daemon psmisc net-tools
RUN    apt-get -yq autoremove
RUN    apt-get clean
RUN    apt-get autoclean

RUN wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
RUN sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
    /etc/apt/sources.list.d/jenkins.list'
RUN apt-get update
RUN apt-get install jenkins

# RUN wget -q -O - $download_url | sudo apt-key add -

#RUN echo "deb https://pkg.jenkins.io/debian-stable binary/" > /etc/apt/sources.list


ENTRYPOINT service jenkins start && bash
# CMD ["-jar", "jenkins"]
# CMD ["service", "jenkins", "start"]
