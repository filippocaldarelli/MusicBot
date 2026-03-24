FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app

# Installa wget
RUN apk add --no-cache wget

# Scarica il JAR con user-agent corretto
RUN wget --user-agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36" \
         -O bot.jar \
         "https://github.com/jagrosh/MusicBot/releases/download/0.4.5/JMusicBot-0.4.5.jar"

# Verifica che il file sia stato scaricato correttamente
RUN if [ ! -f bot.jar ] || [ $(stat -c%s bot.jar) -lt 1000000 ]; then \
        echo "ERROR: Download failed - file too small!" && exit 1; \
    fi

COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]
