# --- Stage 1: Build Java Servlets ---
FROM eclipse-temurin:21-jdk AS builder

WORKDIR /app

COPY src/main/webapp ./webapp
COPY src/main/java ./src

ADD https://repo1.maven.org/maven2/jakarta/servlet/jakarta.servlet-api/6.0.0/jakarta.servlet-api-6.0.0.jar ./servlet-api.jar

RUN mkdir -p webapp/WEB-INF/classes

RUN javac -cp "servlet-api.jar:webapp/WEB-INF/lib/*" -d webapp/WEB-INF/classes $(find src -name "*.java")

# --- Stage 2: Production Container with Tomcat + MySQL ---
FROM tomcat:10.1-jdk21-temurin

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server && \
    rm -rf /var/lib/apt/lists/*

RUN rm -rf /usr/local/tomcat/webapps/*

COPY --from=builder /app/webapp /usr/local/tomcat/webapps/ROOT/

RUN cp /usr/local/tomcat/webapps/ROOT/welcome.jsp /usr/local/tomcat/webapps/ROOT/index.jsp || true

# --- Properly initialize MySQL data dir at BUILD time (root, no password) ---
RUN rm -rf /var/lib/mysql && \
    mkdir -p /var/lib/mysql /var/run/mysqld && \
    chown -R mysql:mysql /var/lib/mysql /var/run/mysqld && \
    mysqld --initialize-insecure --user=mysql --datadir=/var/lib/mysql

EXPOSE 8080

CMD service mysql start && \
    for i in $(seq 1 30); do mysqladmin --protocol=socket -u root ping 2>/dev/null && break; sleep 1; done && \
    mysql --protocol=socket -u root -e "CREATE DATABASE IF NOT EXISTS project_development;" && \
    mysql --protocol=socket -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'meetsingh';" && \
    mysql --protocol=socket -u root -e "FLUSH PRIVILEGES;" && \
    catalina.sh run