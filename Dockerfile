FROM openjdk:6

MAINTAINER sahirzm@gmail.com

EXPOSE 8080

# set tomcat version
ENV TOMCAT_VERSION 5.5.36

# grab tomcat 5 from archive :-)
RUN wget http://archive.apache.org/dist/tomcat/tomcat-5/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz -O /tmp/tomcat.tar.gz

# unpack tomcat and link
RUN tar zxf /tmp/tomcat.tar.gz -C /opt && rm /tmp/tomcat.tar.gz && ln -s /opt/apache-tomcat-${TOMCAT_VERSION} /opt/tomcat

ENV CATALINA_HOME /opt/tomcat
ENV PATH $PATH:$CATALINA_HOME/bin

RUN rm $CATALINA_HOME/conf/tomcat-users.xml
COPY tomcat-users.xml $CATALINA_HOME/conf/tomcat-users.xml

VOLUME ["/opt/tomcat/logs", "/opt/tomcat/work", "/opt/tomcat/temp", "/tmp/hsperfdata_root" ]

CMD $CATALINA_HOME/bin/catalina.sh run

