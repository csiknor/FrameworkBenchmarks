FROM maven:3.9-eclipse-temurin-25 AS maven
WORKDIR /spring
COPY src src
COPY pom.xml pom.xml
RUN mvn package -q

FROM bellsoft/liberica-openjre-debian:25
WORKDIR /spring
COPY --from=maven /spring/target/hello-spring-1.0-SNAPSHOT.jar app.jar
# See https://docs.spring.io/spring-boot/reference/packaging/efficient.html
RUN java -Djarmode=tools -jar app.jar extract

EXPOSE 8080

CMD ["java", "-XX:+DisableExplicitGC", "-XX:+UseStringDeduplication", "-Dlogging.level.root=OFF", "-jar", "app/app.jar", "--spring.profiles.active=jooq"]