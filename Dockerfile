FROM java:7-jdk

MAINTAINER João Fidalgo <joao.fidalgo@outlook.com>

RUN curl -O -s -k -L -C - http://downloads.sourceforge.net/project/lportal/Liferay%20Portal/6.2.3%20GA4/liferay-portal-tomcat-6.2-ce-ga4-20150416163831865.zip && \
    unzip liferay-portal-tomcat-6.2-ce-ga4-20150416163831865.zip -d /opt && \
    rm liferay-portal-tomcat-6.2-ce-ga4-20150416163831865.zip

RUN /bin/echo -e '\nCATALINA_OPTS="$CATALINA_OPTS -Dexternal-properties=portal-db.properties"' >> /opt/liferay-portal-6.2-ce-ga4/tomcat-7.0.42/bin/setenv.sh

ADD ./config/portal-bundle.properties /opt/liferay-portal-6.2-ce-ga4/portal-bundle.properties
ADD ./config/portal-db.properties     /opt/liferay-portal-6.2-ce-ga4/portal-db.properties

VOLUME /var/liferay

EXPOSE 8080

ONBUILD ADD  ./deploy   /var/liferay/deploy
ONBUILD ADD  ./lib      /var/liferay/lib
ONBUILD COPY ./bin/*.sh /var/liferay/bin

ENTRYPOINT ["/opt/liferay-portal-6.2-ce-ga4/tomcat-7.0.42/bin/catalina.sh"]
CMD ["run"]