FROM eclipse-temurin:17-jre-jammy

WORKDIR /app

RUN apt-get update && apt-get install -y \
    libreoffice \
    fonts-dejavu \
    fontconfig \
    && rm -rf /var/lib/apt/lists/*

COPY server/target/*.jar app.jar

EXPOSE 8012

ENTRYPOINT ["java","-Dfile.encoding=UTF-8","-jar","app.jar"]
