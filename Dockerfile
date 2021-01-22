FROM adoptopenjdk:11-jre-hotspot

ARG PROJECT_ARTIFACT_PATH
ARG PROJECT_ARTIFACT_NAME


RUN mkdir -p /opt/app
COPY ${PROJECT_ARTIFACT_PATH}/${PROJECT_ARTIFACT_NAME} /opt/app/

CMD ["java", "-jar", "/opt/app/"+${PROJECT_ARTIFACT_NAME}] 