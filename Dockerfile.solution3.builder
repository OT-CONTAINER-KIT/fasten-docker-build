FROM maven:3-jdk-8

LABEL maintainer="opensource@opstree.com"

WORKDIR /usr/src/app

ADD . /usr/src/app
RUN mvn clean package -Dmaven.test.skip=true
