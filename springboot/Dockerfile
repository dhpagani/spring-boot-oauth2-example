FROM adoptopenjdk:11-jre-hotspot


RUN mkdir -p /opt/app
COPY target/sso.jar /opt/app/

CMD ["java", "-jar", "/opt/app/sso.jar"] 