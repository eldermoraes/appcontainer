FROM tomee:8-jre-7.0.3-plume

COPY server.xml /usr/local/tomee/conf/server.xml
COPY app.war /usr/local/tomee/webapps/
