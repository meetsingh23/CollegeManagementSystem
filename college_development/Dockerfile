# --- Stage 1: Build Java Servlets ---
FROM eclipse-temurin:21-jdk AS builder

WORKDIR /app

COPY src/main/webapp ./webapp
COPY src/main/java ./src

ADD https://repo1.maven.org/maven2/jakarta/servlet/jakarta.servlet-api/6.0.0/jakarta.servlet-api-6.0.0.jar ./servlet-api.jar

RUN mkdir -p webapp/WEB-INF/classes

# Java files compile karein
RUN javac -cp "servlet-api.jar:webapp/WEB-INF/lib/*" -d webapp/WEB-INF/classes $(find src -name "*.java")

# --- Stage 2: Production Container with Tomcat + MySQL ---
FROM tomcat:10.1-jdk21-temurin

# 1. MySQL Server install karein
RUN apt-get update && apt-get install -y mysql-server && rm -rf /var/lib/apt/lists/*

# 2. Default webapps saaf karein
RUN rm -rf /usr/local/tomcat/webapps/*

# 3. Compiled WebApp container mein copy karein
COPY --from=builder /app/webapp /usr/local/tomcat/webapps/ROOT/

RUN cp /usr/local/tomcat/webapps/ROOT/welcome.jsp /usr/local/tomcat/webapps/ROOT/index.jsp || true

# 4. MySQL setup: Root user permission aur database fix
RUN service mysql start && \
    mysql -e "CREATE DATABASE IF NOT EXISTS project;" && \
    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '';" && \
    mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;" && \
    mysql -e "FLUSH PRIVILEGES;"

EXPOSE 8080

# 5. MySQL service aur Tomcat dono ko run karein
CMD service mysql start && catalina.sh run