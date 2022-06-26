FROM gradle:7.4.2-jdk17

WORKDIR /
RUN mkdir /app
RUN git clone https://github.com/vmaaik/strava_family.git /app
WORKDIR /app
RUN gradle bootJar --no-daemon

ADD build/libs/*.jar app.jar

EXPOSE 8090

CMD java -jar -Dspring.profiles.active=prod app.jar