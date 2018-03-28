FROM java:8
RUN apt-get update && apt-get install -y unzip

# install de gradle
RUN wget https://services.gradle.org/distributions/gradle-3.4.1-bin.zip
RUN mkdir /opt/gradle
RUN  unzip -d /opt/gradle gradle-3.4.1-bin.zip
ENV PATH="/opt/gradle/gradle-3.4.1/bin:${PATH}"

# copie des sources et compilation 
COPY . src
WORKDIR src
RUN gradle -version
RUN gradle shadowJar

CMD ["java", "-jar", "build/libs/logger.jar"]



