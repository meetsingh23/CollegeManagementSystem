# --- Stage 1: Build Java Servlets ---
FROM eclipse-temurin:21-jdk AS builder

WORKDIR /app

COPY src/main/webapp ./webapp
COPY src ./src

# Create WEB-INF directories
RUN mkdir -p webapp/WEB-INF/lib webapp/WEB-INF/classes

# Download Jakarta Servlet API & MySQL Driver
ADD https://repo1.maven.org/maven2/jakarta/servlet/jakarta.servlet-api/6.0.0/jakarta.servlet-api-6.0.0.jar ./webapp/WEB-INF/lib/
ADD https://repo1.maven.org/maven2/com/mysql/mysql-connector-j/8.3.0/mysql-connector-j-8.3.0.jar ./webapp/WEB-INF/lib/

# Compile ALL .java files into WEB-INF/classes
RUN javac -cp "webapp/WEB-INF/lib/*" -d webapp/WEB-INF/classes $(find src -name "*.java")

# --- Stage 2: Production Container with Tomcat 11 + MySQL ---
FROM tomcat:11.0-jdk21-temurin

# Install MySQL Server
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server && \
    rm -rf /var/lib/apt/lists/*

# Clean default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WebApp to ROOT
COPY --from=builder /app/webapp /usr/local/tomcat/webapps/ROOT/

# Map welcome.jsp as index page fallback
RUN cp /usr/local/tomcat/webapps/ROOT/welcome.jsp /usr/local/tomcat/webapps/ROOT/index.jsp 2>/dev/null || true

RUN echo "CREATE DATABASE IF NOT EXISTS project_development;" > /docker-entrypoint-initdb.sql && \
    echo "USE project_development;" >> /docker-entrypoint-initdb.sql && \
    echo "CREATE TABLE IF NOT EXISTS sign (first_name VARCHAR(50), last_name VARCHAR(50), email VARCHAR(100), pass VARCHAR(50), date DATE);" >> /docker-entrypoint-initdb.sql && \
    echo "CREATE TABLE IF NOT EXISTS management (id VARCHAR(50), user_id VARCHAR(50), password INT);" >> /docker-entrypoint-initdb.sql && \
    echo "CREATE TABLE IF NOT EXISTS faculty (id VARCHAR(50), user_id VARCHAR(50), password INT);" >> /docker-entrypoint-initdb.sql && \
    echo "CREATE TABLE IF NOT EXISTS student (id VARCHAR(50), user_id VARCHAR(50), password INT);" >> /docker-entrypoint-initdb.sql && \
    echo "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'meetsingh';" >> /docker-entrypoint-initdb.sql && \
    echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;" >> /docker-entrypoint-initdb.sql && \
    echo "FLUSH PRIVILEGES;" >> /docker-entrypoint-initdb.sql

EXPOSE 8080

CMD mkdir -p /var/run/mysqld /var/lib/mysql-files && \
    chown -R mysql:mysql /var/run/mysqld /var/lib/mysql /var/lib/mysql-files && \
    mysqld --user=mysql --daemonize && \
    sleep 4 && \
    mysql -u root < /docker-entrypoint-initdb.sql 2>/dev/null || true && \
    catalina.sh run