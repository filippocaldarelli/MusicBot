#!/bin/sh

# Crea il file config.txt a partire dalle variabili d'ambiente
cat > /app/config.txt << EOF
token = ${TOKEN}
owner = ${OWNER_ID}
prefix = ${PREFIX}
EOF

# Avvia il bot
exec java -jar bot.jar
