FROM amazoncorretto
WORKDIR /app
COPY target/*.jar bg.jar
EXPOSE 8080
CMD [ "java", "-jar", "bg.jar"]
