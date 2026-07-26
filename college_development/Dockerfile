# 1. Base Image - Tomcat with JDK
FROM tomcat:9.0-jdk11-openjdk-slim

# 2. Container ke andar MySQL Server install karein
RUN apt-get update && apt-get install -y mysql-server && rm -rf /var/lib/apt/lists/*

# 3. WebContent folder ko Tomcat me copy karein
# (Agar aapke folder ka naam 'WebContent' ki jagah 'src/main/webapp' hai toh us hisab se change kar lein)
COPY WebContent/ /usr/local/tomcat/webapps/ROOT/

# 4. Local MySQL database aur root user configure karein
RUN service mysql start && \
    mysql -e "CREATE DATABASE IF NOT EXISTS project;" && \
    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '';" && \
    mysql -e "FLUSH PRIVILEGES;"

# 5. Tomcat Port expose karein
EXPOSE 8080

# 6. MySQL aur Tomcat dono ko ek saath start karein
CMD service mysql start && catalina.sh run