FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app

# Installa curl
RUN apk add --no-cache curl

# Scarica il JAR con opzioni per gestire reindirizzamenti e connessioni
RUN curl -L -o bot.jar "https://github.com/jagrosh/MusicBot/releases/download/0.4.5/JMusicBot-0.4.5.jar" && \
    ls -la bot.jar && \
    file bot.jar

# Copia l'entrypoint
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]
