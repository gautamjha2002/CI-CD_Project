FROM openjdk
COPY target/*.jar /
EXPOSE 8080
ENTRYPOINT ["java","-jar","/my-ems-project-1.0-SNAPSHOT.jar"]