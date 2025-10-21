# Dockerfile

# Use a base image containing Java runtime
FROM openjdk:17-jdk-slim
# Replace with your desired JDK version

# Set the working directory inside the container
WORKDIR /app

# Copy the Spring Boot jar file into the container
COPY target/ci-cd-pipeline-0.0.1-SNAPSHOT.jar /app/ci-cd-pipeline-0.0.1-SNAPSHOT.jar

# Expose the port that the Spring Boot application runs on
EXPOSE 8080

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "/app/ci-cd-pipeline-0.0.1-SNAPSHOT.jar"]