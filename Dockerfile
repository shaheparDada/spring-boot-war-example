# Use a base image with OpenJDK and Maven
FROM maven:3.8.4-openjdk-11-slim AS build

# Set the working directory

# Copy the POM file and download dependencies

# Build the application
RUN mvn package

# Use a base image with Tomcat
FROM tomcat:9.0.59-jdk11-openjdk-slim

# Copy the WAR file from the Maven build stage to Tomcat webapps directory
COPY --from=build ./target/your-application.war /usr/local/tomcat/webapps/

# Expose the default Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]

