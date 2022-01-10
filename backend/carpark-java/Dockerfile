FROM openjdk:11

COPY ./target/rezervation-0.0.1-SNAPSHOT.jar /usr/app/

WORKDIR /usr/app

RUN sh -c 'touch rezervation-0.0.1-SNAPSHOT.jar'

ARG JAR_FILE=target/touch rezervation-0.0.1-SNAPSHOT.jar

ENTRYPOINT ["java","-jar","rezervation-0.0.1-SNAPSHOT.jar"]