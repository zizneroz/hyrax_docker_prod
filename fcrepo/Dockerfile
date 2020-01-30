FROM tomcat:8.5

#ENV FCREPO_VERSION 4.7.3

# Configuration for Fedora: https://wiki.duraspace.org/display/FEDORA47/Application+Configuration
ENV JAVA_OPTS="${JAVA_OPTS} -Dfcrepo.home=/fcrepo4-data"
ENV JAVA_OPTS="${JAVA_OPTS} -Dfcrepo.modeshape.configuration=classpath:/config/file-simple/repository.json"
# ENV JAVA_OPTS="${JAVA_OPTS} -Dfcrepo.mysql.username=root"
# ENV JAVA_OPTS="${JAVA_OPTS} -Dfcrepo.mysql.password=123456"
# ENV JAVA_OPTS="${JAVA_OPTS} -Dfcrepo.mysql.host=localhost"
# ENV JAVA_OPTS="${JAVA_OPTS} -Dfcrepo.mysql.port=3306"


# Install Fedora
ADD https://github.com/fcrepo4/fcrepo4/releases/download/fcrepo-${FCREPO_VERSION}/fcrepo-webapp-${FCREPO_VERSION}.war ${CATALINA_HOME}/webapps/fcrepo.war

# FROM tomcat:8.5

# ENV FCREPO_VERSION 4.7.3

# # Configuration for Fedora: https://wiki.duraspace.org/display/FEDORA47/Application+Configuration
# ENV JAVA_OPTS="${JAVA_OPTS} -Dfcrepo.modeshape.configuration=classpath:/config/file-simple/repository.json -Dfcrepo.home=/fcrepo4-data"

# # Install Fedora
# ADD https://github.com/fcrepo4/fcrepo4/releases/download/fcrepo-${FCREPO_VERSION}/fcrepo-webapp-${FCREPO_VERSION}.war ${CATALINA_HOME}/webapps/fcrepo.war
