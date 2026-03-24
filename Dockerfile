FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app

# Installa curl e file
RUN apk add --no-cache curl

# Scarica il JAR (usando un URL diverso)
RUN curl -L -o bot.jar "https://github.com/jagrosh/MusicBot/releases/download/0.4.5/JMusicBot-0.4.5.jar" && \
    if [ ! -f bot.jar ] || [ $(stat -c%s bot.jar) -lt 1000000 ]; then \
        echo "Download failed, file too small!" && exit 1; \
    fi

# Copia l'entrypoint
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]
