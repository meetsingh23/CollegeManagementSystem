FROM tomcat:10.1-jdk21-temurin

# Clean default Tomcat webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy web files from src/main/webapp to ROOT
COPY src/main/webapp/ /usr/local/tomcat/webapps/ROOT/

EXPOSE 8080

CMD ["catalina.sh", "run"]