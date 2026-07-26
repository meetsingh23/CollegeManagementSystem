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

# 1. Install MySQL Server
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server && \
    rm -rf /var/lib/apt/lists/*

# 2. Cleanup default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# 3. Copy WebApp
COPY --from=builder /app/webapp /usr/local/tomcat/webapps/ROOT/

RUN cp /usr/local/tomcat/webapps/ROOT/welcome.jsp /usr/local/tomcat/webapps/ROOT/index.jsp || true

# 4. Create SQL Init File with Database, Tables, Password & Privileges
# YAHAN APNE TABLES KO CREATE KARNE KI QUERIES WRITE KAREIN:
RUN echo "CREATE DATABASE IF NOT EXISTS project_development;" > /docker-entrypoint-initdb.sql && \
    echo "USE project_development;" >> /docker-entrypoint-initdb.sql && \
    echo "CREATE TABLE IF NOT EXISTS sign (id VARCHAR(100), name VARCHAR(100), password VARCHAR(100));" >> /docker-entrypoint-initdb.sql && \
    echo "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'meetsingh';" >> /docker-entrypoint-initdb.sql && \
    echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;" >> /docker-entrypoint-initdb.sql && \
    echo "FLUSH PRIVILEGES;" >> /docker-entrypoint-initdb.sql

EXPOSE 8080

# 5. Start MySQL with init script, then run Tomcat
CMD service mysql start && \
    mysql -u root < /docker-entrypoint-initdb.sql 2>/dev/null || mysql -u root -pmeetsingh < /docker-entrypoint-initdb.sql 2>/dev/null || true && \
    catalina.sh run