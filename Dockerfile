FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app

# Copia il JAR dal repository
COPY JMusicBot-0.4.3.jar /app/bot.jar

# Copia l'entrypoint
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]
