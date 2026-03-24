FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app

# Installa curl e jq
RUN apk add --no-cache curl jq

# Scarica la versione 0.4.5 che supporta YouTube aggiornato
RUN curl -L -o bot.jar https://github.com/jagrosh/MusicBot/releases/download/0.4.5/JMusicBot-0.4.5.jar

# Copia l'entrypoint
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]
