FROM amazoncorretto:latest

ARG jenkins_version=2.263.3
ARG jenkins_dir="jenkins"

ADD http://mirrors.jenkins.io/war-stable/${jenkins_version}/jenkins.war /${jenkins_dir}/

EXPOSE 8080

ENTRYPOINT ["java"]
CMD [ "-jar", "/jenkins/jenkins.war"]
