FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app

# Installa curl e jq per interrogare l'API di GitHub
RUN apk add --no-cache curl jq

# Scarica l'ultima release dal repository ufficiale
RUN latest_release=$(curl -s https://api.github.com/repos/jagrosh/MusicBot/releases/latest) && \
    download_url=$(echo "$latest_release" | jq -r '.assets[0].browser_download_url') && \
    curl -L -o bot.jar "$download_url"

# Avvia il bot
CMD ["java", "-jar", "bot.jar"]
