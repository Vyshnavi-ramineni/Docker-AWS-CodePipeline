FROM maven:3.8-openjdk-11 AS build
WORKDIR /opt/javacodepipeline
COPY . .
RUN mvn clean install -DskipTests
FROM openjdk:17
WORKDIR /opt/javacodepipeline
COPY --from=build /root/.m2/repository/com/sixthpoint/springboot/codepipeline/example/0.0.1-SNAPSHOT/example-0.0.1-SNAPSHOT.jar example-1.0.0-SNAPSHOT.jar 
EXPOSE 8080
ENTRYPOINT ["java" "-jar" "example-1.0.0-SNAPSHOT.jar"]
