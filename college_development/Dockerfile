FROM tomcat:10.1-jdk21-temurin

# Clean default Tomcat webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy web contents directly into Tomcat ROOT
COPY src/main/webapp /usr/local/tomcat/webapps/ROOT/

EXPOSE 8080

CMD ["catalina.sh", "run"]