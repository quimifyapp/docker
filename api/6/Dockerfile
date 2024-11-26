FROM openjdk:11
ADD build/quimify-api-6.jar quimify-api-6.jar
EXPOSE 8085
ENTRYPOINT ["java", "-jar", "quimify-api-6.jar"]
ENV TZ=Europe/Madrid