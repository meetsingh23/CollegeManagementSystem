FROM tomcat:10.1-jdk21-temurin

# Clean default Tomcat applications
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy project source directly to Tomcat ROOT webapp
COPY WebContent /usr/local/tomcat/webapps/ROOT/

EXPOSE 8080

CMD ["catalina.sh", "run"]