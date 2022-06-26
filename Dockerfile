FROM gradle:7.4.2-jdk17

WORKDIR /
RUN mkdir /app
RUN git clone https://github.com/vmaaik/strava_family.git /app
WORKDIR /app
RUN gradle bootJar --no-daemon
RUN echo "test"
RUN pwd
RUN echo "test"
WORKDIR /app/strava_family
ADD build/libs/strava_family-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8090

CMD java -jar -Dspring.profiles.active=prod app.jar