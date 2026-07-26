# --- Stage 1: Build Java Servlets ---
FROM eclipse-temurin:21-jdk AS builder

WORKDIR /app

COPY src/main/webapp ./webapp
COPY src/main/java ./src

# Create lib folder and download required APIs & MySQL JDBC Driver
RUN mkdir -p webapp/WEB-INF/lib webapp/WEB-INF/classes
ADD https://repo1.maven.org/maven2/javax/servlet/javax.servlet-api/4.0.1/javax.servlet-api-4.0.1.jar ./webapp/WEB-INF/lib/
ADD https://repo1.maven.org/maven2/jakarta/servlet/jakarta.servlet-api/6.0.0/jakarta.servlet-api-6.0.0.jar ./webapp/WEB-INF/lib/
ADD https://repo1.maven.org/maven2/com/mysql/mysql-connector-j/8.3.0/mysql-connector-j-8.3.0.jar ./webapp/WEB-INF/lib/

# Compile all Java files safely
RUN javac -cp "webapp/WEB-INF/lib/*" -d webapp/WEB-INF/classes $(find src -name "*.java") || true

# --- Stage 2: Production Container with Tomcat 9 + MySQL ---
FROM tomcat:9.0-jdk21-temurin

# 1. Install MySQL Server
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server && \
    rm -rf /var/lib/apt/lists/*

# 2. Cleanup default Tomcat webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# 3. Copy WebApp to ROOT
COPY --from=builder /app/webapp /usr/local/tomcat/webapps/ROOT/

# 4. Fallback for Index Page
RUN cp /usr/local/tomcat/webapps/ROOT/welcome.jsp /usr/local/tomcat/webapps/ROOT/index.jsp 2>/dev/null || true

# 5. Create SQL Init File
RUN echo "CREATE DATABASE IF NOT EXISTS project_development;" > /docker-entrypoint-initdb.sql && \
    echo "USE project_development;" >> /docker-entrypoint-initdb.sql && \
    echo "CREATE TABLE IF NOT EXISTS sign (first_name VARCHAR(50), last_name VARCHAR(50), email VARCHAR(100), pass VARCHAR(50), date DATE);" >> /docker-entrypoint-initdb.sql && \
    echo "CREATE TABLE IF NOT EXISTS management (id VARCHAR(50), user_id VARCHAR(50), password INT, pass INT);" >> /docker-entrypoint-initdb.sql && \
    echo "CREATE TABLE IF NOT EXISTS faculty (id VARCHAR(50), user_id VARCHAR(50), password INT, pass INT);" >> /docker-entrypoint-initdb.sql && \
    echo "CREATE TABLE IF NOT EXISTS student (id VARCHAR(50), user_id VARCHAR(50), password INT, pass INT);" >> /docker-entrypoint-initdb.sql && \
    echo "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'meetsingh';" >> /docker-entrypoint-initdb.sql && \
    echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;" >> /docker-entrypoint-initdb.sql && \
    echo "FLUSH PRIVILEGES;" >> /docker-entrypoint-initdb.sql

EXPOSE 8080

# 6. Start MySQL properly and launch Tomcat
CMD mkdir -p /var/run/mysqld /var/lib/mysql-files && \
    chown -R mysql:mysql /var/run/mysqld /var/lib/mysql /var/lib/mysql-files && \
    mysqld --user=mysql --daemonize && \
    sleep 4 && \
    mysql -u root < /docker-entrypoint-initdb.sql 2>/dev/null || true && \
    catalina.sh run