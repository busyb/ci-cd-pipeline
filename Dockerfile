# Dockerfile

# Use a base image containing Java runtime
#FROM openjdk:17-jdk-slim
## Replace with your desired JDK version
#
## Set the working directory inside the container
#WORKDIR /app
#
## Add a build argument for the JAR filename, defaulting to wildcard matching
#ARG JAR_FILE=target/ci-cd-pipeline-*.jar
#
## Copy the Spring Boot jar file into the container
## Copy the JAR file with a wildcard to /app/app.jar
##COPY target/ci-cd-pipeline-0.0.1-SNAPSHOT.jar /app/ci-cd-pipeline-0.0.1-SNAPSHOT.jar
##COPY ${JAR_FILE} app.jar
#COPY target/ci-cd-pipeline.jar app.jar
#
#
## Expose the port that the Spring Boot application runs on
#EXPOSE 8080
#
## Run the Spring Boot application
## Run the app.jar regardless of actual jar name
#ENTRYPOINT ["java", "-jar", "/app/app.jar"]
##ENTRYPOINT ["java", "-jar", "/app/ci-cd-pipeline-0.0.1-SNAPSHOT.jar"]

# Stage 1: build the app
FROM maven:3.8.4-openjdk-17 as builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: run the app
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=builder /app/target/ci-cd-pipeline-*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]







