FROM tomee:8-jre-7.0.3-plume

COPY server.xml /usr/local/tomee/conf/server.xml
COPY app.war /usr/local/tomee/webapps/

USER root

RUN addgroup tomee \
    && adduser --system tomee \
    && usermod -G tomee tomee \
    && chown -R tomee:tomee /usr/local/tomee \
    && chmod -R 777 /usr/local/tomee

RUN chown -R tomee:tomee /usr/local/tomee/webapps/app.war \
    && chmod -R 777 /usr/local/tomee/webapps/app.war

USER tomee

EXPOSE 8080

CMD ["catalina.sh", "run"]