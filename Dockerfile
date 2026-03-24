FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app

RUN apk add --no-cache curl

RUN curl -L -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36" \
         -o bot.jar \
         "https://github.com/jagrosh/MusicBot/releases/download/0.4.5/JMusicBot-0.4.5.jar"

RUN if [ ! -f bot.jar ] || [ $(stat -c%s bot.jar) -lt 1000000 ]; then \
        echo "ERROR: Download failed - file too small!" && exit 1; \
    fi

COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]
