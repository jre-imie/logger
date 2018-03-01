FROM java:8
RUN apt-get update && apt-get install -y unzip

RUN wget https://services.gradle.org/distributions/gradle-3.4.1-bin.zip
RUN mkdir /opt/gradle
RUN  unzip -d /opt/gradle gradle-3.4.1-bin.zip
ENV PATH="/opt/gradle/gradle-3.4.1/bin:${PATH}"
COPY . logger
WORKDIR logger
RUN gradle -version
RUN gradle shadowJar

CMD ["java", "-jar", "build/libs/logger.jar"]
