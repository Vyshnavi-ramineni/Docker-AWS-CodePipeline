FROM maven:3.8-openjdk-11 AS build
WORKDIR /opt/javacodepipeline
COPY . .
RUN mvn clean install -DskipTests

FROM openjdk:11
WORKDIR /opt/javacodepipeline/target
COPY --from=build /opt/javacodepipeline/example-1.0.0-SNAPSHOT.jar app.jar example-1.0.0-SNAPSHOT.jar app.jar 
EXPOSE 8080
ENTRYPOINT ["java" "-jar" "example-1.0.0-SNAPSHOT.jar app.jar"]
