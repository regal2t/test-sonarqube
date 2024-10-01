# Step 1: Build the project using Maven
FROM maven AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the pom.xml file and the source code into the working directory
COPY pom.xml .
COPY lib ./lib
COPY api ./api

# Run the Maven build command to build the project
RUN mvn clean package -DskipTests

# Step 2: Create a lightweight image to run the Spring Boot app
FROM openjdk:8-jdk-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file from the build stage to the current stage
COPY --from=build /app/api/target/*.jar app.jar

# Expose the application's port (usually 8080 for Spring Boot)
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
