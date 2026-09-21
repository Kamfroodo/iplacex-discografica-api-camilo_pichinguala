# STAGE 1: Construcción utilizando gradle
FROM gradle:8.5-jdk21 AS build
WORKDIR /app
COPY . .
RUN gradle build -x test

# STAGE 2: Ejecución utilizando openjdk
FROM eclipse-temurin:21-jdk
WORKDIR /app
COPY --from=build /app/build/libs/discografia-1.jar .
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "discografia-1.jar"]