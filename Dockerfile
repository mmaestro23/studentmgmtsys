# Use the official Tomcat image as a base
FROM tomcat:9-jdk11-openjdk

# Maintainer of the image
LABEL maintainer="ericmanzi1738@gmail.com"

# Copy the WAR file to the webapps directory of Tomcat
COPY ./studentmgmtsys_war.war /usr/local/tomcat/webapps/

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
