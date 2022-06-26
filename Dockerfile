FROM gradle:7.4.2-jdk17

WORKDIR /
RUN mkdir /app
RUN git clone https://github.com/vmaaik/strava_family.git /app
WORKDIR /app/strava_family
RUN gradle clean build --no-daemon

ADD build/libs/strava_family-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8090

CMD java -jar -Dspring.profiles.active=prod app.jar