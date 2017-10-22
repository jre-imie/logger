FROM java:8

RUN apt-get update && apt-get install -y unzip

RUN wget https://services.gradle.org/distributions/gradle-3.4.1-bin.zip \
    &&  mkdir /opt/gradle \
    &&  unzip -d /opt/gradle gradle-3.4.1-bin.zip


ENV PATH="/opt/gradle/gradle-3.4.1/bin:${PATH}"

COPY . logger

WORKDIR logger
RUN gradle -version

EXPOSE 8080
CMD ["java", "-jar", "build/libs/logger.jar"]




