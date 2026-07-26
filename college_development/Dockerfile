# Stage 1: Java Servlet Compilation
FROM eclipse-temurin:21-jdk AS builder

WORKDIR /app

COPY src/main/webapp ./webapp
COPY src/main/java ./src

ADD https://repo1.maven.org/maven2/jakarta/servlet/jakarta.servlet-api/6.0.0/jakarta.servlet-api-6.0.0.jar ./servlet-api.jar

RUN mkdir -p webapp/WEB-INF/classes

# Compile Java Source Files
RUN javac -cp "servlet-api.jar:webapp/WEB-INF/lib/*" -d webapp/WEB-INF/classes $(find src -name "*.java")

# Stage 2: Tomcat 10 + MySQL Runtime Setup
FROM tomcat:10.1-jdk21-temurin

# 1. Install MySQL Server
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server && \
    rm -rf /var/lib/apt/lists/*

# 2. Cleanup Tomcat Default Apps
RUN rm -rf /usr/local/tomcat/webapps/*

# 3. Deploy Application to ROOT
COPY --from=builder /app/webapp /usr/local/tomcat/webapps/ROOT/

# 4. Create Init SQL Script (Database, Tables & Full Access)
RUN echo "CREATE DATABASE IF NOT EXISTS project_development;" > /docker-entrypoint-initdb.sql && \
    echo "USE project_development;" >> /docker-entrypoint-initdb.sql && \
    echo "CREATE TABLE IF NOT EXISTS sign (first_name VARCHAR(50), last_name VARCHAR(50), email VARCHAR(100), pass VARCHAR(50), date DATE);" >> /docker-entrypoint-initdb.sql && \
    echo "CREATE TABLE IF NOT EXISTS management (id VARCHAR(50), user_id VARCHAR(50), password VARCHAR(50));" >> /docker-entrypoint-initdb.sql && \
    echo "CREATE TABLE IF NOT EXISTS faculty (id VARCHAR(50), user_id VARCHAR(50), password VARCHAR(50));" >> /docker-entrypoint-initdb.sql && \
    echo "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'meetsingh';" >> /docker-entrypoint-initdb.sql && \
    echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;" >> /docker-entrypoint-initdb.sql && \
    echo "FLUSH PRIVILEGES;" >> /docker-entrypoint-initdb.sql

EXPOSE 8080

# 5. Launch MySQL & Start Tomcat Server
CMD service mysql start && \
    mysql -u root < /docker-entrypoint-initdb.sql 2>/dev/null || mysql -u root -pmeetsingh < /docker-entrypoint-initdb.sql 2>/dev/null || true && \
    catalina.sh run