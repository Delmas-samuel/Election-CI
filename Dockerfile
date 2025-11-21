# Multi-stage Docker build for the Spring Boot app

# ---- Build stage ----
FROM maven:3.9.9-eclipse-temurin-21 AS builder
WORKDIR /app

# Copy project files
COPY pom.xml ./
COPY src ./src

# Build application (skip tests for faster image build on Render)
RUN mvn -B clean package -DskipTests

# ---- Runtime stage ----
FROM eclipse-temurin:21-jre
WORKDIR /app

# Copy the fat jar from the builder image
COPY --from=builder /app/target/*.jar /app/app.jar

# Allow passing extra JVM/system props via JAVA_OPTS
ENV JAVA_OPTS=""

# Expose default Spring Boot port (Render will set PORT env var at runtime)
EXPOSE 8080

# Start the app; if JAVA_OPTS contains -Dserver.port=$PORT, the port will match Render
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar /app/app.jar"]
