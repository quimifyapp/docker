FROM openjdk:11
ADD build/quimify-api-5.jar quimify-api-5.jar
EXPOSE 8085
ENTRYPOINT ["java", "-jar", "quimify-api-5.jar"]
ENV TZ=Europe/Madrid