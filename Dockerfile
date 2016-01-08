FROM java:7-jdk

MAINTAINER João Fidalgo <joao.fidalgo@outlook.com>

RUN curl -O -s -k -L -C http://downloads.sourceforge.net/project/lportal/Liferay%20Portal/6.2.3%20GA4/liferay-portal-tomcat-6.2-ce-ga4-20150416163831865.zip && \
	unzip liferay-portal-tomcat-6.2-ce-ga4-20150416163831865.zip -d /opt && \
	rm liferay-portal-tomcat-6.2-ce-ga4-20150416163831865.zip

RUN /bin/echo -e '\nCATALINA_OPTS="$CATALINA_OPTS -Dexternal-properties=portal-db-mysql.properties"' >> /opt/liferay-portal-6.2-ce-ga4/tomcat-7.0.42/bin/setenv.sh

ADD portal-bundle.properties /opt/liferay-portal-6.2-ce-ga4/portal-bundle.properties
ADD portal-db-mysql.properties /opt/liferay-portal-6.2-ce-ga4/portal-db-mysql.properties

EXPOSE 8080

ENTRYPOINT ["/opt/liferay-portal-6.2-ce-ga4/tomcat-7.0.42/bin/catalina.sh"]