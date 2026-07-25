FROM maven:3.9.9-eclipse-temurin-21 AS build

WORKDIR /app

# Current directory context se sab copy karein
COPY . .

# Check karein pom.xml kahan hai aur build chalayein
RUN mvn clean package -DskipTests

FROM tomcat:10.1-jdk21-temurin

RUN rm -rf /usr/local/tomcat/webapps/*

# Target folder se war file copy karein
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]