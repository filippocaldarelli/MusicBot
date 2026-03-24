FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app

RUN apk add --no-cache wget

RUN wget -O bot.jar "https://github.com/jagrosh/MusicBot/releases/download/0.4.5/JMusicBot-0.4.5.jar"

COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]
