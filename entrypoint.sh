#!/bin/sh

# Crea il file config.txt con le stringhe tra virgolette
cat > /app/config.txt << EOF
token = "${TOKEN}"
owner = "${OWNER_ID}"
prefix = "${PREFIX}"
EOF

# Avvia il bot
exec java -jar bot.jar
