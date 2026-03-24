FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app

# Installa curl e jq per scaricare la release
RUN apk add --no-cache curl jq

# Scarica l'ultima release dal repository ufficiale
RUN latest_release=$(curl -s https://api.github.com/repos/jagrosh/MusicBot/releases/latest) && \
    download_url=$(echo "$latest_release" | jq -r '.assets[0].browser_download_url') && \
    curl -L -o bot.jar "$download_url"

# Copia l'entrypoint e rendilo eseguibile
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Avvia con l'entrypoint
ENTRYPOINT ["/app/entrypoint.sh"]
